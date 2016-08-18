package br.com.unipejet.models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Id;


public class Compras {

	
	Integer identificador;
    Integer numero_compra;
	

	public Integer getNumero_compra() {
		return numero_compra;
	}

	private Integer passagens;
	private double total;
    
	private List<Passageiros> passageiros = new ArrayList<Passageiros>();

	public Integer getIdentificador() {
		return identificador;
	}

	public void setIdentificador(Integer identificador) {
		this.identificador = identificador;
	}

	public Integer getPassagens() {
		return passagens;
	}

	public void setPassagens(Integer passagens) {
		this.passagens = passagens;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public List<Passageiros> getPassageiros() {
		return passageiros;
	}

	public void setPassageiros(List<Passageiros> passageiros) {
		this.passageiros = passageiros;
	}

	public void setNumero_compra(Integer numero_compra) {
		this.numero_compra = numero_compra;
		
	}

	   

}
