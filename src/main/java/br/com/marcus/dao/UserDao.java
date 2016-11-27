package br.com.marcus.dao;

import java.util.List;

import br.com.marcus.modelo.User;

public interface UserDao {

	public List<User> list();
    
    public User get(Long id);
     
    public void saveOrUpdate(User user);
     
    public void delete(Long id);
    
	User findByUserName(String username);
	
}
