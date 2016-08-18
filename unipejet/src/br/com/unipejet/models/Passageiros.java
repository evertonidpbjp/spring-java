package br.com.unipejet.models;


import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class Passageiros {
  
		@Column(scale=2)
		private String nome;
		private String cpf;
		public String getNome() {
			return nome;
		}
		public void setNome(String nome) {
			this.nome = nome;
		}
		public String getCpf() {
			return cpf;
		}
		public void setCpf(String cpf) {
			this.cpf = cpf;
		}
		
}
