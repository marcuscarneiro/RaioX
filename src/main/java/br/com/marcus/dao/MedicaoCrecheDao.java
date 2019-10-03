package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.MedicaoCreche;
import br.com.marcus.modelo.VistoriaCreche;

public interface MedicaoCrecheDao {

	public List<MedicaoCreche> listMedicoesCreche();

	public MedicaoCreche getMedicao(Long id);

	public MedicaoCreche saveMedicao(MedicaoCreche medicaoCreche);

	public List<MedicaoCreche> getByVistoriaCreche(VistoriaCreche vistoriaCreche);
	
	public void delete(Long id);
}
