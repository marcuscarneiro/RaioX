package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.ProvaBrasilDao;
import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.ProvaBrasil;

public class ProvaBrasilDaoImpl implements ProvaBrasilDao {
	private SessionFactory sessionFactory;

	public ProvaBrasilDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<ProvaBrasil> list() {
		@SuppressWarnings("unchecked")
		List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) sessionFactory.getCurrentSession()
		.createCriteria(ProvaBrasil.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listProvaBrasil;
	}
	
    @Transactional
    public void saveOrUpdate(ProvaBrasil provaBrasil) {
        sessionFactory.getCurrentSession().saveOrUpdate(provaBrasil);
    }
 
    @Transactional
    public void delete(Long id) {
        ProvaBrasil provaBrasilToDelete = new ProvaBrasil();
        provaBrasilToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(provaBrasilToDelete);
    }
 
    @Transactional
    public ProvaBrasil get(Long id) {
        String hql = "from ProvaBrasil where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
         
        if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
            return listProvaBrasil.get(0);
        }
         
        return null;
    }
    
    @Transactional
    public ProvaBrasil getByEscola(Escola escola) {
        String hql = "from ProvaBrasil where esc_id=" + escola.getId();
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
         
        if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
            return listProvaBrasil.get(0);
        }
         
        return null;
    }
    
    @Transactional
    public List<ProvaBrasil> getProvaBrasilComparativo(Long id1, Long id2){
    	String hql = "from ProvaBrasil where esc_id in(" + id1 + ", " + id2 + ")";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
         
        if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
            return listProvaBrasil;
        }
         
        return null;
    }
    
    @Transactional
    public List<ProvaBrasil> getMelhorProfPort5() {
    	String hql = "from ProvaBrasil where porc_2013_lp_5 is not null order by porc_2013_lp_5 desc";
    	Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
    	
    	@SuppressWarnings("unchecked")
    	List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
    	
    	if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
    		return listProvaBrasil;
    	}
    	
    	return null;
    }
    
    @Transactional
    public List<ProvaBrasil> getPiorProfPort5() {
    	String hql = "from ProvaBrasil where porc_2013_lp_5 is not null order by porc_2013_lp_5 asc";
    	Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
    	
    	@SuppressWarnings("unchecked")
    	List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
    	
    	if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
    		return listProvaBrasil;
    	}
    	
    	return null;
    }
    
    @Transactional
    public List<ProvaBrasil> getMelhorProfPort9() {
    	String hql = "from ProvaBrasil where porc_2013_lp_9 is not null order by porc_2013_lp_9 desc";
    	Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
    	
    	@SuppressWarnings("unchecked")
    	List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
    	
    	if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
    		return listProvaBrasil;
    	}
    	
    	return null;
    }
    
    @Transactional
    public List<ProvaBrasil> getPiorProfPort9() {
    	String hql = "from ProvaBrasil where porc_2013_lp_9 is not null order by porc_2013_lp_9 asc";
    	Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
    	
    	@SuppressWarnings("unchecked")
    	List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
    	
    	if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
    		return listProvaBrasil;
    	}
    	
    	return null;
    }
    
    @Transactional
    public List<ProvaBrasil> getMelhorProfMat5() {
    	String hql = "from ProvaBrasil where porc_2013_mt_5 is not null order by porc_2013_mt_5 desc";
    	Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
    	
    	@SuppressWarnings("unchecked")
    	List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
    	
    	if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
    		return listProvaBrasil;
    	}
    	
    	return null;
    }
    
    @Transactional
    public List<ProvaBrasil> getPiorProfMat5() {
    	String hql = "from ProvaBrasil where porc_2013_mt_5 is not null order by porc_2013_mt_5 asc";
    	Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
    	
    	@SuppressWarnings("unchecked")
    	List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
    	
    	if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
    		return listProvaBrasil;
    	}
    	
    	return null;
    }
    
    @Transactional
    public List<ProvaBrasil> getMelhorProfMat9() {
    	String hql = "from ProvaBrasil where porc_2013_mt_9 is not null order by porc_2013_mt_9 desc";
    	Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
    	
    	@SuppressWarnings("unchecked")
    	List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
    	
    	if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
    		return listProvaBrasil;
    	}
    	
    	return null;
    }
    
    @Transactional
    public List<ProvaBrasil> getPiorProfMat9() {
    	String hql = "from ProvaBrasil where porc_2013_mt_9 is not null order by porc_2013_mt_9 asc";
    	Query query = sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10);
    	
    	@SuppressWarnings("unchecked")
    	List<ProvaBrasil> listProvaBrasil = (List<ProvaBrasil>) query.list();
    	
    	if (listProvaBrasil != null && !listProvaBrasil.isEmpty()) {
    		return listProvaBrasil;
    	}
    	
    	return null;
    }
}
