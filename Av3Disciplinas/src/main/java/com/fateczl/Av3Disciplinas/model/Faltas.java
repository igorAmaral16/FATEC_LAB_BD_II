package com.fateczl.Av3Disciplinas.model;

import java.time.LocalDate;

public class Faltas {
	private int aluno;
	private int materia;
	private LocalDate dataAula;
	private int presenca;
	
	public int getAluno() {
		return aluno;
	}
	public void setAluno(int aluno) {
		this.aluno = aluno;
	}
	public int getMateria() {
		return materia;
	}
	public void setMateria(int materia) {
		this.materia = materia;
	}
	public LocalDate getDataAula() {
		return dataAula;
	}
	public void setDataAula(LocalDate dataAula) {
		this.dataAula = dataAula;
	}
	public int getPresenca() {
		return presenca;
	}
	public void setPresenca(int presenca) {
		this.presenca = presenca;
	}
	
	

}
