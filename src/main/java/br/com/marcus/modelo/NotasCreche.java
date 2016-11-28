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
@Table(name = "notas_creche")
public class NotasCreche {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "cre_id", nullable = false)
	private Creche creche;

	@Column
	private Double geral;

	@Column
	private Double sala;

	@Column
	private Double bercario;

	@Column
	private Double banheiros;

	@Column
	private Double espacosAlternativos;

	@Column
	private Double acessibilidade;

	@Column
	private Double servicosEssenciais;

	@Column
	private Double materiais;

	@Column
	private Double alimentacao;
	
	@Column
	private Double lavanderia;

	@Column
	private Double saude;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Creche getCreche() {
		return creche;
	}

	public void setCreche(Creche creche) {
		this.creche = creche;
	}

	public Double getGeral() {
		return geral;
	}

	public void setGeral(Double geral) {
		this.geral = geral;
	}

	public Double getSala() {
		return sala;
	}

	public void setSala(Double sala) {
		this.sala = sala;
	}

	public Double getBercario() {
		return bercario;
	}

	public void setBercario(Double bercario) {
		this.bercario = bercario;
	}

	public Double getBanheiros() {
		return banheiros;
	}

	public void setBanheiros(Double banheiros) {
		this.banheiros = banheiros;
	}

	public Double getEspacosAlternativos() {
		return espacosAlternativos;
	}

	public void setEspacosAlternativos(Double espacosAlternativos) {
		this.espacosAlternativos = espacosAlternativos;
	}

	public Double getAcessibilidade() {
		return acessibilidade;
	}

	public void setAcessibilidade(Double acessibilidade) {
		this.acessibilidade = acessibilidade;
	}

	public Double getServicosEssenciais() {
		return servicosEssenciais;
	}

	public void setServicosEssenciais(Double servicosEssenciais) {
		this.servicosEssenciais = servicosEssenciais;
	}

	public Double getMateriais() {
		return materiais;
	}

	public void setMateriais(Double materiais) {
		this.materiais = materiais;
	}

	public Double getAlimentacao() {
		return alimentacao;
	}

	public void setAlimentacao(Double alimentacao) {
		this.alimentacao = alimentacao;
	}

	public Double getLavanderia() {
		return lavanderia;
	}

	public void setLavanderia(Double lavanderia) {
		this.lavanderia = lavanderia;
	}

	public Double getSaude() {
		return saude;
	}

	public void setSaude(Double saude) {
		this.saude = saude;
	}

	
}