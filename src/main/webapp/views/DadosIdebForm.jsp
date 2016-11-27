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

	<title>Dados do IDEB</title>
	
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
				<form:form class="form-horizontal" action="salvaDadosIdeb" method="POST">
					<fieldset>

						<!-- Form Name -->
						<h1>Dados do IDEB</h1>

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
						
						<div class="iniciais col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<h2>Anos iniciais</h2>
						
							<div class="idebs-iniciais col-xs-6 col-sm-6 col-md-6 col-lg-6">
							
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2005_ini"><strong>IDEB 2005</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2005_ini" name="did_ideb_2005_ini" type="text" class="form-control" path="did_ideb_2005_ini" />
									</div>
								</div>
		
								
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2007_ini"><strong>IDEB 2007</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2007_ini" name="did_ideb_2007_ini" type="" class="form-control" path="did_ideb_2007_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2009_ini"><strong>IDEB 2009</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2009_ini" name="did_ideb_2009_ini" type="text" class="form-control" path="did_ideb_2009_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2011_ini"><strong>IDEB 2011</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2011_ini" name="did_ideb_2011_ini" type="text" class="form-control" path="did_ideb_2011_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2013_ini"><strong>IDEB 2013</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2013_ini" name="did_ideb_2013_ini" type="text" class="form-control" path="did_ideb_2013_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2015_ini"><strong>IDEB 2015</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2015_ini" name="did_ideb_2015_ini" type="text" class="form-control" path="did_ideb_2015_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2017_ini"><strong>IDEB 2017</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2017_ini" name="did_ideb_2017_ini" type="text" class="form-control" path="did_ideb_2017_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2019_ini"><strong>IDEB 2019</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2019_ini" name="did_ideb_2019_ini" type="text" class="form-control" path="did_ideb_2019_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2021_ini"><strong>IDEB 2021</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2021_ini" name="did_ideb_2021_ini" type="text" class="form-control" path="did_ideb_2021_ini" />
									</div>
								</div>
							
							</div>
							
							<div class="metas-iniciais col-xs-6 col-sm-6 col-md-6 col-lg-6">
							
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2005_ini"><strong>META 2005</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2005_ini" name="did_meta_2005_ini" type="text" class="form-control" path="did_meta_2005_ini" />
									</div>
								</div>
		
								
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2007_ini"><strong>META 2007</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2007_ini" name="did_meta_2007_ini" type="text" class="form-control" path="did_meta_2007_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2009_ini"><strong>META 2009</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2009_ini" name="did_meta_2009_ini" type="text" class="form-control" path="did_meta_2009_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2011_ini"><strong>META 2011</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2011_ini" name="did_meta_2011_ini" type="text" class="form-control" path="did_meta_2011_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2013_ini"><strong>META 2013</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2013_ini" name="did_meta_2013_ini" type="text" class="form-control" path="did_meta_2013_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2015_ini"><strong>META 2015</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2015_ini" name="did_meta_2015_ini" type="text" class="form-control" path="did_meta_2015_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2017_ini"><strong>META 2017</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2017_ini" name="did_meta_2017_ini" type="text" class="form-control" path="did_meta_2017_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2019_ini"><strong>META 2019</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2019_ini" name="did_meta_2019_ini" type="text" class="form-control" path="did_meta_2019_ini" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2021_ini"><strong>META 2021</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2021_ini" name="did_meta_2021_ini" type="text" class="form-control" path="did_meta_2021_ini" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="finais col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<h2>Anos finais</h2>
							
							<div class="idebs-finais col-xs-6 col-sm-6 col-md-6 col-lg-6">
							
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2005_fin"><strong>IDEB 2005</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2005_fin" name="did_ideb_2005_fin" type="text" class="form-control" path="did_ideb_2005_fin" />
									</div>
								</div>
		
								
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2007_fin"><strong>IDEB 2007</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2007_fin" name="did_ideb_2007_fin" type="text" class="form-control" path="did_ideb_2007_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2009_fin"><strong>IDEB 2009</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2009_fin" name="did_ideb_2009_fin" type="text" class="form-control" path="did_ideb_2009_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2011_fin"><strong>IDEB 2011</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2011_fin" name="did_ideb_2011_fin" type="text" class="form-control" path="did_ideb_2011_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2013_fin"><strong>IDEB 2013</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2013_fin" name="did_ideb_2013_fin" type="text" class="form-control" path="did_ideb_2013_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2015_fin"><strong>IDEB 2015</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2015_fin" name="did_ideb_2015_fin" type="text" class="form-control" path="did_ideb_2015_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2017_fin"><strong>IDEB 2017</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2017_fin" name="did_ideb_2017_fin" type="text" class="form-control" path="did_ideb_2017_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2019_fin"><strong>IDEB 2019</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2019_fin" name="did_ideb_2019_fin" type="text" class="form-control" path="did_ideb_2019_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_ideb_2021_fin"><strong>IDEB 2021</strong></label>
									<div class="col-sm-12">
										<form:input id="did_ideb_2021_fin" name="did_ideb_2021_fin" type="text" class="form-control" path="did_ideb_2021_fin" />
									</div>
								</div>
							
							</div>
							
							<div class="metas-finais col-xs-6 col-sm-6 col-md-6 col-lg-6">
							
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2005_fin"><strong>META 2005</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2005_fin" name="did_meta_2005_fin" type="text" class="form-control" path="did_meta_2005_fin" />
									</div>
								</div>
		
								
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2007_fin"><strong>META 2007</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2007_fin" name="did_meta_2007_fin" type="text" class="form-control" path="did_meta_2007_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2009_fin"><strong>META 2009</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2009_fin" name="did_meta_2009_fin" type="text" class="form-control" path="did_meta_2009_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2011_fin"><strong>META 2011</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2011_fin" name="did_meta_2011_fin" type="text" class="form-control" path="did_meta_2011_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2013_fin"><strong>META 2013</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2013_fin" name="did_meta_2013_fin" type="text" class="form-control" path="did_meta_2013_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2015_fin"><strong>META 2015</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2015_fin" name="did_meta_2015_fin" type="text" class="form-control" path="did_meta_2015_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2017_fin"><strong>META 2017</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2017_fin" name="did_meta_2017_fin" type="text" class="form-control" path="did_meta_2017_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2019_fin"><strong>META 2019</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2019_fin" name="did_meta_2019_fin" type="text" class="form-control" path="did_meta_2019_fin" />
									</div>
								</div>
		
								<!-- Text input-->
								<div class="form-group">
									<label class="col-sm-12 control-label" for="did_meta_2021_fin"><strong>META 2021</strong></label>
									<div class="col-sm-12">
										<form:input id="did_meta_2021_fin" name="did_meta_2021_fin" type="text" class="form-control" path="did_meta_2021_fin" />
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