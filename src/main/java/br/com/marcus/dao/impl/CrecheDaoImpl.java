package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.CrecheDao;
import br.com.marcus.modelo.Creche;

public class CrecheDaoImpl implements CrecheDao {
	private SessionFactory sessionFactory;

	public CrecheDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<Creche> list() {
		@SuppressWarnings("unchecked")
		List<Creche> listCreche = (List<Creche>) sessionFactory.getCurrentSession()
		.createCriteria(Creche.class)
//		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.asc("nome")).list();

		return listCreche;
	}
	
    @Transactional
    public void saveOrUpdate(Creche creche) {
        sessionFactory.getCurrentSession().saveOrUpdate(creche);
    }
 
    @Transactional
    public void delete(Long id) {
        Creche crecheToDelete = new Creche();
        crecheToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(crecheToDelete);
    }
 
    @Transactional
    public Creche get(Long id) {
        String hql = "from Creche where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Creche> listCreche = (List<Creche>) query.list();
         
        if (listCreche != null && !listCreche.isEmpty()) {
            return listCreche.get(0);
        }
         
        return null;
    }
    
    @Transactional
	public List<Creche> getCrechesComparativo(Long id1, Long id2) {
		String hql = "from Creche where id in(" + id1 + "," + id2 + ")";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Creche> listCreche = (List<Creche>) query.list();
         
        if (listCreche != null && !listCreche.isEmpty()) {
            return listCreche;
        }
         
        return null;
	}

}
