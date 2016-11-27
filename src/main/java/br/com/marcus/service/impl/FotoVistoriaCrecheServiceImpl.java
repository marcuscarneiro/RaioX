package br.com.marcus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.FotoVistoriaCrecheDao;
import br.com.marcus.modelo.FotoVistoriaCreche;
import br.com.marcus.modelo.VistoriaCreche;
import br.com.marcus.service.FotoVistoriaCrecheService;

@Service
public class FotoVistoriaCrecheServiceImpl implements FotoVistoriaCrecheService {

	@Autowired
	private FotoVistoriaCrecheDao dao;

	@Transactional(readOnly = true)
	public List<FotoVistoriaCreche> listFotos() {

		return dao.listFotos();
	}

	@Transactional(readOnly = true)
	public FotoVistoriaCreche getFoto(Long id) {

		return dao.getFoto(id);
	}

	@Transactional
	public FotoVistoriaCreche saveFoto(FotoVistoriaCreche fotoVistoriaCreche) {
		return dao.saveFoto(fotoVistoriaCreche);
	}
	
	@Transactional
	public List<FotoVistoriaCreche> getByVistoriaCreche(VistoriaCreche vistoriaCreche){
		
		return dao.getByVistoriaCreche(vistoriaCreche);
	}
	
	@Transactional
	public void delete(Long id){
		
		dao.delete(id);
	}
}
