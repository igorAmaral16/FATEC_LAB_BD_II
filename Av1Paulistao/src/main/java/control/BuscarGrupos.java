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


@WebServlet("/gruposformados")
public class BuscarGrupos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BuscarGrupos() {
        super();
       
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btnEnviar = request.getParameter("enviar");
		
		GenericDAO gDao = new GenericDAO();
		GruposDAO gruDao = new GruposDAO(gDao);
		
		List<Grupo> grupoA = new ArrayList<>();
		List<Grupo> grupoB = new ArrayList<>();
		List<Grupo> grupoC = new ArrayList<>();
		List<Grupo> grupoD = new ArrayList<>();
		
		String erro = "";
		String saida = "";
		
		try {
			if (btnEnviar.equalsIgnoreCase("mostrar")) {
				grupoA = gruDao.listarGrupoA();
				grupoB = gruDao.listarGrupoB();
				grupoC = gruDao.listarGrupoC();
				grupoD = gruDao.listarGrupoD();
			}
			
			
		} catch (SQLException | ClassNotFoundException e) {
			erro = "Erro inesperado, por favor, tente novamente." + e.getMessage();
		}finally {
			request.setAttribute("saida", saida);
	        request.setAttribute("erro", erro);     
	   
	        request.setAttribute("grupoA", grupoA);	       
	        request.setAttribute("grupoB", grupoB);
	        request.setAttribute("grupoC", grupoC);
	        request.setAttribute("grupoD", grupoD);
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("mostrarGrupos.jsp");
			dispatcher.forward(request, response);
			}
		}
	}


