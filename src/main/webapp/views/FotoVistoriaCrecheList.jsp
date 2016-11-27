<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<script src="<%=request.getContextPath()%>/views/assets/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/jquery.dataTables.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/dataTables.bootstrap.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/listas.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/jquery.fancybox.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/jquery.fancybox-media.js"></script>
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/views/assets/css/dataTables.bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/jquery.fancybox.css"/>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<title>Fotos da vistoria</title>
	
	<style type="text/css">
		body {
			padding-top: 70px;
			font-size: 140%;
		}
	</style>
</head>
<body>
	
	<jsp:include page="menu.jsp"/>
	
	<a href="adicionarFotosCreche?id=${vistoriaCrecheId}" class="btn btn-primary" style="margin-left: 20px;" role="button">Adicionar mais fotos</a>
	<br />
	<br />
	<div style="margin-left: 20px; margin-right: 20px;">
		<table id="lista"
			class="table table-hover table-striped table-bordered"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>#</th>
					<th>Creche</th>
					<th>Data da vistoria</th>
					<th>Nome</th>
					<th>Foto</th>
					<th>Alterar</th>
					<th>Deletar</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>#</th>
					<th>Creche</th>
					<th>Data da vistoria</th>
					<th>Nome</th>
					<th>Foto</th>
					<th>Alterar</th>
					<th>Deletar</th>
			</tfoot>
			<c:forEach items="${listFotosCreche}" var="foto" varStatus="status">
				<tr class="clickableRow" href="alteraFotoCreche?id=${foto.id}">
					<td>${status.index + 1}</td>
					<td>${foto.vistoriaCreche.creche.nome}</td>
					<td><fmt:formatDate pattern="dd-MM-yyyy" value="${foto.vistoriaCreche.data}" /></td>
					<td>${foto.nome}</td>
					<td>
						<a class="fancybox" href="<%=request.getContextPath()%>${foto.localizacao}" rel="" title="${foto.nome}">
							<img src="<%=request.getContextPath()%>${foto.localizacao}" width="30" height="30">
						</a>
					</td>
					<td><a href="alteraFotoCreche?id=${foto.id}">Alterar</a></td>
					<td><a href="deletaFotoVistoriaCreche?id=${foto.id}&vistoriaCrecheId=${foto.vistoriaCreche.id}">Deletar</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".clickableRow").click(function() {
				window.document.location = $(this).attr("href");
			});
			$(".fancybox").fancybox();
		});
	</script>
</body>
</html>