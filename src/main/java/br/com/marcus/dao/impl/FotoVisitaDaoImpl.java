package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.FotoVisitaDao;
import br.com.marcus.modelo.FotoVisita;
import br.com.marcus.modelo.Visita;

@Repository
public class FotoVisitaDaoImpl implements FotoVisitaDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<FotoVisita> listFotos() {
		return getSession().createCriteria(FotoVisita.class).list();
	}

	public FotoVisita getFoto(Long id) {
		return (FotoVisita) getSession().get(FotoVisita.class, id);
	}

	public FotoVisita saveFoto(FotoVisita fotoVisita) {
		return (FotoVisita) getSession().merge(fotoVisita);
	}

	@Transactional
	public List<FotoVisita> getByVisita(Visita visita) {
		String hql = "from FotoVisita where vis_id=" + visita.getId();
		System.out.println(hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<FotoVisita> listFotoVisita = (List<FotoVisita>) query.list();

		if (listFotoVisita != null && !listFotoVisita.isEmpty()) {
			return listFotoVisita;
		}

		return null;
	}

    @Transactional
    public void delete(Long id) {
        FotoVisita fotoVisitaToDelete = new FotoVisita();
        fotoVisitaToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(fotoVisitaToDelete);
    }

	private Session getSession() {
		Session sess = getSessionFactory().getCurrentSession();
		if (sess == null) {
			sess = getSessionFactory().openSession();
		}
		return sess;
	}

	private SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}