package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.VistoriaCrecheDao;
import br.com.marcus.modelo.Creche;
import br.com.marcus.modelo.VistoriaCreche;

public class VistoriaCrecheDaoImpl implements VistoriaCrecheDao {
	private SessionFactory sessionFactory;

	public VistoriaCrecheDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<VistoriaCreche> list() {
		@SuppressWarnings("unchecked")
		List<VistoriaCreche> listVistoriaCreche = (List<VistoriaCreche>) sessionFactory.getCurrentSession()
		.createCriteria(VistoriaCreche.class)
//		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.desc("data")).list();

		return listVistoriaCreche;
	}
	
    @Transactional
    public void saveOrUpdate(VistoriaCreche vistoriaCreche) {
        sessionFactory.getCurrentSession().saveOrUpdate(vistoriaCreche);
    }
 
    @Transactional
    public void delete(Long id) {
        VistoriaCreche vistoriaCrecheToDelete = new VistoriaCreche();
        vistoriaCrecheToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(vistoriaCrecheToDelete);
    }
 
    @Transactional
    public VistoriaCreche get(Long id) {
        String hql = "from VistoriaCreche where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<VistoriaCreche> listVistoriaCreche = (List<VistoriaCreche>) query.list();
         
        if (listVistoriaCreche != null && !listVistoriaCreche.isEmpty()) {
            return listVistoriaCreche.get(0);
        }
         
        return null;
    }
    
    @Transactional
    public List<VistoriaCreche> getByCreche(Creche creche) {
        String hql = "from VistoriaCreche where esc_id=" + creche.getId() + " order by data asc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<VistoriaCreche> listVistoriaCreche = (List<VistoriaCreche>) query.list();
         
        if (listVistoriaCreche != null && !listVistoriaCreche.isEmpty()) {
            return listVistoriaCreche;
        }
         
        return null;
    }
    
    @Transactional
    public VistoriaCreche getUltimaByCreche(Long id) {
        String hql = "from VistoriaCreche where esc_id=" + id + " order by data desc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<VistoriaCreche> listVistoriaCreche = (List<VistoriaCreche>) query.list();
         
        if (listVistoriaCreche != null && !listVistoriaCreche.isEmpty()) {
            return listVistoriaCreche.get(0);
        }
         
        return null;
    }
}
