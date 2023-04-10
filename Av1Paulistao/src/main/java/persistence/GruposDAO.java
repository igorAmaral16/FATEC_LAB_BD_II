package persistence;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import model.Grupo;

public class GruposDAO implements IGruposDAO<Grupo>{

	private GenericDAO gDao;
	
	public GruposDAO(GenericDAO gDao) {
		this.gDao = gDao;
	}
	
	
	@Override
	public List<Grupo> gerarGrupo() throws SQLException, ClassNotFoundException {
		List<Grupo> grupos = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String procedure = "{CALL sp_gerar_grupo}";
		String sql = " SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time";
		
		try {
		CallableStatement cs = con.prepareCall(procedure);
		cs.execute();
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			Grupo grupo = new Grupo();
			grupo.setNometime(rs.getString("nome_time"));
			grupo.setGrupo(rs.getString("grupo"));
			grupos.add(grupo);
		}
		rs.close();
		ps.close();
		cs.close();
		
		} catch(Exception e) {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Grupo grupo = new Grupo();
				grupo.setNometime(rs.getString("nome_time"));
				grupo.setGrupo(rs.getString("grupo"));
				grupos.add(grupo);
			}
			rs.close();
			ps.close();
			
		}
		con.close();
		
		return grupos;
	}

	@Override
	public List<Grupo> listarGrupoA() throws SQLException, ClassNotFoundException {
		List<Grupo> gpA = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time AND Grupo = 'A'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupo grupoA = new Grupo();
			grupoA.setNometime(rs.getString("nome_time"));
			grupoA.setGrupo(rs.getString("grupo"));
			gpA.add(grupoA);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gpA;
	}

	@Override
	public List<Grupo> listarGrupoB() throws SQLException, ClassNotFoundException {
		List<Grupo> gpB = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time AND Grupo = 'B'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupo grupoB = new Grupo();
			grupoB.setNometime(rs.getString("nome_time"));
			grupoB.setGrupo(rs.getString("grupo"));
			gpB.add(grupoB);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gpB;
	}
	

	@Override
	public List<Grupo> listarGrupoC() throws SQLException, ClassNotFoundException {
		List<Grupo> gpC = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time AND Grupo = 'C'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupo grupoC = new Grupo();
			grupoC.setNometime(rs.getString("nome_time"));
			grupoC.setGrupo(rs.getString("grupo"));
			gpC.add(grupoC);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gpC;
	}
	@Override
	public List<Grupo> listarGrupoD() throws SQLException, ClassNotFoundException {
		List<Grupo> gpD = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time AND Grupo = 'D'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupo grupoD = new Grupo();
			grupoD.setNometime(rs.getString("nome_time"));
			grupoD.setGrupo(rs.getString("grupo"));
			gpD.add(grupoD);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gpD;
	}

}
