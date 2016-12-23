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

import br.com.marcus.dao.CrecheDao;
import br.com.marcus.dao.VistoriaCrecheDao;
import br.com.marcus.modelo.Creche;
import br.com.marcus.modelo.VistoriaCreche;

@Controller
public class VistoriaCrecheController {

	@Autowired
    private VistoriaCrecheDao vistoriaCrecheDao;
 
	@Autowired
    private CrecheDao crecheDao;
		
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
	
    @RequestMapping("listaVistoriaCreche")
    public ModelAndView handleRequest() throws Exception {
        List<VistoriaCreche> listVistoriaCreche = vistoriaCrecheDao.list();
        ModelAndView model = new ModelAndView("VistoriaCrecheList");
        model.addObject("vistoriaCrecheList", listVistoriaCreche);
        return model;
    }
 
    @RequestMapping(value = "novaVistoriaCreche", method = RequestMethod.GET)
	public ModelAndView newVistoriaCreche(@ModelAttribute("command")  VistoriaCreche vistoriaCreche, BindingResult result) {
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("creches", crecheDao.list());
		return new ModelAndView("VistoriaCrecheForm", model);
	}
    
//    @RequestMapping(value = "alteraVistoriaCreche", method = RequestMethod.GET)  
//    public ModelAndView editVistoriaCreche(@ModelAttribute("command") VistoriaCreche vistoriaCreche,  
//      BindingResult result) {  
//     Map<String, Object> model = new HashMap<String, Object>();  
//     model.put("vistoriaCreche",  vistoriaCrecheDao.get(vistoriaCreche.getId()));  
//     model.put("vistoriaCreches",  vistoriaCrecheDao.list());
//     model.put("creches",  crecheDao.list());  
//     return new ModelAndView("VistoriaCrecheForm", model);  
//    }  
    
    @RequestMapping(value = "alteraVistoriaCreche")
    public ModelAndView editVistoriaCreche(HttpServletRequest request) {
        Long vistoriaCrecheId = Long.parseLong(request.getParameter("id"));
        List<Creche> creches = crecheDao.list();
        ModelAndView model = new ModelAndView("VistoriaCrecheEditForm");
        VistoriaCreche vistoriaCreche = vistoriaCrecheDao.get(vistoriaCrecheId);
        model.addObject("creches", creches);
        model.addObject("vistoriaCreche", vistoriaCreche);
        return model;      
    }
     
    @RequestMapping(value = "deletaVistoriaCreche")
    public String deleteVistoriaCreche(HttpServletRequest request) {
    	Long vistoriaCrecheId = Long.parseLong(request.getParameter("id"));
        vistoriaCrecheDao.delete(vistoriaCrecheId);
        return "forward:listaVistoriaCreche";
    }
     
    @RequestMapping(value = "salvaVistoriaCreche")
    public String saveVistoriaCreche(@ModelAttribute VistoriaCreche vistoriaCreche, BindingResult result,
    		 @RequestParam MultipartFile[] relatorioUpload) {
    	
    	if (relatorioUpload != null && relatorioUpload.length >0) {
    		if (relatorioUpload[0].getSize() > 0){
				try {
					for (MultipartFile aFile : relatorioUpload){
						validateRelatorio(aFile);
						vistoriaCreche.setRelatorio(getDataBaseFilePath(vistoriaCreche, aFile));
					}
				} catch (RuntimeException re) {
					result.reject(re.getMessage());
					return "redirect:/alteraVistoriaCreche?id="+vistoriaCreche.getId();
				}
	
				try {
					for (MultipartFile aFile : relatorioUpload){
						saveRelatorioToLocalDisk(vistoriaCreche, aFile);
					}
				} catch (IOException e) {
					result.reject(e.getMessage());
					System.out.println(e.getMessage());
					return "redirect:/alteraVistoriaCreche?id="+vistoriaCreche.getId();
				}
    		}
		}
    	
        vistoriaCrecheDao.saveOrUpdate(vistoriaCreche);
        return "forward:listaVistoriaCreche";
    }
	
    private void validateRelatorio(MultipartFile relatorio) {
		if (!relatorio.getContentType().equals("application/pdf")) {
			throw new RuntimeException("Apenas PDFs são suportados");
		}
	}
    
	private void saveRelatorioToLocalDisk(VistoriaCreche vistoriaCreche, MultipartFile multipartFile)
			throws IOException, FileNotFoundException {

		String pathToFile = getOutputFilename(vistoriaCreche, multipartFile);
		String separator = System.getProperty("file.separator");
		String folder = getDestinationLocation() + separator + "ArquivosRaioX";
		File newDir = new File(folder);
		if(!newDir.exists()){
			newDir.mkdir();
		}
		
		String subFolder = folder + separator + "RelatoriosCreches";
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
		
		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(pathToFile));
	}
	
	private String getOutputFilename(VistoriaCreche vistoriaCreche, MultipartFile multipartFile) {
		String fileName = multipartFile.getOriginalFilename();
		String separator = System.getProperty("file.separator");
		String nomeArquivo = getDestinationLocation() + separator + "ArquivosRaioX" + separator + "RelatoriosCreches" + separator + vistoriaCreche.getId() + separator + "relatorio" + fileName.substring(fileName.indexOf("."), fileName.length());
		return nomeArquivo;
	}

	private String getDataBaseFilePath(VistoriaCreche vistoriaCreche, MultipartFile multipartFile){
		String fileName = multipartFile.getOriginalFilename();
		String separator = "/";
		String nomeArquivo = separator + "relatoriosCreches" + separator + vistoriaCreche.getId() + separator + "relatorio" + fileName.substring(fileName.indexOf("."), fileName.length());
		return nomeArquivo;
	}
	
	private String getDestinationLocation() {
		return System.getProperty("catalina.base");
	}
}
