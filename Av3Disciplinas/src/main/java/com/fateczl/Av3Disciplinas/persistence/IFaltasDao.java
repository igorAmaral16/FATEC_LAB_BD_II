package com.fateczl.Av3Disciplinas.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fateczl.Av3Disciplinas.model.Faltas;
import com.fateczl.Av3Disciplinas.model.FaltasAlunos;

public interface IFaltasDao {
	public void inserirFalta(Faltas falta) throws ClassNotFoundException, SQLException;
	public List<FaltasAlunos> buscarFaltas(int materia) throws ClassNotFoundException, SQLException;
}
