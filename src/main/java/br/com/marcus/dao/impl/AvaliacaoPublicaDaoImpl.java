package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.AvaliacaoPublicaDao;
import br.com.marcus.modelo.Escola;
import br.com.marcus.modelo.AvaliacaoPublica;

public class AvaliacaoPublicaDaoImpl implements AvaliacaoPublicaDao {
	private SessionFactory sessionFactory;

	public AvaliacaoPublicaDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<AvaliacaoPublica> list() {
		@SuppressWarnings("unchecked")
		List<AvaliacaoPublica> listAvaliacaoPublica = (List<AvaliacaoPublica>) sessionFactory.getCurrentSession()
		.createCriteria(AvaliacaoPublica.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listAvaliacaoPublica;
	}
	
    @Transactional
    public void saveOrUpdate(AvaliacaoPublica avaliacaoPublica) {
        sessionFactory.getCurrentSession().saveOrUpdate(avaliacaoPublica);
    }
 
    @Transactional
    public void delete(Long id) {
        AvaliacaoPublica avaliacaoPublicaToDelete = new AvaliacaoPublica();
        avaliacaoPublicaToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(avaliacaoPublicaToDelete);
    }
 
    @Transactional
    public AvaliacaoPublica get(Long id) {
        String hql = "from AvaliacaoPublica where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<AvaliacaoPublica> listAvaliacaoPublica = (List<AvaliacaoPublica>) query.list();
         
        if (listAvaliacaoPublica != null && !listAvaliacaoPublica.isEmpty()) {
            return listAvaliacaoPublica.get(0);
        }
         
        return null;
    }
    
    @Transactional
    public List<AvaliacaoPublica> getByEscola(Escola escola) {
        String hql = "from AvaliacaoPublica where esc_id=" + escola.getId();
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<AvaliacaoPublica> listAvaliacaoPublica = (List<AvaliacaoPublica>) query.list();
         
        if (listAvaliacaoPublica != null && !listAvaliacaoPublica.isEmpty()) {
            return listAvaliacaoPublica;
        }
         
        return null;
    }
}
