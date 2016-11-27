package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.FotoVisita;
import br.com.marcus.modelo.Visita;

public interface FotoVisitaDao {

	public List<FotoVisita> listFotos();

	public FotoVisita getFoto(Long id);

	public FotoVisita saveFoto(FotoVisita fotoVisita);

	public List<FotoVisita> getByVisita(Visita visita);
	
	public void delete(Long id);
}
