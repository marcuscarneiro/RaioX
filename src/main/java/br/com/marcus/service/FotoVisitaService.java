package br.com.marcus.service;

import java.util.List;

import br.com.marcus.modelo.FotoVisita;
import br.com.marcus.modelo.Visita;

public interface FotoVisitaService {

	List<FotoVisita> listFotos();

	FotoVisita getFoto(Long id);

	FotoVisita saveFoto(FotoVisita fotoVisita);

	List<FotoVisita> getByVisita(Visita visita);
	
	void delete(Long id);
}
