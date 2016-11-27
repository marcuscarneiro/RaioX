<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Painel de Controle</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />

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

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Bem vindo!</h1>
			<p>Este é o Sistema de Controle da Equipe André Régis. Para
				começar escolha uma das opções no menu acima.</p>
		</div>

	</div>
	<!-- /container -->
	<script
		src="<%=request.getContextPath()%>/views/assets/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/views/assets/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/views/assets/js/ie10-viewport-bug-workaround.js"></script>
</head>
</body>
</html>
