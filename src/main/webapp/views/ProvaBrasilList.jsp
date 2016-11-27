<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/views/assets/css/dataTables.bootstrap.css" />
	
	<script src="<%=request.getContextPath()%>/views/assets/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/jquery.dataTables.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/assets/js/dataTables.bootstrap.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<title>Prova Brasil</title>
	
	<style type="text/css">
		body {
			padding-top: 70px;
			font-size: 140%;
		}
	</style>
</head>
<body>
	
	<jsp:include page="menu.jsp"/>
	
	<a href="novaProvaBrasil" class="btn btn-primary" style="margin-left: 20px;" role="button">Adicionar novos dados da Prova Brasil</a>

	<br />
	<br />
	<div style="margin-left: 20px; margin-right: 20px;">
		<table id="lista"
			class="table table-hover table-striped table-bordered"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>#</th>
					<th>Escola</th>
					<th>Alterar</th>
					<th>Deletar</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>#</th>
					<th>Escola</th>
					<th>Alterar</th>
					<th>Deletar</th>
			</tfoot>
			<c:forEach items="${provaBrasilList}" var="provabrasil" varStatus="status">
				<tr class="clickableRow" href="alteraProvaBrasil?id=${provabrasil.id}">
					<td>${status.index + 1}</td>
					<td>${provabrasil.escola.nome}</td>
					<td><a href="alteraProvaBrasil?id=${provabrasil.id}">Alterar</a></td>
					<td><a href="deletaProvaBrasil?id=${provabrasil.id}">Deletar</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".clickableRow").click(function() {
				window.document.location = $(this).attr("href");
			});
		});
		
		$(document).ready(function() {
			$('#lista').dataTable({
				"order": [[ 1, "asc" ]],
				"language": {
					"lengthMenu": "Exibir _MENU_ linhas por página",
					"zeroRecords": "Nenhum dado encontrado",
					"info": "Exibindo página _PAGE_ de _PAGES_",
					"infoEmpty": "Sem dados disponíveis",
					"infoFiltered": "(filtrados de um total de _MAX_)"
				}
			});
		});
	</script>
</body>
</html>