package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.VisitaDao;
import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.Visita;

public class VisitaDaoImpl implements VisitaDao {
	private SessionFactory sessionFactory;

	public VisitaDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<Visita> list() {
		@SuppressWarnings("unchecked")
		List<Visita> listVisita = (List<Visita>) sessionFactory.getCurrentSession()
		.createCriteria(Visita.class)
//		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.desc("data")).list();

		return listVisita;
	}
	
    @Transactional
    public void saveOrUpdate(Visita visita) {
        sessionFactory.getCurrentSession().saveOrUpdate(visita);
    }
 
    @Transactional
    public void delete(Long id) {
        Visita visitaToDelete = new Visita();
        visitaToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(visitaToDelete);
    }
 
    @Transactional
    public Visita get(Long id) {
        String hql = "from Visita where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Visita> listVisita = (List<Visita>) query.list();
         
        if (listVisita != null && !listVisita.isEmpty()) {
            return listVisita.get(0);
        }
         
        return null;
    }
    
    @Transactional
    public List<Visita> getByEscola(Escola escola) {
        String hql = "from Visita where esc_id=" + escola.getId() + " order by data asc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Visita> listVisita = (List<Visita>) query.list();
         
        if (listVisita != null && !listVisita.isEmpty()) {
            return listVisita;
        }
         
        return null;
    }
    
    @Transactional
    public Visita getUltimaByEscola(Long id) {
        String hql = "from Visita where esc_id=" + id + " order by data desc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Visita> listVisita = (List<Visita>) query.list();
         
        if (listVisita != null && !listVisita.isEmpty()) {
            return listVisita.get(0);
        }
         
        return null;
    }
    
    @Transactional
    public List<Visita> getByTimeRange(String ini, String fim) {
    	String hql = "";
    	if(!ini.equals("null") && !fim.equals("null")){
    		hql = "from Visita where data_visita between '" + ini + "' and '" + fim + "' order by data desc";
    	} else if(!ini.equals("null")){
    		hql = "from Visita where data >= '" + ini + "' order by data desc";
    	} else {
    		hql = "from Visita where data <= '" + fim + "' order by data desc";
    	}
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Visita> listVisita = (List<Visita>) query.list();
         
        if (listVisita != null && !listVisita.isEmpty()) {
            return listVisita;
        }
         
        return null;
    }
}
