package com.fateczl.Av3Disciplinas.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fateczl.Av3Disciplinas.model.Notas;
import com.fateczl.Av3Disciplinas.model.NotasAluno;

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

	@Override
	public List<NotasAluno> buscarnotas(int materia) throws ClassNotFoundException, SQLException{
		List<NotasAluno> notas = new ArrayList<>();
		
		Connection con = gDao.getConnection();
		
		String sql = "SELECT * FROM fn_mediaFinal(?)";
		
		PreparedStatement statement = con.prepareStatement(sql);
        statement.setInt(1, materia);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            NotasAluno aluno = new NotasAluno();
            aluno.setRa(resultSet.getInt("Matricula_Aluno"));
            aluno.setNome(resultSet.getString("Aluno"));
            aluno.setAv1(resultSet.getDouble("Avaliacao1"));
            aluno.setAv2(resultSet.getDouble("Avaliacao2"));
            aluno.setAv3(resultSet.getDouble("Avaliacao3"));
            aluno.setTrabalho(resultSet.getDouble("Trabalho"));
            aluno.setExame(resultSet.getDouble("Exame"));
            aluno.setMediaFinal(resultSet.getDouble("MediaFinal"));
            aluno.setSituacao(resultSet.getString("Situacao"));

            notas.add(aluno);
        }
        return notas;
	}

}
