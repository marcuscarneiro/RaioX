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

import br.com.marcus.dao.VisitaDao;
import br.com.marcus.modelo.FotoVisita;
import br.com.marcus.modelo.Visita;
import br.com.marcus.service.FotoVisitaService;

@Controller
public class FotoVisitaController {

	@Autowired
	private FotoVisitaService fotoVisitaService;
	
	@Autowired
    private VisitaDao visitaDao;
	
	@RequestMapping("/fotoUploader")
	public String home() {

		// will be resolved to /views/fotoUploader.jsp      
		return "fotoUploader";
	}
	
	@RequestMapping(value ="/adicionarFotos")
    public ModelAndView novasFotos(HttpServletRequest request){
		Long visitaId = Long.parseLong(request.getParameter("id"));
		ModelAndView model = new ModelAndView("FotoVisitaForm");
        Visita visita = visitaDao.get(visitaId);
        model.addObject("visita", visita);
        return model;
    }

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody
	List<FotoVisita> upload(MultipartHttpServletRequest request,
			HttpServletResponse response, @RequestParam("id") int id) throws IOException {
		Long visitaId = Long.parseLong(request.getParameter("id"));
		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();

		// Maintain a list to send back the files info. to the client side
		List<FotoVisita> fotoVisitas = new ArrayList<FotoVisita>();
		
		Visita visita = visitaDao.get(visitaId);
		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {

			// Save the file to local disk
			String localFisico = saveFotoToLocalDisk(visita, multipartFile);

			FotoVisita fileInfo = getFotoVisitaInfo(multipartFile);
			fileInfo.setLocalizacao(getDataBaseFilePath(visita, multipartFile));
			
			fileInfo.setVisita(visita);
			fileInfo.setLocalfisico(localFisico);
			// Save the file info to database
			fileInfo = saveFotoToDatabase(fileInfo);

			// adding the file info to the list
			fotoVisitas.add(fileInfo);
		}

		return fotoVisitas;
	}

	private String getDataBaseFilePath(Visita visita, MultipartFile multipartFile) throws UnsupportedEncodingException{
//		String fileName = new String (multipartFile.getOriginalFilename().getBytes("iso-8859-1"), "UTF-8");
		String fileName = multipartFile.getOriginalFilename();
		String separator = "/";
		String nomeArquivo = separator + "fotos" + separator + "FotosVisitas" + separator + visita.getId() + separator + fileName;
		return nomeArquivo;
	}
	
	private String saveFotoToLocalDisk(Visita visita, MultipartFile multipartFile)
			throws IOException, FileNotFoundException {

		String pathToFile = getOutputFilename(visita, multipartFile);
		String separator = System.getProperty("file.separator");
		String folder = getDestinationLocation() + separator + "ArquivosRaioX";
		File newDir = new File(folder);
		if(!newDir.exists()){
			newDir.mkdir();
		}
		
		String subFolder = folder + separator + "FotosVisitas";
		File newSubDir = new File(subFolder);
		if(!newSubDir.exists()){
			newSubDir.mkdir();
		}
		
		String subFolderVisitas = subFolder + separator + visita.getId();
		File newSubDirVisitas = new File(subFolderVisitas);
		if(!newSubDirVisitas.exists()){
			newSubDirVisitas.mkdir();
		}

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("Folder: " + subFolderVisitas);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("PathToFile: " + pathToFile);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		String finalPath = getOutputFilename(visita, multipartFile);
		
		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(
				finalPath));
		
		return finalPath;
	}

	private FotoVisita saveFotoToDatabase(FotoVisita fotoVisita) {
		return fotoVisitaService.saveFoto(fotoVisita);

	}

	private String getOutputFilename(Visita visita, MultipartFile multipartFile) throws UnsupportedEncodingException {

//		String fileName = new String (multipartFile.getOriginalFilename().getBytes("iso-8859-1"), "UTF-8");
		String fileName = multipartFile.getOriginalFilename();
		String separator = System.getProperty("file.separator");
		String nomeArquivo = getDestinationLocation() + separator + "ArquivosRaioX" + separator + "FotosVisitas" + separator + visita.getId() + separator + fileName;
		return nomeArquivo;
	}

	private FotoVisita getFotoVisitaInfo(MultipartFile multipartFile)
			throws IOException {

		FotoVisita fotoInfo = new FotoVisita();
//		String nomeFinal = new String (multipartFile.getOriginalFilename().getBytes("iso-8859-1"), "UTF-8");
		fotoInfo.setNome(multipartFile.getOriginalFilename());
		fotoInfo.setTamanho(multipartFile.getSize());
		fotoInfo.setTipo(multipartFile.getContentType());

		return fotoInfo;
	}

	private String getDestinationLocation() {
		return System.getProperty("catalina.base");
	}
	
	
	public String listFotos(Map<String, Object> map, @PathVariable Long visitaId) {
		
		map.put("fotoList", fotoVisitaService.getByVisita(visitaDao.get(visitaId)));
		
		// will be resolved to /views/listFiles.jsp
		return "/FotoVisitaList";
	}
	
	@RequestMapping(value = "/verFotos")
	public ModelAndView handleRequest(HttpServletRequest request) {
		Long visitaId = Long.parseLong(request.getParameter("id"));
        Visita visita = visitaDao.get(visitaId);
		List<FotoVisita> listFotos = fotoVisitaService.getByVisita(visita);

        ModelAndView model = new ModelAndView("FotoVisitaList");
        model.addObject("listFotos", listFotos);
        model.addObject("visitaId", visitaId);
        return model;
    }
	
	@RequestMapping(value = "deletaFotoVisita")
    public String deleteFotoVisita(HttpServletRequest request) {
		Long visitaId = Long.parseLong(request.getParameter("visitaId"));
    	Long fotoVisitaId = Long.parseLong(request.getParameter("id"));
       
        FotoVisita foto = fotoVisitaService.getFoto(fotoVisitaId);
		File file = new File(foto.getLocalfisico());
		try {
			Files.deleteIfExists(file.toPath());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		fotoVisitaService.delete(fotoVisitaId);
        return "forward:verFotos?id="+visitaId;     
    }
	
	@RequestMapping(value = "alteraFoto")
	public ModelAndView editFoto(HttpServletRequest request) {
		Long fotoId = Long.parseLong(request.getParameter("id"));
		FotoVisita fv = fotoVisitaService.getFoto(fotoId);
		ModelAndView model = new ModelAndView("FotoForm");
		model.addObject("foto", fv);
		return model;      
	}
	
	@RequestMapping(value = "salvaFoto", method = RequestMethod.POST)  
	public String saveFoto(@ModelAttribute FotoVisita fotoVisita, BindingResult result) {  
		
		fotoVisitaService.saveFoto(fotoVisita);
		return "forward:verFotos?id="+fotoVisita.getVisita().getId();
	}
	
//	@RequestMapping(value = "/get/{fileId}", method = RequestMethod.GET)
//	public void getFile(HttpServletResponse response, @PathVariable Long fileId) {
//		
//		FotoVisita fotoInfos = fotoVisitaService.getFoto(fileId);
//		
//		File file = new File(fotoInfos.getLocalizacao(), fotoInfos.getNome());
//		
//		try {
//			response.setContentType(fotoInfos.getTipo());
//			response.setHeader("Content-disposition", "attachment; filename=\""
//					+ fotoInfos.getNome() + "\"");
//			
//			FileCopyUtils.copy(FileUtils.readFileToByteArray(file),
//					response.getOutputStream());
//			
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
}