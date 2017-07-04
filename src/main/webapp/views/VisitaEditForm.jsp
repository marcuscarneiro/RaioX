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
				<form:form class="form-horizontal" action="salvaVisita" modelAttribute="visita" method="POST" enctype="multipart/form-data">
					<fieldset>

						<!-- Form Name -->
						<h1>Visita</h1>

						<hr>

						<form:input type="hidden" name="id" path="id" />

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="responsavel"><strong>Pesquisador responsável</strong></label>
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
									<option value="${visita.escola.id}">${visita.escola.nome}</option>
									<c:forEach items="${escolas}" var="escola">
										<option value="${escola.id}">${escola.nome}</option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						
						<!-- TROCAR POR UM BOTÃO DE UPLOAD -->
						<div class="form-group">
						<label class="col-sm-3 control-label" for="relatorio"><strong>Relatório</strong></label>
							<div id="relatorio" class="col-sm-4">
								<input type="file" name="relatorioUpload" size="50" />
							</div>
						</div>
 
 						<c:if test="${not empty visita.relatorio}">
							<div class="form-group">
							<label class="col-sm-3 control-label" for="relatorio"><strong>Relatório atual</strong></label>
								<div id="relatorio" class="col-sm-4">
									<a href="<%=request.getContextPath()%>${visita.relatorio}" 	class="btn btn-primary" role="button">
										Baixar relatório
									</a>
								</div>
							</div>
						</c:if>
						
						<c:if test="${empty visita.relatorio}">
							<div class="form-group">
							<label class="col-sm-3 control-label" for="relatorio"><strong>Relatório atual</strong></label>
								<div id="relatorioEmpty" class="col-sm-4">
									<span>Ainda sem relatório</span>
								</div>
							</div>
						</c:if>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="gestor"><strong>Gestor</strong></label>
							<div class="col-sm-4">
								<form:input id="gestor" name="gestor" type="text" class="form-control" path="gestor" />
							</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="idebVisivel"><strong>IDEB em local visível?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="idebVisivel" path="idebVisivel" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="idebVisivel" path="idebVisivel" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="idebVisivel" path="idebVisivel" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="situacao"><strong>Situação do prédio:</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="situacao" path="situacao" value="proprio" />  Próprio</div>
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
								<form:radiobutton id="turnoVisita" path="turnoVisita" value="manha" /> Manhã</div>
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
								<form:radiobutton id="chuva" path="chuva" value="false" /> NÃO</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="problemasChuva"><strong>Se sim, quais?</strong></label>
							<div class="col-sm-4">
								<form:input id="problemasChuva" name="problemasChuva" type="text" class="form-control" path="problemasChuva" />
							</div>
						</div>
						
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="atualizacao"><strong>É uma vistoria apenas de atualização?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="atualizacao" path="atualizacao" value="true" />  SIM
							</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="atualizacao" path="atualizacao" value="false" />  NÃO
							</div>
						</div>

						<hr>
						<h3 style="text-align: center;">1 - MÓDULO DE SALAS DE AULA</h3>
						<hr>
						Instruções: Prezado(a) pesquisador(a), não deixar células em branco. Caso não haja informação disponível, marcar NI. Caso a pergunta não se aplique, marcar NA. 
						<hr>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa1"><strong>SA1</strong> - Quantos alunos estão matriculados (TOTAL)?</label>
							<div class="col-sm-4">
								<form:input id="sa1" name="sa1" type="text" class="form-control" path="sa1" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa2"><strong>SA2</strong> - Quantas salas de aula há na escola?</label>
							<div class="col-sm-4">
								<form:input id="sa2" name="sa2" type="text" class="form-control" path="sa2" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa3"><strong>SA3</strong> - Há quantos turnos de aula?</label>
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
							<label class="col-sm-3 control-label" for="sa4b"><strong>SA4b</strong> - Quantas salas possuem temperatura entre de 20 e 26ºC?</label>
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
							<label class="col-sm-3 control-label" for="sa5b"><strong>SA5b</strong> - Quantas salas a iluminação está abaixo de 200 ou acima de 750 lux?</label>
							<div class="col-sm-4">
								<form:input id="sa5b" name="sa5b" type="text" class="form-control" path="sa5b" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa6"><strong>SA6</strong> - Quantas salas são climatizadas?</label>
							<div class="col-sm-4">
								<form:input id="sa6" name="sa6" type="text" class="form-control" path="sa6" />
								Obs: Para as que não forem climatizadas, observar se são ventiladas. O valor dessa linha e o da próxima não podem exceder a quantidade de salas de aula.
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa7"><strong>SA7</strong> - Quantas salas são bem ventiladas?</label>
							<div class="col-sm-4">
								<form:input id="sa7" name="sa7" type="text" class="form-control" path="sa7" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="sa8"><strong>SA8</strong> - Quantas salas possuem bom espaço para circulação?</label>
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
							<label class="col-sm-3 control-label" for="sa10"><strong>SA10</strong> - Qual o aspecto de conservação do mobiliário em sala de aula? Use a escala Likert*?</label>
							<div class="col-sm-4">
								<form:input id="sa10" name="sa10" type="text" class="form-control" path="sa10" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-3">
								*ESCALA LIKERT:<br/>
								1 = Não há mobiliário;<br/>
								2 = Mal conservados;<br/>
								3 = Nem bem nem mal conservados;<br/>
								4 = Bem conservados;<br/>
								5 = Muito bem conservados.<br/>
							</div>
						</div>
						
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes1" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes1" name="anotacoes1" class="form-control" path="anotacoes1" />
							</div>
						</div>
						<hr>
						<h3 style="text-align: center;">1A - MÓDULO ESPECIAL DE ENSINO E EDUCAÇÃO ESPECIAL</h3>
						<hr>

						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1a"><strong>EEE1</strong></form:label>
							<div class="col-sm-9 formradio"> - Quais o níveis/modalidades de ensino oferecidos?</div>
						</div>

						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1a"><strong>Educação infantil</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1a" path="eee1a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1a" path="eee1a" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1a" path="eee1a" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1b"><strong>Ensino fundamental I</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1b" path="eee1b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1b" path="eee1b" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1b" path="eee1b" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1c"><strong>Ensino fundamental II</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1c" path="eee1c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1c" path="eee1c" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1c" path="eee1c" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1d"><strong>EJA</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1d" path="eee1d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1d" path="eee1d" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1d" path="eee1d" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1e"><strong>PROJOVEM</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1e" path="eee1e" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1e" path="eee1e" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1e" path="eee1e" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1f"><strong>Lição de vida</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1f" path="eee1f" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1f" path="eee1f" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1f" path="eee1f" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1g"><strong>Acelera</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1g" path="eee1g" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1g" path="eee1g" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1g" path="eee1g" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1h"><strong>Se liga!</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1h" path="eee1h" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1h" path="eee1h" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1h" path="eee1h" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee1i"><strong>Outros</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1i" path="eee1i" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1i" path="eee1i" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee1i" path="eee1i" value="false" />  NÃO</div>
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
							<label class="col-sm-3 control-label" for="eee6"><strong>EEE6</strong> - Há deficiência no quadro de funcionários? Quais?</label>
							<div class="col-sm-4">
								<form:input id="eee6" name="eee6" type="text" class="form-control" path="eee6" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eee7"><strong>EEE7</strong> - Quantos alunos especiais COM LAUDO médico estão matriculados?</label>
							<div class="col-sm-4">
								<form:input id="eee7" name="eee7" type="text" class="form-control" path="eee7" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eee8"><strong>EEE8</strong> - Quantas crianças estão SEM acompanhamento de cuidador/intérprete em sala de aula?</label>
							<div class="col-sm-4">
								<form:input id="eee8" name="eee8" type="text" class="form-control" path="eee8" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eee9"><strong>EEE9</strong> - Os professores com formação em AEE ou psicopedagogia são:</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee9" path="eee9" value="fixos" />  FIXOS</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eee9" path="eee9" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="eee9" path="eee9" value="itinerantes" />  ITINERANTES</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes1a" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes1a" name="anotacoes1a" class="form-control" path="anotacoes1a" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">2 - MÓDULO BIBLIOTECA</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib1"><strong>BIB1</strong> - Existe Biblioteca?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib1" path="bib1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib1" path="bib1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib1" path="bib1" value="false" />  NÃO</div>
							<div class="col-sm-8 col-sm-offset-3">Obs: Caso a resposta seja não, vá para o próximo módulo.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib2"><strong>BIB2</strong> - É aberta aos alunos fora do horário de aula?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib2" path="bib2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib2" path="bib2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib2" path="bib2" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib3"><strong>BIB3</strong> - É climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib3" path="bib3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib3" path="bib3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib3" path="bib3" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib4"><strong>BIB4</strong> - É bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib4" path="bib4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib4" path="bib4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib4" path="bib4" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib5"><strong>BIB5</strong> - Tem espaço para movimentação?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib5" path="bib5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib5" path="bib5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib5" path="bib5" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib6"><strong>BIB6</strong> - Tem televisor?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib6" path="bib6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib6" path="bib6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib6" path="bib6" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib7"><strong>BIB7</strong> - Tem aparelho de DVD?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib7" path="bib7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib7" path="bib7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib7" path="bib7" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib8"><strong>BIB8</strong> - Tem aparelho de som?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib8" path="bib8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib8" path="bib8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib8" path="bib8" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib9"><strong>BIB9</strong> - Tem computador com acesso à internet?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib9" path="bib9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib9" path="bib9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib9" path="bib9" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib10"><strong>BIB10</strong> - Tem Bibliotecário(a)?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib10" path="bib10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib10" path="bib10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib10" path="bib10" value="false" />  NÃO</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="bib11"><strong>BIB11</strong> - Qual a formação do(a) Bibliotecário(a)?</label>
							<div class="col-sm-4">
								<form:input id="bib11" name="bib11" type="text" class="form-control" path="bib11" />
									1 = Nível médio;<br/>
									2 = Superior incompleto;<br/>
									3 = Superior completo.
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="bib12"><strong>BIB12</strong> - Possui mediador de leitura?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib12" path="bib12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib12" path="bib12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="bib12" path="bib12" value="false" />  NÃO</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="bib13"><strong>BIB13</strong> - Qual a formação do mediador(a) de leitura?</label>
							<div class="col-sm-4">
								<form:input id="bib13" name="bib13" type="text" class="form-control" path="bib13" />
								1 = Nível médio;<br/>
								2 = Superior incompleto;<br/>
								3 = Superior completo.
							</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="infger2" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="infger2" name="infger2" class="form-control" path="infger2" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">3 - MÓDULO LABORATÓRIO DE INFORMÁTICA</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="inf1"><strong>INF1</strong> - Existe Laboratório de Informática?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf1" path="inf1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf1" path="inf1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf1" path="inf1" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Caso a resposta seja não, vá para o próximo módulo.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="inf2"><strong>INF2</strong> - É climatizado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf2" path="inf2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf2" path="inf2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf2" path="inf2" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se for climatizado, pule a próxima pergunta.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="inf3"><strong>INF3</strong> - É bem ventilado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf3" path="inf3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf3" path="inf3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf3" path="inf3" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="inf4"><strong>INF4</strong> - Há suporte técnico da Prefeitura?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf4" path="inf4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf4" path="inf4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf4" path="inf4" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="inf5"><strong>INF5</strong> - Há aulas de informática?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf5" path="inf5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf5" path="inf5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf5" path="inf5" value="false" />  NÃO</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inf6"><strong>INF6</strong> - Quantos computadores há no laboratório?</label>
							<div class="col-sm-4">
								<form:input id="inf6" name="inf6" type="text" class="form-control" path="inf6" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inf7"><strong>INF7</strong> - Quantos computadores funcionam?</label>
							<div class="col-sm-4">
								<form:input id="inf7" name="inf7" type="text" class="form-control" path="inf7" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inf8"><strong>INF8</strong> - Quantos computadores tem acesso à internet?</label>
							<div class="col-sm-4">
								<form:input id="inf8" name="inf8" type="text" class="form-control" path="inf8" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="inf9"><strong>INF9</strong> - Há monitor(a) / instrutor(a)?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf9" path="inf9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf9" path="inf9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="inf9" path="inf9" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se a resposta for não, vá para o próximo módulo</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="inf10"><strong>INF10</strong> - Qual a formação do(a) Monitor(a) / Instrutor(a)?</label>
							<div class="col-sm-4">
								<form:input id="inf10" name="inf10" type="text" class="form-control" path="inf10" />
								1 = Na área de informática;<br/>
								0 = Em outra área.
							</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes3" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes3" name="anotacoes3" class="form-control" path="anotacoes3" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">4 - MÓDULO RECREAÇÃO E LAZER</h3>
						<hr>
						Para as perguntas de estado de conservação use os valores:<br/>
						3 = bom;<br/>
						2 = regular;<br/>
						1 = ruim.<br/>
						Caso não haja o local, marque zero.
						<hr>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl1"><strong>RL1</strong> - Qual o estado de conservação do piso?</label>
							<div class="col-sm-4">
								<form:input id="rl1" name="rl1" type="text" class="form-control" path="rl1" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl2"><strong>RL2</strong> - Qual o estado de conservação do parque?</label>
							<div class="col-sm-4">
								<form:input id="rl2" name="rl2" type="text" class="form-control" path="rl2" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl3"><strong>RL3</strong> - Qual o estado de conservação da quadra?</label>
							<div class="col-sm-4">
								<form:input id="rl3" name="rl3" type="text" class="form-control" path="rl3" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl4"><strong>RL4</strong> - Qual o estado de conservação dos brinquedos?</label>
							<div class="col-sm-4">
								<form:input id="rl4" name="rl4" type="text" class="form-control" path="rl4" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="rl5"><strong>RL5</strong> - Como é o espaço de circulação dos corredores?</label>
							<div class="col-sm-4">
								<form:input id="rl5" name="rl5" type="text" class="form-control" path="rl5" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="rl6"><strong>RL6</strong> - Há risco de acidente?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="rl6" path="rl6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="rl6" path="rl6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="rl6" path="rl6" value="false" />  NÃO</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="infger4" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="infger4" name="infger4" class="form-control" path="infger4" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">5 - MÓDULO ACESSIBILIDADE</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace1"><strong>ACE1</strong> - Há alunos cadeirantes ou com dificuldades de locomoção?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace1" path="ace1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace1" path="ace1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace1" path="ace1" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace2"><strong>ACE2</strong> - Há alunos surdos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace2" path="ace2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace2" path="ace2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace2" path="ace2" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace3"><strong>ACE3</strong> - Há alunos cegos ou com visão limitada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace3" path="ace3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace3" path="ace3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace3" path="ace3" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace4"><strong>ACE4</strong> - Há alunos com problemas cognitivos ou patologias mentais?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace4" path="ace4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace4" path="ace4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace4" path="ace4" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace5"><strong>ACE5</strong> - A escola dispõe de rampas de acesso para acessibilidade para todos os espaços dos alunos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace5" path="ace5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace5" path="ace5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace5" path="ace5" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace6"><strong>ACE6</strong> - A escola dispõe de piso tátil?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace6" path="ace6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace6" path="ace6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace6" path="ace6" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace7"><strong>ACE7</strong> - A escola dispõe de materiais didáticos para cegos ou surdos-mudos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace7" path="ace7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace7" path="ace7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace7" path="ace7" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace8"><strong>ACE8</strong> - A escola dispõe de tutores ou intérpretes (libras)?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace8" path="ace8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace8" path="ace8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace8" path="ace8" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace9"><strong>ACE9</strong> - Na escola há sala com recursos multifuncionais?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace9" path="ace9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace9" path="ace9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace9" path="ace9" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="ace10"><strong>ACE10</strong> - Há professores com formação em A.E.E. ou psicopedagogia para atender as crianças especiais?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace10" path="ace10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace10" path="ace10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="ace10" path="ace10" value="false" />  NÃO</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes5" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes5" name="anotacoes5" class="form-control" path="anotacoes5" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">5A - MÓDULO ESPECIAL DE ACESSIBILIDADE</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac1"><strong>EAC1</strong> - Há placas indicativas em braile?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac1" path="eac1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac1" path="eac1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac1" path="eac1" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac2"><strong>EAC2</strong> - Os banheiros estão plenamente adaptados para cadeirantes?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac2" path="eac2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac2" path="eac2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac2" path="eac2" value="false" />  NÃO</div>
						</div>
						<hr>
						EM RELAÇÃO À SALA DE RECURSOS MULTIFUNCIONAIS:
						<hr>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac3a"><strong>EAC3a</strong> - A área para circulação é satisfatória?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3a" path="eac3a" value="true" />  SIM</div>
								<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3a" path="eac3a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3a" path="eac3a" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac3b"><strong>EAC3b</strong> - Os equipamentos eletrônicos atendem às necessidades?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3b" path="eac3b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3b" path="eac3b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3b" path="eac3b" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac3c"><strong>EAC3c</strong> - A mobília atende às necessidades?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3c" path="eac3c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3c" path="eac3c" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3c" path="eac3c" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eac3d"><strong>EAC3d</strong> - Os materiais adaptados atendem às necessidades?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3d" path="eac3d" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3d" path="eac3d" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eac3d" path="eac3d" value="false" />  NÃO</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes5a" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes5a" name="anotacoes5a" class="form-control" path="anotacoes5a" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">6 - MÓDULO SERVIÇOS ESSENCIAIS</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se1"><strong>SE1</strong> - Há distribuição de água na escola?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se1" path="se1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se1" path="se1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se1" path="se1" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se2"><strong>SE2</strong> - Há saneamento básico na escola?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se2" path="se2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se2" path="se2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se2" path="se2" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se3"><strong>SE3</strong> - Há extintores de incêndio em condições de funcionamento?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se3" path="se3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se3" path="se3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se3" path="se3" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se4"><strong>SE4</strong> - Os funcionários sabem usar o extintor?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se4" path="se4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se4" path="se4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se4" path="se4" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se5"><strong>SE5</strong> - Há infiltrações e/ou mofo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se5" path="se5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se5" path="se5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se5" path="se5" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se6"><strong>SE6</strong> - Há rachaduras?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se6" path="se6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se6" path="se6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se6" path="se6" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="se7"><strong>SE7</strong> - Há risco de choque nas instalações elétricas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se7" path="se7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se7" path="se7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="se7" path="se7" value="false" />  NÃO</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="infger6" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="infger6" name="infger6" class="form-control" path="infger6" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">6A - MÓDULO ESPECIAL ESTRUTURA FÍSICA</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef1"><strong>EEF1</strong> - O entorno da unidade é violento?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef1" path="eef1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef1" path="eef1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef1" path="eef1" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef2"><strong>EEF2</strong> - Há vigilantes em todos os turnos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef2" path="eef2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef2" path="eef2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef2" path="eef2" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef3"><strong>EEF3</strong> - O prédio é alvo de vândalos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef3" path="eef3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef3" path="eef3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef3" path="eef3" value="false" />  NÃO</div>
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
							<form:label class="col-sm-3 control-label" path="eef4"><strong>EEF4</strong> - O prédio possui câmeras de segurança?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4" path="eef4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4" path="eef4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4" path="eef4" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef4a"><strong>EEF4a</strong> - Elas estão funcionando?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4a" path="eef4a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4a" path="eef4a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef4a" path="eef4a" value="false" />  NÃO</div>
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
							<label class="col-sm-3 control-label" for="eef6"><strong>EEF6</strong> - Quantos estão fora do prazo de validade?</label>
							<div class="col-sm-4">
								<form:input id="eef6" name="eef6" type="text" class="form-control" path="eef6" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef7"><strong>EEF7</strong> - Há saídas de emergência?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7" path="eef7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7" path="eef7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7" path="eef7" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef7a"><strong>EEF7a</strong> - Se sim, estão sinalizadas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7a" path="eef7a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7a" path="eef7a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef7a" path="eef7a" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef8"><strong>EEF8</strong> - A escola fica em área de encosta ou barreira?</form:label>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="eef8" path="eef8" value="encosta" />  ENCOSTA</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef8" path="eef8" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="eef8" path="eef8" value="barreira" />  BARREIRA</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eef9"><strong>EEF9</strong> - Se a água costuma faltar, indique quantos dias:</label>
							<div class="col-sm-4">
								<form:input id="eef9" name="eef9" type="text" class="form-control" path="eef9" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eef10"><strong>EEF10</strong> - Quantos dias o caminhão pipa demora a abastecer?</label>
							<div class="col-sm-4">
								<form:input id="eef10" name="eef10" type="text" class="form-control" path="eef10" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef10a"><strong>EEF10a</strong> - A limpeza dos reservatórios tem sido feita?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef10a" path="eef10a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef10a" path="eef10a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef10a" path="eef10a" value="false" />  NÃO</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="eef10b"><strong>EEF10b</strong> - Qual o intervalo de limpeza dos reservatórios?</label>
							<div class="col-sm-4">
								<form:input id="eef10b" name="eef10b" type="text" class="form-control" path="eef10b" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef11"><strong>EEF11</strong> - A quantidade de reservatórios supre a demanda?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef11" path="eef11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef11" path="eef11" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef11" path="eef11" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef12"><strong>EEF12</strong> - Existe espaço reservado para depósito de lixo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef12" path="eef12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef12" path="eef12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef12" path="eef12" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef13"><strong>EEF13</strong> - Existe espaço reservado para armazenamento de botijão de gás?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef13" path="eef13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef13" path="eef13" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef13" path="eef13" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef14"><strong>EEF14</strong> - A quantidade de almoxarifados supre a demanda?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef14" path="eef14" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef14" path="eef14" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef14" path="eef14" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef15"><strong>EEF15</strong> - A PCR atendeu às solicitações de coleta de entulhos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef15" path="eef15" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef15" path="eef15" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef15" path="eef15" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef16"><strong>EEF16</strong> - O prédio foi dedetizado há mais de seis meses?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef16" path="eef16" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef16" path="eef16" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef16" path="eef16" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="eef17"><strong>EEF17</strong> - O material de limpeza enviado pela PCR atende à demanda?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef17" path="eef17" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef17" path="eef17" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="eef17" path="eef17" value="false" />  NÃO</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes6a" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes6a" name="anotacoes6a" class="form-control" path="anotacoes6a" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">7 - MÓDULO SALA DOS PROFESSORES</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp1"><strong>SP1</strong> - Há sala de professores?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp1" path="sp1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp1" path="sp1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp1" path="sp1" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Caso a resposta marcada seja NÃO, pule para o próximo módulo.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp2"><strong>SP2</strong> - Possui computadores?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp2" path="sp2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp2" path="sp2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp2" path="sp2" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp3"><strong>SP3</strong> - Possui acesso à internet?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp3" path="sp3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp3" path="sp3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp3" path="sp3" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp4"><strong>SP4</strong> - Possui armários?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp4" path="sp4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp4" path="sp4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp4" path="sp4" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp5"><strong>SP5</strong> - É climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp5" path="sp5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp5" path="sp5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp5" path="sp5" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se a resposta for SIM, pule a próxima pergunta.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp6"><strong>SP6</strong> - É bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp6" path="sp6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp6" path="sp6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp6" path="sp6" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp7"><strong>SP7</strong> - Há mesas e cadeiras?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp7" path="sp7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp7" path="sp7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp7" path="sp7" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp8"><strong>SP8</strong> - A iluminação está abaixo de 200 lux?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp8" path="sp8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp8" path="sp8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp8" path="sp8" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="sp9"><strong>SP9</strong> - Há espaço para circulação?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp9" path="sp9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp9" path="sp9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="sp9" path="sp9" value="false" />  NÃO</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes7" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes7" name="anotacoes7" class="form-control" path="anotacoes7" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">8 - MÓDULO ADMINISTRAÇÃO</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm1"><strong>ADM1</strong> - Direção, Secretaria e Coordenação funcionam na mesma sala?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm1" path="adm1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm1" path="adm1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm1" path="adm1" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Caso marque NÃO, pule a próxima pergunta.<br/>
									Marcando SIM, responda sobre climatização, ventilação e circulação separadamente.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm2"><strong>ADM2</strong> - Se SIM, há espaço que lhes permita funcionar confortavelmente?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm2" path="adm2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm2" path="adm2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm2" path="adm2" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm3"><strong>ADM3</strong> - Possui computadores?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm3" path="adm3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm3" path="adm3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm3" path="adm3" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm4"><strong>ADM4</strong> - Possui acesso à internet?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm4" path="adm4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm4" path="adm4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm4" path="adm4" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm5"><strong>ADM5</strong> - Tem impressora?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm5" path="adm5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm5" path="adm5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm5" path="adm5" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm6"><strong>ADM6</strong> - Tem copiadora?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm6" path="adm6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm6" path="adm6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm6" path="adm6" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm7"><strong>ADM7</strong> - Possui armários?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm7" path="adm7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm7" path="adm7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm7" path="adm7" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm8"><strong>ADM8</strong> - Possui mesas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm8" path="adm8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm8" path="adm8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm8" path="adm8" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm9"><strong>ADM9</strong> - Possui cadeiras?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm9" path="adm9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm9" path="adm9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm9" path="adm9" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm10"><strong>ADM10</strong> - O espaço é climatizado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10" path="adm10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10" path="adm10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10" path="adm10" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se marcou SIM, pule para pergunta pergunta ADM12.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm10a"><strong>ADM10a</strong> - A sala da Direção é climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10a" path="adm10a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10a" path="adm10a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10a" path="adm10a" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se marcar SIM, não responda a pergunta ADM11a.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm10b"><strong>ADM10b</strong> - A sala da Secretaria é climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10b" path="adm10b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10b" path="adm10b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10b" path="adm10b" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se marcar SIM, não responda a pergunta ADM11b.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm10c"><strong>ADM10c</strong> - A sala da Coordenação é climatizada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10c" path="adm10c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10c" path="adm10c" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm10c" path="adm10c" value="false" />  NÃO</div>
								<div class="col-sm-8 col-sm-offset-3">Obs: Se marcar SIM, não responda a pergunta ADM11c.</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm11"><strong>ADM11</strong> - O espaço é bem ventilado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11" path="adm11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11" path="adm11" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11" path="adm11" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm11a"><strong>ADM11a</strong> - A sala da Direção é bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11a" path="adm11a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11a" path="adm11a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11a" path="adm11a" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm11b"><strong>ADM11b</strong> - A sala da Secretaria é bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11b" path="adm11b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11b" path="adm11b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11b" path="adm11b" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm11c"><strong>ADM11c</strong> - A sala da Coordenação é bem ventilada?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11c" path="adm11c" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11c" path="adm11c" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm11c" path="adm11c" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm12"><strong>ADM12</strong> - Há espaço para circulação?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm12" path="adm12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm12" path="adm12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm12" path="adm12" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="adm13"><strong>ADM13</strong> - A iluminação está abaixo de 200 lux?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm13" path="adm13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm13" path="adm13" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="adm13" path="adm13" value="false" />  NÃO</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes8" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes8" name="anotacoes8" class="form-control" path="anotacoes8" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">9 - MÓDULO ALIMENTAÇÃO</h3>
						<hr>
						As perguntas ALIM2 a ALIM8 avaliam o local onde as refeições são feitas e deve ser usada seguinte escala Likert:<br>
						1 = inexistente;<br>
						2 = péssima;<br>
						3 = ruim;<br>
						4 = regular;<br>
						5 = boa;<br>
						6 = ótima.<br>
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
							<label class="col-sm-3 control-label" for="alim1"><strong>ALIM1</strong> - Onde as crianças se alimentam?</label>
							<div class="col-sm-4">
								<form:input id="alim1" name="alim1" type="text" class="form-control" path="alim1" />
								3 = Refeitório;<br>
								2 = Outros;<br>
								1 = Sala de Aula.
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim2"><strong>ALIM2</strong> - Quais as condições de iluminação?</label>
							<div class="col-sm-4">
								<form:input id="alim2" name="alim2" type="text" class="form-control" path="alim2" />
								1 = entre 200 e 750 Lux<br>
								0 = < 200 ou > 750 Lux
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim3"><strong>ALIM3</strong> - Quais as condições da ventilação?</label>
							<div class="col-sm-4">
								<form:input id="alim3" name="alim3" type="text" class="form-control" path="alim3" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim4"><strong>ALIM4</strong> - Quais as condições do espaço de circulação?</label>
							<div class="col-sm-4">
								<form:input id="alim4" name="alim4" type="text" class="form-control" path="alim4" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim5"><strong>ALIM5</strong> - Quais as condições de higiene?</label>
							<div class="col-sm-4">
								<form:input id="alim5" name="alim5" type="text" class="form-control" path="alim5" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim6"><strong>ALIM6</strong> - Quais as condições do mobiliário?</label>
							<div class="col-sm-4">
								<form:input id="alim6" name="alim6" type="text" class="form-control" path="alim6" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim7"><strong>ALIM7</strong> - Quais as condições do bebedouro?</label>
							<div class="col-sm-4">
								<form:input id="alim7" name="alim7" type="text" class="form-control" path="alim7" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim8"><strong>ALIM8</strong> - Quais as condições dos utensílios?</label>
							<div class="col-sm-4">
								<form:input id="alim8" name="alim8" type="text" class="form-control" path="alim8" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim9"><strong>ALIM9</strong> - A merenda é recebida?</label>
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
							<label class="col-sm-3 control-label" for="alim11"><strong>ALIM11</strong> - É bem aceita pelos alunos?</label>
							<div class="col-sm-4">
								<form:input id="alim11" name="alim11" type="text" class="form-control" path="alim11" />
							</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="alim12"><strong>ALIM12</strong> - O cardápio é variado?</label>
							<div class="col-sm-4">
								<form:input id="alim12" name="alim12" type="text" class="form-control" path="alim12" />
							</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="infger9" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="infger9" name="infger9" class="form-control" path="infger9" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">9A - MÓDULO ESPECIAL DE MERENDA</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="em1"><strong>EM1</strong> - A quantidade de alimentos supre a demanda?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em1" path="em1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em1" path="em1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em1" path="em1" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="em2"><strong>EM2</strong> - Caso a merenda seja terceirizada, está sendo recebida dentro do horário?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em2" path="em2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em2" path="em2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em2" path="em2" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="em3"><strong>EM3</strong> - Qual a procedência da água?</form:label>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="em3" path="em3" value="filtrada" />  FILTRADA</div>
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
							<form:label class="col-sm-3 control-label" path="em3a"><strong>EM3a</strong> - Sendo filtrada, há manutenção do filtro?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em3a" path="em3a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em3a" path="em3a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em3a" path="em3a" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="em4"><strong>EM4</strong> - Em dias de aulas extraclasse a merenda é garantida?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em4" path="em4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em4" path="em4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="em4" path="em4" value="false" />  NÃO</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes9a" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes9a" name="anotacoes9a" class="form-control" path="anotacoes9a" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">10 - MATERIAL DIDÁTICO E FARDAMENTO</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf1"><strong>MDF1</strong> - Os alunos recebem o Kit Escolar completo e em número suficiente?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf1" path="mdf1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf1" path="mdf1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf1" path="mdf1" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf2a"><strong>MDF2a</strong> - Os alunos recebem fardamento completo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2a" path="mdf2a" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2a" path="mdf2a" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2a" path="mdf2a" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf2b"><strong>MDF2b</strong> - Os alunos recebem fardamento em tamanho adequado?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2b" path="mdf2b" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2b" path="mdf2b" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf2b" path="mdf2b" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf3"><strong>MDF3</strong> - Os alunos tem à disposição livros didáticos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf3" path="mdf3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf3" path="mdf3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf3" path="mdf3" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf4"><strong>MDF4</strong> - Os alunos tem à disposição livros literários?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf4" path="mdf4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf4" path="mdf4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf4" path="mdf4" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf5"><strong>MDF5</strong> - Os alunos tem à disposição computadores?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf5" path="mdf5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf5" path="mdf5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf5" path="mdf5" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf6"><strong>MDF6</strong> - Os alunos tem à disposição acesso à internet?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf6" path="mdf6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf6" path="mdf6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf6" path="mdf6" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf7"><strong>MDF7</strong> - Os alunos tem à disposição jogos/brinquedos educativos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf7" path="mdf7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf7" path="mdf7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf7" path="mdf7" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf8"><strong>MDF8</strong> - Os alunos tem à disposição aparelho de TV com DVD?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf8" path="mdf8" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf8" path="mdf8" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf8" path="mdf8" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf9"><strong>MDF9</strong> - Os alunos tem à disposição aparelho de som?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf9" path="mdf9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf9" path="mdf9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf9" path="mdf9" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf10"><strong>MDF10</strong> - A escola dispõe de projetor?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf10" path="mdf10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf10" path="mdf10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf10" path="mdf10" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf11"><strong>MDF11</strong> - A escola dispõe de material de artes (massas de modelar, tinta, etc.)?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf11" path="mdf11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf11" path="mdf11" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf11" path="mdf11" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="mdf12"><strong>MDF12</strong> - A escola dispõe de aulas de campo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf12" path="mdf12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf12" path="mdf12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="mdf12" path="mdf12" value="false" />  NÃO</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="infger10" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="infger10" name="infger10" class="form-control" path="infger10" />
							</div>
						</div>
						
						<hr>
						<h3 style="text-align: center;">10A - MÓDULO ESPECIAL DE DIDÁTICA E SAÚDE</h3>
						<hr>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs1"><strong>EDFS1</strong> - Há canetas para quadro branco?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="false" />  NÃO</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="edfs1" path="edfs1" value="Insuficiente" />  Insuficiente</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs2"><strong>EDFS2</strong> - Há apagadores para quadro branco?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="false" />  NÃO</div>
								<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="edfs2" path="edfs2" value="Insuficiente" />  Insuficiente</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs3"><strong>EDFS3</strong> - Há computadores para diário de classe?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="false" />  NÃO</div>
								<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="null" />  </div>
							<div class="col-sm-2 formradio">
								<form:radiobutton id="edfs3" path="edfs3" value="Insuficiente" />  Insuficiente</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs4"><strong>EDFS4</strong> - Mais educação</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs4" path="edfs4" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs4" path="edfs4" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs4" path="edfs4" value="false" />  NÃO</div>
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
							<form:label class="col-sm-3 control-label" path="edfs5"><strong>EDFS5</strong> - Escola aberta</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs5" path="edfs5" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs5" path="edfs5" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs5" path="edfs5" value="false" />  NÃO</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs5o"><strong></strong>Oficinas:</label>
							<div class="col-sm-4">
								<form:input id="edfs5o" name="edfs5o" type="text" class="form-control" path="edfs5o" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs6"><strong>EDFS6</strong> - Segundo tempo</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs6" path="edfs6" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs6" path="edfs6" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs6" path="edfs6" value="false" />  NÃO</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs6o"><strong></strong>Oficinas:</label>
							<div class="col-sm-4">
								<form:input id="edfs6o" name="edfs6o" type="text" class="form-control" path="edfs6o" />
							</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs7"><strong>EDFS7</strong> - Robótica na escola</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7" path="edfs7" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7" path="edfs7" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs7" path="edfs7" value="false" />  NÃO</div>
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
								<form:radiobutton id="edfs8" path="edfs8" value="false" />  NÃO</div>
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
							<form:label class="col-sm-3 control-label" path="edfs9"><strong>EDFS9</strong> - Foram distribuídos tablets aos alunos?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs9" path="edfs9" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs9" path="edfs9" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs9" path="edfs9" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs10"><strong>EDFS10</strong> - Se não, foram recebidos os tablets para o espaço tecnológico?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs10" path="edfs10" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs10" path="edfs10" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs10" path="edfs10" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs11"><strong>EDFS11</strong> - Existe internet wireless para o uso nos computadores/tablets?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs11" path="edfs11" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs11" path="edfs11" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs11" path="edfs11" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs12"><strong>EDFS12</strong> - Foram instaladas mesas interativas da Positivo?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs12" path="edfs12" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs12" path="edfs12" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs12" path="edfs12" value="false" />  NÃO</div>
						</div>
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="edfs13"><strong>EDFS13</strong> - É atendido pelo PSE?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs13" path="edfs13" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs13" path="edfs13" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs13" path="edfs13" value="false" />  NÃO</div>
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
								<form:radiobutton id="edfs14" path="edfs14" value="false" />  NÃO</div>
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
							<form:label class="col-sm-3 control-label" path="edfs15"><strong>EDFS15</strong> - O PSF entrega materiais de saúde preventiva?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs15" path="edfs15" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs15" path="edfs15" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs15" path="edfs15" value="false" />  NÃO</div>
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
							<form:label class="col-sm-3 control-label" path="edfs16"><strong>EDFS16</strong> - As campanhas de vacinação chegam à escola?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs16" path="edfs16" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs16" path="edfs16" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs16" path="edfs16" value="false" />  NÃO</div>
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
							<form:label class="col-sm-3 control-label" path="edfs17"><strong>EDFS17</strong> - São realizadas escovações de dentes após as merendas?</form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs17" path="edfs17" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs17" path="edfs17" value="null" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="edfs17" path="edfs17" value="false" />  NÃO</div>
						</div>
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="edfs17o"><strong></strong>Obs:</label>
							<div class="col-sm-4">
								<form:input id="edfs17o" name="edfs17o" type="text" class="form-control" path="edfs17o" />
							</div>
						</div>
						<!-- Textarea -->
						<div class="form-group">
							<label for="anotacoes10a" class="col-sm-3 control-label"><strong>Anotações</strong></label>
							<div class="col-sm-4">
								<form:textarea id="anotacoes10a" name="anotacoes10a" class="form-control" path="anotacoes10a" />
							</div>
						</div>

						<hr>
							
						<!-- CheckBox Switch -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="pub"><strong>Publicar no Raio-X das Escolas?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="pub" path="pub" value="true" />  SIM
							</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="pub" path="pub" value="false" />  NÃO
							</div>
						</div>

						<hr>

						<!-- Button -->
						<div class="form-group">
							<div class="col-sm-7">
								<div class="pull-right">
									<button id="arquivar" class="btn btn-default" title="Deixa de exibir na lista (pode ser recuperada posteriormente)">Arquivar</button>
									<button id="cancelar" class="btn btn-default" title="Limpa o formulário">Cancelar</button>
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