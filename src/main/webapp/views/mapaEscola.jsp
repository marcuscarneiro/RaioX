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
		
		<title>Raio-X das Escolas Municipais do Recife - Vereador André Régis</title>
		
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
					<li class="menu-item menu-filtro" onclick="abrePainel('filtro')">
						<span class="menu-item-icone">
							<i class="fa fa-sliders fa-2x"></i>
						</span>
						<span class="menu-item-titulo">Filtros</span>
					</li>
					<li class="menu-item menu-numeros" onclick="abrePainel('numeros')">
						<span class="menu-item-icone">
							<i class="fa fa-pie-chart fa-2x"></i>
						</span>
						<span class="menu-item-titulo">Números da educação</span>
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
					<li class="menu-item menu-creche" onclick="abreSiteCreches()">
						<span class="menu-item-icone">
							<i class="fa fa-child fa-2x"></i>
						</span>
						<span class="menu-item-titulo">Creches</span>
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
					<h2>Pesquisa de escolas</h2>
					<div class="busca">
						<span class="busca-icone">
							<i class="fa fa-search fa-lg"></i>
						</span>
						<form>
							<input id="pesquisaEscola" class="form-control busca-input" type="text"></input>
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
		
		<div class="painel painel-contato">
			<div class="detalhe-contato detalhe">
				<span class="painel-close" onclick="fechaPaineis()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<div class="cabecalho">
					<h2>Envie uma mensagem</h2>
					
				</div>
				
			</div>
		</div>
		
		<div class="painel painel-numeros">
			<div class="detalhe-numeros detalhe">
				<span class="painel-close" onclick="fechaPaineis()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<div class="cabecalho">
					<h2>Números da educação municipal</h2>
				</div>
				<div class="ideb-capitais num-div col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Comparativo dos IDEBs das Capitais (Fundamental I)</h3>
					<ul class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<li>
							<span class="cap-tr">Capital</span>
							<span class="cap-tr cap-qtd">IDEB</span>
						</li>
						<li>
							<span>Curitiba</span>
							<span class="cap-qtd">6,3</span>
						</li>
						<li>
							<span>Palmas</span>
							<span class="cap-qtd">6,2</span>
						</li>
						<li>
							<span>Terezina</span>
							<span class="cap-qtd">6,1</span>
						</li>
						<li>
							<span>Belo Horizonte</span>
							<span class="cap-qtd">6,1</span>
						</li>
						<li>
							<span>Florianópolis</span>
							<span class="cap-qtd">6,1</span>
						</li>
						<li>
							<span>São Paulo</span>
							<span class="cap-qtd">5,8</span>
						</li>
						<li>
							<span>Rio Branco</span>
							<span class="cap-qtd">5,8</span>
						</li>
						<li>
							<span>Rio de Janeiro</span>
							<span class="cap-qtd">5,6</span>
						</li>
						<li>
							<span>Vitória</span>
							<span class="cap-qtd">5,6</span>
						</li>
						<li>
							<span>Goiânia</span>
							<span class="cap-qtd">5,5</span>
						</li>
						<li>
							<span>Boa Vista</span>
							<span class="cap-qtd">5,5</span>
						</li>
						<li>
							<span>Cuiabá</span>
							<span class="cap-qtd">5,5</span>
						</li>
						<li>
							<span>Fortaleza</span>
							<span class="cap-qtd">5,4</span>
						</li>
						<li>
							<span>Campo Grande</span>
							<span class="cap-qtd">5,4</span>
						</li>
						<li>
							<span>Manaus</span>
							<span class="cap-qtd">5,4</span>
						</li>
						<li>
							<span>Porto Velho</span>
							<span class="cap-qtd">4,8</span>
						</li>
						<li>
							<span>Natal</span>
							<span class="cap-qtd">4,7</span>
						</li>
						<li>
							<span>Salvador</span>
							<span class="cap-qtd">4,7</span>
						</li>
						<li>
							<span class="ideb-hi">Recife</span>
							<span class="cap-qtd ideb-hi">4,6</span>
						</li>
						<li>
							<span>João Pessoa</span>
							<span class="cap-qtd">4,6</span>
						</li>
						<li>
							<span>Porto Alegre</span>
							<span class="cap-qtd">4,6</span>
						</li>
						<li>
							<span>Belém</span>
							<span class="cap-qtd">4,6</span>
						</li>
						<li>
							<span>São Luís</span>
							<span class="cap-qtd">4,5</span>
						</li>
						<li>
							<span>Aracaju</span>
							<span class="cap-qtd">4,4</span>
						</li>
						<li>
							<span>Maceió</span>
							<span class="cap-qtd">4,4</span>
						</li>
						<li>
							<span>Macapá</span>
							<span class="cap-qtd">4,4</span>
						</li>
						<li>
							<span>Brasília</span>
							<span class="cap-qtd">Sem dados</span>
						</li>
					</ul>
					<div class="cap-info col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<span>Brasilia não possui escolas municipais</span>
						<span>Recife fica na 8ª posição entre as 10 piores capitais brasileiras</span>
						<canvas id="chartIdebCapI" width="700" height="400"></canvas>
					</div>
				</div>
				<div class="ideb-capitais num-div col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Comparativo dos IDEBs das Capitais (Fundamental II)</h3>
					<ul class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<li>
							<span class="cap-tr">Capital</span>
							<span class="cap-tr cap-qtd">IDEB</span>
						</li>
						<li>
							<span>Palmas</span>
							<span class="cap-qtd">5,6</span>
						</li>
						<li>
							<span>Curitiba</span>
							<span class="cap-qtd">5,3</span>
						</li>
						<li>
							<span>Terezina</span>
							<span class="cap-qtd">5,2</span>
						</li>
						<li>
							<span>Campo Grande</span>
							<span class="cap-qtd">5,0</span>
						</li>
						<li>
							<span>Florianópolis</span>
							<span class="cap-qtd">4,9</span>
						</li>
						<li>
							<span>Belo Horizonte</span>
							<span class="cap-qtd">4,8</span>
						</li>
						<li>
							<span>Macapá</span>
							<span class="cap-qtd">4,6</span>
						</li>
						<li>
							<span>Cuiabá</span>
							<span class="cap-qtd">4,5</span>
						</li>
						<li>
							<span>Fortaleza</span>
							<span class="cap-qtd">4,4</span>
						</li>
						<li>
							<span>São Paulo</span>
							<span class="cap-qtd">4,3</span>
						</li>
						<li>
							<span>Rio de Janeiro</span>
							<span class="cap-qtd">4,3</span>
						</li>
						<li>
							<span>Vitória</span>
							<span class="cap-qtd">4,3</span>
						</li>
						<li>
							<span>Manaus</span>
							<span class="cap-qtd">4,3</span>
						</li>
						<li>
							<span>Belém</span>
							<span class="cap-qtd">4,0</span>
						</li>
						<li>
							<span>São Luiz</span>
							<span class="cap-qtd">3,9</span>
						</li>
						<li>
							<span>João Pessoa</span>
							<span class="cap-qtd">3,8</span>
						</li>
						<li>
							<span>Porto Alegre</span>
							<span class="cap-qtd">3,8</span>
						</li>
						<li>
							<span>Natal</span>
							<span class="cap-qtd">3,6</span>
						</li>
						<li>
							<span>Porto Velho</span>
							<span class="cap-qtd">3,5</span>
						</li>
						<li>
							<span class="ideb-hi">Recife</span>
							<span class="cap-qtd ideb-hi">3,5</span>
						</li>
						<li>
							<span>Salvador</span>
							<span class="cap-qtd">3,4</span>
						</li>
						<li>
							<span>Aracaju</span>
							<span class="cap-qtd">3,4</span>
						</li>
						<li>
							<span>Maceió</span>
							<span class="cap-qtd">3,4</span>
						</li>
						<li>
							<span>Rio Branco</span>
							<span class="cap-qtd">Sem dados</span>
						</li>
						<li>
							<span>Goiânia</span>
							<span class="cap-qtd">Sem dados</span>
						</li>
						<li>
							<span>Boa Vista</span>
							<span class="cap-qtd">Sem dados</span>
						</li>
						<li>
							<span>Brasília</span>
							<span class="cap-qtd">Sem dados</span>
						</li>
					</ul>
					<div class="cap-info col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<span>Boa Vista, Goiânia e Rio Branco não possuem dados</span>
						<span>Brasília não possui escolas municipais</span>
						<span>Recife possui a 4ª pior nota entre as capitais brasileiras</span>
						<canvas id="chartIdebCapII" width="700" height="400"></canvas>
					</div>
				</div>
				<div class="aprendizado-portugues num-div col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Taxas de aprendizado adequado em Português</h3>
					<h4>Indica a porcentagem de alunos que aprendeu a matéria adequadamente</h4>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<ul class="apr-cap">
							<li>
								<span class="cap-tr">Capitais do Nordeste</span>
								<span class="cap-tr cap-qtd">Taxa</span>
							</li>
							<li>
								<span>Teresina</span>
								<span class="cap-qtd">63%</span>
							</li>
							<li>
								<span>Fortaleza</span>
								<span class="cap-qtd">55%</span>
							</li>
							<li>
								<span>Salvador</span>
								<span class="cap-qtd">45%</span>
							</li>
							<li>
								<span>João Pessoa</span>
								<span class="cap-qtd">41%</span>
							</li>
							<li>
								<span class="ideb-hi">Recife</span>
								<span class="cap-qtd ideb-hi">40%</span>
							</li>
							<li>
								<span>Maceió</span>
								<span class="cap-qtd">38%</span>
							</li>
							<li>
								<span>Natal</span>
								<span class="cap-qtd">37%</span>
							</li>
							<li>
								<span>São Luís</span>
								<span class="cap-qtd">34%</span>
							</li>
							<li>
								<span>Aracaju</span>
								<span class="cap-qtd">33%</span>
							</li>
						</ul>
					</div>
					<div class="cap-info col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<span>Recife fica na 5ª posição no Fundamental I</span>
						<canvas id="chartAprPortI" width="700" height="400"></canvas>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						
						<ul class="apr-cap">
							<li>
								<span class="cap-tr">Capitais do Nordeste</span>
								<span class="cap-tr cap-qtd">Taxa</span>
							</li>
							<li>
								<span>Teresina</span>
								<span class="cap-qtd">39%</span>
							</li>
							<li>
								<span>Fortaleza</span>
								<span class="cap-qtd">35%</span>
							</li>
							<li>
								<span>Maceió</span>
								<span class="cap-qtd">26%</span>
							</li>
							<li>
								<span>Natal</span>
								<span class="cap-qtd">25%</span>
							</li>
							<li>
								<span>Salvador</span>
								<span class="cap-qtd">24%</span>
							</li>
							<li>
								<span>João Pessoa</span>
								<span class="cap-qtd">24%</span>
							</li>
							<li>
								<span>Aracaju</span>
								<span class="cap-qtd">23%</span>
							</li>
							<li>
								<span class="ideb-hi">Recife</span>
								<span class="cap-qtd ideb-hi">20%</span>
							</li>
							<li>
								<span>São Luís</span>
								<span class="cap-qtd">19%</span>
							</li>
						</ul>
					</div>
					<div class="cap-info col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<span>Recife fica na penúltima posição</span>
						<canvas id="chartAprPortII" width="700" height="400"></canvas>
					</div>
				</div>
				<div class="aprendizado-matematica num-div col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Taxas de aprendizado adequado em Matemática</h3>
					<h4>Indica a porcentagem de alunos que aprendeu a matéria adequadamente</h4>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<ul class="apr-cap">
							<li>
								<span class="cap-tr">Capitais do Nordeste</span>
								<span class="cap-tr cap-qtd">Taxa</span>
							</li>
							<li>
								<span>Teresina</span>
								<span class="cap-qtd">51%</span>
							</li>
							<li>
								<span>Fortaleza</span>
								<span class="cap-qtd">36%</span>
							</li>
							<li>
								<span>Salvador</span>
								<span class="cap-qtd">30%</span>
							</li>
							<li>
								<span>Aracaju</span>
								<span class="cap-qtd">28%</span>
							</li>
							<li>
								<span>João Pessoa</span>
								<span class="cap-qtd">25%</span>
							</li>
							<li>
								<span class="ideb-hi">Recife</span>
								<span class="cap-qtd ideb-hi">24%</span>
							</li>
							<li>
								<span>Maceió</span>
								<span class="cap-qtd">22%</span>
							</li>
							<li>
								<span>Natal</span>
								<span class="cap-qtd">22%</span>
							</li>
							<li>
								<span>São Luís</span>
								<span class="cap-qtd">17%</span>
							</li>
						</ul>
					</div>
					<div class="cap-info col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<span>Recife apresenta a 4ª pior taxa de aprendizado do Nordeste no Ensino Fundamental I</span>
						<canvas id="chartAprMatI" width="700" height="400"></canvas>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						
						<ul class="apr-cap">
							<li>
								<span class="cap-tr">Capitais do Nordeste</span>
								<span class="cap-tr cap-qtd">Taxa</span>
							</li>
							<li>
								<span>Teresina</span>
								<span class="cap-qtd">20%</span>
							</li>
							<li>
								<span>Fortaleza</span>
								<span class="cap-qtd">12%</span>
							</li>
							<li>
								<span>Natal</span>
								<span class="cap-qtd">11%</span>
							</li>
							<li>
								<span>Maceió</span>
								<span class="cap-qtd">10%</span>
							</li>
							<li>
								<span>Aracaju</span>
								<span class="cap-qtd">9%</span>
							</li>
							<li>
								<span>Salvador</span>
								<span class="cap-qtd">8%</span>
							</li>
							<li>
								<span>João Pessoa</span>
								<span class="cap-qtd">7%</span>
							</li>
							<li>
								<span class="ideb-hi">Recife</span>
								<span class="cap-qtd ideb-hi">7%</span>
							</li>
							<li>
								<span>São Luís</span>
								<span class="cap-qtd">5%</span>
							</li>
						</ul>
					</div>
					<div class="cap-info col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<span>Recife tem o 2º pior aprendizado da região Nordeste no Ensino Fundamental II</span>
						<canvas id="chartAprMatII" width="700" height="400"></canvas>
					</div>
				</div>
				<div class="matriculados num-div col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Número de alunos matriculados no ensino fundamental no Recife</h3>
					<ul class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<li>
							<span class="mat-tr">Ano</span>
							<span class="mat-tr mat-qtd">Quantidade</span>
						</li>
						<li>
							<span>2001</span>
							<span class="mat-qtd">95.462</span>
						</li>
						<li>
							<span>2002</span>
							<span class="mat-qtd">100.817</span>
						</li>
						<li>
							<span>2003</span>
							<span class="mat-qtd">104.012</span>
						</li>
						<li>
							<span>2004</span>
							<span class="mat-qtd">101.752</span>
						</li>
						<li>
							<span>2005</span>
							<span class="mat-qtd">98.030</span>
						</li>
						<li>
							<span>2006</span>
							<span class="mat-qtd">93.985</span>
						</li>
						<li>
							<span>2007</span>
							<span class="mat-qtd">87.455</span>
						</li>
						<li>
							<span>2008</span>
							<span class="mat-qtd">83.676</span>
						</li>
						<li>
							<span>2009</span>
							<span class="mat-qtd">77.287</span>
						</li>
						<li>
							<span>2010</span>
							<span class="mat-qtd">71.983</span>
						</li>
						<li>
							<span>2011</span>
							<span class="mat-qtd">67.765</span>
						</li>
						<li>
							<span>2012</span>
							<span class="mat-qtd">64.665</span>
						</li>
						<li>
							<span>2013</span>
							<span class="mat-qtd">62.459</span>
						</li>
						<li>
							<span>2014</span>
							<span class="mat-qtd">61.241</span>
						</li>
						<li>
							<span>2015</span>
							<span class="mat-qtd">59.959</span>
						</li>
					</ul>
					<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<canvas id="chartMatriculados" width="700" height="400"></canvas>
					</div>
				</div>
				<div class="ideb-fundamental-i num-div col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Evolução do IDEB no Ensino Fundamental I</h3>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<ul class="ideb-anos">
							<li>
								<span class="idb-tr idb-ano">Ano</span>
								<span class="idb-tr idb-obs">IDEBs Observados</span>
								<span class="idb-tr idb-meta">Metas Projetadas</span>
							</li>
							<li>
								<span class="idb-ano">2005</span>
								<span class="idb-obs">3,3</span>
								<span class="idb-meta">-</span>
							</li>
							<li>
								<span class="idb-ano">2007</span>
								<span class="idb-obs">3,8</span>
								<span class="idb-meta">3,3</span>
							</li>
							<li>
								<span class="idb-ano">2009</span>
								<span class="idb-obs">4,1</span>
								<span class="idb-meta">3,7</span>
							</li>
							<li>
								<span class="idb-ano">2011</span>
								<span class="idb-obs">4,1</span>
								<span class="idb-meta">4,1</span>
							</li>
							<li>
								<span class="idb-ano">2013</span>
								<span class="idb-obs">4,3</span>
								<span class="idb-meta">4,3</span>
							</li>
							<li>
								<span class="idb-ano">2015</span>
								<span class="idb-obs">4,6</span>
								<span class="idb-meta">4,6</span>
							</li>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<canvas id="chartIdebFunI" width="700" height="400"></canvas>
					</div>
				</div>
				<div class="ideb-fundamental-ii num-div col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h3>Evolução do IDEB no Ensino Fundamental II</h3>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<ul class="ideb-anos">
							<li>
								<span class="idb-tr idb-ano">Ano</span>
								<span class="idb-tr idb-obs">IDEBs Observados</span>
								<span class="idb-tr idb-meta">Metas Projetadas</span>
							</li>
							<li>
								<span class="idb-ano">2005</span>
								<span class="idb-obs">2,8</span>
								<span class="idb-meta">-</span>
							</li>
							<li>
								<span class="idb-ano">2007</span>
								<span class="idb-obs">2,5</span>
								<span class="idb-meta">2,8</span>
							</li>
							<li>
								<span class="idb-ano">2009</span>
								<span class="idb-obs">2,7</span>
								<span class="idb-meta">3</span>
							</li>
							<li>
								<span class="idb-ano">2011</span>
								<span class="idb-obs">2,9</span>
								<span class="idb-meta">3,3</span>
							</li>
							<li>
								<span class="idb-ano">2013</span>
								<span class="idb-obs">3,2</span>
								<span class="idb-meta">3,6</span>
							</li>
							<li>
								<span class="idb-ano">2015</span>
								<span class="idb-obs">3,5</span>
								<span class="idb-meta">4,0</span>
							</li>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<canvas id="chartIdebFunII" width="700" height="400"></canvas>
					</div>
				</div>
			</div>
		</div>
		
		<div class="painel painel-escola">
			<span id="fecha-escola" class="painel-close" onclick="fechaPaineis()">
				<i class="fa fa-close fa-2x"></i>
			</span>
			<div class="detalhe-escola detalhe">
				<div class="escola-left">
					<div class="escola-cabecalho cabecalho">
						<h2 class="escola-nome"></h2>
					</div>
					
					<div class="foto-fachada">
						<img alt="Foto da fachada" src="<%=request.getContextPath()%>/views/assets/css/img/thumb.jpg">
					</div>
					
					<!-- Quadro de dados da Fiscalização -->
					<div class="dados fiscalizacao">
						
						<header class="fiscalizacao-header">
							<h2>FISCALIZAÇÃO</h2>
						</header>
						<div class="fiscalizacao-datas">
							<ul>
								<li><span>1ª VISTORIA</span></li>
								<li><span>2ª VISTORIA</span></li>
								<li><span>3ª VISTORIA</span></li>
							</ul>
						</div>
						<a id="foto-visita-1" class="fancybox big-box" href="#" rel="fotoescola" title="#">
							<img src="#">
						</a>
						<ul class="fiscalizacao-fotos">
							<li>
								<a id="foto-visita-2" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
							<li>
								<a id="foto-visita-3" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
							<li>
								<a id="foto-visita-4" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
							<li>
								<a id="foto-visita-5" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
							<li>
								<a id="foto-visita-6" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
							<li>
								<a id="foto-visita-7" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
							<li>
								<a id="foto-visita-8" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
							<li>
								<a id="foto-visita-9" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
							<li>
								<a id="foto-visita-10" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
						</ul>
						<div class="fiscalizacao-questionario">
							<h3>Informações da escola</h3>
							<h4 class="data-vistoria">Data da vistoria: <span>20/10/2015</span></h4>
							<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<li class="questao-1">
									<span>Total de Alunos:</span>
									<span class="questao-info"></span>
								</li>
								<li class="questao-2">
									<span>Temperatura de sala mais alta:</span>
									<span class="questao-info"></span>
								</li>
								<li>
									<span>Temperatura determinada pela ABNT:</span>
									<span class="questao-info">entre 20ºC e 23ºC</span>
								</li>
								<li class="questao-3">
									<span>Luminosidade mais baixa:</span>
									<span class="questao-info"></span>
								</li>
								<li>
									<span>Luminosidade determinada pela ABNT:</span>
									<span class="questao-info">entre 200 lux e 700 lux</span>
								</li>
								<li class="questao-6">
									<span>A escola dispõe de rampas de acesso em todos os espaços?</span>
									<span class="questao-info"></span>
								</li>
								<li class="questao-4">
									<span>Quantas salas de aula são climatizadas:</span>
									<span class="questao-info"></span>
								</li>
								<li class="questao-5">
									<span>Existe Biblioteca?</span>
									<span class="questao-info"></span>
								</li>
								<li class="questao-7">
									<span>Há saneamento básico na escola?</span>
									<span class="questao-info"></span>
								</li>
								<li class="questao-8">
									<span>Há sala dos professores?</span>
									<span class="questao-info"></span>
								</li>
								<li class="questao-9">
									<span>Onde as crianças se alimentam?</span>
									<span class="questao-info"></span>
								</li>
								<li class="questao-10">
									<span>Os alunos receberam fardamento em tamanho adequado?</span>
									<span class="questao-info"></span>
								</li>
							</ul>
						</div>
						<div class="fiscalicazaoRelatorio">
							<span class="btn-relatorio">RELATÓRIO COMPLETO</span>
							<a target="_blank" href="#" class="btn-relatorio">RELATÓRIO COMPLETO</a>
						</div>
						<div class="fiscalicazaoRequerimento">
							<a target="_blank" href="#" class="btn-requerimento">REQUERIMENTOS</a>
						</div>
					</div>
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
		
					<div class="ideb-aprendizado">
						<div class="graficos">
							<h3>Nível do aprendizado na escola</h3>
							<div id="pizza1" class="grafico-pizza col-xs-12 col-sm-12 col-md-6 col-lg-6">
								
							</div>
		
							<div id="pizza2" class="grafico-pizza col-xs-12 col-sm-12 col-md-6 col-lg-6">
								
							</div>
		
							<div id="pizza3" class="grafico-pizza col-xs-12 col-sm-12 col-md-6 col-lg-6">
								
							</div>
		
							<div id="pizza4" class="grafico-pizza col-xs-12 col-sm-12 col-md-6 col-lg-6">
								
							</div>
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
					<h2>Compare as escolas</h2>
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
						<span class="compare-instrucao">Selecione abaixo duas escolas para compará-las</span>
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
					<h2>SELECIONE AO LADO AS ESCOLAS QUE DESEJA COMPARAR</h2>
				</header>
				<div class="compare-titulos">
					<h4 class="compare-titulo-escola1"></h4>
					<h4 class="compare-titulo-escola2"></h4>
				</div>
				
				<div class="compare-ideb">
					<h3>Ainda não existem dados do IDEB para estas escolas</h3>
					<canvas class="idebcompare grafico-linha" width="700" height="400"></canvas>
				</div>
				
				<hr>
				
				<div class="compare-aprendizado">
					<h3>Ainda não existem dados da Prova Brasil para estas escolas</h3>
					<canvas class="aprendizadocompare grafico-barra" width="700" height="400"></canvas>
				</div>
				
				<hr>
	
				<div class="compare-escola">
					<h3>Ainda não existem dados de visitas para estas escolas</h3>
					
					<h4>Dados da última visita</h4>
	
					<div class="compare-titulos">
						<h4 class="compare-titulo-escola1"></h4>
						<h4 class="compare-titulo-escola2"></h4>
					</div>
	
					<div class="questoes">
						<div class="questao-1">
							<b id="qesc1"></b> <span> - Total de Alunos - <b id="qesc2"></b></span>
						</div>
						<div class="questao-2">
							<b id="qesc1"></b> <span> - Temperatura de sala mais alta - <b id="qesc2"></b></span>
						</div>
						<div class="questao-3">
							<b id="qesc1"></b> <span> - Luminosidade mais baixa - <b id="qesc2"></b></span>
						</div>
						<div class="questao-4">
							<b id="qesc1"></b> <span> - Quantas salas de aula são climatizadas - <b id="qesc2"></b></span>
						</div>
						<div class="questao-5">
							<b id="qesc1"></b> <span> - Existe Biblioteca? - <b id="qesc2"></b></span>
						</div>
						<div class="questao-6">
							<b id="qesc1"></b> <span> - A escola dispõe de rampas de acesso para a acessibilidade de todos os espaços aos alunos? - <b id="qesc2"></b></span>
						</div>
						<div class="questao-7">
							<b id="qesc1"></b> <span> - Há saneamento básico na escola? - <b id="qesc2"></b></span>
						</div>
						<div class="questao-8">
							<b id="qesc1"></b> <span> - Há sala dos professores? - <b id="qesc2"></b></span>
						</div>
						<div class="questao-9">
							<b id="qesc1"></b> <span> - Onde as crianças se alimentam? - <b id="qesc2"></b></span>
						</div>
						<div class="questao-10">
							<b id="qesc1"></b> <span> - Os alunos receberam fardamento em tamanho adequado? - <b id="qesc2"></b></span>
						</div>
					</div>
				</div>
				
				<hr>
				
				<div class="compare-galerias">
					<h4>Galeria de fotos da última visita</h4>
					<div id="galesc1" class="galeria">
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
		
					<div id="galesc2" class="galeria">
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
					<h2>Filtros das escolas</h2>
					<span class="filtro-opcoes">Marque abaixo os filtros que deseja aplicar ao mapa</span>
				</div>
				<div class="filtro-lista">
					<input type="checkbox" id="filtro-1" class="filtro-item" data-filter="meta">
					<label for="filtro-1">Atingiram a meta do IDEB</label>
					
					<div class="filtro-periodo">
						<input type="checkbox" id="filtro-13" class="filtro-item" data-filter="recentes">
						<label for="filtro-13">Escolas visitadas recentemente</label>

						<span>Informe a data inicial e final para obter as escolas fiscalizadas nesse período</span><br>
						<div>
							<label for="periodo-ini">Data inicial</label>
							<input id="periodo-ini" class="form-control" type="text" data-mask-clearifnotmatch="true"></input>
						</div>
						<div>
							<label for="periodo-fim">Datra final</label>
							<input id="periodo-fim" class="form-control" type="text" data-mask-clearifnotmatch="true"></input>
						</div>
						<button type="button" class="btn btn-primary" onclick="filtraRecentes('recentes')">Filtrar</button>
					</div>
					
					<input type="checkbox" id="filtro-14" class="filtro-item" data-filter="evolucao">
					<label for="filtro-14">Escolas com evolução sempre crescente da nota do IDEB</label>
						
					<input type="checkbox" id="filtro-15" class="filtro-item" data-filter="nunca">
					<label for="filtro-15">Escolas que nunca atigiram a meta do IDEB</label>
	
					<input type="checkbox" id="filtro-2" class="filtro-item" data-filter="quadras">
					<label for="filtro-2">Possuem quadra poliesportiva</label>
	
					<input type="checkbox" id="filtro-3" class="filtro-item" data-filter="aces">
					<label for="filtro-3">Possuem itens de acessibilidade</label>
	
					<input type="checkbox" id="filtro-4" class="filtro-item" data-filter="melhorProfPort5">
					<label for="filtro-4">MELHORES taxas de aprovação em Português do Fundamental I</label>
	
					<input type="checkbox" id="filtro-5" class="filtro-item" data-filter="melhorProfMat5">
					<label for="filtro-5">MELHORES taxas de aprovação em Matemática do Fundamental I</label>
	
					<input type="checkbox" id="filtro-6" class="filtro-item" data-filter="melhorProfPort9">
					<label for="filtro-6">MELHORES taxas de aprovação em Português do Fundamental II</label>
	
					<input type="checkbox" id="filtro-7" class="filtro-item" data-filter="melhorProfMat9">
					<label for="filtro-7">MELHORES taxas de aprovação em Matemática do Fundamental II</label>
	
					<input type="checkbox" id="filtro-8" class="filtro-item" data-filter="piorProfPort5">
					<label for="filtro-8">PIORES taxas de aprovação em Português do Fundamental I</label>
	
					<input type="checkbox" id="filtro-9" class="filtro-item" data-filter="piorProfMat5">
					<label for="filtro-9">PIORES taxas de aprovação em Matemática do Fundamental I</label>
	
					<input type="checkbox" id="filtro-10" class="filtro-item" data-filter="piorProfPort9">
					<label for="filtro-10">PIORES taxas de aprovação em Português do Fundamental II</label>
	
					<input type="checkbox" id="filtro-11" class="filtro-item" data-filter="piorProfMat9">
					<label for="filtro-11">PIORES taxas de aprovação em Matemática do Fundamental II</label>
					
					<input type="checkbox" id="filtro-12" class="filtro-item" data-filter="novas">
					<label for="filtro-12">Novas sedes entregues na gestão atual</label>
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
		
		<div class="helper" onclick="abrePainel('contato')">
			<img alt="" src="<%=request.getContextPath()%>/views/assets/css/img/warningWhite.png">
			<span>Clique aqui caso queira fazer uma denúncia ou sugestão</span>
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
		<script src="<%=request.getContextPath()%>/views/assets/js/mapaEscola.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/filters.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.mask.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('[data-toggle="tooltip"]').tooltip(); 
				$('#periodo-ini').mask("00/00/0000", {placeholder: "__/__/____"});
				$('#periodo-fim').mask("00/00/0000", {placeholder: "__/__/____"});
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