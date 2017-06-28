package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.EscolaDao;
import br.com.marcus.modelo.Escola;

public class EscolaDaoImpl implements EscolaDao {
	private SessionFactory sessionFactory;

	public EscolaDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<Escola> list() {
		@SuppressWarnings("unchecked")
		List<Escola> listEscola = (List<Escola>) sessionFactory.getCurrentSession()
		.createCriteria(Escola.class)
//		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.asc("nome")).list();

		return listEscola;
	}
	
    @Transactional
    public void saveOrUpdate(Escola escola) {
        sessionFactory.getCurrentSession().saveOrUpdate(escola);
    }
 
    @Transactional
    public void delete(Long id) {
        Escola escolaToDelete = new Escola();
        escolaToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(escolaToDelete);
    }
 
    @Transactional
    public Escola get(Long id) {
        String hql = "from Escola where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Escola> listEscola = (List<Escola>) query.list();
         
        if (listEscola != null && !listEscola.isEmpty()) {
            return listEscola.get(0);
        }
         
        return null;
    }
    
    @Transactional
	public List<Escola> getEscolasComparativo(Long id1, Long id2) {
		String hql = "from Escola where id in(" + id1 + "," + id2 + ")";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<Escola> listEscola = (List<Escola>) query.list();
         
        if (listEscola != null && !listEscola.isEmpty()) {
            return listEscola;
        }
         
        return null;
	}

}
