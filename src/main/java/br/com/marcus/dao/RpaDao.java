package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.Rpa;
 
public interface RpaDao {
    public List<Rpa> list();
     
    public Rpa get(Long id);
     
    public void saveOrUpdate(Rpa rpa);
     
    public void delete(Long id);
}