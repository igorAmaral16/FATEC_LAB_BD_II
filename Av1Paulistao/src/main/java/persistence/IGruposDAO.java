package persistence;

import java.sql.SQLException;
import java.util.List;

import model.Grupo;

public interface IGruposDAO<Grupos> {

	List<Grupo> gerarGrupo() throws SQLException, ClassNotFoundException;
	public List<Grupos> listarGrupoA() throws SQLException, ClassNotFoundException;
	public List<Grupos> listarGrupoB() throws SQLException, ClassNotFoundException;
	public List<Grupos> listarGrupoC() throws SQLException, ClassNotFoundException;
	public List<Grupos> listarGrupoD() throws SQLException, ClassNotFoundException;


}
