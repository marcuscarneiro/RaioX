package br.com.marcus.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "foto_vistoria_creche")
public class FotoVistoriaCreche {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "vcr_id", nullable = false)
	private VistoriaCreche vistoriaCreche;

	@Column
	private String nome;
	
	@Column
	private String legenda;
	
	@Column
	private String localizacao;
	
	@Column
	private String localfisico;
	
	@Column
	private Long tamanho;
	
	@Column
	private String tipo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public VistoriaCreche getVistoriaCreche() {
		return vistoriaCreche;
	}

	public void setVistoriaCreche(VistoriaCreche vistoriaCreche) {
		this.vistoriaCreche = vistoriaCreche;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLegenda() {
		return legenda;
	}

	public void setLegenda(String legenda) {
		this.legenda = legenda;
	}

	public String getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}

	public String getLocalfisico() {
		return localfisico;
	}

	public void setLocalfisico(String localfisico) {
		this.localfisico = localfisico;
	}

	public Long getTamanho() {
		return tamanho;
	}

	public void setTamanho(Long tamanho) {
		this.tamanho = tamanho;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


}