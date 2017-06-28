package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.Escola;
 
public interface EscolaDao {
    public List<Escola> list();
     
    public Escola get(Long id);
     
    public void saveOrUpdate(Escola escola);
     
    public void delete(Long id);
    
    public List<Escola> getEscolasComparativo(Long id1, Long id2);
    
}