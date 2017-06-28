package br.com.marcus.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.marcus.dao.DadosIdebDao;
import br.com.marcus.dao.EscolaDao;
import br.com.marcus.dao.FotoVisitaDao;
import br.com.marcus.dao.ProvaBrasilDao;
import br.com.marcus.dao.VisitaDao;
import br.com.marcus.modelo.DadosIdeb;
import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.FotoVisita;
import br.com.marcus.modelo.ProvaBrasil;
import br.com.marcus.modelo.Visita;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

@Controller
public class MapaEscolasController {
	
	@Autowired
    private VisitaDao visitaDao;

	@Autowired
    private EscolaDao escolaDao;

	@Autowired
    private FotoVisitaDao fotoVisitaDao;
	
	@Autowired
    private DadosIdebDao dadosIdebDao;
	
	@Autowired
	private ProvaBrasilDao provaBrasilDao;
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
	
	@RequestMapping(value="/consultaRecentes", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody()
	String consultaRecentes(){
		List<Escola> escList = new ArrayList<>();
		List<Visita> visitasList = visitaDao.list();
		for (int i = 0; i < 10; i++) {
			escList.add((visitasList.get(i)).getEscola());
		}
		return getEscolasGeoJSON(escList).toString();
	}
	
	@RequestMapping(value="/carregaEscolas", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody()
	String retornaEscolas(){
		return getEscolasGeoJSON(escolaDao.list()).toString();
	}
	
	@RequestMapping(value = "/consultaVisitas", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	public @ResponseBody
	List<Visita> consultaEscola(@RequestBody Escola escola) {
		String id = escola.getId().toString();
		Escola esc = escolaDao.get(Long.parseLong(id));
		List<Visita> lista = listVisitas(esc);
		try {
			if(!lista.isEmpty()){
				return lista;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping(value = "/consultaEscolasComparativo", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	@ResponseBody
	public List<Escola> consultaEscolasComparativo(
			@RequestBody String json) {
		Long id1 = new Long(json.substring(4,json.indexOf("&")));
		Long id2 = new Long(json.substring(json.indexOf("id2")+4));

		return escolaDao.getEscolasComparativo(id1, id2);
	}
	
	@RequestMapping(value = "/consultaIdebComparativo", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	@ResponseBody
	public List<DadosIdeb> consultaIdebComparativo(
			@RequestBody String json) {
		Long id1 = new Long(json.substring(4,json.indexOf("&")));
		Long id2 = new Long(json.substring(json.indexOf("id2")+4));
		List<DadosIdeb> di = dadosIdebDao.getIdebsComparativo(id1, id2);
		return di;
	}
	
	@RequestMapping(value = "/consultaAprendizadoComparativo", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	@ResponseBody
	public List<ProvaBrasil> consultaAprendizadoComparativo(
			@RequestBody String json) {
		Long id1 = new Long(json.substring(4,json.indexOf("&")));
		Long id2 = new Long(json.substring(json.indexOf("id2")+4));
		List<ProvaBrasil> pb = provaBrasilDao.getProvaBrasilComparativo(id1, id2);
		pb.size();
		return pb;
	}
	
	@RequestMapping(value = "/consultaVisitaComparativo", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	@ResponseBody
	public List<Visita> consultaVisitaComparativo(
			@RequestBody String json) {
		System.out.println(json);
		Long id1 = new Long(json.substring(4,json.indexOf("&")));
		Long id2 = new Long(json.substring(json.indexOf("id2")+4));
		List<Visita> visitas = new ArrayList<>();
		
		visitas.add(visitaDao.getUltimaByEscola(id1));
		visitas.add(visitaDao.getUltimaByEscola(id2));
		
		return visitas;
	}
		
	@RequestMapping(value = "/consultaDadosIdeb", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	public @ResponseBody
		DadosIdeb consultaDadosIdeb(@RequestBody Escola escola) {
		String id = escola.getId().toString();
		Escola esc = escolaDao.get(Long.parseLong(id));
		DadosIdeb ideb = dadosIdebDao.getByEscola(esc);
		if(ideb != null){
			return ideb;
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/consultaProvaBrasil", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	public @ResponseBody
		ProvaBrasil consultaProvaBrasil(@RequestBody Escola escola) {
		String id = escola.getId().toString();
		Escola esc = escolaDao.get(Long.parseLong(id));
		ProvaBrasil provaBrasil = provaBrasilDao.getByEscola(esc);
		return provaBrasil;
	}
	
	@RequestMapping(value = "/consultaFotosVisita", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	public @ResponseBody
		List<FotoVisita> consultaFotosVisita(@RequestBody Visita visita) {
		String id = visita.getId().toString();
		Visita vis = visitaDao.get(Long.parseLong(id));
		List<FotoVisita> fotosVisita = fotoVisitaDao.getByVisita(vis);
		return fotosVisita;
	}
	
	@RequestMapping(value="/melhorIdeb5", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String melhorIdeb5(){
		List<DadosIdeb> idebs = dadosIdebDao.getMelhorIdeb5();
		List<Escola> escolas = new ArrayList<>();
		for (DadosIdeb di : idebs) {
			escolas.add(escolaDao.get(di.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/piorIdeb5", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String piorIdeb5(){
		List<DadosIdeb> idebs = dadosIdebDao.getPiorIdeb5();
		List<Escola> escolas = new ArrayList<>();
		for (DadosIdeb di : idebs) {
			escolas.add(escolaDao.get(di.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/melhorIdeb9", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String melhorIdeb9(){
		List<DadosIdeb> idebs = dadosIdebDao.getMelhorIdeb9();
		List<Escola> escolas = new ArrayList<>();
		for (DadosIdeb di : idebs) {
			escolas.add(escolaDao.get(di.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/piorIdeb9", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String piorIdeb9(){
		List<DadosIdeb> idebs = dadosIdebDao.getPiorIdeb9();
		List<Escola> escolas = new ArrayList<>();
		for (DadosIdeb di : idebs) {
			escolas.add(escolaDao.get(di.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/melhorProfPort5", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String getMelhorProfPort5(){
		List<ProvaBrasil> pbs = provaBrasilDao.getMelhorProfPort5();
		List<Escola> escolas = new ArrayList<>();
		for (ProvaBrasil pb : pbs) {
			escolas.add(escolaDao.get(pb.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/piorProfPort5", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String getPiorProfPort5(){
		List<ProvaBrasil> pbs = provaBrasilDao.getPiorProfPort5();
		List<Escola> escolas = new ArrayList<>();
		for (ProvaBrasil pb : pbs) {
			escolas.add(escolaDao.get(pb.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/melhorProfPort9", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String getMelhorProfPort9(){
		List<ProvaBrasil> pbs = provaBrasilDao.getMelhorProfPort9();
		List<Escola> escolas = new ArrayList<>();
		for (ProvaBrasil pb : pbs) {
			escolas.add(escolaDao.get(pb.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/piorProfPort9", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String getPiorProfPort9(){
		List<ProvaBrasil> pbs = provaBrasilDao.getPiorProfPort9();
		List<Escola> escolas = new ArrayList<>();
		for (ProvaBrasil pb : pbs) {
			escolas.add(escolaDao.get(pb.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/melhorProfMat5", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String getMelhorProfMat5(){
		List<ProvaBrasil> pbs = provaBrasilDao.getMelhorProfMat5();
		List<Escola> escolas = new ArrayList<>();
		for (ProvaBrasil pb : pbs) {
			escolas.add(escolaDao.get(pb.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/piorProfMat5", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String getPiorProfMat5(){
		List<ProvaBrasil> pbs = provaBrasilDao.getPiorProfMat5();
		List<Escola> escolas = new ArrayList<>();
		for (ProvaBrasil pb : pbs) {
			escolas.add(escolaDao.get(pb.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/melhorProfMat9", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String getMelhorProfMat9(){
		List<ProvaBrasil> pbs = provaBrasilDao.getMelhorProfMat9();
		List<Escola> escolas = new ArrayList<>();
		for (ProvaBrasil pb : pbs) {
			escolas.add(escolaDao.get(pb.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	@RequestMapping(value="/piorProfMat9", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody String getPiorProfMat9(){
		List<ProvaBrasil> pbs = provaBrasilDao.getPiorProfMat9();
		List<Escola> escolas = new ArrayList<>();
		for (ProvaBrasil pb : pbs) {
			escolas.add(escolaDao.get(pb.getEscola().getId()));
		}
		return getEscolasGeoJSON(escolas).toString();
	}
	
	public String listEscolas() throws JsonGenerationException, JsonMappingException, IOException{
		List<Escola> escolas = escolaDao.list();
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = ow.writeValueAsString(escolas);
		return json;
	}
	
    public List<Visita> listVisitas(Escola escola){
    	List<Visita> visitas = visitaDao.getByEscola(escola);
        return visitas;
    }
    
    public List<FotoVisita> listFotoVisita(Visita visita){
    	List<FotoVisita> fotosVisita = fotoVisitaDao.listFotos();
    	return fotosVisita;
    }
    
    public JSONObject getEscolasGeoJSON(List<Escola> escolas){
    	JSONObject featureCollection = new JSONObject();
        try {
            featureCollection.put("type", "FeatureCollection");
            JSONArray featureList = new JSONArray();
            // iterate through your list
            List<Visita> visitas = visitaDao.list();
            List<DadosIdeb> listDadosIdeb = dadosIdebDao.list();
            for (Escola escola : escolas) {
                // {"geometry": {"type": "Point", "coordinates": [-94.149, 36.33]}
                JSONObject point = new JSONObject();
                point.put("type", "Point");
                // construct a JSONArray from a string; can also use an array or list
                JSONArray coord = new JSONArray("["+escola.getLongitude()+","+escola.getLatitude()+"]");
                point.put("coordinates", coord);
                JSONObject feature = new JSONObject();
                feature.put("geometry", point);
                feature.put("type", "Feature");
                JSONObject properties = new JSONObject();
                properties.put("ID", escola.getId());
                System.out.println("ID: " + escola.getId());
                properties.put("Escola", escola.getNome());
                properties.put("Endereco", getEnderecoEscola(escola));
                properties.put("IDEB", escola.getIdeb());
                properties.put("RPA", escola.getRpa());
                properties.put("Nova", escola.getNova());
                DadosIdeb dadosIdeb = null;
                for(DadosIdeb di : listDadosIdeb){
                	if(escola.getId().intValue() == di.getEscola().getId().intValue()){
                		dadosIdeb = di;
                	}
                }
                properties.put("Evolucao", getEvolucaoLinear(dadosIdeb));
                properties.put("COR", getMarkerColor(dadosIdeb));
                properties.put("ATINGIUMETA", getMetaAtingida(dadosIdeb));
                properties.put("Foto", escola.getFotoCapa());
                for(Visita visita : visitas){
                	if(escola.getId().intValue() == visita.getEscola().getId().intValue()){
                		String situacao = "";
                		try {
                			properties.put("DataVisita", visita.getData());
                		} catch (Exception e) {
                		}
                		
                		try {
                    		situacao = visita.getRl3();
                		} catch (Exception e) {
                		}
                		
                		if(situacao.equals("")){
                			properties.put("POSSUIQUADRA", "null");
                			break;
                		} else if(situacao.equals("0")){
                			properties.put("POSSUIQUADRA", 0);
                			break;
                		} else if(situacao.equals("1")){
                			properties.put("POSSUIQUADRA", 1);
                			break;
                		} else if(situacao.equals("2")){
                			properties.put("POSSUIQUADRA", 2);
                			break;
                		} else if(situacao.equals("3")){
                			properties.put("POSSUIQUADRA", 3);
                			break;
                		}
                	}
                }
                
                for(Visita visita : visitas){
                	if(escola.getId().intValue() == visita.getEscola().getId().intValue()){
            			properties.put("ACESSIBILIDADE", getAcessibilidade(visita));
            			break;
                	}
                }
                feature.put("properties", properties);
                featureList.put(feature);
                featureCollection.put("features", featureList);
            }
        } catch (JSONException e) {
            System.out.println("can't save json object: "+e.toString());
        }
        // output the result
        System.out.println(featureCollection.toString());
        return featureCollection;
    }
    
    public int getAcessibilidade(Visita visita){
    	String ace5, ace6, ace7, ace8, ace9, ace2, ace3, ace4, eac1, eac2, eac3a, eac3b, eac3c, eac3d;
    	int eee7, eee8;
    	try {
    		if(visita.getAce5() == null){
    			ace5 = "";
    		} else {
    			ace5 = visita.getAce5();
    		}
		} catch (Exception e) {
			ace5 = "";
		}
    	
    	try {
    		if(visita.getAce6() == null){
    			ace6 = "";
    		} else {
    			ace6 = visita.getAce6();
    		}
		} catch (Exception e) {
			ace6 = "";
		}
    	try {
    		if(visita.getAce7() == null){
    			ace7 = "";
    		} else {
    			ace7 = visita.getAce7();
    		}
		} catch (Exception e) {
			ace7 = "";
		}
    	
    	try {
    		if(visita.getAce8() == null){
    			ace8 = "";
    		} else {
    			ace8 = visita.getAce8();
    		}
		} catch (Exception e) {
			ace8 = "";
		}

    	try {
    		if(visita.getAce9() == null){
    			ace9 = "";
    		} else {
    			ace9 = visita.getAce9();
    		}
		} catch (Exception e) {
			ace9 = "";
		}
    	
    	try {
    		if(visita.getEee7() == null){
    			eee7 = 0;
    		} else {
    			eee7 = Integer.parseInt(visita.getEee7());
    		}
		} catch (Exception e) {
			eee7 = 0;
		}
    	
    	try {
    		if(visita.getEee8() == null){
    			eee8 = 0;
    		} else {
    			eee8 = Integer.parseInt(visita.getEee8());
    		}
		} catch (Exception e) {
			eee8 = 0;
		}
    	
    	try {
    		if(visita.getAce2() == null){
    			ace2 = "";
    		} else {
    			ace2 = visita.getAce2();
    		}
		} catch (Exception e) {
			ace2 = "";
		}
    	
    	try {
    		if(visita.getAce3() == null){
    			ace3 = "";
    		} else {
    			ace3 = visita.getAce3();
    		}
		} catch (Exception e) {
			ace3 = "";
		}
    	
    	try {
    		if(visita.getAce4() == null){
    			ace4 = "";
    		} else {
    			ace4 = visita.getAce4();
    		}
		} catch (Exception e) {
			ace4 = "";
		}
    	
    	try {
    		if(visita.getEac1() == null){
    			eac1 = "";
    		} else {
    			eac1 = visita.getEac1();
    		}
		} catch (Exception e) {
			eac1 = "";
		}
    	
    	try {
    		if(visita.getEac2() == null){
    			eac2 = "";
    		} else {
    			eac2 = visita.getEac2();
    		}
		} catch (Exception e) {
			eac2 = "";
		}
    	
    	try {
    		if(visita.getEac3a() == null){
    			eac3a = "";
    		} else {
    			eac3a = visita.getEac3a();
    		}
		} catch (Exception e) {
			eac3a = "";
		}
    	
    	try {
    		if(visita.getEac3b() == null){
    			eac3b = "";
    		} else {
    			eac3b = visita.getEac3b();
    		}
		} catch (Exception e) {
			eac3b = "";
		}
    	
    	try {
    		if(visita.getEac3c() == null){
    			eac3c = "";
    		} else {
    			eac3c = visita.getEac3c();
    		}
		} catch (Exception e) {
			eac3c = "";
		}
    	
    	try {
    		if(visita.getEac3d() == null){
    			eac3d = "";
    		} else {
    			eac3d = visita.getEac3d();
    		}
		} catch (Exception e) {
			eac3d = "";
		}
    	
    	boolean t1, t2, t3, t4, t5;
    	
    	// TESTE 1
    	if(ace5.equals("true") && ace6.equals("true") && ace9.equals("true") && eac1.equals("true") && eac2.equals("true") && eac3a.equals("true") && eac3b.equals("true") && eac3c.equals("true") && eac3d.equals("true")){
    		t1 = true;
    	} else {
    		t1 = false;
    	}
    	
    	// TESTE 2
    	if(eee7 == eee8){
    		t2 = true;
    	} else {
    		t2 = false;
    	}
    	
    	// TESTE 3
		if(ace2.equals("true")){
			if(ace7.equals("true") && ace8.equals("true")){
				t3 = true;
			} else {
				t3 = false;
			}
		} else {
			t3 = true;
		}
		
		// TESTE 4
		if(ace3.equals("true")){
			if(ace7.equals("true")){
				t4 = true;
			} else {
				t4 = false;
			}
		} else {
			t4 = true;
		}
		
		// TESTE 5
		if(ace4.equals("true")){
			if(ace7.equals("true")){
				t5 = true;
			} else {
				t5 = false;
			}
    	} else {
    		t5 = true;
    	}
		
		System.out.println(t1 + " - " + t2 + " - " + t3 + " - " + t4 + " - " + t5);
		
		if(t1 && t2 && t3 && t4 && t5){
			return 3;
		} else if(ace5.equals("true") || ace6.equals("true") || ace9.equals("true") || eac1.equals("true") || eac2.equals("true") || eac3a.equals("true") || eac3b.equals("true") || eac3c.equals("true") || eac3d.equals("true") || t2 || t3 || t4 || t5){
			return 2;
		} else {
			return 1;
		}
    }
    
    public String getMarkerColor(DadosIdeb dadosIdeb){
    	
    	Double idebIni, idebFin, metaIni, metaFin;
    	try {
    		if(dadosIdeb.getDid_ideb_2019_ini() != null){
    			idebIni = dadosIdeb.getDid_ideb_2019_ini();
    			metaIni = dadosIdeb.getDid_meta_2019_ini();
    		} else if(dadosIdeb.getDid_ideb_2017_ini() != null){
    			idebIni = dadosIdeb.getDid_ideb_2017_ini();
    			metaIni = dadosIdeb.getDid_meta_2017_ini();
    		} else if(dadosIdeb.getDid_ideb_2015_ini() != null){
    			idebIni = dadosIdeb.getDid_ideb_2015_ini();
    			metaIni = dadosIdeb.getDid_meta_2015_ini();
    		} else if(dadosIdeb.getDid_ideb_2013_ini() != null){
    			idebIni = dadosIdeb.getDid_ideb_2013_ini();
    			metaIni = dadosIdeb.getDid_meta_2013_ini();
    		} else {
    			idebIni = null;
    			metaIni = null;
    		}
		} catch (Exception e) {
			 idebIni = null;
			 metaIni = null;
		}
    	
    	try {
    		if(dadosIdeb.getDid_ideb_2021_fin() != null){
    			idebFin = dadosIdeb.getDid_ideb_2021_fin();
    			metaFin = dadosIdeb.getDid_meta_2021_fin();
    		} else if(dadosIdeb.getDid_ideb_2019_fin() != null){
    			idebFin = dadosIdeb.getDid_ideb_2019_fin();
    			metaFin = dadosIdeb.getDid_meta_2019_fin();
    		} else if(dadosIdeb.getDid_ideb_2017_fin() != null){
    			idebFin = dadosIdeb.getDid_ideb_2017_fin();
    			metaFin = dadosIdeb.getDid_meta_2017_fin();
    		} else if(dadosIdeb.getDid_ideb_2015_fin() != null){
    			idebFin = dadosIdeb.getDid_ideb_2015_fin();
    			metaFin = dadosIdeb.getDid_meta_2015_fin();
    		} else if(dadosIdeb.getDid_ideb_2013_fin() != null){
    			idebFin = dadosIdeb.getDid_ideb_2013_fin();
    			metaFin = dadosIdeb.getDid_meta_2013_fin();
    		} else {
    			idebFin = null;
    			metaFin = null;
    		}
		} catch (Exception e) {
			idebFin = null;
			metaFin = null;
		}
    	
    	if(idebIni != null && idebFin != null && metaIni != null && metaFin != null){
    		if(idebIni < metaIni){
    			return "red";
    		} else {
    			if(idebFin < metaFin){
    				return "red";
    			} else {
    				if(idebIni < 6 && idebFin < 6) {
    					return "yellow";
    				} else {
    					if(idebIni >= 6 && idebFin >= 6){
    						return "green";
    					} else {
    						return "yellow";
    					}
    				}
    			}
    		}
    	} else if(idebIni != null && metaIni != null){
			if(idebIni < metaIni){
    			return "red";
			} else {
				if(idebIni < 6) {
					return "yellow";
				} else {
					return "green";
				}
			}
		} else if(idebFin != null && metaFin != null){
			if(idebFin < metaFin){
    			return "red";
			} else {
				if(idebFin < 6) {
					return "yellow";
				} else {
					return "green";
				}
			}
		} else {
			return "grey";
		}
    }

    public boolean getMetaAtingida(DadosIdeb dadosIdeb){
    	Double idebIni, idebFin, metaIni, metaFin;
    	try {
    		if(dadosIdeb.getDid_ideb_2015_ini() != null){
    			idebIni = dadosIdeb.getDid_ideb_2015_ini();
    		} else {
    			idebIni = dadosIdeb.getDid_ideb_2013_ini();
    		}
		} catch (Exception e) {
			idebIni = null;
		}
    	
    	try {
    		if(dadosIdeb.getDid_ideb_2015_fin() != null){
    			idebFin = dadosIdeb.getDid_ideb_2015_fin();
    		} else {
    			idebFin = dadosIdeb.getDid_ideb_2013_fin();
    		}
		} catch (Exception e) {
			idebFin = null;
		}
    	
    	try {
    		if(dadosIdeb.getDid_ideb_2015_ini() != null){
    			metaIni = dadosIdeb.getDid_meta_2015_ini();
    		} else {
    			metaIni = dadosIdeb.getDid_meta_2013_ini();
    		}
    	} catch (Exception e) {
    		metaIni = null;
		}
    	
    	try {
    		if(dadosIdeb.getDid_ideb_2015_fin() != null){
    			metaFin = dadosIdeb.getDid_meta_2015_fin();
    		} else {
    			metaFin = dadosIdeb.getDid_meta_2013_fin();
    		}
		} catch (Exception e) {
			metaFin = null;
		}
    	
    	if(idebIni != null && idebFin != null && metaIni != null && metaFin != null){
    		if(idebIni >= metaIni && idebFin >= metaFin){
    			return true;
    		} else {
    			return false;
    		}
    	} else if(idebIni != null && metaIni != null) {
    		if(idebIni >= metaIni){
    			return true;
    		} else {
    			return false;
    		}
    	} else if(idebFin != null && metaFin != null){
    		if(idebFin >= metaFin){
    			return true;
    		} else {
    			return false;
    		}
    	} else {
    		return false;
    	}
    }
    
    public String getEvolucaoLinear(DadosIdeb dadosIdeb){
    	
    	Double ideb2007Ini, ideb2009Ini, ideb2011Ini, ideb2013Ini, ideb2015Ini;
    	Double ideb2007Fin, ideb2009Fin, ideb2011Fin, ideb2013Fin, ideb2015Fin;
    	Double meta2007Ini, meta2009Ini, meta2011Ini, meta2013Ini, meta2015Ini;
    	Double meta2007Fin, meta2009Fin, meta2011Fin, meta2013Fin, meta2015Fin;
    	Boolean idebIni = null, idebFin = null, metaIni = null, metaFin = null, idebFinal = null, metaFinal = null;
    	
    	//IDEBS
    	
    	//INICIAIS
    	
    	try {
    		ideb2007Ini = dadosIdeb.getDid_ideb_2007_ini();
		} catch (Exception e) {
			ideb2007Ini = null;
		}
    	try {
    		ideb2009Ini = dadosIdeb.getDid_ideb_2009_ini();
		} catch (Exception e) {
			ideb2009Ini = null;
		}
    	try {
    		ideb2011Ini = dadosIdeb.getDid_ideb_2011_ini();
		} catch (Exception e) {
			ideb2011Ini = null;
		}
    	try {
    		ideb2013Ini = dadosIdeb.getDid_ideb_2013_ini();
		} catch (Exception e) {
			ideb2013Ini = null;
		}
    	try {
    		ideb2015Ini = dadosIdeb.getDid_ideb_2015_ini();
		} catch (Exception e) {
			ideb2015Ini = null;
		}
    	
    	//FINAIS

    	try {
    		ideb2007Fin = dadosIdeb.getDid_ideb_2007_fin();
		} catch (Exception e) {
			ideb2007Fin = null;
		}
    	try {
    		ideb2009Fin = dadosIdeb.getDid_ideb_2009_fin();
		} catch (Exception e) {
			ideb2009Fin = null;
		}
    	try {
    		ideb2011Fin = dadosIdeb.getDid_ideb_2011_fin();
		} catch (Exception e) {
			ideb2011Fin = null;
		}
    	try {
    		ideb2013Fin = dadosIdeb.getDid_ideb_2013_fin();
		} catch (Exception e) {
			ideb2013Fin = null;
		}
    	try {
    		ideb2015Fin = dadosIdeb.getDid_ideb_2015_fin();
		} catch (Exception e) {
			ideb2015Fin = null;
		}
    	
    	//METAS
    	
    	//INICIAIS
    	
    	try {
    		meta2007Ini = dadosIdeb.getDid_meta_2007_ini();
		} catch (Exception e) {
			meta2007Ini = null;
		}
    	try {
    		meta2009Ini = dadosIdeb.getDid_meta_2009_ini();
		} catch (Exception e) {
			meta2009Ini = null;
		}
    	try {
    		meta2011Ini = dadosIdeb.getDid_meta_2011_ini();
		} catch (Exception e) {
			meta2011Ini = null;
		}
    	try {
    		meta2013Ini = dadosIdeb.getDid_meta_2013_ini();
		} catch (Exception e) {
			meta2013Ini = null;
		}
    	try {
    		meta2015Ini = dadosIdeb.getDid_meta_2015_ini();
		} catch (Exception e) {
			meta2015Ini = null;
		}
    	
    	//FINAIS

    	try {
    		meta2007Fin = dadosIdeb.getDid_meta_2007_fin();
		} catch (Exception e) {
			meta2007Fin = null;
		}
    	try {
    		meta2009Fin = dadosIdeb.getDid_meta_2009_fin();
		} catch (Exception e) {
			meta2009Fin = null;
		}
    	try {
    		meta2011Fin = dadosIdeb.getDid_meta_2011_fin();
		} catch (Exception e) {
			meta2011Fin = null;
		}
    	try {
    		meta2013Fin = dadosIdeb.getDid_meta_2013_fin();
		} catch (Exception e) {
			meta2013Fin = null;
		}
    	try {
    		meta2015Fin = dadosIdeb.getDid_meta_2015_fin();
		} catch (Exception e) {
			meta2015Fin = null;
		}
    	
    	//TESTES CRESCIMENTO
    	
		if(ideb2015Ini != null && ideb2013Ini != null){
			if(ideb2015Ini > ideb2013Ini){
				idebIni = true;
				if(ideb2013Ini != null && ideb2011Ini != null){
					if(ideb2013Ini > ideb2011Ini){
						idebIni = true;
						if(ideb2011Ini != null && ideb2009Ini != null){
							if(ideb2011Ini > ideb2009Ini){
								idebIni = true;
								if(ideb2009Ini != null && ideb2007Ini != null){
									if(ideb2009Ini > ideb2007Ini){
										idebIni = true;
									} else {
										idebIni = false;
									}
								}
							} else {
								idebIni = false;
							}
						}
			    	} else {
						idebIni = false;
					}
				}
			} else {
				idebIni = false;
			}
		} else {
			if(ideb2013Ini != null && ideb2011Ini != null){
				if(ideb2013Ini > ideb2011Ini){
					idebIni = true;
					if(ideb2011Ini != null && ideb2009Ini != null){
						if(ideb2011Ini > ideb2009Ini){
							idebIni = true;
							if(ideb2009Ini != null && ideb2007Ini != null){
								if(ideb2009Ini > ideb2007Ini){
									idebIni = true;
								} else {
									idebIni = false;
								}
							}
						} else {
							idebIni = false;
						}
					}
		    	} else {
					idebIni = false;
				}
			} else {
				idebIni = false;
			}
		}
    	
		if(ideb2015Fin != null && ideb2013Fin != null){
			if(ideb2015Fin > ideb2013Fin){
				idebFin = true;
				if(ideb2013Fin != null && ideb2011Fin != null){
					if(ideb2013Fin > ideb2011Fin){
						idebFin = true;
						if(ideb2011Fin != null && ideb2009Fin != null){
							if(ideb2011Fin > ideb2009Fin){
								idebFin = true;
								if(ideb2009Fin != null && ideb2007Fin != null){
									if(ideb2009Fin > ideb2007Fin){
										idebFin = true;
									} else {
										idebFin = false;
									}
								}
							} else {
								idebFin = false;
							}
						}
			    	} else {
						idebFin = false;
					}
				}
			} else {
				idebFin = false;
			}
		} else {
			if(ideb2013Fin != null && ideb2011Fin != null){
				if(ideb2013Fin > ideb2011Fin){
					idebFin = true;
					if(ideb2011Fin != null && ideb2009Fin != null){
						if(ideb2011Fin > ideb2009Fin){
							idebFin = true;
							if(ideb2009Fin != null && ideb2007Fin != null){
								if(ideb2009Fin > ideb2007Fin){
									idebFin = true;
								} else {
									idebFin = false;
								}
							}
						} else {
							idebFin = false;
						}
					}
		    	} else {
					idebFin = false;
				}
			}
		}
    	
		//TESTES METAS
//		Double ideb2007Ini, ideb2009Ini, ideb2011Ini, ideb2013Ini, ideb2015Ini;
//    	Double ideb2007Fin, ideb2009Fin, ideb2011Fin, ideb2013Fin, ideb2015Fin;
//    	Double meta2007Ini, meta2009Ini, meta2011Ini, meta2013Ini, meta2015Ini;
//    	Double meta2007Fin, meta2009Fin, meta2011Fin, meta2013Fin, meta2015Fin;
//    	Boolean idebIni = null, idebFin = null, metaIni = null, metaFin = null;
		
		//INICIAIS
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("@@@@@@@@@@@@@"+ dadosIdeb.getEscola().getNome() +"@@@@@@@@@@@@@");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		if(dadosIdeb.getEscola().getId() == 262){
			System.out.println("aqui");
		}
		if(ideb2007Ini != null){
			if(ideb2007Ini >= meta2007Ini){
				metaIni = true;
			} else {
				metaIni = false;
			}
		}
		if(ideb2009Ini != null){
			if(ideb2009Ini >= meta2009Ini){
				metaIni = true;
			} else {
				metaIni = false;
			}
		}
		if(ideb2011Ini != null){
			if(ideb2011Ini >= meta2011Ini){
				metaIni = true;
			} else {
				metaIni = false;
			}
		}
		if(ideb2013Ini != null){
			if(ideb2013Ini >= meta2013Ini){
				metaIni = true;
			} else {
				metaIni = false;
			}
		}
		if(ideb2015Ini != null){
			if(ideb2015Ini >= meta2015Ini){
				metaIni = true;
			} else {
				metaIni = false;
			}
		}
		
		//FINAIS
		
		if(ideb2007Fin != null){
			if(ideb2007Fin >= meta2007Fin){
				metaFin = true;
			} else {
				metaFin = false;
			}
		}
		if(ideb2009Fin != null){
			if(ideb2009Fin >= meta2009Fin){
				metaFin = true;
			} else {
				metaFin = false;
			}
		}
		if(ideb2011Fin != null){
			if(ideb2011Fin >= meta2011Fin){
				metaFin = true;
			} else {
				metaFin = false;
			}
		}
		if(ideb2013Fin != null){
			if(ideb2013Fin >= meta2013Fin){
				metaFin = true;
			} else {
				metaFin = false;
			}
		}
		if(ideb2015Fin != null){
			if(ideb2015Fin >= meta2015Fin){
				metaFin = true;
			} else {
				metaFin = false;
			}
		}
		
		//TESTE FINAIS
		
		if(metaIni != null && metaFin != null){
			if(metaIni == true && metaFin == true){
				metaFinal = true;
			} else {
				metaFinal = false;
			}
		} else if(metaIni != null){
			if(metaIni == true){
				metaFinal = true;
			} else {
				metaFinal = false;
			}
		} else if(metaFin != null){
			if(metaFin == true){
				metaFinal = true;
			} else {
				metaFinal = false;
			}
		} else {
			metaFinal = false;
		}
		
    	if(idebIni != null && idebFin != null){
    		if(idebIni && idebFin){
    			idebFinal = true;
    		} else {
    			idebFinal = false;
    		}
    	} else if(idebIni != null) {
    		if(idebIni){
    			idebFinal = true;
    		} else {
    			idebFinal = false;
    		}
    	} else if(idebFin != null) {
    		if(idebFin){
    			idebFinal = true;
    		} else {
    			idebFinal = false;
    		}
    	} else {
    		idebFinal = false;
    	}
    	
    	if(metaFinal == true && idebFinal == true){
    		return "true";
    	} else {
    		return "false";
    	}
    }
    
    public String getEnderecoEscola(Escola escola){
    	System.out.println("##################################");
    	System.out.println(escola.getNome());
    	System.out.println("##################################");
    	String endereco = "";
    	
    	try {
    		if(escola.getLogradouro() != null && !escola.getLogradouro().isEmpty()){
    			endereco += escola.getLogradouro();
    		}
		} catch (Exception e) {
			
		}
    	
    	try {
    		if(escola.getNumeroEnd() != null && !escola.getNumeroEnd().isEmpty()){
    			endereco += ", " + escola.getNumeroEnd();
    		}
		} catch (Exception e) {

		}

    	try {
    		if(escola.getComplemento() != null && !escola.getComplemento().isEmpty()){
    			endereco += ", " + escola.getComplemento();
    		}
		} catch (Exception e) {

		}
    	
    	try {
    		if(escola.getBairro() != null && !escola.getBairro().isEmpty()){
    			endereco += ", " + escola.getBairro();
    		}
		} catch (Exception e) {

		}
    	
    	return endereco;
    }
    
}
