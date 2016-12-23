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
	
	@RequestMapping(value = "/consultaTodasNotas", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	public @ResponseBody
		List<NotasCreche> consultaTodasNotas(@RequestBody Creche creche) {
		List<NotasCreche> notas = notasCrecheDao.list();
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
            List<NotasCreche> listNotasCreche = notasCrecheDao.list();
            for (Creche creche : creches) {
            	VistoriaCreche vistoria = vistoriaCrecheDao.getUltimaByCreche(creche.getId());
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
                properties.put("Nova", creche.getNova());
                NotasCreche notasCreche = null;
                for(NotasCreche nc : listNotasCreche){
                	if(creche.getId().intValue() == nc.getCreche().getId().intValue()){
                		notasCreche = nc;
                	}
                }

                properties.put("COR", getMarkerColor(notasCreche));
                properties.put("Foto", creche.getFotoCapa());
    			properties.put("Acessibilidade", getAcessibilidade(vistoria));
    			properties.put("Grupos", getGruposEscolares(vistoria));
    			properties.put("Climatizada", getSalasClimatizadas(vistoria));
    			properties.put("Lazer", getLazer(vistoria));
    			properties.put("Temperatura", getTemperatura(vistoria));
    			properties.put("Iluminacao", getIluminacao(vistoria));
    			String bercario = "false";
    			try {
    				bercario = vistoria.getBer1().toString();
				} catch (Exception e) {
					bercario = "false";
				}
    			properties.put("Bercario", bercario);
    			String saneamento = "false";
    			try {
    				saneamento = vistoria.getSee4().toString();
				} catch (Exception e) {
					saneamento = "false";
				}
    			properties.put("Saneamento", saneamento);
    			String grupoB = "false";
    			try {
    				grupoB = vistoria.getGer3a().toString();
				} catch (Exception e) {
					grupoB = "false";
				}
    			properties.put("grupoB", grupoB);
    			String grupo1 = "false";
    			try {
    				grupo1 = vistoria.getGer3b().toString();
				} catch (Exception e) {
					grupo1 = "false";
				}
    			properties.put("grupo1", grupo1);
    			String grupo2 = "false";
    			try {
    				grupo2 = vistoria.getGer3c().toString();
				} catch (Exception e) {
					grupo2 = "false";
				}
    			properties.put("grupo2", grupo2);
    			String grupo3 = "false";
    			try {
    				grupo3 = vistoria.getGer3d().toString();
				} catch (Exception e) {
					grupo3 = "false";
				}
    			properties.put("grupo3", grupo3);
    			String grupo4 = "false";
    			try {
    				grupo4 = vistoria.getGer3e().toString();
				} catch (Exception e) {
					grupo4 = "false";
				}
    			properties.put("grupo4", grupo4);
    			String grupo5 = "false";
    			try {
    				grupo5 = vistoria.getGer3f().toString();
				} catch (Exception e) {
					grupo5 = "false";
				}
    			properties.put("grupo5", grupo5);
    			properties.put("CrecrexCMEI", creche.getCrecheCmei());
    			properties.put("notas", notasCreche);
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
    
    public int getGruposEscolares(VistoriaCreche vistoriaCreche){
    	return 0;
    }
    
    public int getSalasClimatizadas(VistoriaCreche vistoriaCreche){
    	int qtdSalas = 0;
    	int salasClimatizadas = 0;
    	
    	try {
    		qtdSalas = vistoriaCreche.getGer2();
		} catch (Exception e) {
		}
    	
    	try {
    		salasClimatizadas = vistoriaCreche.getSal1();
		} catch (Exception e) {
		}
    	
    	if(qtdSalas == 0){
    		return 0;
    	} else if (salasClimatizadas > 0) {
    		if(salasClimatizadas < qtdSalas){
    			return 1;
    		} else {
    			return 2;
    		}
		} else {
			return 0;
		}
    }
    
    public int getTemperatura(VistoriaCreche vistoriaCreche){
    	int qtdSalas = 0;
    	int salasTempCerta = 0;
    	
    	try {
    		qtdSalas = vistoriaCreche.getGer2();
		} catch (Exception e) {
		}
    	
    	try {
    		salasTempCerta = vistoriaCreche.getSal2();
		} catch (Exception e) {
		}
    	
    	if(qtdSalas == 0){
    		return 0;
    	} else if (salasTempCerta > 0) {
    		if(salasTempCerta < qtdSalas){
    			return 1;
    		} else {
    			return 2;
    		}
		} else {
			return 0;
		}
    }
    
    public int getIluminacao(VistoriaCreche vistoriaCreche){
    	int qtdSalas = 0;
    	int salasIlumCerta = 0;
    	
    	try {
    		qtdSalas = vistoriaCreche.getGer2();
		} catch (Exception e) {
		}
    	
    	try {
    		salasIlumCerta = vistoriaCreche.getSal3();
		} catch (Exception e) {
		}
    	
    	if(qtdSalas == 0){
    		return 0;
    	} else if (salasIlumCerta > 0) {
    		if(salasIlumCerta < qtdSalas){
    			return 1;
    		} else {
    			return 2;
    		}
		} else {
			return 0;
		}
    }
    
    public int getLazer(VistoriaCreche vistoriaCreche){
    	int count = 0;
    	try {
			if(vistoriaCreche.getEaa1a() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getEaa1b() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getEaa1c() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getEaa1d() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getEaa1e() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getEaa1f() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getEaa1g() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getEaa1h() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getEaa1i() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	
    	if(count == 9){
    		return 2;
    	} else if (count > 0) {
			return 1;
		} else {
			return 0;
		}
    }
    
    public int getAcessibilidade(VistoriaCreche vistoriaCreche){
    	int count = 0;
    	try {
			if(vistoriaCreche.getAae5() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getAae6() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getAae7() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getAae8() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	try {
			if(vistoriaCreche.getAae9() == true){
				count++;
			}
		} catch (Exception e) {
		}
    	
    	if(count == 5){
    		return 2;
    	} else if (count > 0) {
			return 1;
		} else {
			return 0;
		}
    }
    
    public String getMarkerColor(NotasCreche notasCreche){
    	
    	try {
    		if(notasCreche.getGeral() != null){
    			Double nota =notasCreche.getGeral();
    			if(nota <= 2.5){
    	    		return "cred";
    	    	} else if(nota < 5.1){
    				return "cyellow";
    	    	} else if(nota < 7.6){
    				return "clight-green";
    			} else {
    				return "cgreen";
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
