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
				<form:form class="form-horizontal" action="salvaProvaBrasil" method="POST">
					<fieldset>

						<!-- Form Name -->
						<h1>Prova Brasil - 2013</h1>

						<hr>

						<form:input type="hidden" name="id" path="id" />

						<!-- Select list-->
						<div class="form-group">
							<form:label class="col-sm-12 control-label" path="escola.id"><strong>Escola</strong></form:label>
							<div class="col-sm-12">
								<form:select path="escola.id" class="form-control">
								<c:forEach items="${escolas}" var="escola">
									<option value="${escola.id}">${escola.nome}</option>
								</c:forEach>
								</form:select>
							</div>
						</div>
						
						<div class="iniciais col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<h2>Fundamental I (Anos iniciais)</h2>
						
							<div class="pb-iniciais col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="porc_2013_lp_5"><strong>Porcentagem Português</strong></label>
									<div class="col-sm-12">
										<form:input id="porc_2013_lp_5" name="porc_2013_lp_5" type="text" class="form-control" path="porc_2013_lp_5" />
									</div>
								</div>
		
								
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="porc_2013_mt_5"><strong>Porcentagem Matemática</strong></label>
									<div class="col-sm-12">
										<form:input id="porc_2013_mt_5" name="porc_2013_mt_5" type="text" class="form-control" path="porc_2013_mt_5" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="finais col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<h2>Fundamental II (Anos finais)</h2>
							
							<div class="pb-finais col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="porc_2013_lp_9"><strong>Porcentagem Português</strong></label>
									<div class="col-sm-12">
										<form:input id="porc_2013_lp_9" name="porc_2013_lp_9" type="text" class="form-control" path="porc_2013_lp_9" />
									</div>
								</div>
		
								
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="porc_2013_mt_9"><strong>Porcentagem Matemática</strong></label>
									<div class="col-sm-12">
										<form:input id="porc_2013_mt_9" name="porc_2013_mt_9" type="text" class="form-control" path="porc_2013_mt_9" />
									</div>
								</div>
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