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
				<form:form class="form-horizontal" action="salvaVisita" method="POST" enctype="multipart/form-data">
					<fieldset>

						<!-- Form Name -->
						<h1>Visita</h1>

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
							<form:label class="col-sm-3 control-label" path="escola.id"><strong>Escola</strong></form:label>
							<div class="col-sm-4">
								<form:select path="escola.id" class="form-control">
									<c:forEach items="${escolas}" var="escola">
										<option value="${escola.id}">${escola.nome}</option>
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
							<form:label class="col-sm-3 control-label" path="idebVisivel"><strong>IDEB em local vis�vel?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="idebVisivel" path="idebVisivel" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="idebVisivel" path="idebVisivel" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="idebVisivel" path="idebVisivel" value="false" />  N�O</div>
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
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="turnoVisita"><strong>Turno da visita:</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="turnoVisita" path="turnoVisita" value="manha" /> Manh�</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="turnoVisita" path="turnoVisita" value="null" /> </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="turnoVisita" path="turnoVisita" value="tarde" /> Tarde</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="chuva"><strong>Enfrenta problemas em dias de chuva?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="chuva" path="chuva" value="true" /> SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="chuva" path="chuva" value="null" /> </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="chuva" path="chuva" value="false" /> N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="problemasChuva"><strong>Se sim, quais?</strong></label>
							<div class="col-sm-4">
								<form:input id="problemasChuva" name="problemasChuva" type="text" class="form-control" path="problemasChuva" />
							</div>
						</div>
						<!-- CheckBox Switch -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="atualizacao"><strong>� uma vistoria apenas de atualiza��o?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="atualizacao" path="atualizacao" value="true" />  SIM
							</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="atualizacao" path="atualizacao" value="false" />  N�O
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">1 - M�DULO DE SALAS DE AULA</h3>
						<hr>
						Instru��es: Prezado(a) pesquisador(a), n�o deixar c�lulas em branco. Caso n�o haja informa��o dispon�vel, marcar NI. Caso a pergunta n�o se aplique, marcar NA. 
						<hr>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa1"><strong>SA1</strong> - Quantos alunos est�o matriculados (TOTAL)?</label>
							<div class="col-sm-4">
								<form:input id="sa1" name="sa1" type="text" class="form-control" path="sa1" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa2"><strong>SA2</strong> - Quantas salas de aula h� na escola?</label>
							<div class="col-sm-4">
								<form:input id="sa2" name="sa2" type="text" class="form-control" path="sa2" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa3"><strong>SA3</strong> - H� quantos turnos de aula?</label>
							<div class="col-sm-4">
								<form:input id="sa3" name="sa3" type="text" class="form-control" path="sa3" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa4a"><strong>SA4a</strong> - Qual a temperatura mais alta em sala de aula?</label>
							<div class="col-sm-4">
								<form:input id="sa4a" name="sa4a" type="text" class="form-control" path="sa4a" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa4b"><strong>SA4b</strong> - Quantas salas possuem temperatura entre de 23�C e 26�C?</label>
							<div class="col-sm-4">
								<form:input id="sa4b" name="sa4b" type="text" class="form-control" path="sa4b" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa5a"><strong>SA5a</strong> - Qual a luminosidade mais baixa em sala de aula?</label>
							<div class="col-sm-4">
								<form:input id="sa5a" name="sa5a" type="text" class="form-control" path="sa5a" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa5b"><strong>SA5b</strong> - Quantas salas a ilumina��o est� abaixo de 200 ou acima de 750 lux?</label>
							<div class="col-sm-4">
								<form:input id="sa5b" name="sa5b" type="text" class="form-control" path="sa5b" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa6"><strong>SA6</strong> - Quantas salas s�o climatizadas?</label>
							<div class="col-sm-4">
								<form:input id="sa6" name="sa6" type="text" class="form-control" path="sa6" />
								Obs: Para as que n�o forem climatizadas, observar se s�o ventiladas. O valor dessa linha e o da pr�xima n�o podem exceder a quantidade de salas de aula.
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa7"><strong>SA7</strong> - Quantas salas s�o bem ventiladas?</label>
							<div class="col-sm-4">
								<form:input id="sa7" name="sa7" type="text" class="form-control" path="sa7" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa8"><strong>SA8</strong> - Quantas salas possuem bom espa�o para circula��o?</label>
							<div class="col-sm-4">
								<form:input id="sa8" name="sa8" type="text" class="form-control" path="sa8" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa9"><strong>SA9</strong> - Quantas salas possuem lousas conservadas?</label>
							<div class="col-sm-4">
								<form:input id="sa9" name="sa9" type="text" class="form-control" path="sa9" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa10"><strong>SA10</strong> - Qual o aspecto de conserva��o do mobili�rio em sala de aula? Use a escala Likert*?</label>
							<div class="col-sm-4">
								<form:input id="sa10" name="sa10" type="text" class="form-control" path="sa10" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa11"><strong>SA11</strong> - Quantas salas possuem janelas?</label>
							<div class="col-sm-4">
								<form:input id="sa11" name="sa11" type="text" class="form-control" path="sa11" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-3">
								*ESCALA LIKERT:<br/>
								1 = N�o h� mobili�rio;<br/>
								2 = Mal conservados;<br/>
								3 = Nem bem nem mal conservados;<br/>
								4 = Bem conservados;<br/>
								5 = Muito bem conservados.<br/>
							</div>
						</div>
						
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes1" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes1" name="anotacoes1" class="form-control" path="anotacoes1" />
							</div>
						</div>
						<hr>
						<h3 style="text-align: center;">1A - M�DULO ESPECIAL DE ENSINO E EDUCA��O ESPECIAL</h3>
						<hr>

						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1a"><strong>EEE1</strong></form:label>
							<div class="col-sm-9 formradio"> - Quais o n�veis/modalidades de ensino oferecidos?</div>
						</div>

						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1a"><strong>Educa��o infantil</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1a" path="eee1a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1a" path="eee1a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1a" path="eee1a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1b"><strong>Ensino fundamental I</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1b" path="eee1b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1b" path="eee1b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1b" path="eee1b" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1c"><strong>Ensino fundamental II</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1c" path="eee1c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1c" path="eee1c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1c" path="eee1c" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1d"><strong>EJA</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1d" path="eee1d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1d" path="eee1d" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1d" path="eee1d" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1e"><strong>PROJOVEM</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1e" path="eee1e" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1e" path="eee1e" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1e" path="eee1e" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1f"><strong>Li��o de vida</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1f" path="eee1f" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1f" path="eee1f" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1f" path="eee1f" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1g"><strong>Acelera</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1g" path="eee1g" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1g" path="eee1g" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1g" path="eee1g" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1h"><strong>Se liga!</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1h" path="eee1h" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1h" path="eee1h" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1h" path="eee1h" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1i"><strong>Outros</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1i" path="eee1i" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1i" path="eee1i" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1i" path="eee1i" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eee2"><strong>EEE2</strong> - Quantidade de professores em sala</label>
							<div class="col-sm-4">
								<form:input id="eee2" name="eee2" type="text" class="form-control" path="eee2" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eee3"><strong>EEE3</strong> - Quantidade de professores que acumulam</label>
							<div class="col-sm-4">
								<form:input id="eee3" name="eee3" type="text" class="form-control" path="eee3" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eee4"><strong>EEE4</strong> - Quantidade de professores readaptados</label>
							<div class="col-sm-4">
								<form:input id="eee4" name="eee4" type="text" class="form-control" path="eee4" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eee5"><strong>EEE5</strong> - Quantidade de professores com dois contratos</label>
							<div class="col-sm-4">
								<form:input id="eee5" name="eee5" type="text" class="form-control" path="eee5" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eee6"><strong>EEE6</strong> - H� defici�ncia no quadro de funcion�rios? Quais?</label>
							<div class="col-sm-4">
								<form:input id="eee6" name="eee6" type="text" class="form-control" path="eee6" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eee7"><strong>EEE7</strong> - Quantos alunos com defici�ncia COM LAUDO m�dico est�o matriculados?</label>
							<div class="col-sm-4">
								<form:input id="eee7" name="eee7" type="text" class="form-control" path="eee7" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eee8"><strong>EEE8</strong> - Quantas crian�as est�o SEM acompanhamento de cuidador/int�rprete em sala de aula?</label>
							<div class="col-sm-4">
								<form:input id="eee8" name="eee8" type="text" class="form-control" path="eee8" />
							</div>
						</div>

						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes1a" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes1a" name="anotacoes1a" class="form-control" path="anotacoes1a" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">2 - M�DULO BIBLIOTECA</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib1"><strong>BIB1</strong> - Existe Biblioteca?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib1" path="bib1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib1" path="bib1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib1" path="bib1" value="false" />  N�O</div>
							<div class="col-sm-8 col-sm-offset-3">Obs: Caso a resposta seja n�o, v� para o pr�ximo m�dulo.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib2"><strong>BIB2</strong> - � aberta aos alunos fora do hor�rio de aula?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib2" path="bib2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib2" path="bib2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib2" path="bib2" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib3"><strong>BIB3</strong> - � climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib3" path="bib3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib3" path="bib3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib3" path="bib3" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib4"><strong>BIB4</strong> - � bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib4" path="bib4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib4" path="bib4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib4" path="bib4" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib5"><strong>BIB5</strong> - Tem espa�o para movimenta��o?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib5" path="bib5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib5" path="bib5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib5" path="bib5" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib6"><strong>BIB6</strong> - Tem televisor?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib6" path="bib6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib6" path="bib6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib6" path="bib6" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib8"><strong>BIB8</strong> - Tem aparelho de som?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib8" path="bib8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib8" path="bib8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib8" path="bib8" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib9"><strong>BIB9</strong> - Tem computador com acesso � internet?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib9" path="bib9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib9" path="bib9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib9" path="bib9" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib12"><strong>BIB12</strong> - Possui mediador de leitura?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib12" path="bib12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib12" path="bib12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib12" path="bib12" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="bib13"><strong>BIB13</strong> - Qual a forma��o do mediador(a) de leitura?</label>
							<div class="col-sm-4">
								<form:input id="bib13" name="bib13" type="text" class="form-control" path="bib13" />
								1 = N�vel m�dio;<br/>
								2 = Superior incompleto;<br/>
								3 = Superior completo.
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib14"><strong>BIB14</strong> - A sala possui janelas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib14" path="bib14" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib14" path="bib14" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib14" path="bib14" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes2" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes2" name="anotacoes2" class="form-control" path="anotacoes2" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">4 - M�DULO ESPA�O TECNOL�GICO</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="et1"><strong>ET1</strong> - Existe Espa�o Tecnol�gico?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et1" path="et1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et1" path="et1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et1" path="et1" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Caso a resposta seja n�o, v� para o pr�ximo m�dulo.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="et2"><strong>ET2</strong> - � climatizado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et2" path="et2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et2" path="et2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et2" path="et2" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se for climatizado, pule a pr�xima pergunta.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="et3"><strong>ET3</strong> - � bem ventilado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et3" path="et3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et3" path="et3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et3" path="et3" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="et4"><strong>ET4</strong> - H� suporte t�cnico da Prefeitura?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et4" path="et4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et4" path="et4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et4" path="et4" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="et5"><strong>ET5</strong> - H� aulas de interatividade tecnol�gica?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et5" path="et5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et5" path="et5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et5" path="et5" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="et6"><strong>ET6</strong> - Quantas mesas interativas h� no laborat�rio?</label>
							<div class="col-sm-4">
								<form:input id="et6" name="et6" type="text" class="form-control" path="et6" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="et7"><strong>ET7</strong> - Quantas mesas interativas funcionam?</label>
							<div class="col-sm-4">
								<form:input id="et7" name="et7" type="text" class="form-control" path="et7" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="et8"><strong>ET8</strong> - Quantas mesas interativas tem acesso � internet?</label>
							<div class="col-sm-4">
								<form:input id="et8" name="et8" type="text" class="form-control" path="et8" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="et9"><strong>ET9</strong> - H� monitor(a) / instrutor(a)?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et9" path="et9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et9" path="et9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et9" path="et9" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se a resposta for n�o, v� para o pr�ximo m�dulo</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="et10"><strong>ET10</strong> - Qual a forma��o do(a) Monitor(a) / Instrutor(a)?</label>
							<div class="col-sm-4">
								<form:input id="et10" name="et10" type="text" class="form-control" path="et10" />
								1 = Na �rea de inform�tica;<br/>
								0 = Em outra �rea.
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="et11"><strong>ET11</strong> - A sala possui janelas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et11" path="et11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et11" path="et11" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="et11" path="et11" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes4" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes4" name="anotacoes4" class="form-control" path="anotacoes4" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">5 - M�DULO RECREA��O E LAZER</h3>
						<hr>
						Para as perguntas de estado de conserva��o use os valores:<br/>
						3 = bom;<br/>
						2 = regular;<br/>
						1 = ruim.<br/>
						Caso n�o haja o local, marque zero.
						<hr>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl1"><strong>RL1</strong> - Qual o estado de conserva��o do piso?</label>
							<div class="col-sm-4">
								<form:input id="rl1" name="rl1" type="text" class="form-control" path="rl1" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl2"><strong>RL2</strong> - Qual o estado de conserva��o do parque?</label>
							<div class="col-sm-4">
								<form:input id="rl2" name="rl2" type="text" class="form-control" path="rl2" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl3"><strong>RL3</strong> - Qual o estado de conserva��o da quadra?</label>
							<div class="col-sm-4">
								<form:input id="rl3" name="rl3" type="text" class="form-control" path="rl3" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl4"><strong>RL4</strong> - Qual o estado de conserva��o dos brinquedos?</label>
							<div class="col-sm-4">
								<form:input id="rl4" name="rl4" type="text" class="form-control" path="rl4" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl5"><strong>RL5</strong> - Como � o espa�o de circula��o dos corredores?</label>
							<div class="col-sm-4">
								<form:input id="rl5" name="rl5" type="text" class="form-control" path="rl5" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="rl6"><strong>RL6</strong> - H� risco de acidente?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="rl6" path="rl6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="rl6" path="rl6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="rl6" path="rl6" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes5" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-3">
								<form:textarea id="anotacoes5" name="anotacoes5" class="form-control" path="anotacoes5" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">6 - M�DULO ACESSIBILIDADE</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace1"><strong>ACE1</strong> - H� alunos com defici�ncia motora ou com dificuldades de locomo��o?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace1" path="ace1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace1" path="ace1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace1" path="ace1" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace2"><strong>ACE2</strong> - H� alunos com defici�ncia auditiva ou defici�ncia da fala?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace2" path="ace2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace2" path="ace2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace2" path="ace2" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace3"><strong>ACE3</strong> - H� alunos com defici�ncia visual ou com vis�o limitada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace3" path="ace3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace3" path="ace3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace3" path="ace3" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace4"><strong>ACE4</strong> - H� alunos com defici�ncia intelectual ou Transtorno do Espectro Autista?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace4" path="ace4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace4" path="ace4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace4" path="ace4" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace5"><strong>ACE5</strong> - A escola disp�e de rampas de acesso para acessibilidade para todos os espa�os dos alunos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace5" path="ace5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace5" path="ace5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace5" path="ace5" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace6"><strong>ACE6</strong> - A escola disp�e de piso t�til?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace6" path="ace6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace6" path="ace6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace6" path="ace6" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace8"><strong>ACE8</strong> - A escola disp�e de tutores ou int�rpretes (libras)?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace8" path="ace8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace8" path="ace8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace8" path="ace8" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace9"><strong>ACE9</strong> - Na escola h� sala com recursos multifuncionais?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace9" path="ace9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace9" path="ace9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace9" path="ace9" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace10"><strong>ACE10</strong> - H� professores com forma��o em A.E.E. ou psicopedagogia para atender as crian�as com defici�ncia?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace10" path="ace10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace10" path="ace10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace10" path="ace10" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes6" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes6" name="anotacoes6" class="form-control" path="anotacoes6" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">6A - M�DULO ESPECIAL DE ACESSIBILIDADE</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac1"><strong>EAC1</strong> - H� placas indicativas em braile?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac1" path="eac1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac1" path="eac1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac1" path="eac1" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac2"><strong>EAC2</strong> - Os banheiros est�o plenamente adaptados para cadeirantes?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac2" path="eac2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac2" path="eac2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac2" path="eac2" value="false" />  N�O</div>
						</div>
						<hr>
						EM RELA��O � SALA DE RECURSOS MULTIFUNCIONAIS:
						<hr>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac3a"><strong>EAC3a</strong> - A �rea para circula��o � satisfat�ria?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3a" path="eac3a" value="true" />  SIM</div>
								<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3a" path="eac3a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3a" path="eac3a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac3b"><strong>EAC3b</strong> - Os equipamentos eletr�nicos atendem �s necessidades?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3b" path="eac3b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3b" path="eac3b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3b" path="eac3b" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac3c"><strong>EAC3c</strong> - A mob�lia atende �s necessidades?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3c" path="eac3c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3c" path="eac3c" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3c" path="eac3c" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac3d"><strong>EAC3d</strong> - Os materiais adaptados atendem �s necessidades?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3d" path="eac3d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3d" path="eac3d" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3d" path="eac3d" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes6a" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes6a" name="anotacoes6a" class="form-control" path="anotacoes6a" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">7 - M�DULO SERVI�OS ESSENCIAIS</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se1"><strong>SE1</strong> - H� distribui��o de �gua na escola?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se1" path="se1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se1" path="se1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se1" path="se1" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se2"><strong>SE2</strong> - H� saneamento b�sico na escola?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se2" path="se2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se2" path="se2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se2" path="se2" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se3"><strong>SE3</strong> - H� extintores de inc�ndio em condi��es de funcionamento?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se3" path="se3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se3" path="se3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se3" path="se3" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se4"><strong>SE4</strong> - Os funcion�rios sabem usar o extintor?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se4" path="se4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se4" path="se4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se4" path="se4" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eef5"><strong>EEF5</strong> - Quantidade de extintores:</label>
							<div class="col-sm-4">
								<form:input id="eef5" name="eef5" type="text" class="form-control" path="eef5" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eef6"><strong>EEF6</strong> - Quantos est�o fora do prazo de validade?</label>
							<div class="col-sm-4">
								<form:input id="eef6" name="eef6" type="text" class="form-control" path="eef6" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se5"><strong>SE5</strong> - H� infiltra��es e/ou mofo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se5" path="se5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se5" path="se5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se5" path="se5" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se6"><strong>SE6</strong> - H� rachaduras?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se6" path="se6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se6" path="se6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se6" path="se6" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se7"><strong>SE7</strong> - H� problemas na rede el�tricas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se7" path="se7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se7" path="se7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se7" path="se7" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes7" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes7" name="anotacoes7" class="form-control" path="anotacoes7" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">7A - M�DULO ESPECIAL ESTRUTURA F�SICA</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef1"><strong>EEF1</strong> - O entorno da unidade � violento?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef1" path="eef1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef1" path="eef1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef1" path="eef1" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef2"><strong>EEF2</strong> - H� vigilantes em todos os turnos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef2" path="eef2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef2" path="eef2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef2" path="eef2" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef3"><strong>EEF3</strong> - O pr�dio � alvo de v�ndalos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef3" path="eef3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef3" path="eef3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef3" path="eef3" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eef3a"><strong>EEF3a</strong> - Se sim, como?</label>
							<div class="col-sm-4">
								<form:input id="eef3a" name="eef3a" type="text" class="form-control" path="eef3a" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef4"><strong>EEF4</strong> - O pr�dio possui c�meras de seguran�a?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4" path="eef4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4" path="eef4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4" path="eef4" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef4a"><strong>EEF4a</strong> - Elas est�o funcionando?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4a" path="eef4a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4a" path="eef4a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4a" path="eef4a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef7"><strong>EEF7</strong> - H� sa�das de emerg�ncia?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7" path="eef7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7" path="eef7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7" path="eef7" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef7a"><strong>EEF7a</strong> - Se sim, est�o sinalizadas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7a" path="eef7a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7a" path="eef7a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7a" path="eef7a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef8"><strong>EEF8</strong> - A escola fica em �rea de encosta ou barreira?</form:label>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="eef8" path="eef8" value="encosta" />  ENCOSTA</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef8" path="eef8" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="eef8" path="eef8" value="barreira" />  BARREIRA</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eef9"><strong>EEF9</strong> - Se a �gua costuma faltar, indique quantos dias:</label>
							<div class="col-sm-4">
								<form:input id="eef9" name="eef9" type="text" class="form-control" path="eef9" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eef10"><strong>EEF10</strong> - Quantos dias o caminh�o pipa demora a abastecer?</label>
							<div class="col-sm-4">
								<form:input id="eef10" name="eef10" type="text" class="form-control" path="eef10" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef10a"><strong>EEF10a</strong> - A limpeza dos reservat�rios tem sido feita?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef10a" path="eef10a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef10a" path="eef10a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef10a" path="eef10a" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eef10b"><strong>EEF10b</strong> - Qual o intervalo de limpeza dos reservat�rios?</label>
							<div class="col-sm-4">
								<form:input id="eef10b" name="eef10b" type="text" class="form-control" path="eef10b" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef11"><strong>EEF11</strong> - A quantidade de reservat�rios supre a demanda?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef11" path="eef11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef11" path="eef11" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef11" path="eef11" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef12"><strong>EEF12</strong> - Existe espa�o reservado para dep�sito de lixo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef12" path="eef12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef12" path="eef12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef12" path="eef12" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef13"><strong>EEF13</strong> - Existe espa�o reservado para armazenamento de botij�o de g�s?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef13" path="eef13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef13" path="eef13" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef13" path="eef13" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef14"><strong>EEF14</strong> - A quantidade de almoxarifados supre a demanda?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef14" path="eef14" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef14" path="eef14" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef14" path="eef14" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef15"><strong>EEF15</strong> - A PCR atendeu �s solicita��es de coleta de entulhos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef15" path="eef15" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef15" path="eef15" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef15" path="eef15" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef16"><strong>EEF16</strong> - O pr�dio foi dedetizado h� mais de seis meses?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef16" path="eef16" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef16" path="eef16" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef16" path="eef16" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef17"><strong>EEF17</strong> - O material de limpeza enviado pela PCR atende � demanda?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef17" path="eef17" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef17" path="eef17" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef17" path="eef17" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes7a" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes7a" name="anotacoes7a" class="form-control" path="anotacoes7a" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">8 - M�DULO SALA DOS PROFESSORES</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp1"><strong>SP1</strong> - H� sala de professores?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp1" path="sp1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp1" path="sp1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp1" path="sp1" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Caso a resposta marcada seja N�O, pule para o pr�ximo m�dulo.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp2"><strong>SP2</strong> - Possui computadores?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp2" path="sp2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp2" path="sp2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp2" path="sp2" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp3"><strong>SP3</strong> - Possui acesso � internet?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp3" path="sp3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp3" path="sp3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp3" path="sp3" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp4"><strong>SP4</strong> - Possui arm�rios?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp4" path="sp4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp4" path="sp4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp4" path="sp4" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp5"><strong>SP5</strong> - � climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp5" path="sp5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp5" path="sp5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp5" path="sp5" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se a resposta for SIM, pule a pr�xima pergunta.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp6"><strong>SP6</strong> - � bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp6" path="sp6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp6" path="sp6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp6" path="sp6" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp7"><strong>SP7</strong> - H� mesas e cadeiras?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp7" path="sp7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp7" path="sp7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp7" path="sp7" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp8"><strong>SP8</strong> - A ilumina��o est� abaixo de 200 lux?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp8" path="sp8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp8" path="sp8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp8" path="sp8" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp9"><strong>SP9</strong> - H� espa�o para circula��o?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp9" path="sp9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp9" path="sp9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp9" path="sp9" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp10"><strong>SP10</strong> - A sala possui janelas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp10" path="sp10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp10" path="sp10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp10" path="sp10" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes8" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes8" name="anotacoes8" class="form-control" path="anotacoes8" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">9 - M�DULO ADMINISTRA��O</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm1"><strong>ADM1</strong> - Dire��o, Secretaria e Coordena��o funcionam na mesma sala?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm1" path="adm1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm1" path="adm1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm1" path="adm1" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Caso marque N�O, pule a pr�xima pergunta.<br/>
									Marcando SIM, responda sobre climatiza��o, ventila��o e circula��o separadamente.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm2"><strong>ADM2</strong> - Se SIM, h� espa�o que lhes permita funcionar confortavelmente?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm2" path="adm2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm2" path="adm2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm2" path="adm2" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm3"><strong>ADM3</strong> - Possui computadores?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm3" path="adm3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm3" path="adm3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm3" path="adm3" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm4"><strong>ADM4</strong> - Possui acesso � internet?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm4" path="adm4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm4" path="adm4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm4" path="adm4" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm5"><strong>ADM5</strong> - Tem impressora?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm5" path="adm5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm5" path="adm5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm5" path="adm5" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm6"><strong>ADM6</strong> - Tem copiadora?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm6" path="adm6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm6" path="adm6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm6" path="adm6" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm7"><strong>ADM7</strong> - Possui arm�rios?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm7" path="adm7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm7" path="adm7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm7" path="adm7" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm8"><strong>ADM8</strong> - Possui mesas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm8" path="adm8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm8" path="adm8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm8" path="adm8" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm9"><strong>ADM9</strong> - Possui cadeiras?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm9" path="adm9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm9" path="adm9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm9" path="adm9" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm10"><strong>ADM10</strong> - O espa�o � climatizado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10" path="adm10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10" path="adm10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10" path="adm10" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se marcou SIM, pule para pergunta pergunta ADM12.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm10a"><strong>ADM10a</strong> - A sala da Dire��o � climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10a" path="adm10a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10a" path="adm10a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10a" path="adm10a" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se marcar SIM, n�o responda a pergunta ADM11a.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm10b"><strong>ADM10b</strong> - A sala da Secretaria � climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10b" path="adm10b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10b" path="adm10b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10b" path="adm10b" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se marcar SIM, n�o responda a pergunta ADM11b.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm10c"><strong>ADM10c</strong> - A sala da Coordena��o � climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10c" path="adm10c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10c" path="adm10c" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10c" path="adm10c" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se marcar SIM, n�o responda a pergunta ADM11c.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm11"><strong>ADM11</strong> - O espa�o � bem ventilado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11" path="adm11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11" path="adm11" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11" path="adm11" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm11a"><strong>ADM11a</strong> - A sala da Dire��o � bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11a" path="adm11a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11a" path="adm11a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11a" path="adm11a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm11b"><strong>ADM11b</strong> - A sala da Secretaria � bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11b" path="adm11b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11b" path="adm11b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11b" path="adm11b" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm11c"><strong>ADM11c</strong> - A sala da Coordena��o � bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11c" path="adm11c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11c" path="adm11c" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11c" path="adm11c" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm12"><strong>ADM12</strong> - H� espa�o para circula��o?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm12" path="adm12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm12" path="adm12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm12" path="adm12" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm13"><strong>ADM13</strong> - A ilumina��o est� abaixo de 200 lux?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm13" path="adm13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm13" path="adm13" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm13" path="adm13" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm14"><strong>ADM14</strong> - Caso seja um espa�o compartilhado, a sala possui janelas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14" path="adm14" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14" path="adm14" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14" path="adm14" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm14a"><strong>ADM14a</strong> - A sala da Dire��o possui janelas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14a" path="adm14a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14a" path="adm14a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14a" path="adm14a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm14b"><strong>ADM14b</strong> - A sala da Secretaria possui janelas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14b" path="adm14b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14b" path="adm14b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14b" path="adm14b" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm14c"><strong>ADM14c</strong> - A sala da Coordena��o possui janelas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14c" path="adm14c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14c" path="adm14c" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm14c" path="adm14c" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes9" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes9" name="anotacoes9" class="form-control" path="anotacoes9" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">10 - M�DULO ALIMENTA��O</h3>
						<hr>
						As perguntas ALIM2 a ALIM8 avaliam o local onde as refei��es s�o feitas e deve ser usada seguinte escala Likert:<br>
						1 = inexistente;<br>
						2 = p�ssima;<br>
						3 = ruim;<br>
						4 = regular;<br>
						5 = boa;<br>
						6 = �tima.<br>
						<br>
						Para as perguntas ALIM9 a ALIM12 usar a escala:<br>
						5 = Sempre;<br>
						4 = de vez em quando;<br>
						3 = indiferente;<br>
						2 = raramente;<br>
						1 = nunca.
						<hr>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim1"><strong>ALIM1</strong> - Onde as crian�as se alimentam?</label>
							<div class="col-sm-4">
								<form:input id="alim1" name="alim1" type="text" class="form-control" path="alim1" />
								3 = Refeit�rio;<br>
								2 = Outros;<br>
								1 = Sala de Aula.
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim2"><strong>ALIM2</strong> - Quais as condi��es de ilumina��o?</label>
							<div class="col-sm-4">
								<form:input id="alim2" name="alim2" type="text" class="form-control" path="alim2" />
								1 = entre 200 e 750 Lux<br>
								0 = < 200 ou > 750 Lux
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim3"><strong>ALIM3</strong> - Quais as condi��es da ventila��o?</label>
							<div class="col-sm-4">
								<form:input id="alim3" name="alim3" type="text" class="form-control" path="alim3" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="alim3a"><strong>ALIM3a</strong> - Caso seja um ambiente fechado, possui janelas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim3a" path="alim3a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim3a" path="alim3a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim3a" path="alim3a" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim4"><strong>ALIM4</strong> - Quais as condi��es do espa�o de circula��o?</label>
							<div class="col-sm-4">
								<form:input id="alim4" name="alim4" type="text" class="form-control" path="alim4" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim5"><strong>ALIM5</strong> - Quais as condi��es de higiene?</label>
							<div class="col-sm-4">
								<form:input id="alim5" name="alim5" type="text" class="form-control" path="alim5" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim6"><strong>ALIM6</strong> - Quais as condi��es do mobili�rio?</label>
							<div class="col-sm-4">
								<form:input id="alim6" name="alim6" type="text" class="form-control" path="alim6" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim7"><strong>ALIM7</strong> - Quais as condi��es do bebedouro?</label>
							<div class="col-sm-4">
								<form:input id="alim7" name="alim7" type="text" class="form-control" path="alim7" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim8"><strong>ALIM8</strong> - Quais as condi��es dos utens�lios?</label>
							<div class="col-sm-4">
								<form:input id="alim8" name="alim8" type="text" class="form-control" path="alim8" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim9"><strong>ALIM9</strong> - A merenda � recebida?</label>
							<div class="col-sm-4">
								<form:input id="alim9" name="alim9" type="text" class="form-control" path="alim9" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim10"><strong>ALIM10</strong> - Apresenta anormalidades?</label>
							<div class="col-sm-4">
								<form:input id="alim10" name="alim10" type="text" class="form-control" path="alim10" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim11"><strong>ALIM11</strong> - � bem aceita pelos alunos?</label>
							<div class="col-sm-4">
								<form:input id="alim11" name="alim11" type="text" class="form-control" path="alim11" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim12"><strong>ALIM12</strong> - O card�pio � variado?</label>
							<div class="col-sm-4">
								<form:input id="alim12" name="alim12" type="text" class="form-control" path="alim12" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="alim13"><strong>ALIM13</strong> - H� infiltra��es na cozinha?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim13" path="alim13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim13" path="alim13" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim13" path="alim13" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="alim14"><strong>ALIM14</strong> - H� infiltra��es no balc�o da cozinha?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim14" path="alim14" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim14" path="alim14" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim14" path="alim14" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="alim15"><strong>ALIM15</strong> - A geladeira est� em boas condi��es de uso?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim15" path="alim15" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim15" path="alim15" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="alim15" path="alim15" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes10" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes10" name="anotacoes10" class="form-control" path="anotacoes10" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">10A - M�DULO ESPECIAL DE MERENDA</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="em1"><strong>EM1</strong> - A quantidade de alimentos supre a demanda?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em1" path="em1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em1" path="em1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em1" path="em1" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="em2"><strong>EM2</strong> - Caso a merenda seja terceirizada, est� sendo recebida dentro do hor�rio?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em2" path="em2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em2" path="em2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em2" path="em2" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="em3"><strong>EM3</strong> - Qual a proced�ncia da �gua?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em3" path="em3" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="em3" path="em3" value="fervida" />  FERVIDA</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em3" path="em3" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="em3" path="em3" value="mineral" />  MINERAL</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="em3a"><strong>EM3a</strong> - Sendo filtrada, h� manuten��o do filtro?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em3a" path="em3a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em3a" path="em3a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em3a" path="em3a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="em4"><strong>EM4</strong> - Em dias de aulas extraclasse a merenda � garantida?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em4" path="em4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em4" path="em4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em4" path="em4" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes10a" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes10a" name="anotacoes10a" class="form-control" path="anotacoes10a" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">11 - MATERIAL DID�TICO E FARDAMENTO</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf1"><strong>MDF1</strong> - Os alunos recebem o Kit Escolar completo e em n�mero suficiente?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf1" path="mdf1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf1" path="mdf1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf1" path="mdf1" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf2a"><strong>MDF2a</strong> - Os alunos recebem fardamento completo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2a" path="mdf2a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2a" path="mdf2a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2a" path="mdf2a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf2b"><strong>MDF2b</strong> - Os alunos recebem fardamento em tamanho adequado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2b" path="mdf2b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2b" path="mdf2b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2b" path="mdf2b" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf3"><strong>MDF3</strong> - Os alunos tem � disposi��o livros did�ticos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf3" path="mdf3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf3" path="mdf3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf3" path="mdf3" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf3a"><strong>MDF3a</strong> - Os livros did�ticos foram entregues em n�mero suficiente?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf3a" path="mdf3a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf3a" path="mdf3a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf3a" path="mdf3a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf4"><strong>MDF4</strong> - Os alunos tem � disposi��o livros liter�rios?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf4" path="mdf4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf4" path="mdf4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf4" path="mdf4" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf7"><strong>MDF7</strong> - Os alunos tem � disposi��o jogos/brinquedos educativos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf7" path="mdf7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf7" path="mdf7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf7" path="mdf7" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf8"><strong>MDF8</strong> - Os alunos tem � disposi��o aparelho de TV?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf8" path="mdf8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf8" path="mdf8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf8" path="mdf8" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf9"><strong>MDF9</strong> - Os alunos tem � disposi��o aparelho de som?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf9" path="mdf9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf9" path="mdf9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf9" path="mdf9" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf10"><strong>MDF10</strong> - A escola disp�e de projetor?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf10" path="mdf10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf10" path="mdf10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf10" path="mdf10" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf11"><strong>MDF11</strong> - A escola disp�e de material de artes (massas de modelar, tinta, etc.)?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf11" path="mdf11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf11" path="mdf11" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf11" path="mdf11" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf12"><strong>MDF12</strong> - A escola disp�e de aulas de campo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf12" path="mdf12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf12" path="mdf12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf12" path="mdf12" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf12a"><strong>MDF12a</strong> - � garantida a merenda em aulas de campo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf12a" path="mdf12a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf12a" path="mdf12a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf12a" path="mdf12a" value="false" />  N�O</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes11" class="col-sm-3 control-label"><strong>Anota��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes11" name="anotacoes11" class="form-control" path="anotacoes11" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">11A - M�DULO ESPECIAL DE DID�TICA E SA�DE</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs1"><strong>EDFS1</strong> - H� canetas para quadro branco?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="false" />  N�O</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="Insuficiente" />  Insuficiente</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs2"><strong>EDFS2</strong> - H� apagadores para quadro branco?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="false" />  N�O</div>
								<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="Insuficiente" />  Insuficiente</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs3"><strong>EDFS3</strong> - H� computadores para di�rio de classe?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="false" />  N�O</div>
								<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="Insuficiente" />  Insuficiente</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs4"><strong>EDFS4</strong> - Mais educa��o</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs4" path="edfs4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs4" path="edfs4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs4" path="edfs4" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs4o"><strong></strong>Oficinas:</label>
							<div class="col-sm-4">
								<form:input id="edfs4o" name="edfs4o" type="text" class="form-control" path="edfs4o" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs7"><strong>EDFS7</strong> - Rob�tica na escola</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7" path="edfs7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7" path="edfs7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7" path="edfs7" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs7a"><strong>EDFS7a</strong> - Rob�tica funciona?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7a" path="edfs7a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7a" path="edfs7a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7a" path="edfs7a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs7b"><strong>EDFS7b</strong> - Houve treinamento para professores?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7b" path="edfs7b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7b" path="edfs7b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7b" path="edfs7b" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs7o"><strong></strong>Oficinas:</label>
							<div class="col-sm-4">
								<form:input id="edfs7o" name="edfs7o" type="text" class="form-control" path="edfs7o" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs8"><strong>EDFS8</strong> - Outros</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs8" path="edfs8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs8" path="edfs8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs8" path="edfs8" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs8o"><strong></strong>Quais?</label>
							<div class="col-sm-4">
								<form:input id="edfs8o" name="edfs8o" type="text" class="form-control" path="edfs8o" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs9"><strong>EDFS9</strong> - Foram distribu�dos tablets aos alunos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs9" path="edfs9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs9" path="edfs9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs9" path="edfs9" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs10"><strong>EDFS10</strong> - Se n�o, foram recebidos os tablets para o espa�o tecnol�gico?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs10" path="edfs10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs10" path="edfs10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs10" path="edfs10" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs11"><strong>EDFS11</strong> - Existe internet wireless para o uso nos computadores/tablets?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs11" path="edfs11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs11" path="edfs11" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs11" path="edfs11" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs12"><strong>EDFS12</strong> - Foram instaladas mesas interativas da Positivo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs12" path="edfs12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs12" path="edfs12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs12" path="edfs12" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs13"><strong>EDFS13</strong> - � atendido pelo PSE?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs13" path="edfs13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs13" path="edfs13" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs13" path="edfs13" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs13o"><strong></strong>Como?</label>
							<div class="col-sm-4">
								<form:input id="edfs13o" name="edfs13o" type="text" class="form-control" path="edfs13o" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs14"><strong>EDFS14</strong> - Tem parceria com PSF?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs14" path="edfs14" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs14" path="edfs14" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs14" path="edfs14" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs14o"><strong></strong>Como?</label>
							<div class="col-sm-4">
								<form:input id="edfs14o" name="edfs14o" type="text" class="form-control" path="edfs14o" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs15"><strong>EDFS15</strong> - O PSF entrega materiais de sa�de preventiva?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs15" path="edfs15" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs15" path="edfs15" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs15" path="edfs15" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs15o"><strong></strong>Obs:</label>
							<div class="col-sm-4">
								<form:input id="edfs15o" name="edfs15o" type="text" class="form-control" path="edfs15o" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs16"><strong>EDFS16</strong> - As campanhas de vacina��o chegam � escola?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs16" path="edfs16" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs16" path="edfs16" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs16" path="edfs16" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs16o"><strong></strong>Obs:</label>
							<div class="col-sm-4">
								<form:input id="edfs16o" name="edfs16o" type="text" class="form-control" path="edfs16o" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs17"><strong>EDFS17</strong> - S�o realizadas escova��es de dentes ap�s as merendas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs17" path="edfs17" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs17" path="edfs17" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs17" path="edfs17" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs17o"><strong></strong>Obs:</label>
							<div class="col-sm-4">
								<form:input id="edfs17o" name="edfs17o" type="text" class="form-control" path="edfs17o" />
							</div>
						</div>
						
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs18a"><strong>EDFS18</strong></form:label>
							<div class="col-sm-9 formradio"> - Marque os itens que correspondem a doen�as que afetaram alunos e funcion�rios no ano corrente</div>
						</div>

						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs18a"><strong>Catapora</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18a" path="edfs18a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18a" path="edfs18a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18a" path="edfs18a" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs18b"><strong>Caxumba</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18b" path="edfs18b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18b" path="edfs18b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18b" path="edfs18b" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs18c"><strong>Chikungunya</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18c" path="edfs18c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18c" path="edfs18c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18c" path="edfs18c" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs18d"><strong>Conjutivite</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18d" path="edfs18d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18d" path="edfs18d" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18d" path="edfs18d" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs18e"><strong>Dengue</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18e" path="edfs18e" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18e" path="edfs18e" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18e" path="edfs18e" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs18f"><strong>Hansen�ase</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18f" path="edfs18f" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18f" path="edfs18f" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18f" path="edfs18f" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs18g"><strong>Zika</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18g" path="edfs18g" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18g" path="edfs18g" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs18g" path="edfs18g" value="false" />  N�O</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs19"><strong>EDFS19</strong> - H� evas�o de alunos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs19" path="edfs19" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs19" path="edfs19" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs19" path="edfs19" value="false" />  N�O</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Caso n�o tenha, pular pr�xima pergunta.</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs20"><strong>EDFS20</strong> - Se sim, quantos alunos est�o ausentes?</label>
							<div class="col-sm-4">
								<form:input id="edfs20" name="edfs20" type="text" class="form-control" path="edfs20" />
							</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs21"><strong>EDFS21</strong> - Se sim, foi comunicado ao Conselho Tutelar?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs21" path="edfs21" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs21" path="edfs21" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs21" path="edfs21" value="false" />  N�O</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs22"><strong>EDFS22</strong> - Quantos casos foram comunicados ao Conselho Tutelar?</label>
							<div class="col-sm-4">
								<form:input id="edfs22" name="edfs22" type="text" class="form-control" path="edfs22" />
							</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs23"><strong>EDFS23</strong> - Houve algum caso de gravidez entre as alunas nos �ltimos 12 meses?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs23" path="edfs23" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs23" path="edfs23" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs23" path="edfs23" value="false" />  N�O</div>
						</div>
						
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes11a" class="col-sm-3 control-label"><strong>Mais informa��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes11a" name="anotacoes11a" class="form-control" path="anotacoes11a" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">12 - INSTALA��ES SANIT�RIAS</h3>
						<hr>
						
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1a"><strong>ISA1</strong></form:label>
							<div class="col-sm-9 formradio"> - Marque abaixo os problemas identificados na escola</div>
						</div>

						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1a"><strong>Descargas quebradas</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1a" path="isa1a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1a" path="isa1a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1a" path="isa1a" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1b"><strong>Pias quebradas</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1b" path="isa1b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1b" path="isa1b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1b" path="isa1b" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1c"><strong>Torneiras quebradas</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1c" path="isa1c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1c" path="isa1c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1c" path="isa1c" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1d"><strong>Assentos sanit�rios quebrados/inexistentes</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1d" path="isa1d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1d" path="isa1d" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1d" path="isa1d" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1e"><strong>Vasos sanit�rios quebrados/inexistentes</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1e" path="isa1e" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1e" path="isa1e" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1e" path="isa1e" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1f"><strong>M� higieniza��o</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1f" path="isa1f" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1f" path="isa1f" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1f" path="isa1f" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1g"><strong>Vazamento de �gua</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1g" path="isa1g" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1g" path="isa1g" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1g" path="isa1g" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1h"><strong>Portas danificadas/inexistentes</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1h" path="isa1h" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1h" path="isa1h" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1h" path="isa1h" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1i"><strong>Piso danificado</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1i" path="isa1i" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1i" path="isa1i" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1i" path="isa1i" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1j"><strong>Paredes danificadas</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1j" path="isa1j" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1j" path="isa1j" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1j" path="isa1j" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1k"><strong>Retorno de esgoto</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1k" path="isa1k" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1k" path="isa1k" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1k" path="isa1k" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1l"><strong>Banheiro em quantidade insuficiente</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1l" path="isa1l" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1l" path="isa1l" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1l" path="isa1l" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1m"><strong>Infiltra��es</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1m" path="isa1m" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1m" path="isa1m" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1m" path="isa1m" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1n"><strong>Ralos sem tampa</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1n" path="isa1n" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1n" path="isa1n" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1n" path="isa1n" value="false" />  N�O</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="isa1o"><strong>Espelhos quebrados</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1o" path="isa1o" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1o" path="isa1o" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="isa1o" path="isa1o" value="false" />  N�O</div>
						</div>
						
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes12" class="col-sm-3 control-label"><strong>Mais informa��es</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes12" name="anotacoes12" class="form-control" path="anotacoes12" />
							</div>
						</div>

						<hr>

						<!-- Button -->
						<div class="form-group">
							<div class="col-sm-7">
								<div class="pull-right">
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
	<script src="<%=request.getContextPath()%>/views/assets/js/VisitaForm.js"></script>

</body>

</html>