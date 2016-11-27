package br.com.marcus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImportProdutorController {

	@RequestMapping("importaProdutores")
	public String adiciona(){
		
		System.out.println("Importando");
		return "edital";
	}
}
