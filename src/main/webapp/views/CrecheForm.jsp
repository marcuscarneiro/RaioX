<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/dropzone.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/style.css" />

<script	src="<%=request.getContextPath()%>/views/assets/js/jquery.min.js"></script>
<script	src="<%=request.getContextPath()%>/views/assets/js/bootstrap.min.js"></script>

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
				<form:form class="form-horizontal" action="salvaCreche" method="POST" modelAttribute="creche" enctype="multipart/form-data">
					<fieldset>

						<!-- Form Name -->
						<h1>Creche/CMEI</h1>
						
						<hr>
						
						<form:input type="hidden" path="id" />

						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="crecheCmei"><strong>Creche ou CMEI?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="crecheCmei" path="crecheCmei" value="true" />  Creche</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="crecheCmei" path="crecheCmei" value="false" />  CMEI</div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="nome"><strong>Nome</strong></label>
							<div class="col-sm-4">
								<form:input id="nome" name="nome" type="text" class="form-control" required="true" path="nome"/>
							</div>
						</div>
						
						<!-- TROCAR POR DROPZONE -->
						<c:if test="${not empty creche.id}">
							<div class="form-group">
							<label class="col-sm-3 control-label" for="fotoCapa"><strong>Foto da fachada</strong></label>
								<div id="fotoCapa" class="col-sm-4">
									<input type="file" name="fileUpload" size="50" />
								</div>
							</div>
					    </c:if>
						
						<c:if test="${not empty creche.fotoCapa}">
							<div class="form-group">
							<label class="col-sm-3 control-label" for="fotoCapa"><strong>Foto atual</strong></label>
								<div id="fotoCapa" class="col-sm-4">
									<img class="fotoCapa" alt="" src="<%=request.getContextPath()%>${creche.fotoCapa}">
								</div>
							</div>
						</c:if>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="requerimentos"><strong>Link dos requerimentos</strong></label>
							<div class="col-sm-4">
								<form:input id="requerimentos"
									name="requerimentos" type="text" path="requerimentos"
									class="form-control"/>
							</div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="rpa"><strong>RPA</strong></label>
							<div class="col-sm-4">
								<form:input id="rpa"
									name="rpa" type="number" path="rpa"
									class="form-control"/>
							</div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="latitude"><strong>Latitude</strong></label>
							<div class="col-sm-4">
								<form:input id="latitude"
									name="latitude" type="text" path="latitude"
									class="form-control"/>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="longitude"><strong>Longitude</strong></label>
							<div class="col-sm-4">
								<form:input id="longitude"
									name="longitude" type="text" path="longitude"
									class="form-control"/>
							</div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="logradouro"><strong>Logradouro</strong></label>
							<div class="col-sm-4">
								<form:input id="logradouro"
									name="logradouro" type="text" path="logradouro"
									class="form-control"/>
							</div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="numeroEnd"><strong>N�mero</strong></label>
							<div class="col-sm-4">
								<form:input id="numeroEnd"
									name="numeroEnd" type="text" path="numeroEnd"
									class="form-control"/>
							</div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="complemento"><strong>Complemento</strong></label>
							<div class="col-sm-4">
								<form:input id="complemento"
									name="complemento" type="text" path="complemento"
									class="form-control"/>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="bairro"><strong>Bairro</strong></label>
							<div class="col-sm-4">
								<form:input id="bairro"
									name="bairro" type="text" path="bairro"
									class="form-control"/>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="cep"><strong>CEP</strong></label>
							<div class="col-sm-4">
								<form:input id="cep"
									name="cep" type="text" path="cep"
									class="form-control"/>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="telefone"><strong>Telefone</strong></label>
							<div class="col-sm-4">
								<form:input id="telefone"
									name="telefone" type="text" path="telefone"
									class="form-control"/>
							</div>
						</div>
						
						<!-- CheckBox -->
						<div class="form-group">
							<form:label class="col-sm-3 control-label" path="nova"><strong>Creche nova?</strong></form:label>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="nova" path="nova" value="true" />  SIM</div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="nova" path="nova" value="" />  </div>
							<div class="col-sm-1 formradio">
								<form:radiobutton id="nova" path="nova" value="false" />  N�O</div>
						</div>
						
						<!-- Button -->
						<div class="form-group">
							<div class="col-sm-7">
								<div class="pull-right">
									<button id="cancelar" type="reset" class="btn btn-default" title="Retorna ao estado inicial">Cancelar</button>
									<button id="gravar" type="submit" name="gravar"
										class="btn btn-primary">Gravar</button>
								</div>
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>
	
	<script	src="<%=request.getContextPath()%>/views/assets/js/ie10-viewport-bug-workaround.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap-dialog.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/dropzone.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/app.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/CrecheForm.js"></script>
</body>
</html>