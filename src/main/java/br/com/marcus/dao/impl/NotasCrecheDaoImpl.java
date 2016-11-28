package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.NotasCrecheDao;
import br.com.marcus.modelo.Creche;
import br.com.marcus.modelo.NotasCreche;

public class NotasCrecheDaoImpl implements NotasCrecheDao {
	private SessionFactory sessionFactory;

	public NotasCrecheDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<NotasCreche> list() {
		@SuppressWarnings("unchecked")
		List<NotasCreche> listNotasCreche = (List<NotasCreche>) sessionFactory.getCurrentSession()
		.createCriteria(NotasCreche.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listNotasCreche;
	}
	
    @Transactional
    public void saveOrUpdate(NotasCreche notasCreche) {
        sessionFactory.getCurrentSession().saveOrUpdate(notasCreche);
    }
 
    @Transactional
    public void delete(Long id) {
        NotasCreche notasCrecheToDelete = new NotasCreche();
        notasCrecheToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(notasCrecheToDelete);
    }
 
    @Transactional
    public NotasCreche get(Long id) {
        String hql = "from NotasCreche where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<NotasCreche> listNotasCreche = (List<NotasCreche>) query.list();
         
        if (listNotasCreche != null && !listNotasCreche.isEmpty()) {
            return listNotasCreche.get(0);
        }
         
        return null;
    }
    
    @Transactional
    public NotasCreche getByCreche(Creche creche) {
        String hql = "from NotasCreche where cre_id=" + creche.getId();
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<NotasCreche> listNotasCreche = (List<NotasCreche>) query.list();
         
        if (listNotasCreche != null && !listNotasCreche.isEmpty()) {
            return listNotasCreche.get(0);
        }
         
        return null;
    }
    
    @Transactional
	public List<NotasCreche> getNotasComparativo(Long id1, Long id2) {
    	String hql = "from NotasCreche where cre_id in (" + id1 + "," + id2 + ")";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<NotasCreche> listNotasCreche = (List<NotasCreche>) query.list();
         
        if (listNotasCreche != null && !listNotasCreche.isEmpty()) {
            return listNotasCreche;
        }
        
        return null;
	}
}
