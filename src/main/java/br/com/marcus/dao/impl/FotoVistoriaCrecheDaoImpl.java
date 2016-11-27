package br.com.marcus.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.FotoVistoriaCrecheDao;
import br.com.marcus.modelo.FotoVistoriaCreche;
import br.com.marcus.modelo.VistoriaCreche;

@Repository
public class FotoVistoriaCrecheDaoImpl implements FotoVistoriaCrecheDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<FotoVistoriaCreche> listFotos() {
		return getSession().createCriteria(FotoVistoriaCreche.class).list();
	}

	public FotoVistoriaCreche getFoto(Long id) {
		return (FotoVistoriaCreche) getSession().get(FotoVistoriaCreche.class, id);
	}

	public FotoVistoriaCreche saveFoto(FotoVistoriaCreche fotoVistoriaCreche) {
		return (FotoVistoriaCreche) getSession().merge(fotoVistoriaCreche);
	}

	@Transactional
	public List<FotoVistoriaCreche> getByVistoriaCreche(VistoriaCreche vistoriaCreche) {
		String hql = "from FotoVistoriaCreche where vcr_id=" + vistoriaCreche.getId();
		System.out.println(hql);
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<FotoVistoriaCreche> listFotoVistoriaCreche = (List<FotoVistoriaCreche>) query.list();

		if (listFotoVistoriaCreche != null && !listFotoVistoriaCreche.isEmpty()) {
			return listFotoVistoriaCreche;
		}

		return null;
	}

    @Transactional
    public void delete(Long id) {
        FotoVistoriaCreche fotoVistoriaCrecheToDelete = new FotoVistoriaCreche();
        fotoVistoriaCrecheToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(fotoVistoriaCrecheToDelete);
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