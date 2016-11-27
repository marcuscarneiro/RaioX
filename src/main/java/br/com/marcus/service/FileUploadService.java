package br.com.marcus.service;

import java.util.List;
import br.com.marcus.modelo.FotoVisita;

public interface FileUploadService {

	List<FotoVisita> listFotos();
	FotoVisita getFoto(Long id);
	FotoVisita saveFoto(FotoVisita fotoVisita);
}
