<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/bootstrap-dialog.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/style2.css" />

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
		<!-- Form Name -->
		<h1>Fotos da visita - ${visita.escola.nome}</h1>
		
		<hr>
		<div class="panel-body">
			<div>
				<form:form id="dropzone-form" modelAttribute="visita" class="dropzone"
					enctype="multipart/form-data">
					<form:input type="hidden" path="id" name="id"/>
					<div
						class="dz-default dz-message file-dropzone text-center well col-sm-12">
						<span>
							Para anexar as fotos, arraste-as e solte-as aqui</span><br> <span>ou</span><br>
						<span>Apenas clique</span>
					</div>

					<!-- this is were the previews should be shown. -->
					<div class="dropzone-previews"></div>
				</form:form>
				<hr>
				<button id="upload-button" class="btn btn-primary">
					Enviar
				</button>
				<a class="btn btn-primary pull-right" href="verFotos?id=${visita.id}"> 
					Ver todas as fotos
				</a>
			</div>
		</div>
	</div>
	
	<script src="<%=request.getContextPath()%>/views/assets/js/jquery-2.1.1.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap-dialog.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/dropzone.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/foto.js"></script>
</body>
</html>