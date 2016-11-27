package br.com.marcus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import br.com.marcus.dao.UserDao;
import br.com.marcus.modelo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;

	@RequestMapping("listaUsers")
	public ModelAndView handleRequest() throws Exception {
		List<User> listUsers = userDao.list();
		ModelAndView model = new ModelAndView("UserList");
		model.addObject("userList", listUsers);
		return model;
	}

	@RequestMapping(value = "novaUser", method = RequestMethod.GET)
	public ModelAndView newUser(@ModelAttribute("command") User user, BindingResult result) {
		ModelAndView model = new ModelAndView("UserForm");
		model.addObject("user", user);
		return model;
	}

	@RequestMapping(value = "alteraUser")
	public ModelAndView editUser(HttpServletRequest request) {
		Long userId = Long.parseLong(request.getParameter("id"));
		User user = userDao.get(userId);
		ModelAndView model = new ModelAndView("UserForm");
		model.addObject("user", user);
		return model;      
	}

	@RequestMapping(value = "deletaUser")
	public String deleteUser(HttpServletRequest request) {
		Long userId = Long.parseLong(request.getParameter("id"));
		userDao.delete(userId);
		return "forward:listaUsers";     
	}

	@RequestMapping(value = "/salvaUser", method = RequestMethod.POST)  
	public String saveUser(@ModelAttribute("command") User user,   
			BindingResult result, @RequestParam MultipartFile[] fileUpload) {  
		
		userDao.saveOrUpdate(user);
		return "redirect:/listaUsers";
	}
}
