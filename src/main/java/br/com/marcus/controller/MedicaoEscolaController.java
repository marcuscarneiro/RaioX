package br.com.marcus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.marcus.dao.MedicaoEscolaDao;
import br.com.marcus.dao.VisitaDao;
import br.com.marcus.modelo.MedicaoEscola;
import br.com.marcus.modelo.Visita;

@Controller
public class MedicaoEscolaController {

	@Autowired
    private MedicaoEscolaDao medicaoEscolaDao;
 
	@Autowired
    private VisitaDao visitaDao;
	
    @RequestMapping("listaMedicoesEscola")
    public ModelAndView listaMedicoesEscola(HttpServletRequest request) {
    	Long visitaId = Long.parseLong(request.getParameter("id"));
        Visita visita = visitaDao.get(visitaId);
        List<MedicaoEscola> listMedicoes = medicaoEscolaDao.getByVisita(visita);
        ModelAndView model = new ModelAndView("MedicaoEscolaList");
        model.addObject("medicaoEscolaList", listMedicoes);
        return model;
    }
 
    @RequestMapping(value = "novaMedicaoEscola", method = RequestMethod.GET)
	public ModelAndView newMedicaoEscola(HttpServletRequest request) {
    	Long visitaId = Long.parseLong(request.getParameter("id"));
		ModelAndView model = new ModelAndView("MedicaoEscolaForm");
        Visita visita = visitaDao.get(visitaId);
        model.addObject("visita", visita);
        return model;
	}
    
    @RequestMapping(value = "alteraMedicaoEscola")
    public ModelAndView editMedicaoEscola(HttpServletRequest request) {
        Long medicaoEscolaId = Long.parseLong(request.getParameter("id"));
        ModelAndView model = new ModelAndView("MedicaoEscolaForm");
        MedicaoEscola medicaoEscola = medicaoEscolaDao.getMedicao(medicaoEscolaId);
        model.addObject("medicaoEscola", medicaoEscola);
        return model;      
    }
     
    @RequestMapping(value = "deletaMedicaoEscola")
    public String deleteMedicaoEscola(HttpServletRequest request) {
    	Long medicaoEscolaId = Long.parseLong(request.getParameter("id"));
        medicaoEscolaDao.delete(medicaoEscolaId);
        return "forward:listaVisitas";     
    }
     
//    @RequestMapping(value = "salvaMedicaoEscola")
//    public String saveMedicaoEscola(@RequestParam("id") Long id, @RequestParam("ambiente") String ambiente, @RequestParam("temperatura") String temperatura, @RequestParam("luminosidade") String luminosidade ) {
//    	
//        medicaoEscolaDao.saveMedicao(medicaoEscola);
//        return "forward:listaVisitas";
//    }
    
    @RequestMapping(name = "saveMedicaoEscola", method = RequestMethod.POST)
    @ResponseBody
    public String saveMedicaoEscola(@RequestBody MedicaoEscola medicaoEscola) {
    	medicaoEscolaDao.saveMedicao(medicaoEscola);
      return "forward:listaVisitas";
    }
}
