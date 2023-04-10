package model;


import java.time.LocalDate;



public class Jogo{
	
	private String nomeTimeA;
	private String nomeTimeB;
	private int golsTimeA;
	private int golsTimeB;
	private LocalDate data;
	
	public String getNometimeA() {
		return nomeTimeA;
	}
	public void setNometimeA(String nomeTimeA) {
		this.nomeTimeA = nomeTimeA;
	}
	public String getNometimeB() {
		return nomeTimeB;
	}
	public void setNometimeB(String nomeTimeB) {
		this.nomeTimeB = nomeTimeB;
	}
	public int getGolstimeA() {
		return golsTimeA;
	}
	public void setGolstimeA(int golsTimeA) {
		this.golsTimeA = golsTimeA;
	}
	public int getGolstimeB() {
		return golsTimeB;
	}
	public void setGolstimeB(int golsTimeB) {
		this.golsTimeB = golsTimeB;
	}
	public LocalDate getData() {
		return data;
	}
	public void setData(LocalDate data) {
		this.data = data;
	}
	
	@Override
	public String toString() {
		return "Jogos ["
				+ "nometimeA=" + nomeTimeA 
				+ ", nometimeB=" + nomeTimeB 
				+ ", golstimeA=" + golsTimeA
				+ ", golstimeB=" + golsTimeB 
				+ ", data=" + data 
				+ "]";
	}
	
	

}