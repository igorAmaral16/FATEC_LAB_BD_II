package com.fateczl.Av3Disciplinas.persistence;

import java.sql.SQLException;

import com.fateczl.Av3Disciplinas.model.Notas;

public interface INotasDao {
	public void inserirNota(Notas nota) throws ClassNotFoundException, SQLException;
}
