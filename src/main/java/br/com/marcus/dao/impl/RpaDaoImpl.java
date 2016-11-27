package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.RpaDao;
import br.com.marcus.modelo.Rpa;

public class RpaDaoImpl implements RpaDao {
	
	private SessionFactory sessionFactory;

	public RpaDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<Rpa> list() {
		@SuppressWarnings("unchecked")
		List<Rpa> listRpa = (List<Rpa>) sessionFactory.getCurrentSession()
		.createCriteria(Rpa.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listRpa;
	}
	
    @Transactional
    public void saveOrUpdate(Rpa rpa) {
        sessionFactory.getCurrentSession().saveOrUpdate(rpa);
    }
 
    @Transactional
    public void delete(Long id) {
        Rpa rpaToDelete = new Rpa();
        rpaToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(rpaToDelete);
    }
 
    @Transactional
    public Rpa get(Long id) {
        String hql = "from Rpa where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Rpa> listRpa = (List<Rpa>) query.list();
         
        if (listRpa != null && !listRpa.isEmpty()) {
            return listRpa.get(0);
        }
         
        return null;
    }
}
