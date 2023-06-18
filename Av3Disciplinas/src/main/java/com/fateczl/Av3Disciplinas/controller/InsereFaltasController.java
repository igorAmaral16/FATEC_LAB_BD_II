package com.fateczl.Av3Disciplinas.controller;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fateczl.Av3Disciplinas.model.Faltas;
import com.fateczl.Av3Disciplinas.persistence.FaltasDao;

@Controller
public class InsereFaltasController {

    @Autowired
    private FaltasDao fDao;
    
    @RequestMapping(name = "faltas", value = "/faltas", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		
	    
	   String erro = "";
	   String saida = "";
	  
	   model.addAttribute("saida", saida);
	   model.addAttribute("erro", erro);

		return new ModelAndView("faltas");
	}

	@RequestMapping(name = "faltas", value = "/faltas", method = RequestMethod.POST)
	public ModelAndView insereNota(ModelMap model, @RequestParam Map<String, String> allParam) {
		
		String botao = allParam.get("botao");
		String saida = "";
		String erro = "";
		
		Faltas falta = new Faltas();
		
		falta.setAluno(Integer.valueOf(allParam.get("aluno")));
		falta.setMateria(Integer.valueOf(allParam.get("disciplina")));
		falta.setDataAula(LocalDate.parse((allParam.get("dataFalta"))));
		falta.setPresenca(Integer.valueOf(allParam.get("presenca")));
		
		try {
			if(botao.equalsIgnoreCase("Inserir")) {
				System.out.println("Entrou pra inserir");
				fDao.inserirFalta(falta);
				System.out.println("falta inserida com sucesso");
				saida = "FALTA INSERIDA COM SUCESSO";
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("saida", saida);
			model.addAttribute("erro", erro);
		}
		return new ModelAndView("faltas");
	}

}

