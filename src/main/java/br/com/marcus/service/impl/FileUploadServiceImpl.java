package br.com.marcus.service.impl;

import java.util.List;

import br.com.marcus.dao.FotoVisitaDao;
import br.com.marcus.modelo.FotoVisita;
import br.com.marcus.service.FileUploadService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FileUploadServiceImpl implements FileUploadService {

	@Autowired
	private FotoVisitaDao dao;

	@Transactional(readOnly = true)
	public List<FotoVisita> listFotos() {

		return dao.listFotos();
	}

	@Transactional(readOnly = true)
	public FotoVisita getFoto(Long id) {

		return dao.getFoto(id);
	}

	@Transactional
	public FotoVisita saveFoto(FotoVisita fotoVisita) {
		return dao.saveFoto(fotoVisita);
	}
}
