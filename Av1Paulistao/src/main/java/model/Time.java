package model;

public class Time{

	private int codigoTime;
	private String nomeTime;
	private String cidade;
	private String estadio;
	private String matEsportivo;
	
	public int getCodigotime() {
		return codigoTime;
	}
	public void setCodigotime(int codigoTime) {
		this.codigoTime = codigoTime;
	}
	public String getNometime() {
		return nomeTime;
	}
	public void setNometime(String nomeTime) {
		this.nomeTime = nomeTime;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstadio() {
		return estadio;
	}
	public void setEstadio(String estadio) {
		this.estadio = estadio;
	}
	public String getMatEsportivo() {
		return matEsportivo;
	}
	public void setMatEsportivo(String matEsportivo) {
		this.matEsportivo = matEsportivo;
	}
	
	@Override
	public String toString() {
		return "Times ["
				+ "codigotime=" + codigoTime
				+ ", nometime=" + nomeTime 
				+ ", cidade=" 	+ cidade 
				+ ", estadio="	+ estadio 
				+ ", exportivo=" + matEsportivo 
				+ "]";
	}
	
	
}