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
@Table(name = "medicao_creche")
public class MedicaoCreche {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "vis_id", nullable = false)
	private VistoriaCreche vistoriaCreche;

	@Column
	private Double temperatura;
	
	@Column
	private Long luminosidade;
	
	@Column
	private String ambiente;
	
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

	public Double getTemperatura() {
		return temperatura;
	}

	public void setTemperatura(Double temperatura) {
		this.temperatura = temperatura;
	}

	public Long getLuminosidade() {
		return luminosidade;
	}

	public void setLuminosidade(Long luminosidade) {
		this.luminosidade = luminosidade;
	}

	public String getAmbiente() {
		return ambiente;
	}

	public void setAmbiente(String ambiente) {
		this.ambiente = ambiente;
	}

}