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
@Table(name = "vistoriaCreche")
public class VistoriaCreche {

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
	@JoinColumn(name = "cre_id", nullable = false)
	private Creche creche;

	@Column
	private String relatorio;

	@Column
	private String gestor;

	@Column
	private String situacao;

	@Column
	private Integer ger1;

	@Column
	private Integer ger2;

	@Column
	private Boolean ger3a;

	@Column
	private Boolean ger3b;

	@Column
	private Boolean ger3c;

	@Column
	private Boolean ger3d;

	@Column
	private Boolean ger3e;

	@Column
	private Boolean ger3f;

	@Column
	private Boolean ger4;

	@Column
	private String ger4o;

	@Column
	private String gerinf;

	@Column
	private Integer sal1;

	@Column
	private Integer sal2;

	@Column
	private Integer sal3;

	@Column
	private Integer sal4;

	@Column
	private String salinf;

	@Column
	private Boolean ber1;

	@Column
	private Boolean ber2;

	@Column
	private Boolean ber3;

	@Column
	private Boolean ber4;

	@Column
	private Boolean ber5;

	@Column
	private Boolean ber6;

	@Column
	private Boolean ber7;

	@Column
	private Boolean ber8;

	@Column
	private String berinf;

	@Column
	private Boolean ban1a;

	@Column
	private Boolean ban1b;

	@Column
	private Boolean ban1c;

	@Column
	private Boolean ban1d;

	@Column
	private Boolean ban1e;

	@Column
	private Boolean ban1f;

	@Column
	private Boolean ban1g;

	@Column
	private Boolean ban1h;

	@Column
	private Boolean ban1i;

	@Column
	private Boolean ban1j;

	@Column
	private Boolean ban1k;

	@Column
	private Boolean ban1l;

	@Column
	private Boolean ban1m;

	@Column
	private Boolean ban1n;

	@Column
	private Boolean ban1o;

	@Column
	private String ban1outros;

	@Column
	private String baninf;

	@Column
	private Boolean eaa1a;

	@Column
	private Boolean eaa1b;

	@Column
	private Boolean eaa1c;

	@Column
	private Boolean eaa1d;

	@Column
	private Boolean eaa1e;

	@Column
	private Boolean eaa1f;

	@Column
	private Boolean eaa1g;

	@Column
	private Boolean eaa1h;

	@Column
	private Boolean eaa1i;

	@Column
	private String eaainf;

	@Column
	private Boolean aae1;

	@Column
	private Boolean aae2;

	@Column
	private Boolean aae3;

	@Column
	private Boolean aae4a;

	@Column
	private Boolean aae4b;

	@Column
	private Boolean aae4c;

	@Column
	private Boolean aae4d;

	@Column
	private Boolean aae4e;

	@Column
	private Boolean aae4f;

	@Column
	private Boolean aae4g;

	@Column
	private String aae4outros;

	@Column
	private Boolean aae5;

	@Column
	private Boolean aae6;

	@Column
	private Boolean aae7;

	@Column
	private Boolean aae8;

	@Column
	private Boolean aae9;

	@Column
	private Boolean aae10;

	@Column
	private String aaeinf;

	@Column
	private Boolean see1;

	@Column
	private String see1o;

	@Column
	private Boolean see2;

	@Column
	private String see2o;

	@Column
	private Boolean see3;

	@Column
	private String see3o;

	@Column
	private Boolean see4;

	@Column
	private String see4o;

	@Column
	private Boolean see5;

	@Column
	private String see5o;

	@Column
	private Boolean see6;

	@Column
	private String see6o;

	@Column
	private Boolean see7;

	@Column
	private String see7o;

	@Column
	private Boolean see8;

	@Column
	private String see8o;

	@Column
	private Boolean see9;

	@Column
	private String see9o;

	@Column
	private Boolean see10;

	@Column
	private String see10o;

	@Column
	private Boolean see11;

	@Column
	private String see11o;

	@Column
	private Boolean see12;

	@Column
	private String see12o;

	@Column
	private Boolean see13;

	@Column
	private String see13o;

	@Column
	private Boolean see14;

	@Column
	private String see14o;

	@Column
	private Boolean see15;

	@Column
	private String see15o;

	@Column
	private String seeinf;

	@Column
	private Boolean mat1;

	@Column
	private String mat1o;

	@Column
	private Boolean mat2;

	@Column
	private String mat2o;

	@Column
	private Boolean mat3;

	@Column
	private String mat3o;

	@Column
	private Boolean mat4;

	@Column
	private String mat4o;

	@Column
	private Boolean mat5;

	@Column
	private String mat5o;

	@Column
	private Boolean mat6;

	@Column
	private String mat6o;

	@Column
	private Boolean mat7;

	@Column
	private String mat7o;

	@Column
	private Boolean mat8;

	@Column
	private String mat8o;

	@Column
	private Boolean mat9;

	@Column
	private String mat9o;

	@Column
	private Boolean mat10;

	@Column
	private String mat10o;

	@Column
	private Boolean mat11a;

	@Column
	private Boolean mat11b;

	@Column
	private Boolean mat11c;

	@Column
	private Boolean mat11d;

	@Column
	private String matinf;

	@Column
	private Integer ali1;

	@Column
	private Integer ali2;

	@Column
	private Integer ali3;

	@Column
	private Integer ali4;

	@Column
	private Integer ali5;

	@Column
	private Integer ali6;

	@Column
	private Integer ali7;

	@Column
	private Integer ali8;

	@Column
	private Integer ali9;

	@Column
	private Integer ali10;

	@Column
	private Integer ali11;

	@Column
	private Integer ali12;

	@Column
	private Boolean ali13;

	@Column
	private String aliinf;

	@Column
	private Boolean lav1;

	@Column
	private Boolean lav2;

	@Column
	private Boolean lav3;

	@Column
	private Boolean lav4;

	@Column
	private Boolean lav5;

	@Column
	private String lavinf;

	@Column
	private Boolean adm1;

	@Column
	private Boolean adm2;

	@Column
	private Boolean adm3;

	@Column
	private Boolean adm4;

	@Column
	private Boolean adm5;

	@Column
	private Boolean adm6;

	@Column
	private Boolean adm7;

	@Column
	private Boolean adm8;

	@Column
	private Boolean adm9;

	@Column
	private Boolean adm10;

	@Column
	private Boolean adm11;

	@Column
	private Boolean adm12;

	@Column
	private Boolean adm13;

	@Column
	private Integer adm14;

	@Column
	private Boolean adm15;

	@Column
	private Boolean adm16;

	@Column
	private Boolean adm17;

	@Column
	private Boolean adm18;

	@Column
	private Boolean adm19;

	@Column
	private String adminf;

	@Column
	private Boolean sau1;

	@Column
	private Boolean sau2;

	@Column
	private Boolean sau3a;

	@Column
	private Boolean sau3b;

	@Column
	private Boolean sau3c;

	@Column
	private Boolean sau3d;

	@Column
	private Boolean sau3e;

	@Column
	private Boolean sau3f;

	@Column
	private Boolean sau3g;

	@Column
	private Boolean sau3h;

	@Column
	private Boolean sau3i;

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

	public Creche getCreche() {
		return creche;
	}

	public void setCreche(Creche creche) {
		this.creche = creche;
	}

	public String getRelatorio() {
		return relatorio;
	}

	public void setRelatorio(String relatorio) {
		this.relatorio = relatorio;
	}

	public String getGestor() {
		return gestor;
	}

	public void setGestor(String gestor) {
		this.gestor = gestor;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}

	public Integer getGer1() {
		return ger1;
	}

	public void setGer1(Integer ger1) {
		this.ger1 = ger1;
	}

	public Integer getGer2() {
		return ger2;
	}

	public void setGer2(Integer ger2) {
		this.ger2 = ger2;
	}

	public Boolean getGer3a() {
		return ger3a;
	}

	public void setGer3a(Boolean ger3a) {
		this.ger3a = ger3a;
	}

	public Boolean getGer3b() {
		return ger3b;
	}

	public void setGer3b(Boolean ger3b) {
		this.ger3b = ger3b;
	}

	public Boolean getGer3c() {
		return ger3c;
	}

	public void setGer3c(Boolean ger3c) {
		this.ger3c = ger3c;
	}

	public Boolean getGer3d() {
		return ger3d;
	}

	public void setGer3d(Boolean ger3d) {
		this.ger3d = ger3d;
	}

	public Boolean getGer3e() {
		return ger3e;
	}

	public void setGer3e(Boolean ger3e) {
		this.ger3e = ger3e;
	}

	public Boolean getGer3f() {
		return ger3f;
	}

	public void setGer3f(Boolean ger3f) {
		this.ger3f = ger3f;
	}

	public Boolean getGer4() {
		return ger4;
	}

	public void setGer4(Boolean ger4) {
		this.ger4 = ger4;
	}

	public String getGer4o() {
		return ger4o;
	}

	public void setGer4o(String ger4o) {
		this.ger4o = ger4o;
	}

	public String getGerinf() {
		return gerinf;
	}

	public void setGerinf(String gerinf) {
		this.gerinf = gerinf;
	}

	public Integer getSal1() {
		return sal1;
	}

	public void setSal1(Integer sal1) {
		this.sal1 = sal1;
	}

	public Integer getSal2() {
		return sal2;
	}

	public void setSal2(Integer sal2) {
		this.sal2 = sal2;
	}

	public Integer getSal3() {
		return sal3;
	}

	public void setSal3(Integer sal3) {
		this.sal3 = sal3;
	}

	public Integer getSal4() {
		return sal4;
	}

	public void setSal4(Integer sal4) {
		this.sal4 = sal4;
	}

	public String getSalinf() {
		return salinf;
	}

	public void setSalinf(String salinf) {
		this.salinf = salinf;
	}

	public Boolean getBer1() {
		return ber1;
	}

	public void setBer1(Boolean ber1) {
		this.ber1 = ber1;
	}

	public Boolean getBer2() {
		return ber2;
	}

	public void setBer2(Boolean ber2) {
		this.ber2 = ber2;
	}

	public Boolean getBer3() {
		return ber3;
	}

	public void setBer3(Boolean ber3) {
		this.ber3 = ber3;
	}

	public Boolean getBer4() {
		return ber4;
	}

	public void setBer4(Boolean ber4) {
		this.ber4 = ber4;
	}

	public Boolean getBer5() {
		return ber5;
	}

	public void setBer5(Boolean ber5) {
		this.ber5 = ber5;
	}

	public Boolean getBer6() {
		return ber6;
	}

	public void setBer6(Boolean ber6) {
		this.ber6 = ber6;
	}

	public Boolean getBer7() {
		return ber7;
	}

	public void setBer7(Boolean ber7) {
		this.ber7 = ber7;
	}

	public Boolean getBer8() {
		return ber8;
	}

	public void setBer8(Boolean ber8) {
		this.ber8 = ber8;
	}

	public String getBerinf() {
		return berinf;
	}

	public void setBerinf(String berinf) {
		this.berinf = berinf;
	}

	public Boolean getBan1a() {
		return ban1a;
	}

	public void setBan1a(Boolean ban1a) {
		this.ban1a = ban1a;
	}

	public Boolean getBan1b() {
		return ban1b;
	}

	public void setBan1b(Boolean ban1b) {
		this.ban1b = ban1b;
	}

	public Boolean getBan1c() {
		return ban1c;
	}

	public void setBan1c(Boolean ban1c) {
		this.ban1c = ban1c;
	}

	public Boolean getBan1d() {
		return ban1d;
	}

	public void setBan1d(Boolean ban1d) {
		this.ban1d = ban1d;
	}

	public Boolean getBan1e() {
		return ban1e;
	}

	public void setBan1e(Boolean ban1e) {
		this.ban1e = ban1e;
	}

	public Boolean getBan1f() {
		return ban1f;
	}

	public void setBan1f(Boolean ban1f) {
		this.ban1f = ban1f;
	}

	public Boolean getBan1g() {
		return ban1g;
	}

	public void setBan1g(Boolean ban1g) {
		this.ban1g = ban1g;
	}

	public Boolean getBan1h() {
		return ban1h;
	}

	public void setBan1h(Boolean ban1h) {
		this.ban1h = ban1h;
	}

	public Boolean getBan1i() {
		return ban1i;
	}

	public void setBan1i(Boolean ban1i) {
		this.ban1i = ban1i;
	}

	public Boolean getBan1j() {
		return ban1j;
	}

	public void setBan1j(Boolean ban1j) {
		this.ban1j = ban1j;
	}

	public Boolean getBan1k() {
		return ban1k;
	}

	public void setBan1k(Boolean ban1k) {
		this.ban1k = ban1k;
	}

	public Boolean getBan1l() {
		return ban1l;
	}

	public void setBan1l(Boolean ban1l) {
		this.ban1l = ban1l;
	}

	public Boolean getBan1m() {
		return ban1m;
	}

	public void setBan1m(Boolean ban1m) {
		this.ban1m = ban1m;
	}

	public Boolean getBan1n() {
		return ban1n;
	}

	public void setBan1n(Boolean ban1n) {
		this.ban1n = ban1n;
	}

	public Boolean getBan1o() {
		return ban1o;
	}

	public void setBan1o(Boolean ban1o) {
		this.ban1o = ban1o;
	}

	public String getBan1outros() {
		return ban1outros;
	}

	public void setBan1outros(String ban1outros) {
		this.ban1outros = ban1outros;
	}

	public String getBaninf() {
		return baninf;
	}

	public void setBaninf(String baninf) {
		this.baninf = baninf;
	}

	public Boolean getEaa1a() {
		return eaa1a;
	}

	public void setEaa1a(Boolean eaa1a) {
		this.eaa1a = eaa1a;
	}

	public Boolean getEaa1b() {
		return eaa1b;
	}

	public void setEaa1b(Boolean eaa1b) {
		this.eaa1b = eaa1b;
	}

	public Boolean getEaa1c() {
		return eaa1c;
	}

	public void setEaa1c(Boolean eaa1c) {
		this.eaa1c = eaa1c;
	}

	public Boolean getEaa1d() {
		return eaa1d;
	}

	public void setEaa1d(Boolean eaa1d) {
		this.eaa1d = eaa1d;
	}

	public Boolean getEaa1e() {
		return eaa1e;
	}

	public void setEaa1e(Boolean eaa1e) {
		this.eaa1e = eaa1e;
	}

	public Boolean getEaa1f() {
		return eaa1f;
	}

	public void setEaa1f(Boolean eaa1f) {
		this.eaa1f = eaa1f;
	}

	public Boolean getEaa1g() {
		return eaa1g;
	}

	public void setEaa1g(Boolean eaa1g) {
		this.eaa1g = eaa1g;
	}

	public Boolean getEaa1h() {
		return eaa1h;
	}

	public void setEaa1h(Boolean eaa1h) {
		this.eaa1h = eaa1h;
	}

	public Boolean getEaa1i() {
		return eaa1i;
	}

	public void setEaa1i(Boolean eaa1i) {
		this.eaa1i = eaa1i;
	}

	public String getEaainf() {
		return eaainf;
	}

	public void setEaainf(String eaainf) {
		this.eaainf = eaainf;
	}

	public Boolean getAae1() {
		return aae1;
	}

	public void setAae1(Boolean aae1) {
		this.aae1 = aae1;
	}

	public Boolean getAae2() {
		return aae2;
	}

	public void setAae2(Boolean aae2) {
		this.aae2 = aae2;
	}

	public Boolean getAae3() {
		return aae3;
	}

	public void setAae3(Boolean aae3) {
		this.aae3 = aae3;
	}

	public Boolean getAae4a() {
		return aae4a;
	}

	public void setAae4a(Boolean aae4a) {
		this.aae4a = aae4a;
	}

	public Boolean getAae4b() {
		return aae4b;
	}

	public void setAae4b(Boolean aae4b) {
		this.aae4b = aae4b;
	}

	public Boolean getAae4c() {
		return aae4c;
	}

	public void setAae4c(Boolean aae4c) {
		this.aae4c = aae4c;
	}

	public Boolean getAae4d() {
		return aae4d;
	}

	public void setAae4d(Boolean aae4d) {
		this.aae4d = aae4d;
	}

	public Boolean getAae4e() {
		return aae4e;
	}

	public void setAae4e(Boolean aae4e) {
		this.aae4e = aae4e;
	}

	public Boolean getAae4f() {
		return aae4f;
	}

	public void setAae4f(Boolean aae4f) {
		this.aae4f = aae4f;
	}

	public Boolean getAae4g() {
		return aae4g;
	}

	public void setAae4g(Boolean aae4g) {
		this.aae4g = aae4g;
	}

	public String getAae4outros() {
		return aae4outros;
	}

	public void setAae4outros(String aae4outros) {
		this.aae4outros = aae4outros;
	}

	public Boolean getAae5() {
		return aae5;
	}

	public void setAae5(Boolean aae5) {
		this.aae5 = aae5;
	}

	public Boolean getAae6() {
		return aae6;
	}

	public void setAae6(Boolean aae6) {
		this.aae6 = aae6;
	}

	public Boolean getAae7() {
		return aae7;
	}

	public void setAae7(Boolean aae7) {
		this.aae7 = aae7;
	}

	public Boolean getAae8() {
		return aae8;
	}

	public void setAae8(Boolean aae8) {
		this.aae8 = aae8;
	}

	public Boolean getAae9() {
		return aae9;
	}

	public void setAae9(Boolean aae9) {
		this.aae9 = aae9;
	}

	public Boolean getAae10() {
		return aae10;
	}

	public void setAae10(Boolean aae10) {
		this.aae10 = aae10;
	}

	public String getAaeinf() {
		return aaeinf;
	}

	public void setAaeinf(String aaeinf) {
		this.aaeinf = aaeinf;
	}

	public Boolean getSee1() {
		return see1;
	}

	public void setSee1(Boolean see1) {
		this.see1 = see1;
	}

	public String getSee1o() {
		return see1o;
	}

	public void setSee1o(String see1o) {
		this.see1o = see1o;
	}

	public Boolean getSee2() {
		return see2;
	}

	public void setSee2(Boolean see2) {
		this.see2 = see2;
	}

	public String getSee2o() {
		return see2o;
	}

	public void setSee2o(String see2o) {
		this.see2o = see2o;
	}

	public Boolean getSee3() {
		return see3;
	}

	public void setSee3(Boolean see3) {
		this.see3 = see3;
	}

	public String getSee3o() {
		return see3o;
	}

	public void setSee3o(String see3o) {
		this.see3o = see3o;
	}

	public Boolean getSee4() {
		return see4;
	}

	public void setSee4(Boolean see4) {
		this.see4 = see4;
	}

	public String getSee4o() {
		return see4o;
	}

	public void setSee4o(String see4o) {
		this.see4o = see4o;
	}

	public Boolean getSee5() {
		return see5;
	}

	public void setSee5(Boolean see5) {
		this.see5 = see5;
	}

	public String getSee5o() {
		return see5o;
	}

	public void setSee5o(String see5o) {
		this.see5o = see5o;
	}

	public Boolean getSee6() {
		return see6;
	}

	public void setSee6(Boolean see6) {
		this.see6 = see6;
	}

	public String getSee6o() {
		return see6o;
	}

	public void setSee6o(String see6o) {
		this.see6o = see6o;
	}

	public Boolean getSee7() {
		return see7;
	}

	public void setSee7(Boolean see7) {
		this.see7 = see7;
	}

	public String getSee7o() {
		return see7o;
	}

	public void setSee7o(String see7o) {
		this.see7o = see7o;
	}

	public Boolean getSee8() {
		return see8;
	}

	public void setSee8(Boolean see8) {
		this.see8 = see8;
	}

	public String getSee8o() {
		return see8o;
	}

	public void setSee8o(String see8o) {
		this.see8o = see8o;
	}

	public Boolean getSee9() {
		return see9;
	}

	public void setSee9(Boolean see9) {
		this.see9 = see9;
	}

	public String getSee9o() {
		return see9o;
	}

	public void setSee9o(String see9o) {
		this.see9o = see9o;
	}

	public Boolean getSee10() {
		return see10;
	}

	public void setSee10(Boolean see10) {
		this.see10 = see10;
	}

	public String getSee10o() {
		return see10o;
	}

	public void setSee10o(String see10o) {
		this.see10o = see10o;
	}

	public Boolean getSee11() {
		return see11;
	}

	public void setSee11(Boolean see11) {
		this.see11 = see11;
	}

	public String getSee11o() {
		return see11o;
	}

	public void setSee11o(String see11o) {
		this.see11o = see11o;
	}

	public Boolean getSee12() {
		return see12;
	}

	public void setSee12(Boolean see12) {
		this.see12 = see12;
	}

	public String getSee12o() {
		return see12o;
	}

	public void setSee12o(String see12o) {
		this.see12o = see12o;
	}

	public Boolean getSee13() {
		return see13;
	}

	public void setSee13(Boolean see13) {
		this.see13 = see13;
	}

	public String getSee13o() {
		return see13o;
	}

	public void setSee13o(String see13o) {
		this.see13o = see13o;
	}

	public Boolean getSee14() {
		return see14;
	}

	public void setSee14(Boolean see14) {
		this.see14 = see14;
	}

	public String getSee14o() {
		return see14o;
	}

	public void setSee14o(String see14o) {
		this.see14o = see14o;
	}

	public Boolean getSee15() {
		return see15;
	}

	public void setSee15(Boolean see15) {
		this.see15 = see15;
	}

	public String getSee15o() {
		return see15o;
	}

	public void setSee15o(String see15o) {
		this.see15o = see15o;
	}

	public String getSeeinf() {
		return seeinf;
	}

	public void setSeeinf(String seeinf) {
		this.seeinf = seeinf;
	}

	public Boolean getMat1() {
		return mat1;
	}

	public void setMat1(Boolean mat1) {
		this.mat1 = mat1;
	}

	public String getMat1o() {
		return mat1o;
	}

	public void setMat1o(String mat1o) {
		this.mat1o = mat1o;
	}

	public Boolean getMat2() {
		return mat2;
	}

	public void setMat2(Boolean mat2) {
		this.mat2 = mat2;
	}

	public String getMat2o() {
		return mat2o;
	}

	public void setMat2o(String mat2o) {
		this.mat2o = mat2o;
	}

	public Boolean getMat3() {
		return mat3;
	}

	public void setMat3(Boolean mat3) {
		this.mat3 = mat3;
	}

	public String getMat3o() {
		return mat3o;
	}

	public void setMat3o(String mat3o) {
		this.mat3o = mat3o;
	}

	public Boolean getMat4() {
		return mat4;
	}

	public void setMat4(Boolean mat4) {
		this.mat4 = mat4;
	}

	public String getMat4o() {
		return mat4o;
	}

	public void setMat4o(String mat4o) {
		this.mat4o = mat4o;
	}

	public Boolean getMat5() {
		return mat5;
	}

	public void setMat5(Boolean mat5) {
		this.mat5 = mat5;
	}

	public String getMat5o() {
		return mat5o;
	}

	public void setMat5o(String mat5o) {
		this.mat5o = mat5o;
	}

	public Boolean getMat6() {
		return mat6;
	}

	public void setMat6(Boolean mat6) {
		this.mat6 = mat6;
	}

	public String getMat6o() {
		return mat6o;
	}

	public void setMat6o(String mat6o) {
		this.mat6o = mat6o;
	}

	public Boolean getMat7() {
		return mat7;
	}

	public void setMat7(Boolean mat7) {
		this.mat7 = mat7;
	}

	public String getMat7o() {
		return mat7o;
	}

	public void setMat7o(String mat7o) {
		this.mat7o = mat7o;
	}

	public Boolean getMat8() {
		return mat8;
	}

	public void setMat8(Boolean mat8) {
		this.mat8 = mat8;
	}

	public String getMat8o() {
		return mat8o;
	}

	public void setMat8o(String mat8o) {
		this.mat8o = mat8o;
	}

	public Boolean getMat9() {
		return mat9;
	}

	public void setMat9(Boolean mat9) {
		this.mat9 = mat9;
	}

	public String getMat9o() {
		return mat9o;
	}

	public void setMat9o(String mat9o) {
		this.mat9o = mat9o;
	}

	public Boolean getMat10() {
		return mat10;
	}

	public void setMat10(Boolean mat10) {
		this.mat10 = mat10;
	}

	public String getMat10o() {
		return mat10o;
	}

	public void setMat10o(String mat10o) {
		this.mat10o = mat10o;
	}

	public Boolean getMat11a() {
		return mat11a;
	}

	public void setMat11a(Boolean mat11a) {
		this.mat11a = mat11a;
	}

	public Boolean getMat11b() {
		return mat11b;
	}

	public void setMat11b(Boolean mat11b) {
		this.mat11b = mat11b;
	}

	public Boolean getMat11c() {
		return mat11c;
	}

	public void setMat11c(Boolean mat11c) {
		this.mat11c = mat11c;
	}

	public Boolean getMat11d() {
		return mat11d;
	}

	public void setMat11d(Boolean mat11d) {
		this.mat11d = mat11d;
	}

	public String getMatinf() {
		return matinf;
	}

	public void setMatinf(String matinf) {
		this.matinf = matinf;
	}

	public Integer getAli1() {
		return ali1;
	}

	public void setAli1(Integer ali1) {
		this.ali1 = ali1;
	}

	public Integer getAli2() {
		return ali2;
	}

	public void setAli2(Integer ali2) {
		this.ali2 = ali2;
	}

	public Integer getAli3() {
		return ali3;
	}

	public void setAli3(Integer ali3) {
		this.ali3 = ali3;
	}

	public Integer getAli4() {
		return ali4;
	}

	public void setAli4(Integer ali4) {
		this.ali4 = ali4;
	}

	public Integer getAli5() {
		return ali5;
	}

	public void setAli5(Integer ali5) {
		this.ali5 = ali5;
	}

	public Integer getAli6() {
		return ali6;
	}

	public void setAli6(Integer ali6) {
		this.ali6 = ali6;
	}

	public Integer getAli7() {
		return ali7;
	}

	public void setAli7(Integer ali7) {
		this.ali7 = ali7;
	}

	public Integer getAli8() {
		return ali8;
	}

	public void setAli8(Integer ali8) {
		this.ali8 = ali8;
	}

	public Integer getAli9() {
		return ali9;
	}

	public void setAli9(Integer ali9) {
		this.ali9 = ali9;
	}

	public Integer getAli10() {
		return ali10;
	}

	public void setAli10(Integer ali10) {
		this.ali10 = ali10;
	}

	public Integer getAli11() {
		return ali11;
	}

	public void setAli11(Integer ali11) {
		this.ali11 = ali11;
	}

	public Integer getAli12() {
		return ali12;
	}

	public void setAli12(Integer ali12) {
		this.ali12 = ali12;
	}

	public Boolean getAli13() {
		return ali13;
	}

	public void setAli13(Boolean ali13) {
		this.ali13 = ali13;
	}

	public String getAliinf() {
		return aliinf;
	}

	public void setAliinf(String aliinf) {
		this.aliinf = aliinf;
	}

	public Boolean getLav1() {
		return lav1;
	}

	public void setLav1(Boolean lav1) {
		this.lav1 = lav1;
	}

	public Boolean getLav2() {
		return lav2;
	}

	public void setLav2(Boolean lav2) {
		this.lav2 = lav2;
	}

	public Boolean getLav3() {
		return lav3;
	}

	public void setLav3(Boolean lav3) {
		this.lav3 = lav3;
	}

	public Boolean getLav4() {
		return lav4;
	}

	public void setLav4(Boolean lav4) {
		this.lav4 = lav4;
	}

	public Boolean getLav5() {
		return lav5;
	}

	public void setLav5(Boolean lav5) {
		this.lav5 = lav5;
	}

	public String getLavinf() {
		return lavinf;
	}

	public void setLavinf(String lavinf) {
		this.lavinf = lavinf;
	}

	public Boolean getAdm1() {
		return adm1;
	}

	public void setAdm1(Boolean adm1) {
		this.adm1 = adm1;
	}

	public Boolean getAdm2() {
		return adm2;
	}

	public void setAdm2(Boolean adm2) {
		this.adm2 = adm2;
	}

	public Boolean getAdm3() {
		return adm3;
	}

	public void setAdm3(Boolean adm3) {
		this.adm3 = adm3;
	}

	public Boolean getAdm4() {
		return adm4;
	}

	public void setAdm4(Boolean adm4) {
		this.adm4 = adm4;
	}

	public Boolean getAdm5() {
		return adm5;
	}

	public void setAdm5(Boolean adm5) {
		this.adm5 = adm5;
	}

	public Boolean getAdm6() {
		return adm6;
	}

	public void setAdm6(Boolean adm6) {
		this.adm6 = adm6;
	}

	public Boolean getAdm7() {
		return adm7;
	}

	public void setAdm7(Boolean adm7) {
		this.adm7 = adm7;
	}

	public Boolean getAdm8() {
		return adm8;
	}

	public void setAdm8(Boolean adm8) {
		this.adm8 = adm8;
	}

	public Boolean getAdm9() {
		return adm9;
	}

	public void setAdm9(Boolean adm9) {
		this.adm9 = adm9;
	}

	public Boolean getAdm10() {
		return adm10;
	}

	public void setAdm10(Boolean adm10) {
		this.adm10 = adm10;
	}

	public Boolean getAdm11() {
		return adm11;
	}

	public void setAdm11(Boolean adm11) {
		this.adm11 = adm11;
	}

	public Boolean getAdm12() {
		return adm12;
	}

	public void setAdm12(Boolean adm12) {
		this.adm12 = adm12;
	}

	public Boolean getAdm13() {
		return adm13;
	}

	public void setAdm13(Boolean adm13) {
		this.adm13 = adm13;
	}

	public Integer getAdm14() {
		return adm14;
	}

	public void setAdm14(Integer adm14) {
		this.adm14 = adm14;
	}

	public Boolean getAdm15() {
		return adm15;
	}

	public void setAdm15(Boolean adm15) {
		this.adm15 = adm15;
	}

	public Boolean getAdm16() {
		return adm16;
	}

	public void setAdm16(Boolean adm16) {
		this.adm16 = adm16;
	}

	public Boolean getAdm17() {
		return adm17;
	}

	public void setAdm17(Boolean adm17) {
		this.adm17 = adm17;
	}

	public Boolean getAdm18() {
		return adm18;
	}

	public void setAdm18(Boolean adm18) {
		this.adm18 = adm18;
	}

	public Boolean getAdm19() {
		return adm19;
	}

	public void setAdm19(Boolean adm19) {
		this.adm19 = adm19;
	}

	public String getAdminf() {
		return adminf;
	}

	public void setAdminf(String adminf) {
		this.adminf = adminf;
	}

	public Boolean getSau1() {
		return sau1;
	}

	public void setSau1(Boolean sau1) {
		this.sau1 = sau1;
	}

	public Boolean getSau2() {
		return sau2;
	}

	public void setSau2(Boolean sau2) {
		this.sau2 = sau2;
	}

	public Boolean getSau3a() {
		return sau3a;
	}

	public void setSau3a(Boolean sau3a) {
		this.sau3a = sau3a;
	}

	public Boolean getSau3b() {
		return sau3b;
	}

	public void setSau3b(Boolean sau3b) {
		this.sau3b = sau3b;
	}

	public Boolean getSau3c() {
		return sau3c;
	}

	public void setSau3c(Boolean sau3c) {
		this.sau3c = sau3c;
	}

	public Boolean getSau3d() {
		return sau3d;
	}

	public void setSau3d(Boolean sau3d) {
		this.sau3d = sau3d;
	}

	public Boolean getSau3e() {
		return sau3e;
	}

	public void setSau3e(Boolean sau3e) {
		this.sau3e = sau3e;
	}

	public Boolean getSau3f() {
		return sau3f;
	}

	public void setSau3f(Boolean sau3f) {
		this.sau3f = sau3f;
	}

	public Boolean getSau3g() {
		return sau3g;
	}

	public void setSau3g(Boolean sau3g) {
		this.sau3g = sau3g;
	}

	public Boolean getSau3h() {
		return sau3h;
	}

	public void setSau3h(Boolean sau3h) {
		this.sau3h = sau3h;
	}

	public Boolean getSau3i() {
		return sau3i;
	}

	public void setSau3i(Boolean sau3i) {
		this.sau3i = sau3i;
	}
	
}