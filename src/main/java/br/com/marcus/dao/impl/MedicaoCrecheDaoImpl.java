package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.MedicaoCrecheDao;
import br.com.marcus.modelo.MedicaoCreche;
import br.com.marcus.modelo.VistoriaCreche;

public class MedicaoCrecheDaoImpl implements MedicaoCrecheDao {

	private SessionFactory sessionFactory;

	public MedicaoCrecheDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<MedicaoCreche> listMedicoesCreche() {
		return getSession().createCriteria(MedicaoCreche.class).list();
	}

	public MedicaoCreche getMedicao(Long id) {
		return (MedicaoCreche) getSession().get(MedicaoCreche.class, id);
	}

	public MedicaoCreche saveMedicao(MedicaoCreche medicaoCreche) {
		return (MedicaoCreche) getSession().merge(medicaoCreche);
	}

	@Transactional
	public List<MedicaoCreche> getByVistoriaCreche(VistoriaCreche vistoriaCreche) {
		String hql = "from MedicaoCreche where vis_id=" + vistoriaCreche.getId();
		System.out.println(hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<MedicaoCreche> listMedicaoCreche = (List<MedicaoCreche>) query.list();

		if (listMedicaoCreche != null && !listMedicaoCreche.isEmpty()) {
			return listMedicaoCreche;
		}

		return null;
	}

    @Transactional
    public void delete(Long id) {
        MedicaoCreche medicaoCrecheToDelete = new MedicaoCreche();
        medicaoCrecheToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(medicaoCrecheToDelete);
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