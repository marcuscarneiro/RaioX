package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.MedicaoEscolaDao;
import br.com.marcus.modelo.MedicaoEscola;
import br.com.marcus.modelo.Visita;

public class MedicaoEscolaDaoImpl implements MedicaoEscolaDao {

	private SessionFactory sessionFactory;

	public MedicaoEscolaDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<MedicaoEscola> listMedicoesEscola() {
		return getSession().createCriteria(MedicaoEscola.class).list();
	}

	public MedicaoEscola getMedicao(Long id) {
		return (MedicaoEscola) getSession().get(MedicaoEscola.class, id);
	}

	public MedicaoEscola saveMedicao(MedicaoEscola medicaoEscola) {
		return (MedicaoEscola) getSession().merge(medicaoEscola);
	}

	@Transactional
	public List<MedicaoEscola> getByVisita(Visita visita) {
		String hql = "from MedicaoEscola where vis_id=" + visita.getId();
		System.out.println(hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<MedicaoEscola> listMedicaoEscola = (List<MedicaoEscola>) query.list();

		if (listMedicaoEscola != null && !listMedicaoEscola.isEmpty()) {
			return listMedicaoEscola;
		}

		return null;
	}

    @Transactional
    public void delete(Long id) {
        MedicaoEscola medicaoEscolaToDelete = new MedicaoEscola();
        medicaoEscolaToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(medicaoEscolaToDelete);
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