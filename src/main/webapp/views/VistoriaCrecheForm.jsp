<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/general-style.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/bootstrap-dialog.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/style.css" />

	<script src="<%=request.getContextPath()%>/views/assets/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap-checkbox.js"></script>

	<!-- Custom styles for this template -->
	<style type="text/css">
		body {
			padding-top: 70px;
		}
	</style>
</head>

<body>
	
	<jsp:include page="menu.jsp"/>

	<div class="container">
		<div class="row">
			<div class="container" id="formContainer">
				<form:form class="form-horizontal" action="salvaVistoriaCreche" method="POST" enctype="multipart/form-data">
					<fieldset>

						<!-- Form Name -->
						<h1>Vistoria Creche</h1>

						<hr>

						<form:input type="hidden" name="id" path="id" />

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="responsavel"><strong>Pesquisador respons�vel</strong></label>
							<div class="col-sm-4">
								<form:input id="responsavel" name="responsavel" type="text" class="form-control" path="responsavel" />
							</div>
						</div>

						<!-- Text input -->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="data"><strong>Data da coleta</strong></label>
							<div class="col-sm-4">
								<form:input id="data" name="data" class="form-control date" path="data" />
							</div>
						</div>

						<!-- Select list-->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="creche.id"><strong>Creche/CMEI</strong></form:label>
							<div class="col-sm-4">
								<form:select path="creche.id" class="form-control">
									<c:forEach items="${creches}" var="creche">
										<option value="${creche.id}">${creche.nome}</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="gestor"><strong>Gestor</strong></label>
							<div class="col-sm-4">
								<form:input id="gestor" name="gestor" type="text" class="form-control" path="gestor" />
							</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="situacao"><strong>Situa��o do pr�dio:</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="situacao" path="situacao" value="proprio" />  Pr�prio</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="situacao" path="situacao" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="situacao" path="situacao" value="cedido" />  Cedido</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="situacao" path="situacao" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="situacao" path="situacao" value="alugado" />  Alugado</div>
						</div>
						
						<hr>
						
						<h3 style="text-align: center;">INFORMA��ES GERAIS</h3>
						<hr>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ger1"><strong>Quantos alunos est�o matriculados?</strong></label>
							<div class="col-sm-4">
								<form:input id="ger1" name="ger1" type="number" class="form-control" path="ger1" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ger2"><strong>Quantas salas de aula h� na unidade?</strong></label>
							<div class="col-sm-4">
								<form:input id="ger2" name="ger2" type="number" class="form-control" path="ger2" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-9 formradio"> - Quais turmas s�o oferecidas?</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ger3a"><strong>Ber��rio</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3a" path="ger3a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3a" path="ger3a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3a" path="ger3a" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ger3b"><strong>Grupo I</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3b" path="ger3b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3b" path="ger3b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3b" path="ger3b" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ger3c"><strong>Grupo II</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3c" path="ger3c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3c" path="ger3c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3c" path="ger3c" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ger3d"><strong>Grupo III</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3d" path="ger3d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3d" path="ger3d" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3d" path="ger3d" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ger3e"><strong>Grupo IV</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3e" path="ger3e" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3e" path="ger3e" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3e" path="ger3e" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ger3f"><strong>Grupo V</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3f" path="ger3f" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3f" path="ger3f" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger3f" path="ger3f" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ger4"><strong>H� defici�ncia no quadro de funcion�rios?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger4" path="ger4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger4" path="ger4" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ger4" path="ger4" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ger4o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="ger4o" name="ger4o" type="text" class="form-control" path="ger4o" />
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="gerinf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="gerinf" name="gerinf" type="text" class="form-control" path="gerinf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">SALA DE AULA</h3>
						<hr>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sal1"><strong>Quantas salas s�o climatizadas?</strong></label>
							<div class="col-sm-4">
								<form:input id="sal1" name="sal1" type="number" class="form-control" path="sal1" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sal2"><strong>Quantas salas possuem temperatura entre 20 e 26�C?</strong></label>
							<div class="col-sm-4">
								<form:input id="sal2" name="sal2" type="number" class="form-control" path="sal2" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sal3"><strong>Quantas salas t�m ilumina��o abaixo de 200 ou acima de 750 Lux?</strong></label>
							<div class="col-sm-4">
								<form:input id="sal3" name="sal3" type="number" class="form-control" path="sal3" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sal4"><strong>Qual o aspecto de conserva��o do mobili�rio em sala de aula? Use a escala Likert</strong></label>
							<div class="col-sm-4">
								<form:input id="sal4" name="sal4" type="number" class="form-control" path="sal4" />
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="salinf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="salinf" name="salinf" type="text" class="form-control" path="salinf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">BER��RIO</h3>
						<hr>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ber1"><strong>Existe ber��rio na unidade? (Se n�o, pule para o pr�ximo m�dulo)</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber1" path="ber1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber1" path="ber1" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber1" path="ber1" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ber2"><strong>O ber��rio apresenta temperatura entre 20 e 26�C?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber2" path="ber2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber2" path="ber2" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber2" path="ber2" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ber3"><strong>O ber��rio apresenta luminosidade entre 200 e 750Lux?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber3" path="ber3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber3" path="ber3" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber3" path="ber3" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ber4"><strong>Os ber�os est�o em quantidade suficiente e em boas condi��es de uso?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber4" path="ber4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber4" path="ber4" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber4" path="ber4" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ber5"><strong>Existe lact�rio?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber5" path="ber5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber5" path="ber5" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber5" path="ber5" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ber6"><strong>Existe frald�rio?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber6" path="ber6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber6" path="ber6" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber6" path="ber6" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ber7"><strong>Existe risco de acidente no frald�rio?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber7" path="ber7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber7" path="ber7" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber7" path="ber7" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ber8"><strong>H� chuveiro el�trico funcionando no frald�rio?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber8" path="ber8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber8" path="ber8" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ber8" path="ber8" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="berinf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="berinf" name="berinf" type="text" class="form-control" path="berinf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">BANHEIROS</h3>
						<hr>

						<div class="form-group">
							<div class="col-sm-9 formradio">Indique os problemas identificados:</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1a"><strong>Descargas quebradas</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1a" path="ban1a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1a" path="ban1a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1a" path="ban1a" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1b"><strong>Pias quebradas</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1b" path="ban1b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1b" path="ban1b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1b" path="ban1b" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1c"><strong>Torneiras quebradas</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1c" path="ban1c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1c" path="ban1c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1c" path="ban1c" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1d"><strong>Assentos sanit�rios quebrados/inexistentes</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1d" path="ban1d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1d" path="ban1d" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1d" path="ban1d" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1e"><strong>Vasos sanit�rios quebrados/inexistentes</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1e" path="ban1e" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1e" path="ban1e" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1e" path="ban1e" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1f"><strong>M� higieniza��o</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1f" path="ban1f" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1f" path="ban1f" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1f" path="ban1f" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1g"><strong>Pias altas</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1g" path="ban1g" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1g" path="ban1g" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1g" path="ban1g" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1h"><strong>Portas danificadas/inexistentes</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1h" path="ban1h" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1h" path="ban1h" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1h" path="ban1h" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1i"><strong>Piso danificado</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1i" path="ban1i" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1i" path="ban1i" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1i" path="ban1i" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1j"><strong>Paredes danificadas</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1j" path="ban1j" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1j" path="ban1j" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1j" path="ban1j" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1k"><strong>Aus�ncia de piso antiderrapante</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1k" path="ban1k" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1k" path="ban1k" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1k" path="ban1k" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1l"><strong>Vazamento de �gua</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1l" path="ban1l" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1l" path="ban1l" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1l" path="ban1l" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1m"><strong>Retorno de esgoto</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1m" path="ban1m" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1m" path="ban1m" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1m" path="ban1m" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1n"><strong>Vasos em tamanho inadequado</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1n" path="ban1n" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1n" path="ban1n" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1n" path="ban1n" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ban1o"><strong>Banheiro em quantidade insuficiente</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1o" path="ban1o" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1o" path="ban1o" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ban1o" path="ban1o" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ban1outros"><strong>Outros</strong></label>
							<div class="col-sm-4">
								<form:input id="ban1outros" name="ban1outros" type="text" class="form-control" path="ban1outros" />
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="baninf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="baninf" name="baninf" type="text" class="form-control" path="baninf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">ESPA�OS ALTERNATIVOS DE APRENDIZAGEM E LAZER</h3>
						<hr>

						<div class="form-group">
							<div class="col-sm-9 formradio">Identifique os itens existentes:</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eaa1a"><strong>Biblioteca</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1a" path="eaa1a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1a" path="eaa1a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1a" path="eaa1a" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eaa1b"><strong>Espa�o Tecnol�gico</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1b" path="eaa1b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1b" path="eaa1b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1b" path="eaa1b" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eaa1c"><strong>Sala de V�deo</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1c" path="eaa1c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1c" path="eaa1c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1c" path="eaa1c" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eaa1d"><strong>Brinquedoteca</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1d" path="eaa1d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1d" path="eaa1d" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1d" path="eaa1d" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eaa1e"><strong>Quadra</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1e" path="eaa1e" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1e" path="eaa1e" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1e" path="eaa1e" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eaa1f"><strong>P�tio</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1f" path="eaa1f" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1f" path="eaa1f" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1f" path="eaa1f" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eaa1g"><strong>Caixa de areia</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1g" path="eaa1g" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1g" path="eaa1g" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1g" path="eaa1g" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eaa1h"><strong>Parquinho</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1h" path="eaa1h" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1h" path="eaa1h" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1h" path="eaa1h" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eaa1i"><strong>Brinquedos em bom estado</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1i" path="eaa1i" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1i" path="eaa1i" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eaa1i" path="eaa1i" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eaainf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="eaainf" name="eaainf" type="text" class="form-control" path="eaainf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">ACESSIBILIDADE E ATENDIMENTO EDUCACIONAL ESPECIALIZADO</h3>
						<hr>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae1"><strong>Existem crian�as com necessidades especiais diagnosticadas com laudo matriculadas?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae1" path="aae1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae1" path="aae1" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae1" path="aae1" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae2"><strong>Se sim, todas est�o acompanhadas por cuidador em sala de aula?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae2" path="aae2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae2" path="aae2" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae2" path="aae2" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae3"><strong>Existe professor realizando atendimento educacional especializado na unidade?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae3" path="aae3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae3" path="aae3" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae3" path="aae3" value="false" />  N�O</div>
						</div>

						<div class="form-group">
							<div class="col-sm-9 formradio">Indique abaixo as necessidades especiais que englobam os alunos matriculados:</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae4a"><strong>Cadeirante</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4a" path="aae4a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4a" path="aae4a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4a" path="aae4a" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae4b"><strong>Limita��es motoras</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4b" path="aae4b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4b" path="aae4b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4b" path="aae4b" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae4c"><strong>Surdez</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4c" path="aae4c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4c" path="aae4c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4c" path="aae4c" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae4d"><strong>Baixa audi��o</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4d" path="aae4d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4d" path="aae4d" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4d" path="aae4d" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae4e"><strong>Cegueira</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4e" path="aae4e" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4e" path="aae4e" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4e" path="aae4e" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae4f"><strong>Baixa vis�o</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4f" path="aae4f" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4f" path="aae4f" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4f" path="aae4f" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae4g"><strong>Problemas cognitivos/patologias mentais</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4g" path="aae4g" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4g" path="aae4g" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae4g" path="aae4g" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="aae4outros"><strong>Outras</strong></label>
							<div class="col-sm-4">
								<form:input id="aae4outros" name="aae4outros" type="text" class="form-control" path="aae4outros" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae5"><strong>H� rampas no acesso a TODAS as depend�ncias?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae5" path="aae5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae5" path="aae5" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae5" path="aae5" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae6"><strong>H� banheiros infantis plenamente adaptados para cadeirantes?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae6" path="aae6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae6" path="aae6" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae6" path="aae6" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae7"><strong>H� banheiros adultos plenamente adaptados para cadeirantes?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae7" path="aae7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae7" path="aae7" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae7" path="aae7" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae8"><strong>H� piso t�til?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae8" path="aae8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae8" path="aae8" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae8" path="aae8" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae9"><strong>H� placas indicativas em braile na entrada das diferentes depend�ncias?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae9" path="aae9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae9" path="aae9" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae9" path="aae9" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="aae10"><strong>H� Sala de Recursos Multifuncionais na unidade?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae10" path="aae10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae10" path="aae10" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="aae10" path="aae10" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="aaeinf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="aaeinf" name="aaeinf" type="text" class="form-control" path="aaeinf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">SERVI�OS ESSENCIAIS / ESTRUTURA B�SICA</h3>
						<hr>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see1"><strong>H� distribui��o de �gua na institui��o?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see1" path="see1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see1" path="see1" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see1" path="see1" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see1o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see1o" name="see1o" type="text" class="form-control" path="see1o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see2"><strong>A quantidade de reservat�rios supre a demanda?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see2" path="see2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see2" path="see2" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see2" path="see2" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see2o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see2o" name="see2o" type="text" class="form-control" path="see2o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see3"><strong>Foi realizada limpeza dos reservat�rios nos �ltimos seis meses?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see3" path="see3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see3" path="see3" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see3" path="see3" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see3o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see3o" name="see3o" type="text" class="form-control" path="see3o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see4"><strong>H� saneamento b�sico na unidade?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see4" path="see4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see4" path="see4" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see4" path="see4" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see4o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see4o" name="see4o" type="text" class="form-control" path="see4o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see5"><strong>H� falhas na rede el�trica?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see5" path="see5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see5" path="see5" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see5" path="see5" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see5o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see5o" name="see5o" type="text" class="form-control" path="see5o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see6"><strong>H� extintores em condi��es de funcionamento?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see6" path="see6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see6" path="see6" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see6" path="see6" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see6o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see6o" name="see6o" type="text" class="form-control" path="see6o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see7"><strong>H� sa�das de emerg�ncia desobstru�das e sinalizadas?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see7" path="see7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see7" path="see7" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see7" path="see7" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see7o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see7o" name="see7o" type="text" class="form-control" path="see7o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see8"><strong>Houve dedetiza��o nos �ltimos seis meses?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see8" path="see8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see8" path="see8" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see8" path="see8" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see8o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see8o" name="see8o" type="text" class="form-control" path="see8o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see9"><strong>A unidade fica localizada em �rea de encosta ou barreira?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see9" path="see9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see9" path="see9" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see9" path="see9" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see9o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see9o" name="see9o" type="text" class="form-control" path="see9o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see10"><strong>A institui��o � alvo de v�ndalos?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see10" path="see10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see10" path="see10" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see10" path="see10" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see10o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see10o" name="see10o" type="text" class="form-control" path="see10o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see11"><strong>Existem c�meras de seguran�a funcionando?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see11" path="see11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see11" path="see11" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see11" path="see11" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see11o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see11o" name="see11o" type="text" class="form-control" path="see11o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see12"><strong>H� rachaduras?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see12" path="see12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see12" path="see12" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see12" path="see12" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see12o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see12o" name="see12o" type="text" class="form-control" path="see12o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see13"><strong>H� infiltra��es/mofo?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see13" path="see13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see13" path="see13" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see13" path="see13" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see13o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see13o" name="see13o" type="text" class="form-control" path="see13o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see14"><strong>H� goteiras?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see14" path="see14" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see14" path="see14" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see14" path="see14" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see14o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see14o" name="see14o" type="text" class="form-control" path="see14o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="see15"><strong>H� focos de �gua parada na unidade?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see15" path="see15" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see15" path="see15" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="see15" path="see15" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="see15o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="see15o" name="see15o" type="text" class="form-control" path="see15o" />
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="seeinf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="seeinf" name="seeinf" type="text" class="form-control" path="seeinf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">MATERIAIS</h3>
						<hr>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat1"><strong>Os materiais de limpeza suprem a demanda?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat1" path="mat1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat1" path="mat1" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat1" path="mat1" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat1o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat1o" name="mat1o" type="text" class="form-control" path="mat1o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat2"><strong>Os materiais de expediente suprem a demanda?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat2" path="mat2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat2" path="mat2" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat2" path="mat2" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat2o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat2o" name="mat2o" type="text" class="form-control" path="mat2o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat3"><strong>Os materiais de higiene pessoal suprem a demanda?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat3" path="mat3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat3" path="mat3" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat3" path="mat3" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat3o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat3o" name="mat3o" type="text" class="form-control" path="mat3o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat4"><strong>O enxoval supre a demanda?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat4" path="mat4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat4" path="mat4" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat4" path="mat4" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat4o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat4o" name="mat4o" type="text" class="form-control" path="mat4o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat5"><strong>Os colchonetes suprem a demanda e est�o em boas condi��es de uso?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat5" path="mat5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat5" path="mat5" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat5" path="mat5" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat5o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat5o" name="mat5o" type="text" class="form-control" path="mat5o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat6"><strong>Est�o sendo entregues equipamentos de prote��o individual para funcion�rios (luvas e aventais)?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat6" path="mat6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat6" path="mat6" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat6" path="mat6" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat6o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat6o" name="mat6o" type="text" class="form-control" path="mat6o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat7"><strong>Os kits escolares foram entregues em quantidade suficiente para atender � demanda?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat7" path="mat7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat7" path="mat7" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat7" path="mat7" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat7o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat7o" name="mat7o" type="text" class="form-control" path="mat7o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat8"><strong>Os fardamentos foram distribu�dos em quantidade suficiente para atender � demanda?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat8" path="mat8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat8" path="mat8" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat8" path="mat8" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat8o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat8o" name="mat8o" type="text" class="form-control" path="mat8o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat9"><strong>A Prefeitura disponibiliza jogos pedag�gicos?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat9" path="mat9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat9" path="mat9" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat9" path="mat9" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat9o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat9o" name="mat9o" type="text" class="form-control" path="mat9o" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat10"><strong>A Prefeitura envia brinquedos para as crian�as?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat10" path="mat10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat10" path="mat10" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat10" path="mat10" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="mat10o"><strong>Obs:</strong></label>
							<div class="col-sm-4">
								<form:input id="mat10o" name="mat10o" type="text" class="form-control" path="mat10o" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-9 formradio">Indique abaixo os itens audiovisuais existentes e em condi��es de uso:</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat11a"><strong>Aparelho de TV</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11a" path="mat11a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11a" path="mat11a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11a" path="mat11a" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat11b"><strong>Aparelho de DVD</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11b" path="mat11b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11b" path="mat11b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11b" path="mat11b" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat11c"><strong>Aparelho de Som</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11c" path="mat11c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11c" path="mat11c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11c" path="mat11c" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mat11d"><strong>Datashow</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11d" path="mat11d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11d" path="mat11d" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mat11d" path="mat11d" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="matinf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="matinf" name="matinf" type="text" class="form-control" path="matinf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">M�DULO ALIMENTA��O</h3>
						<hr>

						<div class="form-group">
							<div class="col-sm-9 formradio">As perguntas de 1 a 9 avaliam o local onde as refei��es s�o feitas e deve ser usada seguinte escala Likert: 1 = inexistente; 2 = p�ssima; 3 = ruim; 4 = regular; 5 = boa; 6 = �tima.</div>
						</div>

						<div class="form-group">
							<div class="col-sm-9 formradio">Para as perguntas de 10 a 12, usar a escala: 5 = Sempre; 4 = de vez em quando; 3 = indiferente; 2 = raramente; 1 = nunca</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali1"><strong>Onde as crian�as se alimentam? </strong> 
								3 = Refeit�rio; 2 = Outros; 1 = Sala de Aula
								</label>
							<div class="col-sm-4">
								<form:input id="ali1" name="ali1" type="number" class="form-control" path="ali1" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali2"><strong>Quais as condi��es de ilumina��o? </strong>
								1 = entre 200 e 750 lux; 0 = -200 ou +750
								</label>
							<div class="col-sm-4">
								<form:input id="ali2" name="ali2" type="number" class="form-control" path="ali2" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali3"><strong>Quais as condi��es da ventila��o?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali3" name="ali3" type="number" class="form-control" path="ali3" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali4"><strong>Quais as condi��es do espa�o de circula��o?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali4" name="ali4" type="number" class="form-control" path="ali4" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali5"><strong>Quais as condi��es de higiene?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali5" name="ali5" type="number" class="form-control" path="ali5" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali6"><strong>Quais as condi��es do mobili�rio?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali6" name="ali6" type="number" class="form-control" path="ali6" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali7"><strong>Quais as condi��es do bebedouro?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali7" name="ali7" type="number" class="form-control" path="ali7" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali8"><strong>Quais as condi��es dos utens�lios?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali8" name="ali8" type="number" class="form-control" path="ali8" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali9"><strong>Os alimentos est�o sendo recebidos?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali9" name="ali9" type="number" class="form-control" path="ali9" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali10"><strong>Apresentam anormalidades?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali10" name="ali10" type="number" class="form-control" path="ali10" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali11"><strong>O card�pio � adequado � faixa et�ria atendida?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali11" name="ali11" type="number" class="form-control" path="ali11" />
							</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="ali12"><strong>As amostras de alimentos para an�lise est�o sendo recolhidas?</strong></label>
							<div class="col-sm-4">
								<form:input id="ali12" name="ali12" type="number" class="form-control" path="ali12" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ali13"><strong>Os eletrodom�sticos est�o em boas condi��es de uso?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ali13" path="ali13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ali13" path="ali13" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ali13" path="ali13" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="aliinf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="aliinf" name="aliinf" type="text" class="form-control" path="aliinf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">M�DULO LAVANDERIA</h3>
						<hr>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="lav1"><strong>As m�quinas de lavar est�o em quantidade suficiente e em boas condi��es de uso?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav1" path="lav1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav1" path="lav1" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav1" path="lav1" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="lav2"><strong>As secadoras est�o em quantidade suficiente e em boas condi��es de uso?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav2" path="lav2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav2" path="lav2" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav2" path="lav2" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="lav3"><strong>Existem tanques de lavar roupas?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav3" path="lav3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav3" path="lav3" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav3" path="lav3" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="lav4"><strong>Existem varais?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav4" path="lav4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav4" path="lav4" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav4" path="lav4" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="lav5"><strong>Existem arm�rios em quantidade suficiente e em boas condi��es de uso?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav5" path="lav5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav5" path="lav5" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="lav5" path="lav5" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="lavinf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="lavinf" name="lavinf" type="text" class="form-control" path="lavinf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">M�DULO ADMINISTRATIVO</h3>
						<hr>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm1"><strong>H� sala de professores?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm1" path="adm1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm1" path="adm1" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm1" path="adm1" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm2"><strong>Se sim, a temperatura do ambiente est� entre 20 e 26�C?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm2" path="adm2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm2" path="adm2" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm2" path="adm2" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm3"><strong>Se sim, a luminosidade da depend�ncia est� entre 200 e 750Lux?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm3" path="adm3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm3" path="adm3" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm3" path="adm3" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm4"><strong>Dire��o, secretaria e coordena��o funcionam na mesma sala?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm4" path="adm4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm4" path="adm4" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm4" path="adm4" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm5"><strong>Se sim, h� espa�o para que eles funcionem confortavelmente?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm5" path="adm5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm5" path="adm5" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm5" path="adm5" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm6"><strong>Se sim, a temperatura do ambiente est� entre 20 e 26�C?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm6" path="adm6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm6" path="adm6" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm6" path="adm6" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm7"><strong>Se sim, a luminosidade da depend�ncia est� entre 200 e 750Lux?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm7" path="adm7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm7" path="adm7" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm7" path="adm7" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm8"><strong>Se n�o, a sala da dire��o tem temperatura ambiente entre 20 e 26�C?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm8" path="adm8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm8" path="adm8" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm8" path="adm8" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm9"><strong>Se n�o, a luminosidade da dire��o est� entre 200 e 750Lux?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm9" path="adm9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm9" path="adm9" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm9" path="adm9" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm10"><strong>Se n�o, a sala da secretaria tem temperatura ambiente entre 20 e 26�C?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10" path="adm10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10" path="adm10" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10" path="adm10" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm11"><strong>Se n�o, a luminosidade da secretaria est� entre 200 e 750Lux?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11" path="adm11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11" path="adm11" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11" path="adm11" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm12"><strong>Se n�o, a sala da coordena��o tem temperatura ambiente entre 20 e 26�C?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm12" path="adm12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm12" path="adm12" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm12" path="adm12" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm13"><strong>Se n�o, a luminosidade da coordena��o est� entre 200 e 750Lux?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm13" path="adm13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm13" path="adm13" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm13" path="adm13" value="false" />  N�O</div>
						</div>

						<!-- Number input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="adm14"><strong>Qual a condi��o do mobili�rio das salas administrativas? Use a escala Likert  </strong></label>
							<div class="col-sm-4">
								<form:input id="adm14" name="adm14" type="number" class="form-control" path="adm14" />
							</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm15"><strong>O corpo administrativo-pedag�gico conta com computadores em condi��es de funcionamento?	Sim	N�o</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm15" path="adm15" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm15" path="adm15" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm15" path="adm15" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm16"><strong>A unidade disp�e de copiadora?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm16" path="adm16" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm16" path="adm16" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm16" path="adm16" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm17"><strong>A linha telef�nica da unidade funciona normalmente?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm17" path="adm17" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm17" path="adm17" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm17" path="adm17" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm18"><strong>O servi�o de internet � garantido na institui��o?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm18" path="adm18" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm18" path="adm18" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm18" path="adm18" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm19"><strong>O di�rio online est� sendo utilizado sem transtornos?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm19" path="adm19" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm19" path="adm19" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm19" path="adm19" value="false" />  N�O</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="adminf"><strong>Mais informa��es:</strong></label>
							<div class="col-sm-4">
								<form:input id="adminf" name="adminf" type="text" class="form-control" path="adminf" />
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">M�DULO SA�DE</h3>
						<hr>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau1"><strong>A creche possui c�pias dos cart�es de vacina��o das crian�as?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau1" path="sau1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau1" path="sau1" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau1" path="sau1" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau2"><strong>O posto de sa�de da comunidade realiza acompanhamento m�dico e odontol�gico na unidade?	Sim	N�o</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau2" path="sau2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau2" path="sau2" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau2" path="sau2" value="false" />  N�O</div>
						</div>

						<div class="form-group">
							<div class="col-sm-9 formradio">Identifique os itens que correspondem a doen�as que afetaram alunos e funcion�rios no ano corrente:</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau3a"><strong>Piolho</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3a" path="sau3a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3a" path="sau3a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3a" path="sau3a" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau3b"><strong>C�rie</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3b" path="sau3b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3b" path="sau3b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3b" path="sau3b" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau3c"><strong>Verminoses</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3c" path="sau3c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3c" path="sau3c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3c" path="sau3c" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau3d"><strong>Dermatites</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3d" path="sau3d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3d" path="sau3d" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3d" path="sau3d" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau3e"><strong>Hansen�ase</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3e" path="sau3e" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3e" path="sau3e" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3e" path="sau3e" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau3f"><strong>Dengue</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3f" path="sau3f" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3f" path="sau3f" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3f" path="sau3f" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau3g"><strong>Zika</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3g" path="sau3g" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3g" path="sau3g" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3g" path="sau3g" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau3h"><strong>Febre chikungunya</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3h" path="sau3h" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3h" path="sau3h" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3h" path="sau3h" value="false" />  N�O</div>
						</div>

						<!-- RadioButton -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sau3i"><strong>Conjuntivite</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3i" path="sau3i" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3i" path="sau3i" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sau3i" path="sau3i" value="false" />  N�O</div>
						</div>

						<hr>

						<!-- Button -->
						<div class="form-group">
							<div class="col-sm-7">
								<div class="pull-right">
									<button id="arquivar" class="btn btn-default" title="Deixa de exibir na lista (pode ser recuperada posteriormente)">Arquivar</button>
									<button id="cancelar" class="btn btn-default" title="Limpa o formul�rio">Cancelar</button>
									<button id="gravar" type="submit" name="gravar" class="btn btn-primary">Gravar</button>
								</div>
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/views/assets/js/ie10-viewport-bug-workaround.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap-dialog.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/dropzone.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/app.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/VistoriaCrecheForm.js"></script>

</body>

</html>