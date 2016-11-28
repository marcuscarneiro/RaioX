package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.Creche;
import br.com.marcus.modelo.NotasCreche;
 
public interface NotasCrecheDao {
    public List<NotasCreche> list();
     
    public NotasCreche get(Long id);
     
    public void saveOrUpdate(NotasCreche notasCreche);
     
    public void delete(Long id);
    
    public NotasCreche getByCreche(Creche creche);
    
    public List<NotasCreche> getNotasComparativo(Long id1, Long id2);

}