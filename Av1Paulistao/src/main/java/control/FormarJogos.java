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

import model.Jogo;
import persistence.GenericDAO;
import persistence.JogosDAO;


@WebServlet("/gerarJogos")
public class FormarJogos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FormarJogos() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String btnEnviar = request.getParameter("enviar");
		
		GenericDAO gDao = new GenericDAO();
		JogosDAO jDao = new JogosDAO(gDao);
		
		List<Jogo> jogo = new ArrayList<>();
		String erro = "";
		String saida = "";
		
		try {
			
			if(btnEnviar.equalsIgnoreCase("listar")) {

				jogo = jDao.listarJogos();
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		}finally {
		request.setAttribute("jogo", jogo);	
        request.setAttribute("saida", saida);
        request.setAttribute("erro", erro);     
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("listarJogos.jsp");
		dispatcher.forward(request, response);
		}
	}

}