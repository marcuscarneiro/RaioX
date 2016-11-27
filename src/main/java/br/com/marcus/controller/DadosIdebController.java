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

import br.com.marcus.dao.DadosIdebDao;
import br.com.marcus.dao.EscolaDao;
import br.com.marcus.modelo.DadosIdeb;
import br.com.marcus.modelo.Escola;

@Controller
public class DadosIdebController {

	@Autowired
    private DadosIdebDao dadosIdebDao;
 
	@Autowired
    private EscolaDao escolaDao;
		
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
	
    @RequestMapping("listaIdeb")
    public ModelAndView handleRequest() throws Exception {
        List<DadosIdeb> listDadosIdebs = dadosIdebDao.list();
        ModelAndView model = new ModelAndView("DadosIdebList");
        List<Escola> escolas = escolaDao.list();
        model.addObject("dadosIdebList", listDadosIdebs);
        model.addObject("escolas", escolas);
        return model;
    }
 
    @RequestMapping(value = "novaDadosIdeb", method = RequestMethod.GET)
	public ModelAndView newDadosIdeb(@ModelAttribute("command")  DadosIdeb dadosIdeb, BindingResult result) {
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("escolas", escolaDao.list());
		return new ModelAndView("DadosIdebForm", model);
	}
    
    @RequestMapping(value = "alteraDadosIdeb")
    public ModelAndView editDadosIdeb(HttpServletRequest request) {
        Long dadosIdebId = Long.parseLong(request.getParameter("id"));
        List<Escola> escolas = escolaDao.list();
        ModelAndView model = new ModelAndView("DadosIdebEditForm");
        DadosIdeb dadosIdeb = dadosIdebDao.get(dadosIdebId);
        model.addObject("escolas", escolas);
        model.addObject("dadosIdeb", dadosIdeb);
        return model;      
    }
     
    @RequestMapping(value = "deletaDadosIdeb")
    public String deleteDadosIdeb(HttpServletRequest request) {
    	Long dadosIdebId = Long.parseLong(request.getParameter("id"));
        dadosIdebDao.delete(dadosIdebId);
        return "forward:listaIdeb";     
    }
     
    @RequestMapping(value = "salvaDadosIdeb")
    public String saveDadosIdeb(@ModelAttribute DadosIdeb dadosIdeb) {
    	
        dadosIdebDao.saveOrUpdate(dadosIdeb);
        return "forward:listaIdeb";
    }
}
