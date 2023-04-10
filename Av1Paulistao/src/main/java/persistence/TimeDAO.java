package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Time;

public class TimeDAO implements ITimesDAO<Time>{

	private GenericDAO gDao;
	
	public TimeDAO(GenericDAO gDao) {
		this.gDao = gDao;
	}
	@Override
	public List<Time> listarTimes() throws SQLException, ClassNotFoundException {
	    List<Time> times = new ArrayList<>();
	    
	    Connection con = gDao.getConnection();
	    
	    String sql = "SELECT codigo_time, nome_time, cidade, estadio, materialEsportivo FROM times ORDER BY nome_time ASC";
	    
	    PreparedStatement ps = con.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    
	    while(rs.next()) {
	    	Time time = new Time();
	    	time.setCodigotime(rs.getInt("codigo_time"));
	    	time.setNometime(rs.getString("nome_time"));
	    	time.setCidade(rs.getString("cidade"));
	    	time.setEstadio(rs.getString("estadio"));
	    	time.setMatEsportivo(rs.getString("materialEsportivo"));
	    	times.add(time);
	    }
	    rs.close();
	    ps.close();
	    con.close();
	    
		return times;
	}

}