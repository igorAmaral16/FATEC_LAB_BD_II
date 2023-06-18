package com.fateczl.Av3Disciplinas.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fateczl.Av3Disciplinas.model.Faltas;
import com.fateczl.Av3Disciplinas.model.FaltasAlunos;

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

	@Override
	public List<FaltasAlunos> buscarFaltas(int materia) throws ClassNotFoundException, SQLException {
		List<FaltasAlunos> faltas = new ArrayList<>();
		
		Connection con = gDao.getConnection();
		
		String sql = "SELECT * FROM fn_cursorFaltas(?)";
		
		PreparedStatement statement = con.prepareStatement(sql);
        statement.setInt(1, materia);
        ResultSet rs = statement.executeQuery();

        while (rs.next()) {
        	FaltasAlunos falta = new FaltasAlunos();
            falta.setMatricula_Aluno(rs.getInt("Matricula_Aluno"));
            falta.setAluno(rs.getString("Aluno"));
            falta.setDATA1(rs.getString("DATA1"));
            falta.setDATA2(rs.getString("DATA2"));
            falta.setDATA3(rs.getString("DATA3"));
            falta.setDATA4(rs.getString("DATA4"));
            falta.setDATA5(rs.getString("DATA5"));
            falta.setDATA6(rs.getString("DATA6"));
            falta.setDATA7(rs.getString("DATA7"));
            falta.setDATA8(rs.getString("DATA8"));
            falta.setDATA9(rs.getString("DATA9"));
            falta.setDATA10(rs.getString("DATA10"));
            falta.setDATA11(rs.getString("DATA11"));
            falta.setDATA12(rs.getString("DATA12"));
            falta.setDATA13(rs.getString("DATA13"));
            falta.setDATA14(rs.getString("DATA14"));
            falta.setDATA15(rs.getString("DATA15"));
            falta.setDATA16(rs.getString("DATA16"));
            falta.setDATA17(rs.getString("DATA17"));
            falta.setDATA18(rs.getString("DATA18"));
            falta.setDATA19(rs.getString("DATA19"));
            falta.setDATA20(rs.getString("DATA20"));
            falta.setTotFaltas(rs.getInt("totFaltas"));

            faltas.add(falta);     
        }
        return faltas;
	}
}
