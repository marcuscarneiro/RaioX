package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.MedicaoEscola;
import br.com.marcus.modelo.Visita;

public interface MedicaoEscolaDao {

	public List<MedicaoEscola> listMedicoesEscola();

	public MedicaoEscola getMedicao(Long id);

	public MedicaoEscola saveMedicao(MedicaoEscola medicaoEscola);

	public List<MedicaoEscola> getByVisita(Visita visita);
	
	public void delete(Long id);
}
