package br.com.marcus.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import br.com.marcus.dao.UserDao;
import br.com.marcus.modelo.User;

public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;

	public UserDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<User> list() {
		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) sessionFactory.getCurrentSession()
		.createCriteria(User.class)
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listUser;
	}
	
    @Transactional
    public void saveOrUpdate(User user) {
        sessionFactory.getCurrentSession().saveOrUpdate(user);
    }
 
    @Transactional
    public void delete(Long id) {
        User userToDelete = new User();
        userToDelete.setId(id);
        sessionFactory.getCurrentSession().delete(userToDelete);
    }
 
    @Transactional
    public User get(Long id) {
        String hql = "from User where id=" + id;
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
         
        @SuppressWarnings("unchecked")
        List<User> listUser = (List<User>) query.list();
         
        if (listUser != null && !listUser.isEmpty()) {
            return listUser.get(0);
        }
         
        return null;
    }
    
    @SuppressWarnings("unchecked")
	public User findByUserName(String username) {

		List<User> users = new ArrayList<User>();

		users = sessionFactory.getCurrentSession()
			.createQuery("from User where username=?")
			.setParameter(0, username)
			.list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}
}
