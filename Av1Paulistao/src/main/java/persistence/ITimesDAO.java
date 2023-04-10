package persistence;

import java.sql.SQLException;
import java.util.List;

public interface ITimesDAO<Time> {

	public List<Time> listarTimes() throws SQLException, ClassNotFoundException;
}