package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.Creche;
 
public interface CrecheDao {
    public List<Creche> list();
     
    public Creche get(Long id);
     
    public void saveOrUpdate(Creche creche);
     
    public void delete(Long id);
    
    public List<Creche> getCrechesComparativo(Long id1, Long id2);

}