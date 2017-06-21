package br.com.marcus.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="escola")
public class Escola {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="esc_id")
	private Long id;
	
	@Column
	private String nome;
	
	@Column
	private Double latitude;
	
	@Column
	private Double longitude;
	
	@Column
	private String logradouro;
	
	@Column
	private String numeroEnd;
	
	@Column
	private String complemento;
	
	@Column
	private String bairro;
	
	@Column
	private String cep;
	
	@Column
	private String telefone;
	
	@Column
	private String telefone2;
	
	@Column
	private String requerimentos;
	
	@Column
	private Double ideb;
	
	@Column
	private Integer rpa;
	
	@Column
	private Integer codMec;

	@Column
	private String nova;

	@Column
	private String fotoCapa;
	
	public String getFotoCapa() {
		return fotoCapa;
	}

	public void setFotoCapa(String fotoCapa) {
		this.fotoCapa = fotoCapa;
	}

	public void setRpa(Integer rpa) {
		this.rpa = rpa;
	}

	public void setCodMec(Integer codMec) {
		this.codMec = codMec;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumeroEnd() {
		return numeroEnd;
	}

	public void setNumeroEnd(String numeroEnd) {
		this.numeroEnd = numeroEnd;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getTelefone2() {
		return telefone2;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public String getRequerimentos() {
		return requerimentos;
	}

	public void setRequerimentos(String requerimentos) {
		this.requerimentos = requerimentos;
	}

	public Double getIdeb() {
		return ideb;
	}

	public void setIdeb(Double ideb) {
		this.ideb = ideb;
	}

	public Integer getRpa() {
		return rpa;
	}

	public Integer getCodMec() {
		return codMec;
	}

	public String getNova() {
		return nova;
	}

	public void setNova(String nova) {
		this.nova = nova;
	}

}
