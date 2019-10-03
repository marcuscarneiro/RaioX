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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/proficiencia.css" />

	<script src="<%=request.getContextPath()%>/views/assets/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap-checkbox.js"></script>

	<title>Prova Brasil</title>
	
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
				<form:form class="form-horizontal" modelAttribute="visita">
					<fieldset>

						<!-- Form Name -->
						<h1>Ficha de medições - ${visita.escola.nome}</h1>

						<hr>

						<form:input type="hidden" name="id" path="id" />

						
						<hr>
						
						<div id="medicaoList" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div id="medicao1" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-6 control-label"><strong>Ambiente</strong></label>
									<div class="col-sm-6">
										<input id="ambiente1" type="text" class="form-control" />
									</div>
								</div>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-3 control-label"><strong>Temperatura</strong></label>
									<div class="col-sm-3">
										<input id="temperatura1" type="text" class="form-control" />
									</div>
								</div>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-3 control-label"><strong>Luminosidade</strong></label>
									<div class="col-sm-3">
										<input id="luminosidade1" type="text" class="form-control" />
									</div>
								</div>
							</div>
						</div>


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