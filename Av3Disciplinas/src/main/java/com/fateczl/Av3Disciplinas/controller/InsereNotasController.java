package com.fateczl.Av3Disciplinas.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fateczl.Av3Disciplinas.model.Notas;
import com.fateczl.Av3Disciplinas.persistence.NotasDao;

@Controller
public class InsereNotasController {

    @Autowired
    private NotasDao nDao;
    
    @RequestMapping(name = "notas", value = "/notas", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		
	    
	   String erro = "";
	   String saida = "";
	  
	   model.addAttribute("saida", saida);
	   model.addAttribute("erro", erro);

		return new ModelAndView("notas");
	}

	@RequestMapping(name = "notas", value = "/notas", method = RequestMethod.POST)
	public ModelAndView insereNota(ModelMap model, @RequestParam Map<String, String> allParam) {
		
		String botao = allParam.get("botao");
		String saida = "";
		String erro = "";
		
		Notas nota = new Notas();
		
		nota.setAluno(Integer.valueOf(allParam.get("aluno")));
		nota.setMateria(Integer.valueOf(allParam.get("disciplina")));
		nota.setNota(Double.parseDouble(allParam.get("nota")));
		nota.setTipoAvaliacao(Integer.valueOf(allParam.get("tipoAvaliacao")));
		
		System.out.println(nota);
		
		try {
			if(botao.equalsIgnoreCase("Inserir")) {
				System.out.println("Entrou pra inserir");
				nDao.inserirNota(nota);
				System.out.println("nota inserida com sucesso");
				saida = "NOTA INSERIDA COM SUCESSO";
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		} finally {
			model.addAttribute("saida", saida);
			model.addAttribute("erro", erro);
		}
		return new ModelAndView("notas");
	}

}

