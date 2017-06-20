package br.com.marcus.service.impl;

import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.marcus.dao.UserDao;
import br.com.marcus.modelo.User;
import br.com.marcus.repository.RoleRepository;
import br.com.marcus.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userDao.saveOrUpdate(user);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUserName(username);
    }
}