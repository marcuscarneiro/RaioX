package br.com.marcus.service;

import java.util.List;

import br.com.marcus.modelo.FotoVistoriaCreche;
import br.com.marcus.modelo.VistoriaCreche;

public interface FotoVistoriaCrecheService {

	List<FotoVistoriaCreche> listFotos();

	FotoVistoriaCreche getFoto(Long id);

	FotoVistoriaCreche saveFoto(FotoVistoriaCreche fotoVistoriaCreche);

	List<FotoVistoriaCreche> getByVistoriaCreche(VistoriaCreche vistoriaCreche);
	
	void delete(Long id);
}
