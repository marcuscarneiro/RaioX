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
@Table(name = "prova_brasil")
public class ProvaBrasil {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "esc_id", nullable = false)
	private Escola escola;
	
	@Column
	private Integer porc_2007_lp_5;
	
	@Column
	private Integer porc_2007_lp_9;
	
	@Column
	private Integer porc_2007_mt_5;
	
	@Column
	private Integer porc_2007_mt_9;
	
	@Column
	private Integer porc_2009_lp_5;
	
	@Column
	private Integer porc_2009_mt_5;
	
	@Column
	private Integer porc_2009_lp_9;
	
	@Column
	private Integer porc_2009_mt_9;
	
	@Column
	private Integer porc_2011_lp_5;
	
	@Column
	private Integer porc_2011_mt_5;
	
	@Column
	private Integer porc_2011_lp_9;
	
	@Column
	private Integer porc_2011_mt_9;

	@Column
	private Integer porc_2013_lp_5;
	
	@Column
	private Integer porc_2013_mt_5;
	
	@Column
	private Integer porc_2013_lp_9;
	
	@Column
	private Integer porc_2013_mt_9;
	
	@Column
	private Integer porc_2015_lp_5;
	
	@Column
	private Integer porc_2015_mt_5;
	
	@Column
	private Integer porc_2015_lp_9;
	
	@Column
	private Integer porc_2015_mt_9;
	
	@Column
	private Integer porc_2017_lp_5;
	
	@Column
	private Integer porc_2017_mt_5;
	
	@Column
	private Integer porc_2017_lp_9;
	
	@Column
	private Integer porc_2017_mt_9;
	
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

	public Integer getPorc_2007_lp_5() {
		return porc_2007_lp_5;
	}

	public void setPorc_2007_lp_5(Integer porc_2007_lp_5) {
		this.porc_2007_lp_5 = porc_2007_lp_5;
	}

	public Integer getPorc_2007_lp_9() {
		return porc_2007_lp_9;
	}

	public void setPorc_2007_lp_9(Integer porc_2007_lp_9) {
		this.porc_2007_lp_9 = porc_2007_lp_9;
	}

	public Integer getPorc_2007_mt_5() {
		return porc_2007_mt_5;
	}

	public void setPorc_2007_mt_5(Integer porc_2007_mt_5) {
		this.porc_2007_mt_5 = porc_2007_mt_5;
	}

	public Integer getPorc_2007_mt_9() {
		return porc_2007_mt_9;
	}

	public void setPorc_2007_mt_9(Integer porc_2007_mt_9) {
		this.porc_2007_mt_9 = porc_2007_mt_9;
	}

	public Integer getPorc_2009_lp_5() {
		return porc_2009_lp_5;
	}

	public void setPorc_2009_lp_5(Integer porc_2009_lp_5) {
		this.porc_2009_lp_5 = porc_2009_lp_5;
	}

	public Integer getPorc_2009_mt_5() {
		return porc_2009_mt_5;
	}

	public void setPorc_2009_mt_5(Integer porc_2009_mt_5) {
		this.porc_2009_mt_5 = porc_2009_mt_5;
	}

	public Integer getPorc_2009_lp_9() {
		return porc_2009_lp_9;
	}

	public void setPorc_2009_lp_9(Integer porc_2009_lp_9) {
		this.porc_2009_lp_9 = porc_2009_lp_9;
	}

	public Integer getPorc_2009_mt_9() {
		return porc_2009_mt_9;
	}

	public void setPorc_2009_mt_9(Integer porc_2009_mt_9) {
		this.porc_2009_mt_9 = porc_2009_mt_9;
	}

	public Integer getPorc_2011_lp_5() {
		return porc_2011_lp_5;
	}

	public void setPorc_2011_lp_5(Integer porc_2011_lp_5) {
		this.porc_2011_lp_5 = porc_2011_lp_5;
	}

	public Integer getPorc_2011_mt_5() {
		return porc_2011_mt_5;
	}

	public void setPorc_2011_mt_5(Integer porc_2011_mt_5) {
		this.porc_2011_mt_5 = porc_2011_mt_5;
	}

	public Integer getPorc_2011_lp_9() {
		return porc_2011_lp_9;
	}

	public void setPorc_2011_lp_9(Integer porc_2011_lp_9) {
		this.porc_2011_lp_9 = porc_2011_lp_9;
	}

	public Integer getPorc_2011_mt_9() {
		return porc_2011_mt_9;
	}

	public void setPorc_2011_mt_9(Integer porc_2011_mt_9) {
		this.porc_2011_mt_9 = porc_2011_mt_9;
	}

	public Integer getPorc_2013_lp_5() {
		return porc_2013_lp_5;
	}

	public void setPorc_2013_lp_5(Integer porc_2013_lp_5) {
		this.porc_2013_lp_5 = porc_2013_lp_5;
	}

	public Integer getPorc_2013_mt_5() {
		return porc_2013_mt_5;
	}

	public void setPorc_2013_mt_5(Integer porc_2013_mt_5) {
		this.porc_2013_mt_5 = porc_2013_mt_5;
	}

	public Integer getPorc_2013_lp_9() {
		return porc_2013_lp_9;
	}

	public void setPorc_2013_lp_9(Integer porc_2013_lp_9) {
		this.porc_2013_lp_9 = porc_2013_lp_9;
	}

	public Integer getPorc_2013_mt_9() {
		return porc_2013_mt_9;
	}

	public void setPorc_2013_mt_9(Integer porc_2013_mt_9) {
		this.porc_2013_mt_9 = porc_2013_mt_9;
	}

	public Integer getPorc_2015_lp_5() {
		return porc_2015_lp_5;
	}

	public void setPorc_2015_lp_5(Integer porc_2015_lp_5) {
		this.porc_2015_lp_5 = porc_2015_lp_5;
	}

	public Integer getPorc_2015_mt_5() {
		return porc_2015_mt_5;
	}

	public void setPorc_2015_mt_5(Integer porc_2015_mt_5) {
		this.porc_2015_mt_5 = porc_2015_mt_5;
	}

	public Integer getPorc_2015_lp_9() {
		return porc_2015_lp_9;
	}

	public void setPorc_2015_lp_9(Integer porc_2015_lp_9) {
		this.porc_2015_lp_9 = porc_2015_lp_9;
	}

	public Integer getPorc_2015_mt_9() {
		return porc_2015_mt_9;
	}

	public void setPorc_2015_mt_9(Integer porc_2015_mt_9) {
		this.porc_2015_mt_9 = porc_2015_mt_9;
	}

	public Integer getPorc_2017_lp_5() {
		return porc_2017_lp_5;
	}

	public void setPorc_2017_lp_5(Integer porc_2017_lp_5) {
		this.porc_2017_lp_5 = porc_2017_lp_5;
	}

	public Integer getPorc_2017_mt_5() {
		return porc_2017_mt_5;
	}

	public void setPorc_2017_mt_5(Integer porc_2017_mt_5) {
		this.porc_2017_mt_5 = porc_2017_mt_5;
	}

	public Integer getPorc_2017_lp_9() {
		return porc_2017_lp_9;
	}

	public void setPorc_2017_lp_9(Integer porc_2017_lp_9) {
		this.porc_2017_lp_9 = porc_2017_lp_9;
	}

	public Integer getPorc_2017_mt_9() {
		return porc_2017_mt_9;
	}

	public void setPorc_2017_mt_9(Integer porc_2017_mt_9) {
		this.porc_2017_mt_9 = porc_2017_mt_9;
	}
}