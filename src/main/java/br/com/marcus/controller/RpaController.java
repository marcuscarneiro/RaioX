package br.com.marcus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.marcus.dao.RpaDao;
import br.com.marcus.modelo.Rpa;

@Controller
public class RpaController {

	@Autowired
	private RpaDao rpaDao;

	@RequestMapping("listaRpas")
	public ModelAndView handleRequest() throws Exception {
		List<Rpa> listRpas = rpaDao.list();
		ModelAndView model = new ModelAndView("RpaList");
		model.addObject("rpaList", listRpas);
		return model;
	}

	@RequestMapping(value = "novaRpa", method = RequestMethod.GET)
	public ModelAndView newRpa(@ModelAttribute("command") Rpa rpa, BindingResult result) {
		ModelAndView model = new ModelAndView("RpaForm");
		model.addObject("rpa", rpa);
		return model;
	}

	@RequestMapping(value = "alteraRpa")
	public ModelAndView editRpa(HttpServletRequest request) {
		Long rpaId = Long.parseLong(request.getParameter("id"));
		Rpa rpa = rpaDao.get(rpaId);
		ModelAndView model = new ModelAndView("RpaForm");
		model.addObject("rpa", rpa);
		return model;      
	}

	@RequestMapping(value = "deletaRpa")
	public String deleteRpa(HttpServletRequest request) {
		Long rpaId = Long.parseLong(request.getParameter("id"));
		rpaDao.delete(rpaId);
		return "forward:listaRpas";     
	}

	@RequestMapping(value = "/salvaRpa", method = RequestMethod.POST)  
	public String saveRpa(@ModelAttribute("command") Rpa rpa,   
			BindingResult result, @RequestParam MultipartFile[] fileUpload) {  
		
		rpaDao.saveOrUpdate(rpa);
		return "redirect:/listaRpas";
	}
}  