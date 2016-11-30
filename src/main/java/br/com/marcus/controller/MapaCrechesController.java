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

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import br.com.marcus.dao.CrecheDao;
import br.com.marcus.dao.FotoVistoriaCrecheDao;
import br.com.marcus.dao.NotasCrecheDao;
import br.com.marcus.dao.VistoriaCrecheDao;
import br.com.marcus.modelo.Creche;
import br.com.marcus.modelo.FotoVistoriaCreche;
import br.com.marcus.modelo.NotasCreche;
import br.com.marcus.modelo.VistoriaCreche;

@Controller
public class MapaCrechesController {
	
	@Autowired
    private VistoriaCrecheDao vistoriaCrecheDao;

	@Autowired
    private CrecheDao crecheDao;

	@Autowired
    private FotoVistoriaCrecheDao fotoVistoriaCrecheDao;
	
	@Autowired
    private NotasCrecheDao notasCrecheDao;
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
	
	@RequestMapping(value="/carregaCreches", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
	public @ResponseBody()
	String retornaCreches(){
		return getCrechesGeoJSON(crecheDao.list()).toString();
	}
	
	@RequestMapping(value = "/consultaVistorias", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	public @ResponseBody
	List<VistoriaCreche> consultaCreche(@RequestBody Creche creche) {
		String id = creche.getId().toString();
		Creche esc = crecheDao.get(Long.parseLong(id));
		List<VistoriaCreche> lista = listVistoriaCreches(esc);
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
	
	@RequestMapping(value = "/consultaNotas", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	public @ResponseBody
		NotasCreche consultaNotas(@RequestBody Creche creche) {
		String id = creche.getId().toString();
		Creche cre = crecheDao.get(Long.parseLong(id));
		NotasCreche notas = notasCrecheDao.getByCreche(cre);
		if(notas != null){
			return notas;
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/consultaCrechesComparativo", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	@ResponseBody
	public List<Creche> consultaCrechesComparativo(
			@RequestBody String json) {
		Long id1 = new Long(json.substring(4,json.indexOf("&")));
		Long id2 = new Long(json.substring(json.indexOf("id2")+4));

		return crecheDao.getCrechesComparativo(id1, id2);
	}
	
	@RequestMapping(value = "/consultaNotasComparativo", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	@ResponseBody
	public List<NotasCreche> consultaIdebComparativo(
			@RequestBody String json) {
		Long id1 = new Long(json.substring(4,json.indexOf("&")));
		Long id2 = new Long(json.substring(json.indexOf("id2")+4));
		List<NotasCreche> nc = notasCrecheDao.getNotasComparativo(id1, id2);
		return nc;
	}
	
	@RequestMapping(value = "/consultaVistoriaCrecheComparativo", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	@ResponseBody
	public List<VistoriaCreche> consultaVistoriaCrecheComparativo(
			@RequestBody String json) {
		System.out.println(json);
		Long id1 = new Long(json.substring(4,json.indexOf("&")));
		Long id2 = new Long(json.substring(json.indexOf("id2")+4));
		List<VistoriaCreche> vistoriaCreches = new ArrayList<>();
		
		vistoriaCreches.add(vistoriaCrecheDao.getUltimaByCreche(id1));
		vistoriaCreches.add(vistoriaCrecheDao.getUltimaByCreche(id2));
		
		return vistoriaCreches;
	}
		
	@RequestMapping(value = "/consultaFotosVistoriaCreche", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	public @ResponseBody
		List<FotoVistoriaCreche> consultaFotosVistoriaCreche(@RequestBody VistoriaCreche vistoriaCreche) {
		String id = vistoriaCreche.getId().toString();
		VistoriaCreche vis = vistoriaCrecheDao.get(Long.parseLong(id));
		List<FotoVistoriaCreche> fotosVistoriaCreche = fotoVistoriaCrecheDao.getByVistoriaCreche(vis);
		return fotosVistoriaCreche;
	}
	
	public String listCreches() throws JsonGenerationException, JsonMappingException, IOException{
		List<Creche> creches = crecheDao.list();
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = ow.writeValueAsString(creches);
		return json;
	}
	
    public List<VistoriaCreche> listVistoriaCreches(Creche creche){
    	List<VistoriaCreche> vistoriaCreches = vistoriaCrecheDao.getByCreche(creche);
        return vistoriaCreches;
    }
    
    public List<FotoVistoriaCreche> listFotoVistoriaCreche(VistoriaCreche vistoriaCreche){
    	List<FotoVistoriaCreche> fotosVistoriaCreche = fotoVistoriaCrecheDao.listFotos();
    	return fotosVistoriaCreche;
    }
    
    public JSONObject getCrechesGeoJSON(List<Creche> creches){
    	JSONObject featureCollection = new JSONObject();
        try {
            featureCollection.put("type", "FeatureCollection");
            JSONArray featureList = new JSONArray();
            // iterate through your list
            List<VistoriaCreche> vistoriaCreches = vistoriaCrecheDao.list();
            List<NotasCreche> listNotasCreche = notasCrecheDao.list();
            for (Creche creche : creches) {
                // {"geometry": {"type": "Point", "coordinates": [-94.149, 36.33]}
                JSONObject point = new JSONObject();
                point.put("type", "Point");
                // construct a JSONArray from a string; can also use an array or list
                JSONArray coord = new JSONArray("["+creche.getLongitude()+","+creche.getLatitude()+"]");
                point.put("coordinates", coord);
                JSONObject feature = new JSONObject();
                feature.put("geometry", point);
                feature.put("type", "Feature");
                JSONObject properties = new JSONObject();
                properties.put("ID", creche.getId());
                System.out.println("ID: " + creche.getId());
                properties.put("Creche", creche.getNome());
                properties.put("Endereco", getEnderecoCreche(creche));
                properties.put("RPA", creche.getRpa());
                NotasCreche notasCreche = null;
                for(NotasCreche nc : listNotasCreche){
                	if(creche.getId().intValue() == nc.getCreche().getId().intValue()){
                		notasCreche = nc;
                	}
                }
                properties.put("COR", getMarkerColor(notasCreche));
                properties.put("Foto", creche.getFotoCapa());
//                for(VistoriaCreche vistoriaCreche : vistoriaCreches){
//                	if(creche.getId().intValue() == vistoriaCreche.getCreche().getId().intValue()){
//                		String situacao = "";
//                		try {
//                    		situacao = vistoriaCreche.getRl3();
//                		} catch (Exception e) {
//                			properties.put("POSSUIQUADRA", "null");
//                			break;
//                		}
//                		if(situacao.equals("")){
//                			properties.put("POSSUIQUADRA", "null");
//                			break;
//                		} else if(situacao.equals("0")){
//                			properties.put("POSSUIQUADRA", 0);
//                			break;
//                		} else if(situacao.equals("1")){
//                			properties.put("POSSUIQUADRA", 1);
//                			break;
//                		} else if(situacao.equals("2")){
//                			properties.put("POSSUIQUADRA", 2);
//                			break;
//                		} else if(situacao.equals("3")){
//                			properties.put("POSSUIQUADRA", 3);
//                			break;
//                		}
//                	}
//                }
                
                for(VistoriaCreche vistoriaCreche : vistoriaCreches){
                	if(creche.getId().intValue() == vistoriaCreche.getCreche().getId().intValue()){
            			properties.put("ACESSIBILIDADE", getAcessibilidade(vistoriaCreche));
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
    
    public int getAcessibilidade(VistoriaCreche vistoriaCreche){
    	return 0;
    }
    
    public String getMarkerColor(NotasCreche notasCreche){
    	
    	try {
    		if(notasCreche.getGeral() != null){
    			Double nota =notasCreche.getGeral();
    			if(nota < 2.5){
    	    		return "red";
    	    	} else if(nota < 5.1){
    				return "orange";
    	    	} else if(nota < 7.6){
    				return "yellow";
    			} else {
    				return "green";
    			}
    		} else {
    			return "grey";
    		}
		} catch (Exception e) {
			return "grey";
		}
    }

    public String getEnderecoCreche(Creche creche){
    	System.out.println("##################################");
    	System.out.println(creche.getNome());
    	System.out.println("##################################");
    	String endereco = "";
    	
    	try {
    		if(creche.getLogradouro() != null && !creche.getLogradouro().isEmpty()){
    			endereco += creche.getLogradouro();
    		}
		} catch (Exception e) {
			
		}
    	
    	try {
    		if(creche.getNumeroEnd() != null && !creche.getNumeroEnd().isEmpty()){
    			endereco += ", " + creche.getNumeroEnd();
    		}
		} catch (Exception e) {

		}

    	try {
    		if(creche.getComplemento() != null && !creche.getComplemento().isEmpty()){
    			endereco += ", " + creche.getComplemento();
    		}
		} catch (Exception e) {

		}
    	
    	try {
    		if(creche.getBairro() != null && !creche.getBairro().isEmpty()){
    			endereco += ", " + creche.getBairro();
    		}
		} catch (Exception e) {

		}
    	
    	return endereco;
    }
    
}
