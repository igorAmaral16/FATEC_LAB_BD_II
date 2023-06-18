package com.fateczl.Av3Disciplinas.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fateczl.Av3Disciplinas.model.Notas;
import com.fateczl.Av3Disciplinas.model.NotasAluno;

public interface INotasDao {
	public void inserirNota(Notas nota) throws ClassNotFoundException, SQLException;
	public List<NotasAluno> buscarnotas(int materia) throws ClassNotFoundException, SQLException;
}
