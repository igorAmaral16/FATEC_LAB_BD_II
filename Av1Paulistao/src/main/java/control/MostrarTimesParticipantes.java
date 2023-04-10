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

import model.Time;
import persistence.GenericDAO;
import persistence.TimeDAO;

@WebServlet("/listarTimes")
public class MostrarTimesParticipantes extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MostrarTimesParticipantes() {
        super();
     
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String btnEnviar = request.getParameter("enviar");	
		
    GenericDAO gDao = new GenericDAO();
    TimeDAO tDao = new TimeDAO(gDao);
    
    List<Time> times = new ArrayList<>();
    String erro = "";
    String saida = "";
    
    try {
    	if(btnEnviar.equalsIgnoreCase("LISTAR")) {
    		times = tDao.listarTimes();
    	}
    } catch (SQLException | ClassNotFoundException e) {
    	erro = ("Não foi possível gerar grupos, tente novamente. ") + e.getMessage();
    } finally {
    	request.setAttribute("erro", erro);
    	request.setAttribute("saida", saida);
    	request.setAttribute("time", times);
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("listarTimes.jsp");
    	dispatcher.forward(request, response);
    	}
	}
}
