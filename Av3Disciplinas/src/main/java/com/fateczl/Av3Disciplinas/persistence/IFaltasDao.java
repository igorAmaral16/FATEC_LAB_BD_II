package com.fateczl.Av3Disciplinas.persistence;

import java.sql.SQLException;

import com.fateczl.Av3Disciplinas.model.Faltas;

public interface IFaltasDao {
	public void inserirFalta(Faltas falta) throws ClassNotFoundException, SQLException;

}
