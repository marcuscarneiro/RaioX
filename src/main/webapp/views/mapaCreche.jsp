<%@ page language="java" pageEncoding="UTF-8" session="false"%>
	<!DOCTYPE html>
	<html>

	<head>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/sweetalert.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/mapbox.css" />
		<link href='https://api.mapbox.com/mapbox-gl-js/v0.18.0/mapbox-gl.css' rel='stylesheet' />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/jquery.fancybox.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/hover.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/mapa.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/frontpage.css" />
		<link  id='GoogleFontsLink' href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet' type='text/css'>

		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/sweetalert.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery-ui.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/ChartNew.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/dropzone.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/mapbox.js"></script>
		<script src='https://api.mapbox.com/mapbox-gl-js/v0.18.0/mapbox-gl.js'></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.fancybox.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.fancybox-media.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap-list-filter.src.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/recife.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa1.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa2.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa3.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa4.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa5.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa6.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.simpleslider.package.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.flip.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/map.js"></script>
		
		<title>Raio-X da Educação Municipal do Recife - Vereador André Régis</title>
		
		<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/views/assets/css/img/raiox-ico.png" sizes="16x16">
		
		<meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />

		<script type="text/javascript">
			var contextPath = '<%=request.getContextPath()%>';

			console.log(contextPath);
		</script>
	</head>

	<body>
		<nav class="side-menu">
			<div class="menu-barra">
				<ul class="menu-botoes">
					<li class="menu-item menu-busca" onclick="abrePainel('pesquisa')">
						<span class="menu-item-icone">
							<i class="fa fa-search fa-2x"></i>
						</span>
						<span class="menu-item-titulo">Pesquisa</span>
					</li>
					<li class="menu-item menu-compare" onclick="abrePainel('compare')">
						<span class="menu-item-icone">
							<i class="fa fa-bar-chart fa-2x"></i>
						</span>
						<span class="menu-item-titulo">Compare</span>
					</li>
					<li class="menu-item menu-ranking" onclick="abrePainel('ranking')">
						<span class="menu-item-icone">
							<i class="fa fa-list-ol fa-2x"></i>
						</span>
						<span class="menu-item-titulo">Rankings</span>
					</li>
					<li class="menu-item menu-filtro" onclick="abrePainel('filtro')">
						<span class="menu-item-icone">
							<i class="fa fa-sliders fa-2x"></i>
						</span>
						<span class="menu-item-titulo">Filtros</span>
					</li>
					<li class="menu-item menu-andre" onclick="abreSiteAndre()">
						<span class="menu-item-icone">
							<i class="fa fa-user fa-2x"></i>
						</span>
						<span class="menu-item-titulo">André Régis</span>
					</li>
					<li class="menu-item menu-videos" onclick="abrePainel('videos')">
						<span class="menu-item-icone">
							<i class="fa fa-youtube-play fa-2x"></i>
						</span>
						<span class="menu-item-titulo">Vídeos</span>
					</li>
				</ul>
			</div>
		</nav>
		<div id="mobile-menu" class="navbar navbar-default navbar-fixed-top"
			role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-menubuilder">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse navbar-menubuilder">
					<ul class="nav navbar-nav navbar-left">
						<li onclick="abrePainel('pesquisa')"><a href="#">Pesquisa</a></li>
						<li onclick="abrePainel('compare')"><a href="#">Compare</a></li>
						<li onclick="abrePainel('filtro')"><a href="#">Filtros</a></li>
						<li onclick="abrePainel('numeros')"><a href="#">Números da educação</a></li>
						<li onclick="abreSiteAndre()"><a href="#">André Régis</a></li>
						<li onclick="abrePainel('videos')"><a href="#">Vídeos</a></li>
					</ul>
				</div>
			</div>
		</div>

	<div class="painel painel-pesquisa">
			<div class="dados-pesquisa detalhe">
				<span class="painel-close" onclick="fechaPaineis()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<div class="cabecalho">
					<h2>Pesquisa de creches</h2>
					<div class="busca">
						<span class="busca-icone">
							<i class="fa fa-search fa-lg"></i>
						</span>
						<form>
							<input id="pesquisaCreche" class="form-control busca-input" type="text"></input>
						</form>
						<span class="formato-titulo">Apresentação:</span>
						<ul class="formato-opcoes fa-ul">
							<li class="formato-item fa-li" onclick="mudaFormatoPesquisa('caixas')">
								<i class="fa fa-th-large"></i>
								<span>Foto</span>
							</li>
							<li class="formato-item fa-li" onclick="mudaFormatoPesquisa('lista')">
								<i class="fa fa-list"></i>
								<span>Lista</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="pesquisa-resultado">
					<ul class="pesquisa-lista">
						
					</ul>
				</div>
			</div>
		</div>
		
		<div class="painel painel-projeto">
			<div class="detalhe-projeto detalhe">
				<span class="painel-close" onclick="fechaPaineis()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<div class="cabecalho">
					<h2>O projeto</h2>
					
				</div>
				
			</div>
		</div>
		
		<div class="painel painel-ranking">
			<div class="detalhe-ranking detalhe">
				<span class="painel-close" onclick="fechaPaineis()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<div class="cabecalho">
					<h2>Ranking das creches por módulo</h2>
				</div>
			</div>
		</div>
		
		<div class="painel painel-creche">
			<span id="fecha-creche" class="painel-close" onclick="fechaPaineis()">
				<i class="fa fa-close fa-2x"></i>
			</span>
			<div class="detalhe-creche detalhe">
				<div class="creche-cabecalho cabecalho">
					<h2 class="creche-nome"></h2>
				</div>
				
				
				<!-- Quadro de dados do IDEB -->
				<div class="dados ideb">
					<span id="fecha-ideb" class="painel-close" onclick="fechaPaineis()">
						<i class="fa fa-close fa-2x"></i>
					</span>
					<header class="ideb-intro">
						<h2>DADOS DO IDEB</h2>
					</header>
		
					<div id="linha1" class="linha col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="coluna col-esq col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
						</div>
						<div class="coluna col-dir col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
						</div>
					</div>
					
					<div id="linha2" class="linha col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="coluna col-esq col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
						</div>
						<div class="coluna col-dir col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="painel painel-compare">
			<div class="dados-compare">
				<span id="fecha-compare" class="painel-close" onclick="fechaPainelCompare()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<div class="cabecalho-compare">
					<h2>Compare as creches</h2>
					<div class="busca-compare">
						<span class="busca-icone">
							<i class="fa fa-search fa-lg"></i>
						</span>
						<form action="teste_submit" method="get" accept-charset="utf-8">
							<input class="busca-input form-control" type="text"></input>
						</form>
						<span class="formato-titulo">Apresentação:</span>
						<ul class="formato-opcoes fa-ul">
							<li class="formato-item fa-li" onclick="mudaFormatoCompare('lista')">
								<i class="fa fa-list"></i>
								<span>Lista</span>
							</li>
							<li class="formato-item fa-li" onclick="mudaFormatoCompare('caixas')">
								<i class="fa fa-th-large"></i>
								<span>Caixas</span>
							</li>
						</ul>
						<span class="compare-instrucao">Selecione abaixo duas creches para compará-las</span>
					</div>
					<ul class="compare-selecionados">
					</ul>
				</div>
				<div class="compare-resultado">
					<ul class="compare-lista">
					</ul>
				</div>
			</div>
			
			<!-- Quadro de COMPARATIVO -->
			<div class="dados compare">
				<span id="fecha-resultado-compare" class="painel-close" onclick="fechaPainelResultadoCompare()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<span id="fecha-compare-desk" class="painel-close" onclick="fechaPainelCompare()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<header class="compare-header">
					<h2>SELECIONE AO LADO AS CRECHES QUE DESEJA COMPARAR</h2>
				</header>
				<div class="compare-titulos">
					<h4 class="compare-titulo-creche1"></h4>
					<h4 class="compare-titulo-creche2"></h4>
				</div>
				
				<div class="compare-creche">
					<h3>Ainda não existem dados de vistorias para estas creches</h3>
					
					<h4>Dados da última vistoria</h4>
	
					<div class="compare-titulos">
						<h4 class="compare-titulo-creche1"></h4>
						<h4 class="compare-titulo-creche2"></h4>
					</div>
	
					<div class="questoes">
						<div class="questao-1">
							<b id="qcre1"></b> <span> - Total de Alunos - <b id="qcre2"></b></span>
						</div>
						<div class="questao-2">
							<b id="qcre1"></b> <span> - Temperatura de sala mais alta - <b id="qcre2"></b></span>
						</div>
						<div class="questao-3">
							<b id="qcre1"></b> <span> - Luminosidade mais baixa - <b id="qcre2"></b></span>
						</div>
						<div class="questao-4">
							<b id="qcre1"></b> <span> - Quantas salas de aula são climatizadas - <b id="qcre2"></b></span>
						</div>
						<div class="questao-5">
							<b id="qcre1"></b> <span> - Existe Biblioteca? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-6">
							<b id="qcre1"></b> <span> - A escola dispõe de rampas de acesso para a acessibilidade de todos os espaços aos alunos? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-7">
							<b id="qcre1"></b> <span> - Há saneamento básico na escola? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-8">
							<b id="qcre1"></b> <span> - Há sala dos professores? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-9">
							<b id="qcre1"></b> <span> - Onde as crianças se alimentam? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-10">
							<b id="qcre1"></b> <span> - Os alunos receberam fardamento em tamanho adequado? - <b id="qcre2"></b></span>
						</div>
					</div>
				</div>
				
				<hr>
				
				<div class="compare-galerias">
					<h4>Galeria de fotos da última vistoria</h4>
					<div id="galcre1" class="galeria">
						<h4></h4>
						<a id="fotocompesq1" class="fancybox boxes" href="#" rel="fotovise" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompesq2" class="fancybox boxes" href="#" rel="fotovise" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompesq3" class="fancybox boxes" href="#" rel="fotovise" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompesq4" class="fancybox boxes" href="#" rel="fotovise" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompesq5" class="fancybox boxes" href="#" rel="fotovise" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompesq6" class="fancybox boxes" href="#" rel="fotovise" title="#">
							<img src="#" width="100" height="100">
						</a>
					</div>
		
					<div id="galcre2" class="galeria">
						<h4></h4>
						<a id="fotocompdir1" class="fancybox boxes" href="#" rel="fotovisd" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompdir2" class="fancybox boxes" href="#" rel="fotovisd" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompdir3" class="fancybox boxes" href="#" rel="fotovisd" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompdir4" class="fancybox boxes" href="#" rel="fotovisd" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompdir5" class="fancybox boxes" href="#" rel="fotovisd" title="#">
							<img src="#" width="100" height="100">
						</a>
						<a id="fotocompdir6" class="fancybox boxes" href="#" rel="fotovisd" title="#">
							<img src="#" width="100" height="100">
						</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="painel painel-filtro">
			<div class="detalhe-filtro detalhe">
				<span class="painel-close" onclick="fechaPainelFiltro()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<div class="cabecalho">
					<h2>Filtros das creches</h2>
					<span class="filtro-opcoes">Marque abaixo o filtro que deseja aplicar no mapa</span>
				</div>
				<div class="filtro-lista">
					<input type="checkbox" id="filtro-1" class="filtro-item" data-filter="meta">
					<label for="filtro-1">Atingiram a meta do IDEB</label>
	
					<input type="checkbox" id="filtro-2" class="filtro-item" data-filter="quadras">
					<label for="filtro-2">Possuem quadra poliesportiva</label>
				</div>
			</div>
		</div>
		
		<div class="painel painel-videos">
			<div class="detalhe-video detalhe">
				<span class="painel-close" onclick="fechaPaineis()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<div class="cabecalho">
					<h2>Vídeos sobre a educação municipal</h2>
				</div>
				<div id="video-gallery">
					<ul class="list video-list">
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/GJimmx4RoHo?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/GJimmx4RoHo/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/y0J5AKOK77M?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/y0J5AKOK77M/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/impb4gsp4mQ?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/impb4gsp4mQ/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/2KLbArUDPL8?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/2KLbArUDPL8/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/__iX8R29eng?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/__iX8R29eng/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/5kSaaXA4ik4?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/5kSaaXA4ik4/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/DfFd4SouIlE?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/DfFd4SouIlE/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/vhu6UOGLEOk?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/vhu6UOGLEOk/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/SApOLLwSJKs?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/SApOLLwSJKs/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/el5-Mh2kc3U?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/el5-Mh2kc3U/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/AzVA-Fg7Zb4?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/AzVA-Fg7Zb4/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/uPT-u6NFklg?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/uPT-u6NFklg/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/wm4PZZVmuWk?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/wm4PZZVmuWk/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/Okyb2UqECjc?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/Okyb2UqECjc/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/Xv89TmHDRak?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/Xv89TmHDRak/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/kEWs892KKj0?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/kEWs892KKj0/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/pcovmR0jtT0?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/pcovmR0jtT0/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/FSs4cS8BWOM?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/FSs4cS8BWOM/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/PYOcG_-YW9s?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/PYOcG_-YW9s/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/5WjHOsf8Itk?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/5WjHOsf8Itk/mqdefault.jpg">
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- Quadro do MAPA -->
		<div id='map'></div>

		<div id="flip" class="flip logo" ontouchstart="this.classList.toggle('hover');">
			<div class="front">
				<img class="top" src="<%=request.getContextPath()%>/views/assets/css/img/marca-sistema-1.png">
			</div>
			<div class="back">
				<img class="top" src="<%=request.getContextPath()%>/views/assets/css/img/marca-sistema-2.png">
			</div>
		</div>
		
		<div class="redes-sociais">
			<ul class="lista-redes">
				<li class="social-item">
					<a target="_blank" href="https://www.facebook.com/fanpage.andreregis">
						<i class="fa-2x fa fa-facebook-square"></i>
					</a>
					<span class="fa-hidden">Facebook</span>
				</li>
				<li class="social-item">
					<a target="_blank" href="https://www.flickr.com/photos/flickr_andreregis">
						<i class="fa-2x fa fa-flickr"></i>
					</a>
					<span class="fa-hidden">Flickr</span>
				</li>
				<li class="social-item">
					<a target="_blank" href="https://www.youtube.com/user/vereadorandreregis">
						<i class="fa-2x fa fa-youtube-square"></i>
					</a>
					<span class="fa-hidden">YouTube</span>
				</li>
				<li class="social-item">
					<a target="_blank" href="https://instagram.com/andreregisdecarvalho">
						<i class="fa-2x fa fa-instagram"></i>
					</a>
					<span class="fa-hidden">Instagram</span>
				</li>
				<li class="social-item">
					<a target="_blank" href="https://twitter.com/andregis">
						<i class="fa-2x fa fa-twitter-square"></i>
					</a>
					<span class="fa-hidden">Twitter</span>
				</li>
				<li class="social-item">
					<a target="_blank" href="https://soundcloud.com/andreregis">
						<i class="fa-2x fa fa-soundcloud"></i>
					</a>
					<span class="fa-hidden">Soundcloud</span>
				</li>
			</ul>
		</div>
		
		<div class="helper">
			<i class="fa fa-question-circle-o"></i>
		</div>
		
		<footer>
			<div id="home-mob" class="rpa-item rpa-home" onclick="focusRpa(0)">
				<i class="fa fa-home fa-2x"></i>
			</div>
			<div class="footer-filtros">
				<span class="filtro-rpa" data-toggle="tooltip" data-placement="right" title="Região Político-Administrativa (RPA)">Filtre por RPA:</span>
				<ul class="lista-rpas">
					<li class="rpa-item rpa-home" onclick="focusRpa(0)">
						<i class="fa fa-home fa-2x"></i>
					</li>
					<li class="rpa-item box-numeros" onclick="focusRpa(1)" data-toggle="tooltip" data-placement="top" title="RPA 1">1</li>
					<li class="rpa-item box-numeros" onclick="focusRpa(2)" data-toggle="tooltip" data-placement="top" title="RPA 2">2</li>
					<li class="rpa-item box-numeros" onclick="focusRpa(3)" data-toggle="tooltip" data-placement="top" title="RPA 3">3</li>
					<li class="rpa-item box-numeros" onclick="focusRpa(4)" data-toggle="tooltip" data-placement="top" title="RPA 4">4</li>
					<li class="rpa-item box-numeros" onclick="focusRpa(5)" data-toggle="tooltip" data-placement="top" title="RPA 5">5</li>
					<li class="rpa-item box-numeros" onclick="focusRpa(6)" data-toggle="tooltip" data-placement="top" title="RPA 6">6</li>
				</ul>
			</div>
			<div class="legenda">
				<span>Legenda</span>
				<ul class="lista-legenda">
					<li id="pin-verde" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Superou a meta IDEB e ficou acima de 6">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/verde-15.png">
					</li>
					<li id="pin-azul" class="legenda-item" data-toggle="tooltip" data-placement="top" title="BOM">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/azul-15.png">
					</li>
					<li class="legenda-item">
						<img id="pin-amarelo" src="<%=request.getContextPath()%>/views/assets/css/img/amarelo-15.png" data-toggle="tooltip" data-placement="top" title="Atingiu a meta IDEB mas ficou abaixo de 6">
					</li>
					<li id="pin-vermelho" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Não atingiu a meta do IDEB">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/vermelho-15.png">
					</li>
					<li id="pin-cinza" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Sem dados do IDEB">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/cinza-15.png">
					</li>
					<li id="pin-preto" class="legenda-item" data-toggle="tooltip" data-placement="top" title="RUIM">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/preto-15.png">
					</li>
				</ul>
				<span class="copyright">© Todos os direitos reservados</span>
			</div>
		</footer>
		
		<!-- Lista invisível dos marcadores -->
		<div id="marker-list"></div>
		
		<div id="dialog-message" title="Relatório indisponível">
			<p>
				O relatório deste ano ainda não está cadastrado.
			</p>
			<p>
				Em breve iremos disponibilizá-lo aqui.
			</p>
		</div>
		<script src="<%=request.getContextPath()%>/views/assets/js/mapaCreche.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('[data-toggle="tooltip"]').tooltip(); 
				$(".videos").fancybox({
					maxWidth	: 800,
					maxHeight	: 600,
					fitToView	: false,
					width		: '70%',
					height		: '70%',
					autoSize	: false,
					closeClick	: false,
					openEffect	: 'none',
					closeEffect	: 'none'
				});
			});
        </script>
        <script type="text/javascript">
	        $(function(){
	            $(".flip").flip({
	                trigger: 'hover'
	            });
	        });
        </script>
        <script src="<%=request.getContextPath()%>/views/assets/js/chartsRaiox.js"></script>
        <script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-81736019-1', 'auto');
		  ga('send', 'pageview');
		
		</script>
	</body>

	</html>