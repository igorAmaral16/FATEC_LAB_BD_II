package com.fateczl.Av3Disciplinas.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fateczl.Av3Disciplinas.model.Notas;

@Repository
public class NotasDao implements INotasDao{
	
	@Autowired
	GenericDao gDao;
	
	@Override
	public void inserirNota(Notas nota) throws ClassNotFoundException, SQLException {
		Connection con = gDao.getConnection();
		
		String procedure = "{CALL p_insereNotas(?, ?, ?, ?)}";

		    CallableStatement cs = con.prepareCall(procedure);
		    		
		    cs.setInt(1, nota.getAluno());
		    cs.setInt(2, nota.getMateria());
		    cs.setInt(3, nota.getTipoAvaliacao());
		    cs.setDouble(4, nota.getNota());
           
		    cs.execute();
	}

}
