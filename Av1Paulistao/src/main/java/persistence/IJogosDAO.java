package persistence;

import java.sql.SQLException;
import java.util.List;

public interface IJogosDAO<Jogo> {
	public List<Jogo> listarJogos() throws SQLException, ClassNotFoundException;
	public List<Jogo> buscarJogos(String data) throws SQLException, ClassNotFoundException;

}