package br.com.marcus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.marcus.modelo.User;
import br.com.marcus.service.SecurityService;
import br.com.marcus.service.UserService;
import br.com.marcus.validator.UserValidator;

@Controller
public class UserController {
	
	@Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
	
//	@Autowired
//	private UserDao userDao;
//
//	@RequestMapping("listaUsers")
//	public ModelAndView handleRequest() throws Exception {
//		List<User> listUsers = userDao.list();
//		ModelAndView model = new ModelAndView("UserList");
//		model.addObject("userList", listUsers);
//		return model;
//	}
//
//	@RequestMapping(value = "novaUser", method = RequestMethod.GET)
//	public ModelAndView newUser(@ModelAttribute("command") User user, BindingResult result) {
//		ModelAndView model = new ModelAndView("UserForm");
//		model.addObject("user", user);
//		return model;
//	}
//
//	@RequestMapping(value = "alteraUser")
//	public ModelAndView editUser(HttpServletRequest request) {
//		Long userId = Long.parseLong(request.getParameter("id"));
//		User user = userDao.get(userId);
//		ModelAndView model = new ModelAndView("UserForm");
//		model.addObject("user", user);
//		return model;      
//	}
//
//	@RequestMapping(value = "deletaUser")
//	public String deleteUser(HttpServletRequest request) {
//		Long userId = Long.parseLong(request.getParameter("id"));
//		userDao.delete(userId);
//		return "forward:listaUsers";     
//	}
//
//	@RequestMapping(value = "/salvaUser", method = RequestMethod.POST)  
//	public String saveUser(@ModelAttribute("command") User user,   
//			BindingResult result, @RequestParam MultipartFile[] fileUpload) {  
//		
//		userDao.saveOrUpdate(user);
//		return "redirect:/listaUsers";
//	}
}
