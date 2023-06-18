package com.fateczl.Av3Disciplinas.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fateczl.Av3Disciplinas.model.Faltas;

@Repository
public class FaltasDao implements IFaltasDao{
	
	@Autowired
	GenericDao gDao;

	@Override
	public void inserirFalta(Faltas falta) throws ClassNotFoundException, SQLException {
		Connection con = gDao.getConnection();
		
		String procedure = "{CALL p_insereFaltas(?, ?, ?, ?)}";

		    CallableStatement cs = con.prepareCall(procedure);
		    		
		    cs.setInt(1, falta.getAluno());
		    cs.setInt(2, falta.getMateria());
		    LocalDate dataAula = falta.getDataAula();
		    java.sql.Date sqlDate = java.sql.Date.valueOf(dataAula);
		    cs.setDate(3, sqlDate);
		    cs.setDouble(4, falta.getPresenca());
           
		    cs.execute();
		
	}

}
