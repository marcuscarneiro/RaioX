package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.Creche;
import br.com.marcus.modelo.VistoriaCreche;

public interface VistoriaCrecheDao {
	public List<VistoriaCreche> list();

	public VistoriaCreche get(Long id);

	public void saveOrUpdate(VistoriaCreche vistoriaCreche);

	public void delete(Long id);

	public List<VistoriaCreche> getByCreche(Creche creche);
	
	public VistoriaCreche getUltimaByCreche(Long id);
}