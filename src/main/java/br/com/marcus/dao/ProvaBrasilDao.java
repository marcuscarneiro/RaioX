package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.ProvaBrasil;
 
public interface ProvaBrasilDao {
    public List<ProvaBrasil> list();
     
    public ProvaBrasil get(Long id);
     
    public void saveOrUpdate(ProvaBrasil provaBrasil);
     
    public void delete(Long id);
    
    public ProvaBrasil getByEscola(Escola escola);
    
    public List<ProvaBrasil> getProvaBrasilComparativo(Long id1, Long id2);
    
    public List<ProvaBrasil> getMelhorProfPort5();
    
    public List<ProvaBrasil> getPiorProfPort5();
    
    public List<ProvaBrasil> getMelhorProfPort9();
    
    public List<ProvaBrasil> getPiorProfPort9();
    
    public List<ProvaBrasil> getMelhorProfMat5();
    
    public List<ProvaBrasil> getPiorProfMat5();
    
    public List<ProvaBrasil> getMelhorProfMat9();
    
    public List<ProvaBrasil> getPiorProfMat9();

}