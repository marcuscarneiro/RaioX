<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />
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
				<form:form class="form-horizontal" action="salvaFoto" method="POST" modelAttribute="foto">
					<fieldset>

						<!-- Form Name -->
						<h1>Foto</h1>
						
						<hr>
						
						<form:input type="hidden" path="id" />
						<form:input type="hidden" path="visita.id" />
						<form:input type="hidden" path="localizacao" />
						<form:input type="hidden" path="localfisico" />
						<form:input type="hidden" path="tamanho" />
						<form:input type="hidden" path="tipo" />

						<c:if test="${not empty foto.localizacao}">
							<div class="form-group">
							<label class="col-sm-3 control-label" for="foto"><strong>Foto</strong></label>
								<div id="foto" class="col-sm-4">
									<img class="fotoCapa" alt="" src="<%=request.getContextPath()%>${foto.localizacao}">
								</div>
							</div>
						</c:if>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label" for="escola"><strong>Escola</strong></label>
							<div class="col-sm-4">
								<span id="escola">${foto.visita.escola.nome}</span>
							</div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="nome"><strong>Nome</strong></label>
							<div class="col-sm-4">
								<form:input id="nome"
									name="nome" type="text" path="nome"
									class="form-control"/>
							</div>
						</div>
						
						<!-- Text input-->
						<div class="form-group">
							<label class="col-sm-3 control-label"
								for="legenda"><strong>Legenda</strong></label>
							<div class="col-sm-4">
								<form:input id="legenda"
									name="legenda" type="text" path="legenda"
									class="form-control"/>
							</div>
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
</body>
</html>