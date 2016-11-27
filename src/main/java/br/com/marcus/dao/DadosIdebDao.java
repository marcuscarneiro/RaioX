package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.DadosIdeb;
 
public interface DadosIdebDao {
    public List<DadosIdeb> list();
     
    public DadosIdeb get(Long id);
     
    public void saveOrUpdate(DadosIdeb dadosIdeb);
     
    public void delete(Long id);
    
    public DadosIdeb getByEscola(Escola escola);
    
    public List<DadosIdeb> getIdebsComparativo(Long id1, Long id2);
    
    public List<DadosIdeb> getMelhorIdeb5();
    
    public List<DadosIdeb> getPiorIdeb5();
    
    public List<DadosIdeb> getMelhorIdeb9();
    
    public List<DadosIdeb> getPiorIdeb9();
}