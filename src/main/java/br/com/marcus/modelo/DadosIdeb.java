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
@Table(name = "dados_ideb")
public class DadosIdeb {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "esc_id", nullable = false)
	private Escola escola;

	@Column
	private Double did_ideb_2005_ini;

	@Column
	private Double did_ideb_2007_ini;

	@Column
	private Double did_ideb_2009_ini;

	@Column
	private Double did_ideb_2011_ini;

	@Column
	private Double did_ideb_2013_ini;

	@Column
	private Double did_ideb_2015_ini;

	@Column
	private Double did_ideb_2017_ini;

	@Column
	private Double did_ideb_2019_ini;

	@Column
	private Double did_ideb_2021_ini;
	
	@Column
	private Double did_ideb_2005_fin;

	@Column
	private Double did_ideb_2007_fin;

	@Column
	private Double did_ideb_2009_fin;

	@Column
	private Double did_ideb_2011_fin;

	@Column
	private Double did_ideb_2013_fin;

	@Column
	private Double did_ideb_2015_fin;

	@Column
	private Double did_ideb_2017_fin;

	@Column
	private Double did_ideb_2019_fin;

	@Column
	private Double did_ideb_2021_fin;
	
	@Column
	private Double did_meta_2005_ini;

	@Column
	private Double did_meta_2007_ini;

	@Column
	private Double did_meta_2009_ini;

	@Column
	private Double did_meta_2011_ini;

	@Column
	private Double did_meta_2013_ini;

	@Column
	private Double did_meta_2015_ini;

	@Column
	private Double did_meta_2017_ini;

	@Column
	private Double did_meta_2019_ini;

	@Column
	private Double did_meta_2021_ini;
	
	@Column
	private Double did_meta_2005_fin;

	@Column
	private Double did_meta_2007_fin;

	@Column
	private Double did_meta_2009_fin;

	@Column
	private Double did_meta_2011_fin;

	@Column
	private Double did_meta_2013_fin;
	
	@Column
	private Double did_meta_2015_fin;

	@Column
	private Double did_meta_2017_fin;

	@Column
	private Double did_meta_2019_fin;

	@Column
	private Double did_meta_2021_fin;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Escola getEscola() {
		return escola;
	}

	public void setEscola(Escola escola) {
		this.escola = escola;
	}

	public Double getDid_ideb_2005_ini() {
		return did_ideb_2005_ini;
	}

	public void setDid_ideb_2005_ini(Double did_ideb_2005_ini) {
		this.did_ideb_2005_ini = did_ideb_2005_ini;
	}

	public Double getDid_ideb_2007_ini() {
		return did_ideb_2007_ini;
	}

	public void setDid_ideb_2007_ini(Double did_ideb_2007_ini) {
		this.did_ideb_2007_ini = did_ideb_2007_ini;
	}

	public Double getDid_ideb_2009_ini() {
		return did_ideb_2009_ini;
	}

	public void setDid_ideb_2009_ini(Double did_ideb_2009_ini) {
		this.did_ideb_2009_ini = did_ideb_2009_ini;
	}

	public Double getDid_ideb_2011_ini() {
		return did_ideb_2011_ini;
	}

	public void setDid_ideb_2011_ini(Double did_ideb_2011_ini) {
		this.did_ideb_2011_ini = did_ideb_2011_ini;
	}

	public Double getDid_ideb_2013_ini() {
		return did_ideb_2013_ini;
	}

	public void setDid_ideb_2013_ini(Double did_ideb_2013_ini) {
		this.did_ideb_2013_ini = did_ideb_2013_ini;
	}

	public Double getDid_ideb_2005_fin() {
		return did_ideb_2005_fin;
	}

	public void setDid_ideb_2005_fin(Double did_ideb_2005_fin) {
		this.did_ideb_2005_fin = did_ideb_2005_fin;
	}

	public Double getDid_ideb_2007_fin() {
		return did_ideb_2007_fin;
	}

	public void setDid_ideb_2007_fin(Double did_ideb_2007_fin) {
		this.did_ideb_2007_fin = did_ideb_2007_fin;
	}

	public Double getDid_ideb_2009_fin() {
		return did_ideb_2009_fin;
	}

	public void setDid_ideb_2009_fin(Double did_ideb_2009_fin) {
		this.did_ideb_2009_fin = did_ideb_2009_fin;
	}

	public Double getDid_ideb_2011_fin() {
		return did_ideb_2011_fin;
	}

	public void setDid_ideb_2011_fin(Double did_ideb_2011_fin) {
		this.did_ideb_2011_fin = did_ideb_2011_fin;
	}

	public Double getDid_ideb_2013_fin() {
		return did_ideb_2013_fin;
	}

	public void setDid_ideb_2013_fin(Double did_ideb_2013_fin) {
		this.did_ideb_2013_fin = did_ideb_2013_fin;
	}

	public Double getDid_meta_2005_ini() {
		return did_meta_2005_ini;
	}

	public void setDid_meta_2005_ini(Double did_meta_2005_ini) {
		this.did_meta_2005_ini = did_meta_2005_ini;
	}

	public Double getDid_meta_2007_ini() {
		return did_meta_2007_ini;
	}

	public void setDid_meta_2007_ini(Double did_meta_2007_ini) {
		this.did_meta_2007_ini = did_meta_2007_ini;
	}

	public Double getDid_meta_2009_ini() {
		return did_meta_2009_ini;
	}

	public void setDid_meta_2009_ini(Double did_meta_2009_ini) {
		this.did_meta_2009_ini = did_meta_2009_ini;
	}

	public Double getDid_meta_2011_ini() {
		return did_meta_2011_ini;
	}

	public void setDid_meta_2011_ini(Double did_meta_2011_ini) {
		this.did_meta_2011_ini = did_meta_2011_ini;
	}

	public Double getDid_meta_2013_ini() {
		return did_meta_2013_ini;
	}

	public void setDid_meta_2013_ini(Double did_meta_2013_ini) {
		this.did_meta_2013_ini = did_meta_2013_ini;
	}

	public Double getDid_meta_2005_fin() {
		return did_meta_2005_fin;
	}

	public void setDid_meta_2005_fin(Double did_meta_2005_fin) {
		this.did_meta_2005_fin = did_meta_2005_fin;
	}

	public Double getDid_meta_2007_fin() {
		return did_meta_2007_fin;
	}

	public void setDid_meta_2007_fin(Double did_meta_2007_fin) {
		this.did_meta_2007_fin = did_meta_2007_fin;
	}

	public Double getDid_meta_2009_fin() {
		return did_meta_2009_fin;
	}

	public void setDid_meta_2009_fin(Double did_meta_2009_fin) {
		this.did_meta_2009_fin = did_meta_2009_fin;
	}

	public Double getDid_meta_2011_fin() {
		return did_meta_2011_fin;
	}

	public void setDid_meta_2011_fin(Double did_meta_2011_fin) {
		this.did_meta_2011_fin = did_meta_2011_fin;
	}

	public Double getDid_meta_2013_fin() {
		return did_meta_2013_fin;
	}

	public void setDid_meta_2013_fin(Double did_meta_2013_fin) {
		this.did_meta_2013_fin = did_meta_2013_fin;
	}

	public Double getDid_meta_2015_fin() {
		return did_meta_2015_fin;
	}

	public void setDid_meta_2015_fin(Double did_meta_2015_fin) {
		this.did_meta_2015_fin = did_meta_2015_fin;
	}

	public Double getDid_meta_2017_fin() {
		return did_meta_2017_fin;
	}

	public void setDid_meta_2017_fin(Double did_meta_2017_fin) {
		this.did_meta_2017_fin = did_meta_2017_fin;
	}

	public Double getDid_meta_2019_fin() {
		return did_meta_2019_fin;
	}

	public void setDid_meta_2019_fin(Double did_meta_2019_fin) {
		this.did_meta_2019_fin = did_meta_2019_fin;
	}

	public Double getDid_meta_2021_fin() {
		return did_meta_2021_fin;
	}

	public void setDid_meta_2021_fin(Double did_meta_2021_fin) {
		this.did_meta_2021_fin = did_meta_2021_fin;
	}

	public Double getDid_ideb_2015_ini() {
		return did_ideb_2015_ini;
	}

	public void setDid_ideb_2015_ini(Double did_ideb_2015_ini) {
		this.did_ideb_2015_ini = did_ideb_2015_ini;
	}

	public Double getDid_ideb_2017_ini() {
		return did_ideb_2017_ini;
	}

	public void setDid_ideb_2017_ini(Double did_ideb_2017_ini) {
		this.did_ideb_2017_ini = did_ideb_2017_ini;
	}

	public Double getDid_ideb_2019_ini() {
		return did_ideb_2019_ini;
	}

	public void setDid_ideb_2019_ini(Double did_ideb_2019_ini) {
		this.did_ideb_2019_ini = did_ideb_2019_ini;
	}

	public Double getDid_ideb_2021_ini() {
		return did_ideb_2021_ini;
	}

	public void setDid_ideb_2021_ini(Double did_ideb_2021_ini) {
		this.did_ideb_2021_ini = did_ideb_2021_ini;
	}

	public Double getDid_ideb_2015_fin() {
		return did_ideb_2015_fin;
	}

	public void setDid_ideb_2015_fin(Double did_ideb_2015_fin) {
		this.did_ideb_2015_fin = did_ideb_2015_fin;
	}

	public Double getDid_ideb_2017_fin() {
		return did_ideb_2017_fin;
	}

	public void setDid_ideb_2017_fin(Double did_ideb_2017_fin) {
		this.did_ideb_2017_fin = did_ideb_2017_fin;
	}

	public Double getDid_ideb_2019_fin() {
		return did_ideb_2019_fin;
	}

	public void setDid_ideb_2019_fin(Double did_ideb_2019_fin) {
		this.did_ideb_2019_fin = did_ideb_2019_fin;
	}

	public Double getDid_ideb_2021_fin() {
		return did_ideb_2021_fin;
	}

	public void setDid_ideb_2021_fin(Double did_ideb_2021_fin) {
		this.did_ideb_2021_fin = did_ideb_2021_fin;
	}

	public Double getDid_meta_2015_ini() {
		return did_meta_2015_ini;
	}

	public void setDid_meta_2015_ini(Double did_meta_2015_ini) {
		this.did_meta_2015_ini = did_meta_2015_ini;
	}

	public Double getDid_meta_2017_ini() {
		return did_meta_2017_ini;
	}

	public void setDid_meta_2017_ini(Double did_meta_2017_ini) {
		this.did_meta_2017_ini = did_meta_2017_ini;
	}

	public Double getDid_meta_2019_ini() {
		return did_meta_2019_ini;
	}

	public void setDid_meta_2019_ini(Double did_meta_2019_ini) {
		this.did_meta_2019_ini = did_meta_2019_ini;
	}

	public Double getDid_meta_2021_ini() {
		return did_meta_2021_ini;
	}

	public void setDid_meta_2021_ini(Double did_meta_2021_ini) {
		this.did_meta_2021_ini = did_meta_2021_ini;
	}
}