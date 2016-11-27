package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.FotoVistoriaCreche;
import br.com.marcus.modelo.VistoriaCreche;

public interface FotoVistoriaCrecheDao {

	public List<FotoVistoriaCreche> listFotos();

	public FotoVistoriaCreche getFoto(Long id);

	public FotoVistoriaCreche saveFoto(FotoVistoriaCreche fotoVistoriaCreche);

	public List<FotoVistoriaCreche> getByVistoriaCreche(VistoriaCreche vistoriaCreche);
	
	public void delete(Long id);
}
