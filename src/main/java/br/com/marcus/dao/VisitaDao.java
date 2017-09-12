package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.Visita;

public interface VisitaDao {
	public List<Visita> list();
	
	public Visita get(Long id);

	public void saveOrUpdate(Visita visita);

	public void delete(Long id);

	public List<Visita> getByEscola(Escola escola);
	
	public Visita getUltimaByEscola(Long id);
	
	public List<Visita> getByTimeRange(String ini, String fim);
	
}