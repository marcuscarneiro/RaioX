package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.AvaliacaoPublica;
 
public interface AvaliacaoPublicaDao {
    public List<AvaliacaoPublica> list();
     
    public AvaliacaoPublica get(Long id);
     
    public void saveOrUpdate(AvaliacaoPublica avaliacaoPublica);
     
    public void delete(Long id);
    
    public List<AvaliacaoPublica> getByEscola(Escola escola);
}