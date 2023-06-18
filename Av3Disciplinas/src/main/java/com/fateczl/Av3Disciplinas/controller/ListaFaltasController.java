package com.fateczl.Av3Disciplinas.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fateczl.Av3Disciplinas.model.FaltasAlunos;
import com.fateczl.Av3Disciplinas.persistence.FaltasDao;

@Controller
public class ListaFaltasController {
	
	@Autowired
    private FaltasDao fDao;
	
	@RequestMapping(name = "listarFaltas", value = "/listarFaltas", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		
	    
	   String erro = "";
	   String saida = "";
	  
	   model.addAttribute("saida", saida);
	   model.addAttribute("erro", erro);

		return new ModelAndView("listarFaltas");
	}
	
	@RequestMapping(name = "listarFaltas", value = "/listarFaltas", method = RequestMethod.POST)
	public ModelAndView listarNotas(ModelMap model, @RequestParam Map<String, String> allParam) {
		
		int materia = Integer.valueOf(allParam.get("disciplina"));
		
		String erro = "";
		List<FaltasAlunos> faltas;
		
		try {
			System.out.println("Entrou para buscar");
			faltas = fDao.buscarFaltas(materia);
			System.out.println(faltas);
			
			model.addAttribute("faltas", faltas);
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			erro = e.getMessage();
		}finally {
			model.addAttribute("erro", erro);
		}
		
		return new ModelAndView("listarFaltas");
	}

}
