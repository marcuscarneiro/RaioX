package br.com.marcus.service;

import br.com.marcus.modelo.User;


public interface UserService {

	void save(User user);
	User findByUsername(String username);
}
