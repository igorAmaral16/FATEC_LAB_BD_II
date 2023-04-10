package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Grupo;
import persistence.GenericDAO;
import persistence.GruposDAO;


@WebServlet("/formarGrupos")
public class FormarGrupos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FormarGrupos() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           String btnEnviar = request.getParameter("enviar");
           
           GenericDAO gDao = new GenericDAO();
           GruposDAO gDAO = new GruposDAO(gDao);
           
           List<Grupo> grupos = new ArrayList<>();
           String erro = "";
           String saida = "";
           
           try {
        	   if(btnEnviar.equalsIgnoreCase("GERAR")) {
        		   grupos = gDAO.gerarGrupo();
        	   }
        	   
           } catch (SQLException | ClassNotFoundException e) {
        	   erro = ("Não foi possível gerar grupos, tente novamente. ") + e.getMessage();
           } finally {
        	   request.setAttribute("erro", erro);
        	   request.setAttribute("saida", saida);
        	   request.setAttribute("grupos", grupos);
        	   
        	   RequestDispatcher dispatcher = request.getRequestDispatcher("formarGrupos.jsp");
        	   dispatcher.forward(request, response);
           }
           	   
	}

}