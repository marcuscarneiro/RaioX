package br.com.marcus.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import br.com.marcus.dao.VistoriaCrecheDao;
import br.com.marcus.modelo.FotoVistoriaCreche;
import br.com.marcus.modelo.VistoriaCreche;
import br.com.marcus.service.FotoVistoriaCrecheService;

@Controller
public class FotoVistoriaCrecheController {

	@Autowired
	private FotoVistoriaCrecheService fotoVistoriaCrecheService;
	
	@Autowired
    private VistoriaCrecheDao vistoriaCrecheDao;
	
	@RequestMapping("/fotoCrecheUploader")
	public String home() {

		// will be resolved to /views/fotoUploader.jsp      
		return "fotoCrecheUploader";
	}
	
	@RequestMapping(value ="/adicionarFotosCreche")
    public ModelAndView novasFotos(HttpServletRequest request){
		Long vistoriaCrecheId = Long.parseLong(request.getParameter("id"));
		ModelAndView model = new ModelAndView("FotoVistoriaCrecheUpload");
        VistoriaCreche vistoriaCreche = vistoriaCrecheDao.get(vistoriaCrecheId);
        model.addObject("vistoriaCreche", vistoriaCreche);
        return model;
    }

	@RequestMapping(value = "/uploadCreche", method = RequestMethod.POST)
	public @ResponseBody
	List<FotoVistoriaCreche> upload(MultipartHttpServletRequest request,
			HttpServletResponse response, @RequestParam("id") int id) throws IOException {
		Long vistoriaCrecheId = Long.parseLong(request.getParameter("id"));
		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();

		// Maintain a list to send back the files info. to the client side
		List<FotoVistoriaCreche> fotoVistoriaCreches = new ArrayList<FotoVistoriaCreche>();
		
		VistoriaCreche vistoriaCreche = vistoriaCrecheDao.get(vistoriaCrecheId);
		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {

			// Save the file to local disk
			String localFisico = saveFotoToLocalDisk(vistoriaCreche, multipartFile);

			FotoVistoriaCreche fileInfo = getFotoVistoriaCrecheInfo(multipartFile);
			fileInfo.setLocalizacao(getDataBaseFilePath(vistoriaCreche, multipartFile));
			
			fileInfo.setVistoriaCreche(vistoriaCreche);
			fileInfo.setLocalfisico(localFisico);
			// Save the file info to database
			fileInfo = saveFotoToDatabase(fileInfo);

			// adding the file info to the list
			fotoVistoriaCreches.add(fileInfo);
		}

		return fotoVistoriaCreches;
	}

	private String getDataBaseFilePath(VistoriaCreche vistoriaCreche, MultipartFile multipartFile) throws UnsupportedEncodingException{
//		String fileName = new String (multipartFile.getOriginalFilename().getBytes("iso-8859-1"), "UTF-8");
		String fileName = multipartFile.getOriginalFilename();
		String separator = "/";
		String nomeArquivo = separator + "fotos" + separator + "FotosVistoriaCreches" + separator + vistoriaCreche.getId() + separator + fileName;
		return nomeArquivo;
	}
	
	private String saveFotoToLocalDisk(VistoriaCreche vistoriaCreche, MultipartFile multipartFile)
			throws IOException, FileNotFoundException {

		String pathToFile = getOutputFilename(vistoriaCreche, multipartFile);
		String separator = System.getProperty("file.separator");
		String folder = getDestinationLocation() + separator + "ArquivosRaioX";
		File newDir = new File(folder);
		if(!newDir.exists()){
			newDir.mkdir();
		}
		
		String subFolder = folder + separator + "FotosVistoriaCreches";
		File newSubDir = new File(subFolder);
		if(!newSubDir.exists()){
			newSubDir.mkdir();
		}
		
		String subFolderVistoriaCreches = subFolder + separator + vistoriaCreche.getId();
		File newSubDirVistoriaCreches = new File(subFolderVistoriaCreches);
		if(!newSubDirVistoriaCreches.exists()){
			newSubDirVistoriaCreches.mkdir();
		}

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("Folder: " + subFolderVistoriaCreches);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("PathToFile: " + pathToFile);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		String finalPath = getOutputFilename(vistoriaCreche, multipartFile);
		
		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(
				finalPath));
		
		return finalPath;
	}

	private FotoVistoriaCreche saveFotoToDatabase(FotoVistoriaCreche fotoVistoriaCreche) {
		return fotoVistoriaCrecheService.saveFoto(fotoVistoriaCreche);

	}

	private String getOutputFilename(VistoriaCreche vistoriaCreche, MultipartFile multipartFile) throws UnsupportedEncodingException {

//		String fileName = new String (multipartFile.getOriginalFilename().getBytes("iso-8859-1"), "UTF-8");
		String fileName = multipartFile.getOriginalFilename();
		String separator = System.getProperty("file.separator");
		String nomeArquivo = getDestinationLocation() + separator + "ArquivosRaioX" + separator + "FotosVistoriaCreches" + separator + vistoriaCreche.getId() + separator + fileName;
		return nomeArquivo;
	}

	private FotoVistoriaCreche getFotoVistoriaCrecheInfo(MultipartFile multipartFile)
			throws IOException {

		FotoVistoriaCreche fotoInfo = new FotoVistoriaCreche();
//		String nomeFinal = new String (multipartFile.getOriginalFilename().getBytes("iso-8859-1"), "UTF-8");
		fotoInfo.setNome(multipartFile.getOriginalFilename());
		fotoInfo.setTamanho(multipartFile.getSize());
		fotoInfo.setTipo(multipartFile.getContentType());

		return fotoInfo;
	}

	private String getDestinationLocation() {
		return System.getProperty("catalina.base");
	}
	
	
	public String listFotos(Map<String, Object> map, @PathVariable Long vistoriaCrecheId) {
		
		map.put("fotoList", fotoVistoriaCrecheService.getByVistoriaCreche(vistoriaCrecheDao.get(vistoriaCrecheId)));
		
		// will be resolved to /views/listFiles.jsp
		return "/FotoVistoriaCrecheList";
	}
	
	@RequestMapping(value = "/verFotosCreche")
	public ModelAndView handleRequest(HttpServletRequest request) {
		Long vistoriaCrecheId = Long.parseLong(request.getParameter("id"));
        VistoriaCreche vistoriaCreche = vistoriaCrecheDao.get(vistoriaCrecheId);
		List<FotoVistoriaCreche> listFotos = fotoVistoriaCrecheService.getByVistoriaCreche(vistoriaCreche);

        ModelAndView model = new ModelAndView("FotoVistoriaCrecheList");
        model.addObject("listFotosCreche", listFotos);
        model.addObject("vistoriaCrecheId", vistoriaCrecheId);
        return model;
    }
	
	@RequestMapping(value = "deletaFotoVistoriaCreche")
    public String deleteFotoVistoriaCreche(HttpServletRequest request) {
		Long vistoriaCrecheId = Long.parseLong(request.getParameter("vistoriaCrecheId"));
    	Long fotoVistoriaCrecheId = Long.parseLong(request.getParameter("id"));
       
        FotoVistoriaCreche foto = fotoVistoriaCrecheService.getFoto(fotoVistoriaCrecheId);
		File file = new File(foto.getLocalfisico());
		try {
			Files.deleteIfExists(file.toPath());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		fotoVistoriaCrecheService.delete(fotoVistoriaCrecheId);
        return "forward:verFotosCreche?id="+vistoriaCrecheId;     
    }
	
	@RequestMapping(value = "alteraFotoCreche")
	public ModelAndView editFoto(HttpServletRequest request) {
		Long fotoId = Long.parseLong(request.getParameter("id"));
		FotoVistoriaCreche fv = fotoVistoriaCrecheService.getFoto(fotoId);
		ModelAndView model = new ModelAndView("FotoCrecheForm");
		model.addObject("foto", fv);
		return model;      
	}
	
	@RequestMapping(value = "salvaFotoCreche", method = RequestMethod.POST)  
	public String saveFoto(@ModelAttribute FotoVistoriaCreche fotoVistoriaCreche, BindingResult result) {  
		
		fotoVistoriaCrecheService.saveFoto(fotoVistoriaCreche);
		return "forward:verFotosCreche?id="+fotoVistoriaCreche.getVistoriaCreche().getId();
	}
}