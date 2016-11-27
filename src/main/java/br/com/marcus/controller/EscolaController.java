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

import br.com.marcus.dao.EscolaDao;
import br.com.marcus.modelo.Escola;

@Controller
public class EscolaController {

	@Autowired
	private EscolaDao escolaDao;

	@RequestMapping("listaEscolas")
	public ModelAndView handleRequest() throws Exception {
		List<Escola> listEscolas = escolaDao.list();
		ModelAndView model = new ModelAndView("EscolaList");
		model.addObject("escolaList", listEscolas);
		return model;
	}

	@RequestMapping(value = "novaEscola", method = RequestMethod.GET)
	public ModelAndView newEscola(@ModelAttribute("command") Escola escola, BindingResult result) {
		//    	Map<String, Object> model = new HashMap<String, Object>();
		//    	model.put("escolas",  escolaDao.list());
		ModelAndView model = new ModelAndView("EscolaForm");
		model.addObject("escola", escola);
		return model;
	}

	@RequestMapping(value = "alteraEscola")
	public ModelAndView editEscola(HttpServletRequest request) {
		Long escolaId = Long.parseLong(request.getParameter("id"));
		Escola escola = escolaDao.get(escolaId);
		ModelAndView model = new ModelAndView("EscolaForm");
		model.addObject("escola", escola);
		return model;      
	}

	@RequestMapping(value = "deletaEscola")
	public String deleteEscola(HttpServletRequest request) {
		Long escolaId = Long.parseLong(request.getParameter("id"));
		escolaDao.delete(escolaId);
		return "forward:listaEscolas";     
	}

	@RequestMapping(value = "/salvaEscola", method = RequestMethod.POST)  
	public String saveEscola(@ModelAttribute("command") Escola escola,   
			BindingResult result, @RequestParam MultipartFile[] fileUpload) {  
		
		//FOTO CAPA
		if (fileUpload != null && fileUpload.length > 0) {
			if (fileUpload[0].getSize() > 0){
				try {
					for (MultipartFile aFile : fileUpload){
						validateImage(aFile);
						escola.setFotoCapa(getDataBaseFilePath(escola, aFile));
					}
				} catch (RuntimeException re) {
					result.reject(re.getMessage());
					return "redirect:/alteraEscola?id=" + escola.getId();
				}
	
				try {
					for (MultipartFile aFile : fileUpload){
						saveFotoToLocalDisk(escola, aFile);
					}
				} catch (IOException e) {
					result.reject(e.getMessage());
					System.out.println(e.getMessage());
					return "redirect:/alteraEscola?id=" + escola.getId();
				}
			} else {
				Long idEsc = escola.getId();
				Escola esc = escolaDao.get(idEsc);
				escola.setFotoCapa(esc.getFotoCapa());
			}
		} else {
			Long idEsc = escola.getId();
			Escola esc = escolaDao.get(idEsc);
			escola.setFotoCapa(esc.getFotoCapa());
		}
		
		escolaDao.saveOrUpdate(escola);
		return "redirect:/listaEscolas";
	}

	private void validateImage(MultipartFile image) {
		if (!image.getContentType().equals("image/jpeg") && !image.getContentType().equals("image/png")) {
			throw new RuntimeException("Apenas imagens em JPG ou PNG são suportadas");
		}
	}
	
	private void saveFotoToLocalDisk(Escola escola, MultipartFile multipartFile)
			throws IOException, FileNotFoundException {

		String pathToFile = getOutputFilename(escola, multipartFile);
		String separator = System.getProperty("file.separator");
		String folder = getDestinationLocation() + separator + "ArquivosRaioX";
		File newDir = new File(folder);
		if(!newDir.exists()){
			newDir.mkdir();
		}
		
		String subFolder = folder + separator + "FotosEscolas";
		File newSubDir = new File(subFolder);
		if(!newSubDir.exists()){
			newSubDir.mkdir();
		}
		
		String subFolderEscolas = subFolder + separator + escola.getId();
		File newSubDirEscolas = new File(subFolderEscolas);
		if(!newSubDirEscolas.exists()){
			newSubDirEscolas.mkdir();
		}

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("Folder: " + subFolderEscolas);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("PathToFile: " + pathToFile);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(pathToFile));
	}

	private String getOutputFilename(Escola escola, MultipartFile multipartFile) {
		String fileName = multipartFile.getOriginalFilename();
		String separator = System.getProperty("file.separator");
		String nomeArquivo = getDestinationLocation() + separator + "ArquivosRaioX" + separator + "FotosEscolas" + separator + escola.getId() + separator + "capa" + fileName.substring(fileName.indexOf("."), fileName.length());
		return nomeArquivo;
	}
	
	private String getDataBaseFilePath(Escola escola, MultipartFile multipartFile){
		String fileName = multipartFile.getOriginalFilename();
		String separator = "/";
		String nomeArquivo = separator + "fotos" + separator + "FotosEscolas" + separator + escola.getId() + separator + "capa" + fileName.substring(fileName.indexOf("."), fileName.length());
		return nomeArquivo;
	}
	
	private String getDestinationLocation() {
		return System.getProperty("catalina.base");
	}
}  