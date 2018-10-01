package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.DadosIdebDao;
import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.DadosIdeb;

public class DadosIdebDaoImpl implements DadosIdebDao {
	private SessionFactory sessionFactory;

	public DadosIdebDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<DadosIdeb> list() {
		@SuppressWarnings("unchecked")
		List<DadosIdeb> listDadosIdeb = (List<DadosIdeb>) sessionFactory.getCurrentSession()
		.createCriteria(DadosIdeb.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listDadosIdeb;
	}
	
    @Transactional
    public void saveOrUpdate(DadosIdeb dadosIdeb) {
        sessionFactory.getCurrentSession().saveOrUpdate(dadosIdeb);
    }
 
    @Transactional
    public void delete(Long id) {
        DadosIdeb dadosIdebToDelete = new DadosIdeb();
        dadosIdebToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(dadosIdebToDelete);
    }
 
    @Transactional
    public DadosIdeb get(Long id) {
        String hql = "from DadosIdeb where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<DadosIdeb> listDadosIdeb = (List<DadosIdeb>) query.list();
         
        if (listDadosIdeb != null && !listDadosIdeb.isEmpty()) {
            return listDadosIdeb.get(0);
        }
         
        return null;
    }
    
    @Transactional
    public DadosIdeb getByEscola(Escola escola) {
        String hql = "from DadosIdeb where esc_id=" + escola.getId();
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<DadosIdeb> listDadosIdeb = (List<DadosIdeb>) query.list();
         
        if (listDadosIdeb != null && !listDadosIdeb.isEmpty()) {
            return listDadosIdeb.get(0);
        }
         
        return null;
    }
    
    @Transactional
	public List<DadosIdeb> getIdebsComparativo(Long id1, Long id2) {
    	String hql = "from DadosIdeb where esc_id in (" + id1 + "," + id2 + ")";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<DadosIdeb> listDadosIdeb = (List<DadosIdeb>) query.list();
         
        if (listDadosIdeb != null && !listDadosIdeb.isEmpty()) {
            return listDadosIdeb;
        }
        
        return null;
	}
    
    @Transactional
	public List<DadosIdeb> getMelhorIdeb5(String ano) {
		String hql = "from DadosIdeb where did_ideb_"+ ano +"_ini is not null order by did_ideb_"+ano+"_ini desc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
         
        @SuppressWarnings("unchecked")
        List<DadosIdeb> listDadosIdeb = (List<DadosIdeb>) query.list();
         
        if (listDadosIdeb != null && !listDadosIdeb.isEmpty()) {
            return listDadosIdeb;
        }
         
        return null;
	}
    
    @Transactional
	public List<DadosIdeb> getPiorIdeb5(String ano) {
		String hql = "from DadosIdeb where did_ideb_"+ano+"_ini is not null order by did_ideb_"+ano+"_ini asc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
         
        @SuppressWarnings("unchecked")
        List<DadosIdeb> listDadosIdeb = (List<DadosIdeb>) query.list();
         
        if (listDadosIdeb != null && !listDadosIdeb.isEmpty()) {
            return listDadosIdeb;
        }
         
        return null;
	}
    
    @Transactional
	public List<DadosIdeb> getMelhorIdeb9(String ano) {
		String hql = "from DadosIdeb where did_ideb_"+ano+"_fin is not null order by did_ideb_"+ano+"_ini desc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
         
        @SuppressWarnings("unchecked")
        List<DadosIdeb> listDadosIdeb = (List<DadosIdeb>) query.list();
         
        if (listDadosIdeb != null && !listDadosIdeb.isEmpty()) {
            return listDadosIdeb;
        }
         
        return null;
	}
    
    @Transactional
	public List<DadosIdeb> getPiorIdeb9(String ano) {
		String hql = "from DadosIdeb where did_ideb_"+ano+"_fin is not null order by did_ideb_"+ano+"_ini asc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
         
        @SuppressWarnings("unchecked")
        List<DadosIdeb> listDadosIdeb = (List<DadosIdeb>) query.list();
         
        if (listDadosIdeb != null && !listDadosIdeb.isEmpty()) {
            return listDadosIdeb;
        }
         
        return null;
	}

}
