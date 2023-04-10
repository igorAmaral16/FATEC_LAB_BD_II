package persistence;


import java.sql.CallableStatement;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import model.Jogo;

public class JogosDAO implements IJogosDAO<Jogo>{

	private GenericDAO gDao;
	
	public JogosDAO (GenericDAO gDao) {
		this.gDao = gDao;
	}
	@Override
	public List<Jogo> listarJogos() throws SQLException, ClassNotFoundException {
		List<Jogo> jogos = new ArrayList<>();
		
		Connection con = gDao.getConnection();
		
		String procedure = "{CALL sp_GerarJogos}";
		String sql = "SELECT timeA, gols_timeA, timeB, gols_timeB, data_jogo FROM jogosGerados";
		
		CallableStatement cs = con.prepareCall(procedure);
		cs.execute();
		
		PreparedStatement ps = con.prepareStatement(sql);	
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			Jogo jogo = new Jogo();
			jogo.setNometimeA(rs.getString("timeA"));
			jogo.setGolstimeA(rs.getInt("gols_timeA"));			
			jogo.setNometimeB(rs.getString("timeB"));
			jogo.setGolstimeB(rs.getInt("gols_timeB"));
			jogo.setData(LocalDate.parse(rs.getString("data_jogo"))); 
			
			jogos.add(jogo);
		}
		rs.close();
		ps.close();	
		cs.close();
		con.close();
		
		return jogos;
	}
	
	public List<Jogo> buscarJogos(String data) throws SQLException, ClassNotFoundException {
		List<Jogo> jogos = new ArrayList<>();
		
		Connection con = gDao.getConnection();
		String sql = "SELECT timeA, gols_timeA, timeB, gols_timeB, data_jogo FROM jogosGerados WHERE data_jogo = ?";
	
		PreparedStatement ps = con.prepareStatement(sql);	
		ps.setString(1, data);

		
		ResultSet rs = ps.executeQuery();		
		while(rs.next()) {
			Jogo jogo = new Jogo();
			jogo.setNometimeA(rs.getString("timeA"));
			jogo.setGolstimeA(rs.getInt("gols_timeA"));			
			jogo.setNometimeB(rs.getString("timeB"));
			jogo.setGolstimeB(rs.getInt("gols_timeB"));
			jogo.setData(LocalDate.parse(rs.getString("data_jogo"))); 
			
			jogos.add(jogo);
		}
		rs.close();
		ps.close();		
		con.close();
		
		return jogos;
	}

}