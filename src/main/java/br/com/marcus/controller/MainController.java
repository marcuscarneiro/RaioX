package br.com.marcus.controller;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.marcus.modelo.Email;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping("/creches")
	public String creches() {
		
		return "mapaCreche";
	}

	@RequestMapping("/escolas")
	public String escolas() {
		
		return "mapaEscola";
	}

	@RequestMapping("/painel")
	public String painel() {
		return "painel";
	}

	@RequestMapping("/menu")
	public String menu() {
		return "painel";
	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security + Hibernate Example");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}
	
	@RequestMapping(value = "/sendMail", headers = {"Content-type=application/json"}, produces={"application/json; charset=UTF-8"}, method = RequestMethod.POST)
	@ResponseBody
	public boolean addEmail(@RequestBody Email email) {
		
		System.out.println("Nome: " + email.getNome() + ", Assunto: " + email.getAssunto() + ", E-mail: " + email.getEmail() + ", Escola: " + email.getEscola() + ", Mensagem: " + email.getMensagem());
		
		Properties props = new Properties();
		
		/** Parâmetros de conexão com servidor Gmail */
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		
		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() 
			{
				return new PasswordAuthentication("equipearegis@gmail.com", "aR456000");
			}
		});
		
		/** Ativa Debug para sessão */
		session.setDebug(true);
		try {
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("equipearegis@gmail.com")); //Remetente
			
			Address[] toUser = InternetAddress //Destinatário(s)
					.parse("gabineteandreregis@gmail.com");  
			message.setRecipients(Message.RecipientType.TO, toUser);
			message.setSubject("Denúncia/sugestão do Raio-X das Escolas");//Assunto
			message.setText("E-mail enviado pelo sistema de mensagens do Raio-X das Escolas.\n\n" + 
			"Remetente: " + email.getNome() +
			"\nE-mail: " + email.getEmail() +
			"\nEscola: " + email.getEscola() +
			"\nMensagem:\n" + email.getMensagem());
			
			/**Método para enviar a mensagem criada*/
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
		return true;
	}
	
	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}

}