<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html lang="pt-br" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>RaioX Educação</title>
		<meta name="description" content="RaioX Educação: Sistema" />
		<meta name="keywords" content="Sistema Educação, André Régis, Escolas, Creches" />
		<meta name="author" content="Renato Lins / Marcus Carneiro" />
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/views/assets/images/telainicio/favico.ico" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/demo.css" /> 
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/component.css" />
		<script src="<%=request.getContextPath()%>/views/assets/js/modernizr.custom.js"></script>
		<!-- Desenvolvido com o template Blueprint  -->

	</head>
	<body>

		<div class="container">
			<div id="splitlayout" class="splitlayout">
				<div class="intro">
					<div class="side side-left">
						
						<header class="codropsheader clearfix">
							<span>Vereador do Recife <span class="bp-icon bp-icon-about" data-content="Vereador da cidade do Recife - Pernambuco."></span></span>
							<h1>ANDRÉ RÉGIS</h1>
							<nav>
								<a href="http://andreregis.com.br/" class="bp-icon bp-icon-next" data-info="Site do Vereador"><span>Vá para o Site</span></a>
							</nav>
	
						</header>

						<div class="intro-content">
							<div class="profile"><img src="<%=request.getContextPath()%>/views/assets/images/profile1.jpg" alt="RaioX Escolas"></div>
							<h1>
								<span>RaioX Escolas </span>
								<span><a href="http://www.raioxdasescolas.com.br/raiox/escolas"> Acesse o Sistema</a></span>
								
							</h1>
						</div>
						<div class="overlay"></div>
					</div>
					<div class="side side-right">
						<div class="intro-content">
							<div class="profile"><img src="<%=request.getContextPath()%>/views/assets/images/profile2.jpg" alt="RaioX Creches"></div>
							<h1><span>RaioX Creches </span>
							<span><a href="http://www.raioxdasescolas.com.br/raiox/creches"> Acesse o Sistema</a></span>
							</h1>
						</div>
						<div class="overlay"></div>
					</div>
				</div><!-- /intro -->
				<div class="page page-right">
					<div class="page-inner">
						
						<section>
							<h2>RaioX das Creches</h2>
							<p>Sistema desenvolvido pela equipe do vereador do Recife André Régis. O RaioX das Creches, tem como finalidade, apresentar a sociedade a situação que se encontra as creches do Recife.</p>
							
							<p><a href="http://www.raioxdasescolas.com.br/raiox/creches">ACESSE O SISTEMA</a>.</p>
					
						</section>
					</div><!-- /page-inner -->
				</div><!-- /page-right -->
				<div class="page page-left">
					<div class="page-inner">
						<section>
							<h2>RaioX das Escolas</h2>
							<p> O RaioX das Escolas, tem como finalidade, apresentar a sociedade a situação que se encontra as escolas do Recife, comparando-as e apresentando dados atualizados do IDEB. Sistema desenvolvido pela equipe do vereador do Recife André Régis.</p>
							<p><a href="http://www.raioxdasescolas.com.br/raiox/escolas">ACESSE O SISTEMA</a>.</p>
						</section>
					</div><!-- /page-inner -->
				</div><!-- /page-left -->
				<a href="#" class="back back-right" title="back to intro">&rarr;</a>
				<a href="#" class="back back-left" title="back to intro">&larr;</a>
			</div><!-- /splitlayout -->
		</div><!-- /container -->
		<script src="<%=request.getContextPath()%>/views/assets/js/classie.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/cbpSplitLayout.js"></script>
	</body>
</html>