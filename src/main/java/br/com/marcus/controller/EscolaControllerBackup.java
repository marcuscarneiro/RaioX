package br.com.marcus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.marcus.dao.EscolaDao;
import br.com.marcus.modelo.Escola;

@Controller
public class EscolaControllerBackup {

	@Autowired
    private EscolaDao escolaDao;
 
    @RequestMapping("/1")
    public ModelAndView handleRequest() throws Exception {
        List<Escola> listEscolas = escolaDao.list();
        ModelAndView model = new ModelAndView("EscolaList");
        model.addObject("escolaList", listEscolas);
        return model;
    }
     
//    @RequestMapping(value = "novaEscola")
//    public ModelAndView newEscola() {
//        ModelAndView model = new ModelAndView("EscolaForm");
//        model.addObject("escola", new Escola());
//        return model;      
//    }
    
    @RequestMapping(value = "/2", method = RequestMethod.GET)
	public ModelAndView newEscola(@ModelAttribute("command") Escola escola, BindingResult result) {
//    	Map<String, Object> model = new HashMap<String, Object>();
//    	model.put("escolas",  escolaDao.list());
    	ModelAndView model = new ModelAndView("EscolaForm");
        model.addObject("escola", escola);
		return model;
	}
    
    @RequestMapping(value = "/3")
    public ModelAndView editEscola(HttpServletRequest request) {
        Long escolaId = Long.parseLong(request.getParameter("id"));
        Escola escola = escolaDao.get(escolaId);
        ModelAndView model = new ModelAndView("EscolaForm");
        model.addObject("escola", escola);
        return model;      
    }
     
    @RequestMapping(value = "/4")
    public String deleteEscola(HttpServletRequest request) {
    	Long escolaId = Long.parseLong(request.getParameter("id"));
        escolaDao.delete(escolaId);
        return "forward:listaEscolas";     
    }
     
//    @RequestMapping(value = "salvaEscola")
//    public String saveEscola(@ModelAttribute Escola escola) {
//        escolaDao.saveOrUpdate(escola);
//        return "forward:listaEscolas";
//    }
//    
    @RequestMapping(value = "/5", method = RequestMethod.POST)  
    public ModelAndView saveEscola(@ModelAttribute("command") Escola escola,   
      BindingResult result) {  
    	escolaDao.saveOrUpdate(escola);  
     return new ModelAndView("redirect:/listaEscolas.html");  
    }  
}
