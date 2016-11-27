package br.com.marcus.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.marcus.dao.CrecheDao;
import br.com.marcus.modelo.Creche;

@Controller
public class CrecheController {

	@Autowired
	private CrecheDao crecheDao;

	@RequestMapping("listaCreches")
	public ModelAndView handleRequest() throws Exception {
		List<Creche> listCreches = crecheDao.list();
		ModelAndView model = new ModelAndView("CrecheList");
		model.addObject("crecheList", listCreches);
		return model;
	}

	@RequestMapping(value = "novaCreche", method = RequestMethod.GET)
	public ModelAndView newCreche(@ModelAttribute("command") Creche creche, BindingResult result) {
		//    	Map<String, Object> model = new HashMap<String, Object>();
		//    	model.put("creches",  crecheDao.list());
		ModelAndView model = new ModelAndView("CrecheForm");
		model.addObject("creche", creche);
		return model;
	}

	@RequestMapping(value = "alteraCreche")
	public ModelAndView editCreche(HttpServletRequest request) {
		Long crecheId = Long.parseLong(request.getParameter("id"));
		Creche creche = crecheDao.get(crecheId);
		ModelAndView model = new ModelAndView("CrecheForm");
		model.addObject("creche", creche);
		return model;      
	}

	@RequestMapping(value = "deletaCreche")
	public String deleteCreche(HttpServletRequest request) {
		Long crecheId = Long.parseLong(request.getParameter("id"));
		crecheDao.delete(crecheId);
		return "forward:listaCreches";     
	}

	@RequestMapping(value = "/salvaCreche", method = RequestMethod.POST)  
	public String saveCreche(@ModelAttribute("command") Creche creche,   
			BindingResult result, @RequestParam MultipartFile[] fileUpload) {  
		
		//FOTO CAPA
		if (fileUpload != null && fileUpload.length > 0) {
			if (fileUpload[0].getSize() > 0){
				try {
					for (MultipartFile aFile : fileUpload){
						validateImage(aFile);
						creche.setFotoCapa(getDataBaseFilePath(creche, aFile));
					}
				} catch (RuntimeException re) {
					result.reject(re.getMessage());
					return "redirect:/alteraCreche?id=" + creche.getId();
				}
	
				try {
					for (MultipartFile aFile : fileUpload){
						saveFotoToLocalDisk(creche, aFile);
					}
				} catch (IOException e) {
					result.reject(e.getMessage());
					System.out.println(e.getMessage());
					return "redirect:/alteraCreche?id=" + creche.getId();
				}
			} else {
				Long idCre = creche.getId();
				Creche cre = crecheDao.get(idCre);
				creche.setFotoCapa(cre.getFotoCapa());
			}
		} else {
			Long idCre = creche.getId();
			Creche cre = crecheDao.get(idCre);
			if(cre != null){
				if(cre.getFotoCapa() != null){
					creche.setFotoCapa(cre.getFotoCapa());
				}
			}
		}
		
		crecheDao.saveOrUpdate(creche);
		return "redirect:/listaCreches";
	}

	private void validateImage(MultipartFile image) {
		if (!image.getContentType().equals("image/jpeg") && !image.getContentType().equals("image/png")) {
			throw new RuntimeException("Apenas imagens em JPG ou PNG são suportadas");
		}
	}
	
	private void saveFotoToLocalDisk(Creche creche, MultipartFile multipartFile)
			throws IOException, FileNotFoundException {

		String pathToFile = getOutputFilename(creche, multipartFile);
		String separator = System.getProperty("file.separator");
		String folder = getDestinationLocation() + separator + "ArquivosRaioX";
		File newDir = new File(folder);
		if(!newDir.exists()){
			newDir.mkdir();
		}
		
		String subFolder = folder + separator + "FotosCreches";
		File newSubDir = new File(subFolder);
		if(!newSubDir.exists()){
			newSubDir.mkdir();
		}
		
		String subFolderCreches = subFolder + separator + creche.getId();
		File newSubDirCreches = new File(subFolderCreches);
		if(!newSubDirCreches.exists()){
			newSubDirCreches.mkdir();
		}

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("Folder: " + subFolderCreches);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("PathToFile: " + pathToFile);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(pathToFile));
	}

	private String getOutputFilename(Creche creche, MultipartFile multipartFile) {
		String fileName = multipartFile.getOriginalFilename();
		String separator = System.getProperty("file.separator");
		String nomeArquivo = getDestinationLocation() + separator + "ArquivosRaioX" + separator + "FotosCreches" + separator + creche.getId() + separator + "capa" + fileName.substring(fileName.indexOf("."), fileName.length());
		return nomeArquivo;
	}
	
	private String getDataBaseFilePath(Creche creche, MultipartFile multipartFile){
		String fileName = multipartFile.getOriginalFilename();
		String separator = "/";
		String nomeArquivo = separator + "fotos" + separator + "FotosCreches" + separator + creche.getId() + separator + "capa" + fileName.substring(fileName.indexOf("."), fileName.length());
		return nomeArquivo;
	}
	
	private String getDestinationLocation() {
		return System.getProperty("catalina.base");
	}
}  