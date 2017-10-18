package br.com.marcus.modelo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "visita")
public class Visita {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column
	private String responsavel;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd-MM-yyyy")
	@Column(name = "data_visita", nullable = false)
	private Date data;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "esc_id", nullable = false)
	private Escola escola;

	@Column
	private String atualizacao;
	
	@Column
	private String pesquisaCompleta;
	
	@Column
	private String rpa;

	@Column
	private String relatorio;
	
	@Column
	private String sa1;

	@Column
	private String sa2;

	@Column
	private String sa3;

	@Column
	private String sa4a;

	@Column
	private String sa4b;

	@Column
	private String sa5a;

	@Column
	private String sa5b;

	@Column
	private String sa6;

	@Column
	private String sa7;

	@Column
	private String sa8;

	@Column
	private String sa9;

	@Column
	private String sa10;

	@Column
	private String anotacoes1;

	@Column
	private String bib1;

	@Column
	private String bib2;

	@Column
	private String bib3;

	@Column
	private String bib4;

	@Column
	private String bib5;

	@Column
	private String bib6;

	@Column
	private String bib7;

	@Column
	private String bib8;

	@Column
	private String bib9;

	@Column
	private String bib10;

	@Column
	private String bib11;

	@Column
	private String bib12;

	@Column
	private String bib13;

	@Column
	private String anotacoes2;

	@Column
	private String inf1;

	@Column
	private String inf2;

	@Column
	private String inf3;

	@Column
	private String inf4;

	@Column
	private String inf5;

	@Column
	private String inf6;

	@Column
	private String inf7;

	@Column
	private String inf8;

	@Column
	private String inf9;

	@Column
	private String inf10;

	@Column
	private String anotacoes3;

	@Column
	private String et1;

	@Column
	private String et2;

	@Column
	private String et3;

	@Column
	private String et4;

	@Column
	private String et5;

	@Column
	private String et6;

	@Column
	private String et7;

	@Column
	private String et8;

	@Column
	private String et9;

	@Column
	private String et10;

	@Column
	private String anotacoes4;
	
	@Column
	private String rl1;

	@Column
	private String rl2;

	@Column
	private String rl3;

	@Column
	private String rl4;

	@Column
	private String rl5;

	@Column
	private String rl6;

	@Column
	private String anotacoes5;

	@Column
	private String ace1;

	@Column
	private String ace2;

	@Column
	private String ace3;

	@Column
	private String ace4;

	@Column
	private String ace5;

	@Column
	private String ace6;

	@Column
	private String ace7;

	@Column
	private String ace8;

	@Column
	private String ace9;

	@Column
	private String ace10;

	@Column
	private String anotacoes6;

	@Column
	private String se1;

	@Column
	private String se2;

	@Column
	private String se3;

	@Column
	private String se4;

	@Column
	private String se5;

	@Column
	private String se6;

	@Column
	private String se7;

	@Column
	private String anotacoes7;

	@Column
	private String sp1;

	@Column
	private String sp2;

	@Column
	private String sp3;

	@Column
	private String sp4;

	@Column
	private String sp5;

	@Column
	private String sp6;

	@Column
	private String sp7;

	@Column
	private String sp8;

	@Column
	private String sp9;

	@Column
	private String anotacoes8;

	@Column
	private String adm1;

	@Column
	private String adm2;

	@Column
	private String adm3;

	@Column
	private String adm4;

	@Column
	private String adm5;

	@Column
	private String adm6;

	@Column
	private String adm7;

	@Column
	private String adm8;

	@Column
	private String adm9;

	@Column
	private String adm10;

	@Column
	private String adm10a;

	@Column
	private String adm10b;

	@Column
	private String adm10c;

	@Column
	private String adm11;

	@Column
	private String adm11a;

	@Column
	private String adm11b;

	@Column
	private String adm11c;

	@Column
	private String adm12;

	@Column
	private String adm13;

	@Column
	private String anotacoes9;

	@Column
	private String alim1;

	@Column
	private String alim2;

	@Column
	private String alim3;

	@Column
	private String alim4;

	@Column
	private String alim5;

	@Column
	private String alim6;

	@Column
	private String alim7;

	@Column
	private String alim8;

	@Column
	private String alim9;

	@Column
	private String alim10;

	@Column
	private String alim11;

	@Column
	private String alim12;

	@Column
	private String anotacoes10;

	@Column
	private String mdf1;

	@Column
	private String mdf2a;

	@Column
	private String mdf2b;

	@Column
	private String mdf3;

	@Column
	private String mdf4;

	@Column
	private String mdf5;

	@Column
	private String mdf6;

	@Column
	private String mdf7;

	@Column
	private String mdf8;

	@Column
	private String mdf9;

	@Column
	private String mdf10;

	@Column
	private String mdf11;

	@Column
	private String mdf12;

	@Column
	private String mdf12a;
	
	@Column
	private String anotacoes11;

	@Column
	private String endereco;

	@Column
	private String gestor;

	@Column
	private String idebVisivel;

	@Column
	private String situacao;

	@Column
	private String turnoVisita;

	@Column
	private String chuva;

	@Column
	private String problemasChuva;

	@Column
	private String eee1a;

	@Column
	private String eee1b;

	@Column
	private String eee1c;

	@Column
	private String eee1d;

	@Column
	private String eee1e;

	@Column
	private String eee1f;

	@Column
	private String eee1g;

	@Column
	private String eee1h;

	@Column
	private String eee1i;

	@Column
	private String eee2;

	@Column
	private String eee3;

	@Column
	private String eee4;

	@Column
	private String eee5;

	@Column
	private String eee6;

	@Column
	private String eee7;

	@Column
	private String eee8;

	@Column
	private String eee9;

	@Column
	private String anotacoes1a;

	@Column
	private String eac1;

	@Column
	private String eac2;

	@Column
	private String eac3a;

	@Column
	private String eac3b;

	@Column
	private String eac3c;

	@Column
	private String eac3d;

	@Column
	private String anotacoes6a;

	@Column
	private String eef1;

	@Column
	private String eef2;

	@Column
	private String eef3;

	@Column
	private String eef3a;

	@Column
	private String eef4;

	@Column
	private String eef4a;

	@Column
	private String eef5;

	@Column
	private String eef6;

	@Column
	private String eef7;

	@Column
	private String eef7a;

	@Column
	private String eef8;

	@Column
	private String eef9;

	@Column
	private String eef10;

	@Column
	private String eef10a;

	@Column
	private String eef10b;

	@Column
	private String eef11;

	@Column
	private String eef12;

	@Column
	private String eef13;

	@Column
	private String eef14;

	@Column
	private String eef15;

	@Column
	private String eef16;

	@Column
	private String eef17;

	@Column
	private String anotacoes7a;

	@Column
	private String em1;

	@Column
	private String em2;

	@Column
	private String em3;

	@Column
	private String em3a;

	@Column
	private String em4;

	@Column
	private String anotacoes10a;

	@Column
	private String edfs1;

	@Column
	private String edfs2;

	@Column
	private String edfs3;

	@Column
	private String edfs4;

	@Column
	private String edfs4o;

	@Column
	private String edfs5;

	@Column
	private String edfs5o;

	@Column
	private String edfs6;

	@Column
	private String edfs6o;

	@Column
	private String edfs7;

	@Column
	private String edfs7o;

	@Column
	private String edfs7a;

	@Column
	private String edfs7b;

	@Column
	private String edfs8;

	@Column
	private String edfs8o;

	@Column
	private String edfs9;

	@Column
	private String edfs10;

	@Column
	private String edfs11;

	@Column
	private String edfs12;

	@Column
	private String edfs13;

	@Column
	private String edfs13o;

	@Column
	private String edfs14;

	@Column
	private String edfs14o;

	@Column
	private String edfs15;

	@Column
	private String edfs15o;

	@Column
	private String edfs16;

	@Column
	private String edfs16o;

	@Column
	private String edfs17;

	@Column
	private String edfs17o;

	@Column
	private String edfs18a;

	@Column
	private String edfs18b;

	@Column
	private String edfs18c;

	@Column
	private String edfs18d;

	@Column
	private String edfs18e;

	@Column
	private String edfs18f;

	@Column
	private String edfs18g;
	
	@Column
	private String anotacoes11a;

	@Column
	private String pub;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Escola getEscola() {
		return escola;
	}

	public void setEscola(Escola escola) {
		this.escola = escola;
	}

	public String getAtualizacao() {
		return atualizacao;
	}

	public void setAtualizacao(String atualizacao) {
		this.atualizacao = atualizacao;
	}

	public String getPesquisaCompleta() {
		return pesquisaCompleta;
	}

	public void setPesquisaCompleta(String pesquisaCompleta) {
		this.pesquisaCompleta = pesquisaCompleta;
	}

	public String getRpa() {
		return rpa;
	}

	public void setRpa(String rpa) {
		this.rpa = rpa;
	}

	public String getRelatorio() {
		return relatorio;
	}

	public void setRelatorio(String relatorio) {
		this.relatorio = relatorio;
	}

	public String getSa1() {
		return sa1;
	}

	public void setSa1(String sa1) {
		this.sa1 = sa1;
	}

	public String getSa2() {
		return sa2;
	}

	public void setSa2(String sa2) {
		this.sa2 = sa2;
	}

	public String getSa3() {
		return sa3;
	}

	public void setSa3(String sa3) {
		this.sa3 = sa3;
	}

	public String getSa4a() {
		return sa4a;
	}

	public void setSa4a(String sa4a) {
		this.sa4a = sa4a;
	}

	public String getSa4b() {
		return sa4b;
	}

	public void setSa4b(String sa4b) {
		this.sa4b = sa4b;
	}

	public String getSa5a() {
		return sa5a;
	}

	public void setSa5a(String sa5a) {
		this.sa5a = sa5a;
	}

	public String getSa5b() {
		return sa5b;
	}

	public void setSa5b(String sa5b) {
		this.sa5b = sa5b;
	}

	public String getSa6() {
		return sa6;
	}

	public void setSa6(String sa6) {
		this.sa6 = sa6;
	}

	public String getSa7() {
		return sa7;
	}

	public void setSa7(String sa7) {
		this.sa7 = sa7;
	}

	public String getSa8() {
		return sa8;
	}

	public void setSa8(String sa8) {
		this.sa8 = sa8;
	}

	public String getSa9() {
		return sa9;
	}

	public void setSa9(String sa9) {
		this.sa9 = sa9;
	}

	public String getSa10() {
		return sa10;
	}

	public void setSa10(String sa10) {
		this.sa10 = sa10;
	}

	public String getAnotacoes1() {
		return anotacoes1;
	}

	public void setAnotacoes1(String anotacoes1) {
		this.anotacoes1 = anotacoes1;
	}

	public String getBib1() {
		return bib1;
	}

	public void setBib1(String bib1) {
		this.bib1 = bib1;
	}

	public String getBib2() {
		return bib2;
	}

	public void setBib2(String bib2) {
		this.bib2 = bib2;
	}

	public String getBib3() {
		return bib3;
	}

	public void setBib3(String bib3) {
		this.bib3 = bib3;
	}

	public String getBib4() {
		return bib4;
	}

	public void setBib4(String bib4) {
		this.bib4 = bib4;
	}

	public String getBib5() {
		return bib5;
	}

	public void setBib5(String bib5) {
		this.bib5 = bib5;
	}

	public String getBib6() {
		return bib6;
	}

	public void setBib6(String bib6) {
		this.bib6 = bib6;
	}

	public String getBib7() {
		return bib7;
	}

	public void setBib7(String bib7) {
		this.bib7 = bib7;
	}

	public String getBib8() {
		return bib8;
	}

	public void setBib8(String bib8) {
		this.bib8 = bib8;
	}

	public String getBib9() {
		return bib9;
	}

	public void setBib9(String bib9) {
		this.bib9 = bib9;
	}

	public String getBib10() {
		return bib10;
	}

	public void setBib10(String bib10) {
		this.bib10 = bib10;
	}

	public String getBib11() {
		return bib11;
	}

	public void setBib11(String bib11) {
		this.bib11 = bib11;
	}

	public String getBib12() {
		return bib12;
	}

	public void setBib12(String bib12) {
		this.bib12 = bib12;
	}

	public String getBib13() {
		return bib13;
	}

	public void setBib13(String bib13) {
		this.bib13 = bib13;
	}


	public String getAnotacoes2() {
		return anotacoes2;
	}

	public void setAnotacoes2(String anotacoes2) {
		this.anotacoes2 = anotacoes2;
	}

	public String getInf1() {
		return inf1;
	}

	public void setInf1(String inf1) {
		this.inf1 = inf1;
	}

	public String getInf2() {
		return inf2;
	}

	public void setInf2(String inf2) {
		this.inf2 = inf2;
	}

	public String getInf3() {
		return inf3;
	}

	public void setInf3(String inf3) {
		this.inf3 = inf3;
	}

	public String getInf4() {
		return inf4;
	}

	public void setInf4(String inf4) {
		this.inf4 = inf4;
	}

	public String getInf5() {
		return inf5;
	}

	public void setInf5(String inf5) {
		this.inf5 = inf5;
	}

	public String getInf6() {
		return inf6;
	}

	public void setInf6(String inf6) {
		this.inf6 = inf6;
	}

	public String getInf7() {
		return inf7;
	}

	public void setInf7(String inf7) {
		this.inf7 = inf7;
	}

	public String getInf8() {
		return inf8;
	}

	public void setInf8(String inf8) {
		this.inf8 = inf8;
	}

	public String getInf9() {
		return inf9;
	}

	public void setInf9(String inf9) {
		this.inf9 = inf9;
	}

	public String getInf10() {
		return inf10;
	}

	public void setInf10(String inf10) {
		this.inf10 = inf10;
	}

	public String getAnotacoes3() {
		return anotacoes3;
	}

	public void setAnotacoes3(String anotacoes3) {
		this.anotacoes3 = anotacoes3;
	}

	public String getEt1() {
		return et1;
	}

	public void setEt1(String et1) {
		this.et1 = et1;
	}

	public String getEt2() {
		return et2;
	}

	public void setEt2(String et2) {
		this.et2 = et2;
	}

	public String getEt3() {
		return et3;
	}

	public void setEt3(String et3) {
		this.et3 = et3;
	}

	public String getEt4() {
		return et4;
	}

	public void setEt4(String et4) {
		this.et4 = et4;
	}

	public String getEt5() {
		return et5;
	}

	public void setEt5(String et5) {
		this.et5 = et5;
	}

	public String getEt6() {
		return et6;
	}

	public void setEt6(String et6) {
		this.et6 = et6;
	}

	public String getEt7() {
		return et7;
	}

	public void setEt7(String et7) {
		this.et7 = et7;
	}

	public String getEt8() {
		return et8;
	}

	public void setEt8(String et8) {
		this.et8 = et8;
	}

	public String getEt9() {
		return et9;
	}

	public void setEt9(String et9) {
		this.et9 = et9;
	}

	public String getEt10() {
		return et10;
	}

	public void setEt10(String et10) {
		this.et10 = et10;
	}

	public String getAnotacoes4() {
		return anotacoes4;
	}

	public void setAnotacoes4(String anotacoes4) {
		this.anotacoes4 = anotacoes4;
	}

	public String getRl1() {
		return rl1;
	}

	public void setRl1(String rl1) {
		this.rl1 = rl1;
	}

	public String getRl2() {
		return rl2;
	}

	public void setRl2(String rl2) {
		this.rl2 = rl2;
	}

	public String getRl3() {
		return rl3;
	}

	public void setRl3(String rl3) {
		this.rl3 = rl3;
	}

	public String getRl4() {
		return rl4;
	}

	public void setRl4(String rl4) {
		this.rl4 = rl4;
	}

	public String getRl5() {
		return rl5;
	}

	public void setRl5(String rl5) {
		this.rl5 = rl5;
	}

	public String getRl6() {
		return rl6;
	}

	public void setRl6(String rl6) {
		this.rl6 = rl6;
	}

	public String getAnotacoes5() {
		return anotacoes5;
	}

	public void setAnotacoes5(String anotacoes5) {
		this.anotacoes5 = anotacoes5;
	}

	public String getAce1() {
		return ace1;
	}

	public void setAce1(String ace1) {
		this.ace1 = ace1;
	}

	public String getAce2() {
		return ace2;
	}

	public void setAce2(String ace2) {
		this.ace2 = ace2;
	}

	public String getAce3() {
		return ace3;
	}

	public void setAce3(String ace3) {
		this.ace3 = ace3;
	}

	public String getAce4() {
		return ace4;
	}

	public void setAce4(String ace4) {
		this.ace4 = ace4;
	}

	public String getAce5() {
		return ace5;
	}

	public void setAce5(String ace5) {
		this.ace5 = ace5;
	}

	public String getAce6() {
		return ace6;
	}

	public void setAce6(String ace6) {
		this.ace6 = ace6;
	}

	public String getAce7() {
		return ace7;
	}

	public void setAce7(String ace7) {
		this.ace7 = ace7;
	}

	public String getAce8() {
		return ace8;
	}

	public void setAce8(String ace8) {
		this.ace8 = ace8;
	}

	public String getAce9() {
		return ace9;
	}

	public void setAce9(String ace9) {
		this.ace9 = ace9;
	}

	public String getAce10() {
		return ace10;
	}

	public void setAce10(String ace10) {
		this.ace10 = ace10;
	}

	public String getAnotacoes6() {
		return anotacoes6;
	}

	public void setAnotacoes6(String anotacoes6) {
		this.anotacoes6 = anotacoes6;
	}

	public String getSe1() {
		return se1;
	}

	public void setSe1(String se1) {
		this.se1 = se1;
	}

	public String getSe2() {
		return se2;
	}

	public void setSe2(String se2) {
		this.se2 = se2;
	}

	public String getSe3() {
		return se3;
	}

	public void setSe3(String se3) {
		this.se3 = se3;
	}

	public String getSe4() {
		return se4;
	}

	public void setSe4(String se4) {
		this.se4 = se4;
	}

	public String getSe5() {
		return se5;
	}

	public void setSe5(String se5) {
		this.se5 = se5;
	}

	public String getSe6() {
		return se6;
	}

	public void setSe6(String se6) {
		this.se6 = se6;
	}

	public String getSe7() {
		return se7;
	}

	public void setSe7(String se7) {
		this.se7 = se7;
	}

	public String getAnotacoes7() {
		return anotacoes7;
	}

	public void setAnotacoes7(String anotacoes7) {
		this.anotacoes7 = anotacoes7;
	}

	public String getSp1() {
		return sp1;
	}

	public void setSp1(String sp1) {
		this.sp1 = sp1;
	}

	public String getSp2() {
		return sp2;
	}

	public void setSp2(String sp2) {
		this.sp2 = sp2;
	}

	public String getSp3() {
		return sp3;
	}

	public void setSp3(String sp3) {
		this.sp3 = sp3;
	}

	public String getSp4() {
		return sp4;
	}

	public void setSp4(String sp4) {
		this.sp4 = sp4;
	}

	public String getSp5() {
		return sp5;
	}

	public void setSp5(String sp5) {
		this.sp5 = sp5;
	}

	public String getSp6() {
		return sp6;
	}

	public void setSp6(String sp6) {
		this.sp6 = sp6;
	}

	public String getSp7() {
		return sp7;
	}

	public void setSp7(String sp7) {
		this.sp7 = sp7;
	}

	public String getSp8() {
		return sp8;
	}

	public void setSp8(String sp8) {
		this.sp8 = sp8;
	}

	public String getSp9() {
		return sp9;
	}

	public void setSp9(String sp9) {
		this.sp9 = sp9;
	}

	public String getAnotacoes8() {
		return anotacoes8;
	}

	public void setAnotacoes8(String anotacoes8) {
		this.anotacoes8 = anotacoes8;
	}

	public String getAdm1() {
		return adm1;
	}

	public void setAdm1(String adm1) {
		this.adm1 = adm1;
	}

	public String getAdm2() {
		return adm2;
	}

	public void setAdm2(String adm2) {
		this.adm2 = adm2;
	}

	public String getAdm3() {
		return adm3;
	}

	public void setAdm3(String adm3) {
		this.adm3 = adm3;
	}

	public String getAdm4() {
		return adm4;
	}

	public void setAdm4(String adm4) {
		this.adm4 = adm4;
	}

	public String getAdm5() {
		return adm5;
	}

	public void setAdm5(String adm5) {
		this.adm5 = adm5;
	}

	public String getAdm6() {
		return adm6;
	}

	public void setAdm6(String adm6) {
		this.adm6 = adm6;
	}

	public String getAdm7() {
		return adm7;
	}

	public void setAdm7(String adm7) {
		this.adm7 = adm7;
	}

	public String getAdm8() {
		return adm8;
	}

	public void setAdm8(String adm8) {
		this.adm8 = adm8;
	}

	public String getAdm9() {
		return adm9;
	}

	public void setAdm9(String adm9) {
		this.adm9 = adm9;
	}

	public String getAdm10() {
		return adm10;
	}

	public void setAdm10(String adm10) {
		this.adm10 = adm10;
	}

	public String getAdm10a() {
		return adm10a;
	}

	public void setAdm10a(String adm10a) {
		this.adm10a = adm10a;
	}

	public String getAdm10b() {
		return adm10b;
	}

	public void setAdm10b(String adm10b) {
		this.adm10b = adm10b;
	}

	public String getAdm10c() {
		return adm10c;
	}

	public void setAdm10c(String adm10c) {
		this.adm10c = adm10c;
	}

	public String getAdm11() {
		return adm11;
	}

	public void setAdm11(String adm11) {
		this.adm11 = adm11;
	}

	public String getAdm11a() {
		return adm11a;
	}

	public void setAdm11a(String adm11a) {
		this.adm11a = adm11a;
	}

	public String getAdm11b() {
		return adm11b;
	}

	public void setAdm11b(String adm11b) {
		this.adm11b = adm11b;
	}

	public String getAdm11c() {
		return adm11c;
	}

	public void setAdm11c(String adm11c) {
		this.adm11c = adm11c;
	}

	public String getAdm12() {
		return adm12;
	}

	public void setAdm12(String adm12) {
		this.adm12 = adm12;
	}

	public String getAdm13() {
		return adm13;
	}

	public void setAdm13(String adm13) {
		this.adm13 = adm13;
	}

	public String getAnotacoes9() {
		return anotacoes9;
	}

	public void setAnotacoes9(String anotacoes9) {
		this.anotacoes9 = anotacoes9;
	}

	public String getAlim1() {
		return alim1;
	}

	public void setAlim1(String alim1) {
		this.alim1 = alim1;
	}

	public String getAlim2() {
		return alim2;
	}

	public void setAlim2(String alim2) {
		this.alim2 = alim2;
	}

	public String getAlim3() {
		return alim3;
	}

	public void setAlim3(String alim3) {
		this.alim3 = alim3;
	}

	public String getAlim4() {
		return alim4;
	}

	public void setAlim4(String alim4) {
		this.alim4 = alim4;
	}

	public String getAlim5() {
		return alim5;
	}

	public void setAlim5(String alim5) {
		this.alim5 = alim5;
	}

	public String getAlim6() {
		return alim6;
	}

	public void setAlim6(String alim6) {
		this.alim6 = alim6;
	}

	public String getAlim7() {
		return alim7;
	}

	public void setAlim7(String alim7) {
		this.alim7 = alim7;
	}

	public String getAlim8() {
		return alim8;
	}

	public void setAlim8(String alim8) {
		this.alim8 = alim8;
	}

	public String getAlim9() {
		return alim9;
	}

	public void setAlim9(String alim9) {
		this.alim9 = alim9;
	}

	public String getAlim10() {
		return alim10;
	}

	public void setAlim10(String alim10) {
		this.alim10 = alim10;
	}

	public String getAlim11() {
		return alim11;
	}

	public void setAlim11(String alim11) {
		this.alim11 = alim11;
	}

	public String getAlim12() {
		return alim12;
	}

	public void setAlim12(String alim12) {
		this.alim12 = alim12;
	}

	public String getAnotacoes10() {
		return anotacoes10;
	}

	public void setAnotacoes10(String anotacoes10) {
		this.anotacoes10 = anotacoes10;
	}

	public String getMdf1() {
		return mdf1;
	}

	public void setMdf1(String mdf1) {
		this.mdf1 = mdf1;
	}

	public String getMdf2a() {
		return mdf2a;
	}

	public void setMdf2a(String mdf2a) {
		this.mdf2a = mdf2a;
	}

	public String getMdf2b() {
		return mdf2b;
	}

	public void setMdf2b(String mdf2b) {
		this.mdf2b = mdf2b;
	}

	public String getMdf3() {
		return mdf3;
	}

	public void setMdf3(String mdf3) {
		this.mdf3 = mdf3;
	}

	public String getMdf4() {
		return mdf4;
	}

	public void setMdf4(String mdf4) {
		this.mdf4 = mdf4;
	}

	public String getMdf5() {
		return mdf5;
	}

	public void setMdf5(String mdf5) {
		this.mdf5 = mdf5;
	}

	public String getMdf6() {
		return mdf6;
	}

	public void setMdf6(String mdf6) {
		this.mdf6 = mdf6;
	}

	public String getMdf7() {
		return mdf7;
	}

	public void setMdf7(String mdf7) {
		this.mdf7 = mdf7;
	}

	public String getMdf8() {
		return mdf8;
	}

	public void setMdf8(String mdf8) {
		this.mdf8 = mdf8;
	}

	public String getMdf9() {
		return mdf9;
	}

	public void setMdf9(String mdf9) {
		this.mdf9 = mdf9;
	}

	public String getMdf10() {
		return mdf10;
	}

	public void setMdf10(String mdf10) {
		this.mdf10 = mdf10;
	}

	public String getMdf11() {
		return mdf11;
	}

	public void setMdf11(String mdf11) {
		this.mdf11 = mdf11;
	}

	public String getMdf12() {
		return mdf12;
	}

	public void setMdf12(String mdf12) {
		this.mdf12 = mdf12;
	}

	public String getAnotacoes11() {
		return anotacoes11;
	}

	public void setAnotacoes11(String anotacoes11) {
		this.anotacoes11 = anotacoes11;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getGestor() {
		return gestor;
	}

	public void setGestor(String gestor) {
		this.gestor = gestor;
	}

	public String getIdebVisivel() {
		return idebVisivel;
	}

	public void setIdebVisivel(String idebVisivel) {
		this.idebVisivel = idebVisivel;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public String getTurnoVisita() {
		return turnoVisita;
	}

	public void setTurnoVisita(String turnoVisita) {
		this.turnoVisita = turnoVisita;
	}

	public String getChuva() {
		return chuva;
	}

	public void setChuva(String chuva) {
		this.chuva = chuva;
	}

	public String getProblemasChuva() {
		return problemasChuva;
	}

	public void setProblemasChuva(String problemasChuva) {
		this.problemasChuva = problemasChuva;
	}

	public String getEee1a() {
		return eee1a;
	}

	public void setEee1a(String eee1a) {
		this.eee1a = eee1a;
	}

	public String getEee1b() {
		return eee1b;
	}

	public void setEee1b(String eee1b) {
		this.eee1b = eee1b;
	}

	public String getEee1c() {
		return eee1c;
	}

	public void setEee1c(String eee1c) {
		this.eee1c = eee1c;
	}

	public String getEee1d() {
		return eee1d;
	}

	public void setEee1d(String eee1d) {
		this.eee1d = eee1d;
	}

	public String getEee1e() {
		return eee1e;
	}

	public void setEee1e(String eee1e) {
		this.eee1e = eee1e;
	}

	public String getEee1f() {
		return eee1f;
	}

	public void setEee1f(String eee1f) {
		this.eee1f = eee1f;
	}

	public String getEee1g() {
		return eee1g;
	}

	public void setEee1g(String eee1g) {
		this.eee1g = eee1g;
	}

	public String getEee1h() {
		return eee1h;
	}

	public void setEee1h(String eee1h) {
		this.eee1h = eee1h;
	}

	public String getEee1i() {
		return eee1i;
	}

	public void setEee1i(String eee1i) {
		this.eee1i = eee1i;
	}

	public String getEee2() {
		return eee2;
	}

	public void setEee2(String eee2) {
		this.eee2 = eee2;
	}

	public String getEee3() {
		return eee3;
	}

	public void setEee3(String eee3) {
		this.eee3 = eee3;
	}

	public String getEee4() {
		return eee4;
	}

	public void setEee4(String eee4) {
		this.eee4 = eee4;
	}

	public String getEee5() {
		return eee5;
	}

	public void setEee5(String eee5) {
		this.eee5 = eee5;
	}

	public String getEee6() {
		return eee6;
	}

	public void setEee6(String eee6) {
		this.eee6 = eee6;
	}

	public String getEee7() {
		return eee7;
	}

	public void setEee7(String eee7) {
		this.eee7 = eee7;
	}

	public String getEee8() {
		return eee8;
	}

	public void setEee8(String eee8) {
		this.eee8 = eee8;
	}

	public String getEee9() {
		return eee9;
	}

	public void setEee9(String eee9) {
		this.eee9 = eee9;
	}

	public String getAnotacoes1a() {
		return anotacoes1a;
	}

	public void setAnotacoes1a(String anotacoes1a) {
		this.anotacoes1a = anotacoes1a;
	}

	public String getEac1() {
		return eac1;
	}

	public void setEac1(String eac1) {
		this.eac1 = eac1;
	}

	public String getEac2() {
		return eac2;
	}

	public void setEac2(String eac2) {
		this.eac2 = eac2;
	}

	public String getEac3a() {
		return eac3a;
	}

	public void setEac3a(String eac3a) {
		this.eac3a = eac3a;
	}

	public String getEac3b() {
		return eac3b;
	}

	public void setEac3b(String eac3b) {
		this.eac3b = eac3b;
	}

	public String getEac3c() {
		return eac3c;
	}

	public void setEac3c(String eac3c) {
		this.eac3c = eac3c;
	}

	public String getEac3d() {
		return eac3d;
	}

	public void setEac3d(String eac3d) {
		this.eac3d = eac3d;
	}

	public String getAnotacoes6a() {
		return anotacoes6a;
	}

	public void setAnotacoes6a(String anotacoes6a) {
		this.anotacoes6a = anotacoes6a;
	}

	public String getEef1() {
		return eef1;
	}

	public void setEef1(String eef1) {
		this.eef1 = eef1;
	}

	public String getEef2() {
		return eef2;
	}

	public void setEef2(String eef2) {
		this.eef2 = eef2;
	}

	public String getEef3() {
		return eef3;
	}

	public void setEef3(String eef3) {
		this.eef3 = eef3;
	}

	public String getEef3a() {
		return eef3a;
	}

	public void setEef3a(String eef3a) {
		this.eef3a = eef3a;
	}

	public String getEef4() {
		return eef4;
	}

	public void setEef4(String eef4) {
		this.eef4 = eef4;
	}

	public String getEef4a() {
		return eef4a;
	}

	public void setEef4a(String eef4a) {
		this.eef4a = eef4a;
	}

	public String getEef5() {
		return eef5;
	}

	public void setEef5(String eef5) {
		this.eef5 = eef5;
	}

	public String getEef6() {
		return eef6;
	}

	public void setEef6(String eef6) {
		this.eef6 = eef6;
	}

	public String getEef7() {
		return eef7;
	}

	public void setEef7(String eef7) {
		this.eef7 = eef7;
	}

	public String getEef7a() {
		return eef7a;
	}

	public void setEef7a(String eef7a) {
		this.eef7a = eef7a;
	}

	public String getEef8() {
		return eef8;
	}

	public void setEef8(String eef8) {
		this.eef8 = eef8;
	}

	public String getEef9() {
		return eef9;
	}

	public void setEef9(String eef9) {
		this.eef9 = eef9;
	}

	public String getEef10() {
		return eef10;
	}

	public void setEef10(String eef10) {
		this.eef10 = eef10;
	}

	public String getEef10a() {
		return eef10a;
	}

	public void setEef10a(String eef10a) {
		this.eef10a = eef10a;
	}

	public String getEef10b() {
		return eef10b;
	}

	public void setEef10b(String eef10b) {
		this.eef10b = eef10b;
	}

	public String getEef11() {
		return eef11;
	}

	public void setEef11(String eef11) {
		this.eef11 = eef11;
	}

	public String getEef12() {
		return eef12;
	}

	public void setEef12(String eef12) {
		this.eef12 = eef12;
	}

	public String getEef13() {
		return eef13;
	}

	public void setEef13(String eef13) {
		this.eef13 = eef13;
	}

	public String getEef14() {
		return eef14;
	}

	public void setEef14(String eef14) {
		this.eef14 = eef14;
	}

	public String getEef15() {
		return eef15;
	}

	public void setEef15(String eef15) {
		this.eef15 = eef15;
	}

	public String getEef16() {
		return eef16;
	}

	public void setEef16(String eef16) {
		this.eef16 = eef16;
	}

	public String getEef17() {
		return eef17;
	}

	public void setEef17(String eef17) {
		this.eef17 = eef17;
	}

	public String getAnotacoes7a() {
		return anotacoes7a;
	}

	public void setAnotacoes7a(String anotacoes7a) {
		this.anotacoes7a = anotacoes7a;
	}

	public String getEm1() {
		return em1;
	}

	public void setEm1(String em1) {
		this.em1 = em1;
	}

	public String getEm2() {
		return em2;
	}

	public void setEm2(String em2) {
		this.em2 = em2;
	}

	public String getEm3() {
		return em3;
	}

	public void setEm3(String em3) {
		this.em3 = em3;
	}

	public String getEm3a() {
		return em3a;
	}

	public void setEm3a(String em3a) {
		this.em3a = em3a;
	}

	public String getEm4() {
		return em4;
	}

	public void setEm4(String em4) {
		this.em4 = em4;
	}

	public String getAnotacoes10a() {
		return anotacoes10a;
	}

	public void setAnotacoes10a(String anotacoes10a) {
		this.anotacoes10a = anotacoes10a;
	}

	public String getEdfs1() {
		return edfs1;
	}

	public void setEdfs1(String edfs1) {
		this.edfs1 = edfs1;
	}

	public String getEdfs2() {
		return edfs2;
	}

	public void setEdfs2(String edfs2) {
		this.edfs2 = edfs2;
	}

	public String getEdfs3() {
		return edfs3;
	}

	public void setEdfs3(String edfs3) {
		this.edfs3 = edfs3;
	}

	public String getEdfs4() {
		return edfs4;
	}

	public void setEdfs4(String edfs4) {
		this.edfs4 = edfs4;
	}

	public String getEdfs4o() {
		return edfs4o;
	}

	public void setEdfs4o(String edfs4o) {
		this.edfs4o = edfs4o;
	}

	public String getEdfs5() {
		return edfs5;
	}

	public void setEdfs5(String edfs5) {
		this.edfs5 = edfs5;
	}

	public String getEdfs5o() {
		return edfs5o;
	}

	public void setEdfs5o(String edfs5o) {
		this.edfs5o = edfs5o;
	}

	public String getEdfs6() {
		return edfs6;
	}

	public void setEdfs6(String edfs6) {
		this.edfs6 = edfs6;
	}

	public String getEdfs6o() {
		return edfs6o;
	}

	public void setEdfs6o(String edfs6o) {
		this.edfs6o = edfs6o;
	}

	public String getEdfs7() {
		return edfs7;
	}

	public void setEdfs7(String edfs7) {
		this.edfs7 = edfs7;
	}

	public String getEdfs7o() {
		return edfs7o;
	}

	public void setEdfs7o(String edfs7o) {
		this.edfs7o = edfs7o;
	}

	public String getEdfs7a() {
		return edfs7a;
	}

	public void setEdfs7a(String edfs7a) {
		this.edfs7a = edfs7a;
	}

	public String getEdfs7b() {
		return edfs7b;
	}

	public void setEdfs7b(String edfs7b) {
		this.edfs7b = edfs7b;
	}

	public String getEdfs8() {
		return edfs8;
	}

	public void setEdfs8(String edfs8) {
		this.edfs8 = edfs8;
	}

	public String getEdfs8o() {
		return edfs8o;
	}

	public void setEdfs8o(String edfs8o) {
		this.edfs8o = edfs8o;
	}

	public String getEdfs9() {
		return edfs9;
	}

	public void setEdfs9(String edfs9) {
		this.edfs9 = edfs9;
	}

	public String getEdfs10() {
		return edfs10;
	}

	public void setEdfs10(String edfs10) {
		this.edfs10 = edfs10;
	}

	public String getEdfs11() {
		return edfs11;
	}

	public void setEdfs11(String edfs11) {
		this.edfs11 = edfs11;
	}

	public String getEdfs12() {
		return edfs12;
	}

	public void setEdfs12(String edfs12) {
		this.edfs12 = edfs12;
	}

	public String getEdfs13() {
		return edfs13;
	}

	public void setEdfs13(String edfs13) {
		this.edfs13 = edfs13;
	}

	public String getEdfs13o() {
		return edfs13o;
	}

	public void setEdfs13o(String edfs13o) {
		this.edfs13o = edfs13o;
	}

	public String getEdfs14() {
		return edfs14;
	}

	public void setEdfs14(String edfs14) {
		this.edfs14 = edfs14;
	}

	public String getEdfs14o() {
		return edfs14o;
	}

	public void setEdfs14o(String edfs14o) {
		this.edfs14o = edfs14o;
	}

	public String getEdfs15() {
		return edfs15;
	}

	public void setEdfs15(String edfs15) {
		this.edfs15 = edfs15;
	}

	public String getEdfs15o() {
		return edfs15o;
	}

	public void setEdfs15o(String edfs15o) {
		this.edfs15o = edfs15o;
	}

	public String getEdfs16() {
		return edfs16;
	}

	public void setEdfs16(String edfs16) {
		this.edfs16 = edfs16;
	}

	public String getEdfs16o() {
		return edfs16o;
	}

	public void setEdfs16o(String edfs16o) {
		this.edfs16o = edfs16o;
	}

	public String getEdfs17() {
		return edfs17;
	}

	public void setEdfs17(String edfs17) {
		this.edfs17 = edfs17;
	}

	public String getEdfs17o() {
		return edfs17o;
	}

	public void setEdfs17o(String edfs17o) {
		this.edfs17o = edfs17o;
	}

	public String getAnotacoes11a() {
		return anotacoes11a;
	}

	public void setAnotacoes11a(String anotacoes11a) {
		this.anotacoes11a = anotacoes11a;
	}

	public String getPub() {
		return pub;
	}

	public void setPub(String pub) {
		this.pub = pub;
	}

	public String getMdf12a() {
		return mdf12a;
	}

	public void setMdf12a(String mdf12a) {
		this.mdf12a = mdf12a;
	}

	public String getEdfs18a() {
		return edfs18a;
	}

	public void setEdfs18a(String edfs18a) {
		this.edfs18a = edfs18a;
	}

	public String getEdfs18b() {
		return edfs18b;
	}

	public void setEdfs18b(String edfs18b) {
		this.edfs18b = edfs18b;
	}

	public String getEdfs18c() {
		return edfs18c;
	}

	public void setEdfs18c(String edfs18c) {
		this.edfs18c = edfs18c;
	}

	public String getEdfs18d() {
		return edfs18d;
	}

	public void setEdfs18d(String edfs18d) {
		this.edfs18d = edfs18d;
	}

	public String getEdfs18e() {
		return edfs18e;
	}

	public void setEdfs18e(String edfs18e) {
		this.edfs18e = edfs18e;
	}

	public String getEdfs18f() {
		return edfs18f;
	}

	public void setEdfs18f(String edfs18f) {
		this.edfs18f = edfs18f;
	}

	public String getEdfs18g() {
		return edfs18g;
	}

	public void setEdfs18g(String edfs18g) {
		this.edfs18g = edfs18g;
	}
}