package br.com.marcus.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
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
import br.com.marcus.dao.AvaliacaoPublicaDao;
import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.AvaliacaoPublica;

@Controller
public class AvaliacaoPublicaController {

	@Autowired
    private AvaliacaoPublicaDao avaliacaoPublicaDao;
 
	@Autowired
    private EscolaDao escolaDao;
		
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
	
    @RequestMapping("listaAvaliacaoPublicas")
    public ModelAndView handleRequest() throws Exception {
        List<AvaliacaoPublica> listAvaliacaoPublicas = avaliacaoPublicaDao.list();
        ModelAndView model = new ModelAndView("AvaliacaoPublicaList");
        model.addObject("avaliacaoPublicaList", listAvaliacaoPublicas);
        return model;
    }
 
    @RequestMapping(value = "novaAvaliacaoPublica", method = RequestMethod.GET)
	public ModelAndView newAvaliacaoPublica(@ModelAttribute("command")  AvaliacaoPublica avaliacaoPublica, BindingResult result) {
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("escolas", escolaDao.list());
		return new ModelAndView("AvaliacaoPublicaForm", model);
	}
    
    @RequestMapping(value = "alteraAvaliacaoPublica")
    public ModelAndView editAvaliacaoPublica(HttpServletRequest request) {
        Long avaliacaoPublicaId = Long.parseLong(request.getParameter("id"));
        List<Escola> escolas = escolaDao.list();
        ModelAndView model = new ModelAndView("AvaliacaoPublicaEditForm");
        AvaliacaoPublica avaliacaoPublica = avaliacaoPublicaDao.get(avaliacaoPublicaId);
        model.addObject("escolas", escolas);
        model.addObject("avaliacaoPublica", avaliacaoPublica);
        return model;      
    }
     
    @RequestMapping(value = "deletaAvaliacaoPublica")
    public String deleteAvaliacaoPublica(HttpServletRequest request) {
    	Long avaliacaoPublicaId = Long.parseLong(request.getParameter("id"));
        avaliacaoPublicaDao.delete(avaliacaoPublicaId);
        return "forward:listaAvaliacaoPublicas";     
    }
     
    @RequestMapping(value = "salvaAvaliacaoPublica")
    public String saveAvaliacaoPublica(@ModelAttribute AvaliacaoPublica avaliacaoPublica, BindingResult result,
    		 @RequestParam MultipartFile[] relatorioUpload) {
    	
        avaliacaoPublicaDao.saveOrUpdate(avaliacaoPublica);
        return "forward:listaAvaliacaoPublicas";
    }
}
