package control;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Jogo;
import persistence.GenericDAO;
import persistence.JogosDAO;

@WebServlet("/buscarJogos")
public class BuscarJogos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuscarJogos() {
        super();
     
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String btnEnviar = request.getParameter("botao");
		
		GenericDAO gDao = new GenericDAO();
		JogosDAO jDao = new JogosDAO(gDao);
		
		List<Jogo> listaJogos = new ArrayList<>();
		String erro = "";
		String saida = "";
		
		try {
			LocalDate data = (LocalDate.parse(request.getParameter("data")));
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy", Locale.US);
			String dataN = data.format(dtf);
			if(btnEnviar.equalsIgnoreCase("buscar")) {
				listaJogos = jDao.buscarJogos(dataN);
				
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			erro = "Erro inesperado, por favor, tente novamente." + e.getMessage();
		}finally {
			
        request.setAttribute("saida", saida);
        request.setAttribute("erro", erro);     
        
        request.setAttribute("listaJogos", listaJogos);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("buscarJogos.jsp");
		dispatcher.forward(request, response);
		}
	}

		
	}

