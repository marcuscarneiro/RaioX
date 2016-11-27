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
import org.springframework.web.servlet.ModelAndView;

import br.com.marcus.dao.EscolaDao;
import br.com.marcus.dao.ProvaBrasilDao;
import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.ProvaBrasil;

@Controller
public class ProvaBrasilController {

	@Autowired
    private ProvaBrasilDao provaBrasilDao;
 
	@Autowired
    private EscolaDao escolaDao;
		
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
	
    @RequestMapping("listaProvaBrasil")
    public ModelAndView handleRequest() throws Exception {
        List<ProvaBrasil> listProvaBrasil = provaBrasilDao.list();
        ModelAndView model = new ModelAndView("ProvaBrasilList");
        List<Escola> escolas = escolaDao.list();
        model.addObject("provaBrasilList", listProvaBrasil);
        model.addObject("escolas", escolas);
        return model;
    }
 
    @RequestMapping(value = "novaProvaBrasil", method = RequestMethod.GET)
	public ModelAndView newProvaBrasil(@ModelAttribute("command")  ProvaBrasil provaBrasil, BindingResult result) {
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("escolas", escolaDao.list());
		return new ModelAndView("ProvaBrasilForm", model);
	}
    
    @RequestMapping(value = "alteraProvaBrasil")
    public ModelAndView editProvaBrasil(HttpServletRequest request) {
        Long provaBrasilId = Long.parseLong(request.getParameter("id"));
        List<Escola> escolas = escolaDao.list();
        ModelAndView model = new ModelAndView("ProvaBrasilEditForm");
        ProvaBrasil provaBrasil = provaBrasilDao.get(provaBrasilId);
        model.addObject("escolas", escolas);
        model.addObject("provaBrasil", provaBrasil);
        return model;      
    }
     
    @RequestMapping(value = "deletaProvaBrasil")
    public String deleteProvaBrasil(HttpServletRequest request) {
    	Long provaBrasilId = Long.parseLong(request.getParameter("id"));
        provaBrasilDao.delete(provaBrasilId);
        return "forward:listaProvaBrasil";     
    }
     
    @RequestMapping(value = "salvaProvaBrasil")
    public String saveProvaBrasil(@ModelAttribute ProvaBrasil provaBrasil) {
    	
        provaBrasilDao.saveOrUpdate(provaBrasil);
        return "forward:listaProvaBrasil";
    }
}
