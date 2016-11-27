package br.com.marcus.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.marcus.dao.EscolaDao;
import br.com.marcus.dao.VisitaDao;
import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.Visita;

@Controller
public class VisitaController {

	@Autowired
    private VisitaDao visitaDao;
 
	@Autowired
    private EscolaDao escolaDao;
		
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
	
    @RequestMapping("listaVisitas")
    public ModelAndView handleRequest() throws Exception {
        List<Visita> listVisitas = visitaDao.list();
        ModelAndView model = new ModelAndView("VisitaList");
        model.addObject("visitaList", listVisitas);
        return model;
    }
 
    @RequestMapping(value = "novaVisita", method = RequestMethod.GET)
	public ModelAndView newVisita(@ModelAttribute("command")  Visita visita, BindingResult result) {
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("escolas", escolaDao.list());
		return new ModelAndView("VisitaForm", model);
	}
    
//    @RequestMapping(value = "alteraVisita", method = RequestMethod.GET)  
//    public ModelAndView editVisita(@ModelAttribute("command") Visita visita,  
//      BindingResult result) {  
//     Map<String, Object> model = new HashMap<String, Object>();  
//     model.put("visita",  visitaDao.get(visita.getId()));  
//     model.put("visitas",  visitaDao.list());
//     model.put("escolas",  escolaDao.list());  
//     return new ModelAndView("VisitaForm", model);  
//    }  
    
    @RequestMapping(value = "alteraVisita")
    public ModelAndView editVisita(HttpServletRequest request) {
        Long visitaId = Long.parseLong(request.getParameter("id"));
        List<Escola> escolas = escolaDao.list();
        ModelAndView model = new ModelAndView("VisitaEditForm");
        Visita visita = visitaDao.get(visitaId);
        model.addObject("escolas", escolas);
        model.addObject("visita", visita);
        return model;      
    }
     
    @RequestMapping(value = "deletaVisita")
    public String deleteVisita(HttpServletRequest request) {
    	Long visitaId = Long.parseLong(request.getParameter("id"));
        visitaDao.delete(visitaId);
        return "forward:listaVisitas";     
    }
     
    @RequestMapping(value = "salvaVisita")
    public String saveVisita(@ModelAttribute Visita visita, BindingResult result,
    		 @RequestParam MultipartFile[] relatorioUpload) {
    	
    	if (relatorioUpload != null && relatorioUpload.length >0) {
    		if (relatorioUpload[0].getSize() > 0){
				try {
					for (MultipartFile aFile : relatorioUpload){
						validateRelatorio(aFile);
						visita.setRelatorio(getDataBaseFilePath(visita, aFile));
					}
				} catch (RuntimeException re) {
					result.reject(re.getMessage());
					return "redirect:/alteraVisita?id="+visita.getId();
				}
	
				try {
					for (MultipartFile aFile : relatorioUpload){
						saveRelatorioToLocalDisk(visita, aFile);
					}
				} catch (IOException e) {
					result.reject(e.getMessage());
					System.out.println(e.getMessage());
					return "redirect:/alteraVisita?id="+visita.getId();
				}
    		}
		}
    	
        visitaDao.saveOrUpdate(visita);
        return "forward:listaVisitas";
    }
	
    private void validateRelatorio(MultipartFile relatorio) {
		if (!relatorio.getContentType().equals("application/pdf")) {
			throw new RuntimeException("Apenas PDFs são suportados");
		}
	}
    
	private void saveRelatorioToLocalDisk(Visita visita, MultipartFile multipartFile)
			throws IOException, FileNotFoundException {

		String pathToFile = getOutputFilename(visita, multipartFile);
		String separator = System.getProperty("file.separator");
		String folder = getDestinationLocation() + separator + "ArquivosRaioX";
		File newDir = new File(folder);
		if(!newDir.exists()){
			newDir.mkdir();
		}
		
		String subFolder = folder + separator + "Relatorios";
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
		
		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(pathToFile));
	}
	
	private String getOutputFilename(Visita visita, MultipartFile multipartFile) {
		String fileName = multipartFile.getOriginalFilename();
		String separator = System.getProperty("file.separator");
		String nomeArquivo = getDestinationLocation() + separator + "ArquivosRaioX" + separator + "Relatorios" + separator + visita.getId() + separator + "relatorio" + fileName.substring(fileName.indexOf("."), fileName.length());
		return nomeArquivo;
	}

	private String getDataBaseFilePath(Visita visita, MultipartFile multipartFile){
		String fileName = multipartFile.getOriginalFilename();
		String separator = "/";
		String nomeArquivo = separator + "relatorios" + separator + visita.getId() + separator + "relatorio" + fileName.substring(fileName.indexOf("."), fileName.length());
		return nomeArquivo;
	}
	
	private String getDestinationLocation() {
		return System.getProperty("catalina.base");
	}
}
