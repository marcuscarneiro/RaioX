<%@ page language="java" pageEncoding="UTF-8" session="false"%>
	<!DOCTYPE html>
	<html>

	<head>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/sweetalert.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/leaflet.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/jquery.fancybox.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/hover.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/mapa.css" />
		<link  id='GoogleFontsLink' href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet' type='text/css'>
		<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Montserrat:semi-bold" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/frontpage.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/fab-menu.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/mobile.css" />

		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/sweetalert.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery-ui.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/ChartNew.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/leaflet.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/heatmap.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/leaflet-heatmap.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.fancybox.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.fancybox-media.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap-list-filter.src.js"></script>
		
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.lazy/1.7.9/jquery.lazy.min.js"></script>
    	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.lazy/1.7.9/jquery.lazy.plugins.min.js"></script>
		
		<script src="<%=request.getContextPath()%>/views/assets/js/recife.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa1n.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa2n.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa3n.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa4n.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa5n.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/rpa6n.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/bairros.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.flip.min.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/map.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/mobile.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/showEscola.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/bootstrap.min.js"></script>
		
		<title>Raio-X das Escolas Municipais do Recife - Vereador André Régis</title>
		
		<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/views/assets/css/img/raiox-ico.png" sizes="16x16">
		
		<meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />

		<script type="text/javascript">
			var contextPath = '<%=request.getContextPath()%>';

			console.log(contextPath);
		</script>
	</head>

	<body>
		<div id='layers-ui' class='layers-ui'>
			<img alt="" src="<%=request.getContextPath()%>/views/assets/css/img/layers.png">
			<div id='layers-options' class='layers-options'>
				<span class="close-layers" onclick="fechaLayers()">
					<i class="fa fa-close"></i>
				</span>
				<div class="layers-bg">
					<span class="layer-title">Tipo do mapa</span>
					<div class="layers-rpas"></div>
					<div class="layers-bairros"></div>
				</div>
				<hr>
				<div class="layers-info">
					<span class="layer-title">Informações</span>
					<div class="layers-escolas"></div>
					<div class="layers-calor"></div>
				</div>
			</div>
		</div>
		
		<div id="container-floating" onclick="showFab()">
			<div class="nd3 nds" onclick="abreSiteAndre()">
				<img alt="" src="<%=request.getContextPath()%>/views/assets/css/img/ar-small.jpg">
			</div>
			<div class="nd2 nds" onclick="abrePainel('contato')">
				<i class="mobile-send fa fa-send"></i>
			</div>
			<div class="nd1 nds" onclick="abreInstagram()">
				<i class="mobile-instagram fa fa-instagram"></i>
			</div>
			<div id="floating-button">
				<p class="plus">+</p>
			</div>
		</div>

		<div id='anos-radio' class='anos-radio'>
			<div id="tab" class="btn-group btn-group-justified" data-toggle="buttons">
				<a href="#" onclick="changeIniciais()" id="btnIniciais" class="btn btn-primary not-active">
					<input type="radio" />Anos iniciais
				</a>
				<a href="#" onclick="changeFinais()" id="btnFinais" class="btn btn-primary not-active">
					<input type="radio" />Anos finais
				</a>
			</div>
		</div>
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

		<div class="painel painel-pesquisa">
			<div class="dados-pesquisa detalhe">
				<div class="mobile-painel-menu">
					<div class="menu-left" onclick="fechaPainelMobile('lista')">
						<img alt="Retornar" src="<%=request.getContextPath()%>/views/assets/css/icons/arrow-left.svg">
					</div>
					<div class="menu-title">
						<span>Lista das Escolas</span>
					</div>
					<div class="menu-right">
						
					</div>
				</div>
				<div class="cabecalho">
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
			<div class="detalhe-contato">
				<span class="painel-close" onclick="fechaPaineis()">
					<img alt="Retornar" src="<%=request.getContextPath()%>/views/assets/css/icons/arrow-left-white.svg">
				</span>
				<span class="menu-left" onclick="fechaPaineis()">
					<img alt="Retornar" src="<%=request.getContextPath()%>/views/assets/css/icons/arrow-left-white.svg">
				</span>
				<div class="contato-topo">
					<h2>Entre em contato</h2>
				</div>
				<form class="contato-form">
					<input id="contNome" class="form-control" type="text" placeholder="Nome*"></input>
					<input id="contEmail" class="form-control" type="text" placeholder="Seu e-mail*"></input>
					<select id="contEscola" class="form-control">
						<option value="" selected disabled>Escolha a sua escola*</option>
					</select>
					<select id="contAssunto" class="form-control">
						<option value="" selected disabled>Escolha o assunto*</option>
						<option value="Denúncia">Denúncia</option>
						<option value="Sugestão">Sugestão</option>
						<option value="Outros">Outros</option>
					</select>
					<input id="contMensagem" class="form-control" type="text" placeholder="Mensagem*"></input>
					<button id="sendButton" type="button" class="btn btn-primary" onclick="enviaForm()"><i id="sending" class="fa fa-circle-o-notch fa-spin"></i>ENVIAR</button>
				</form>
				<hr>
				<h3>OUTRAS FORMAS</h3>
				<i class="fa fa-envelope"></i><span>equipeandreregis@gmail.com</span><br>
				<i class="fa fa-phone-square"></i><span>(81) 3301-1253</span>
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
		
		<div id="modalEscola" class="painel painel-escola modal fade" aria-hidden="true" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<span id="fecha-escola" class="painel-close" onclick="fechaPaineis()">
							<i class="fa fa-close fa-2x"></i>
						</span>
						<div class="escola-cabecalho">
							<h2 class="escola-nome"></h2>
						</div>
					</div>
					<div class="modal-body">
						<div class="detalhe-escola">
							<div class="escola-left">
								
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
											<a id="foto-visita-counter" class="fancybox boxes" href="#" rel="fotoescola" title="#">
												<span></span>
												<img src="#">
											</a>
										</li>
									</ul>
									<h2 class="titulo-questionario">Questionário aplicado</h2>
									<table class="table table-condensed fiscalizacao-questionario" style="border-collapse:collapse;">
										<tbody>
											<tr data-toggle="collapse" data-target="#gerais" class="accordion-toggle">
												<td class="titulo-modulo">INFORMAÇÕES GERAIS</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div class="accordian-body collapse" id="gerais">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="rpa"><span>Região Político-Administrativa (RPA):</span><span class="questao-info"></span></li>
															<li class="questao" id="endereco"><span>Endereço:</span><span class="questao-info"></span></li>
															<li class="questao" id="telefone"><span>Telefone:</span><span class="questao-info"></span></li>
															<li class="questao" id="data_visita"><span>Data da coleta:</span><span class="questao-info"></span></li>
															<li class="questao" id="gestor"><span>Gestor:</span><span class="questao-info"></span></li>
															<li class="questao" id="idebvisivel"><span>IDEB em local visível?</span><span class="questao-info"></span></li>
															<li class="questao" id="situacao"><span>Situação do prédio:</span><span class="questao-info"></span></li>
															<li class="questao" id="turnovisita"><span>Turno da visita:</span><span class="questao-info"></span></li>
															<li class="questao" id="chuva"><span>Enfrenta problemas em dias de chuva?</span><span class="questao-info"></span></li>
															<li class="questao" id="problemaschuva"><span>Quais problemas?</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											<tr data-toggle="collapse" data-target="#sala" class="accordion-toggle">
												<td class="titulo-modulo">SALAS DE AULA</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="sala" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="sa1"><span>Quantos alunos estão matriculados (TOTAL)?</span><span class="questao-info"></span></li>
															<li class="questao" id="sa2"><span>Quantas salas de aula há na escola?</span><span class="questao-info"></span></li>
															<li class="questao" id="sa3"><span>Há quantos turnos de aula?</span><span class="questao-info"></span></li>
															<li class="questao" id="sa4a"><span>Qual a temperatura mais alta em sala de aula?</span><span class="questao-info"></span></li>
															<li class="questao"><span>Temperatura ideal determinada pela ABNT:</span><span class="questao-info">entre 20ºC e 23ºC</span></li>
															<li class="questao" id="sa4b"><span>Quantas salas possuem temperatura entre de 23ºC e 26ºC?</span><span class="questao-info"></span></li>
															<li class="questao" id="sa5a"><span>Qual a luminosidade mais baixa em sala de aula?</span><span class="questao-info"></span></li>
															<li class="questao" id="sa5b"><span>Quantas salas a iluminação está abaixo de 200 ou acima de 750 lux?</span><span class="questao-info"></span></li>
															<li class="questao"><span>Nível de iluminação ideal determinada pela ABNT:</span><span class="questao-info">entre 200 lux e 500 lux</span></li>
															<li class="questao" id="sa6"><span>Quantas salas são climatizadas?</span><span class="questao-info"></span></li>
															<li class="questao" id="sa7"><span>Quantas salas são bem ventiladas?</span><span class="questao-info"></span></li>
															<li class="questao" id="sa8"><span>Quantas salas possuem bom espaço para circulação?</span><span class="questao-info"></span></li>
															<li class="questao" id="sa9"><span>Quantas salas possuem lousas conservadas?</span><span class="questao-info"></span></li>
															<li class="questao" id="sa10"><span>Qual o aspecto de conservação do mobiliário em sala de aula?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes1"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											<tr data-toggle="collapse" data-target="#eee" class="accordion-toggle">
												<td class="titulo-modulo">ENSINO E EDUCAÇÃO ESPECIAL</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="eee" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="eee1"><span>Quais o níveis/modalidades de ensino oferecidos?</span><span class="questao-info"></span></li>
															<li class="questao" id="eee2"><span>Quantidade de professores em sala</span><span class="questao-info"></span></li>
															<li class="questao" id="eee3"><span>Quantidade de professores que acumulam</span><span class="questao-info"></span></li>
															<li class="questao" id="eee4"><span>Quantidade de professores readaptados</span><span class="questao-info"></span></li>
															<li class="questao" id="eee5"><span>Quantidade de professores com dois contratos</span><span class="questao-info"></span></li>
															<li class="questao" id="eee6"><span>Há deficiência no quadro de funcionários? Quais?</span><span class="questao-info"></span></li>
															<li class="questao" id="eee7"><span>Quantos alunos especiais COM LAUDO médico estão matriculados?</span><span class="questao-info"></span></li>
															<li class="questao" id="eee8"><span>Quantas crianças estão SEM acompanhamento de cuidador/intérprete em sala de aula?</span><span class="questao-info"></span></li>
															<li class="questao" id="eee9"><span>Os professores com formação em AEE ou psicopedagogia são:</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes1a"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											
											<tr data-toggle="collapse" data-target="#bib" class="accordion-toggle">
												<td class="titulo-modulo">BIBLIOTECA</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="bib" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="bib1"><span>Existe Biblioteca?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib2"><span>É aberta aos alunos fora do horário de aula?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib3"><span>É climatizada?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib4"><span>É bem ventilada?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib5"><span>Tem espaço para movimentação?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib6"><span>Tem televisor?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib7"><span>Tem aparelho de DVD?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib8"><span>Tem aparelho de som?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib9"><span>Tem computador com acesso à internet?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib10"><span>Tem Bibliotecário(a)?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib11"><span>Qual a formação do(a) Bibliotecário(a)?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib12"><span>Possui mediador de leitura?</span><span class="questao-info"></span></li>
															<li class="questao" id="bib13"><span>Qual a formação do mediador(a) de leitura?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes2"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											
											<tr data-toggle="collapse" data-target="#inf" class="accordion-toggle">
												<td class="titulo-modulo">LABORATÓRIO DE INFORMÁTICA</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="inf" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="inf1"><span>Existe Laboratório de Informática?</span><span class="questao-info"></span></li>
															<li class="questao" id="inf2"><span>É climatizado?</span><span class="questao-info"></span></li>
															<li class="questao" id="inf3"><span>É bem ventilado?</span><span class="questao-info"></span></li>
															<li class="questao" id="inf4"><span>Há suporte técnico da Prefeitura?</span><span class="questao-info"></span></li>
															<li class="questao" id="inf5"><span>Há aulas de informática?</span><span class="questao-info"></span></li>
															<li class="questao" id="inf6"><span>Quantos computadores há no laboratório?</span><span class="questao-info"></span></li>
															<li class="questao" id="inf7"><span>Quantos computadores funcionam?</span><span class="questao-info"></span></li>
															<li class="questao" id="inf8"><span>Quantos computadores tem acesso à internet?</span><span class="questao-info"></span></li>
															<li class="questao" id="inf9"><span>Há monitor(a) / instrutor(a)?</span><span class="questao-info"></span></li>
															<li class="questao" id="inf10"><span>Qual a formação do(a) Monitor(a) / Instrutor(a)?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes3"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											
											<tr data-toggle="collapse" data-target="#et" class="accordion-toggle">
												<td class="titulo-modulo">ESPAÇO TECNOLÓGICO</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="et" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="et1"><span>Existe Espaço Tecnológico?</span><span class="questao-info"></span></li>
															<li class="questao" id="et2"><span>É climatizado?</span><span class="questao-info"></span></li>
															<li class="questao" id="et3"><span>É bem ventilado?</span><span class="questao-info"></span></li>
															<li class="questao" id="et4"><span>Há suporte técnico da Prefeitura?</span><span class="questao-info"></span></li>
															<li class="questao" id="et5"><span>Há aulas de interatividade tecnológica?</span><span class="questao-info"></span></li>
															<li class="questao" id="et6"><span>Quantas mesas interativas há no laboratório?</span><span class="questao-info"></span></li>
															<li class="questao" id="et7"><span>Quantas mesas interativas funcionam?</span><span class="questao-info"></span></li>
															<li class="questao" id="et8"><span>Quantas mesas interativas tem acesso à internet?</span><span class="questao-info"></span></li>
															<li class="questao" id="et9"><span>Há monitor(a) / instrutor(a)?</span><span class="questao-info"></span></li>
															<li class="questao" id="et10"><span>Qual a formação do(a) Monitor(a) / Instrutor(a)?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes4"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											
											<tr data-toggle="collapse" data-target="#rl" class="accordion-toggle">
												<td class="titulo-modulo">RECREAÇÃO E LAZER</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="rl" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="rl1"><span>Qual o estado de conservação do piso?</span><span class="questao-info"></span></li>
															<li class="questao" id="rl2"><span>Qual o estado de conservação do parque?</span><span class="questao-info"></span></li>
															<li class="questao" id="rl3"><span>Qual o estado de conservação da quadra?</span><span class="questao-info"></span></li>
															<li class="questao" id="rl4"><span>Qual o estado de conservação dos brinquedos?</span><span class="questao-info"></span></li>
															<li class="questao" id="rl5"><span>Como é o espaço de circulação dos corredores?</span><span class="questao-info"></span></li>
															<li class="questao" id="rl6"><span>Há risco de acidente?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes5"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											
											<tr data-toggle="collapse" data-target="#ace" class="accordion-toggle">
												<td class="titulo-modulo">ACESSIBILIDADE</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="ace" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="ace1"><span>Há alunos cadeirantes ou com dificuldades de locomoção?</span><span class="questao-info"></span></li>
															<li class="questao" id="ace2"><span>Há alunos surdos?</span><span class="questao-info"></span></li>
															<li class="questao" id="ace3"><span>Há alunos cegos ou com visão limitada?</span><span class="questao-info"></span></li>
															<li class="questao" id="ace4"><span>Há alunos com problemas cognitivos ou patologias mentais?</span><span class="questao-info"></span></li>
															<li class="questao" id="ace5"><span>A escola dispõe de rampas de acesso para acessibilidade para todos os espaços dos alunos?</span><span class="questao-info"></span></li>
															<li class="questao" id="ace6"><span>A escola dispõe de piso tátil?</span><span class="questao-info"></span></li>
															<li class="questao" id="ace7"><span>A escola dispõe de materiais didáticos para cegos ou surdos-mudos?</span><span class="questao-info"></span></li>
															<li class="questao" id="ace8"><span>A escola dispõe de tutores ou intérpretes (libras)?</span><span class="questao-info"></span></li>
															<li class="questao" id="ace9"><span>Na escola há sala com recursos multifuncionais?</span><span class="questao-info"></span></li>
															<li class="questao" id="ace10"><span>Há professores com formação em A.E.E. ou psicopedagogia para atender as crianças especiais?</span><span class="questao-info"></span></li>
															<li class="questao" id="eac1"><span>Há placas indicativas em braile?</span><span class="questao-info"></span></li>
															<li class="questao" id="eac2"><span>Os banheiros estão plenamente adaptados para cadeirantes?</span><span class="questao-info"></span></li>
															<li class="questao" id="eac3a"><span>A área para circulação é satisfatória?</span><span class="questao-info"></span></li>
															<li class="questao" id="eac3b"><span>Os equipamentos eletrônicos atendem às necessidades?</span><span class="questao-info"></span></li>
															<li class="questao" id="eac3c"><span>A mobília atende às necessidades?</span><span class="questao-info"></span></li>
															<li class="questao" id="eac3d"><span>Os materiais adaptados atendem às necessidades?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes6"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											
											<tr data-toggle="collapse" data-target="#se" class="accordion-toggle">
												<td class="titulo-modulo">SERVIÇOS ESSENCIAIS</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="se" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="se1"><span>Há distribuição de água na escola?</span><span class="questao-info"></span></li>
															<li class="questao" id="se2"><span>Há saneamento básico na escola?</span><span class="questao-info"></span></li>
															<li class="questao" id="se3"><span>Há extintores de incêndio em condições de funcionamento?</span><span class="questao-info"></span></li>
															<li class="questao" id="se4"><span>Os funcionários sabem usar o extintor?</span><span class="questao-info"></span></li>
															<li class="questao" id="se5"><span>Há infiltrações e/ou mofo?</span><span class="questao-info"></span></li>
															<li class="questao" id="se6"><span>Há rachaduras?</span><span class="questao-info"></span></li>
															<li class="questao" id="se7"><span>Há risco de choque nas instalações elétricas?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes7"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											
											<tr data-toggle="collapse" data-target="#eef" class="accordion-toggle">
												<td class="titulo-modulo">ESTRUTURA FÍSICA</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="eef" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="eef1"><span>O entorno da unidade é violento?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef2"><span>Há vigilantes em todos os turnos?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef3"><span>O prédio é alvo de vândalos?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef3a"><span>Se sim, como?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef4"><span>O prédio possui câmeras de segurança?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef4a"><span>Elas estão funcionando?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef5"><span>Quantidade de extintores:</span><span class="questao-info"></span></li>
															<li class="questao" id="eef6"><span>Quantos estão fora do prazo de validade?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef7"><span>Há saídas de emergência?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef7a"><span>Se sim, estão sinalizadas?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef8"><span>A escola fica em área de encosta ou barreira?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef9"><span>Se a água costuma faltar, indique quantos dias:</span><span class="questao-info"></span></li>
															<li class="questao" id="eef10"><span>Quantos dias o caminhão pipa demora a abastecer?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef10a"><span>A limpeza dos reservatórios tem sido feita?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef10b"><span>Qual o intervalo de limpeza dos reservatórios?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef11"><span>A quantidade de reservatórios supre a demanda?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef12"><span>Existe espaço reservado para depósito de lixo?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef13"><span>Existe espaço reservado para armazenamento de botijão de gás?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef14"><span>A quantidade de almoxarifados supre a demanda?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef15"><span>A PCR atendeu às solicitações de coleta de entulhos?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef16"><span>O prédio foi dedetizado há mais de seis meses?</span><span class="questao-info"></span></li>
															<li class="questao" id="eef17"><span>O material de limpeza enviado pela PCR atende à demanda?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes7a"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											
											<tr data-toggle="collapse" data-target="#sp" class="accordion-toggle">
												<td class="titulo-modulo">SALA DOS PROFESSORES</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="sp" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="sp1"><span>Há sala de professores?</span><span class="questao-info"></span></li>
															<li class="questao" id="sp2"><span>Possui computadores?</span><span class="questao-info"></span></li>
															<li class="questao" id="sp3"><span>Possui acesso à internet?</span><span class="questao-info"></span></li>
															<li class="questao" id="sp4"><span>Possui armários?</span><span class="questao-info"></span></li>
															<li class="questao" id="sp5"><span>É climatizada?</span><span class="questao-info"></span></li>
															<li class="questao" id="sp6"><span>É bem ventilada?</span><span class="questao-info"></span></li>
															<li class="questao" id="sp7"><span>Há mesas e cadeiras?</span><span class="questao-info"></span></li>
															<li class="questao" id="sp8"><span>A iluminação está abaixo de 200 lux?</span><span class="questao-info"></span></li>
															<li class="questao" id="sp9"><span>Há espaço para circulação?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes8"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											<tr data-toggle="collapse" data-target="#adm" class="accordion-toggle">
												<td class="titulo-modulo">ADMINISTRAÇÃO</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="adm" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="adm1"><span>Direção, Secretaria e Coordenação funcionam na mesma sala?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm2"><span>Se SIM, há espaço que lhes permita funcionar confortavelmente?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm3"><span>Possui computadores?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm4"><span>Possui acesso à internet?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm5"><span>Tem impressora?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm6"><span>Tem copiadora?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm7"><span>Possui armários?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm8"><span>Possui mesas?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm9"><span>Possui cadeiras?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm10"><span>O espaço é climatizado?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm10a"><span>A sala da Direção é climatizada?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm10b"><span>A sala da Secretaria é climatizada?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm10c"><span>A sala da Coordenação é climatizada?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm11"><span>O espaço é bem ventilado?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm11a"><span>A sala da Direção é bem ventilada?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm11b"><span>A sala da Secretaria é bem ventilada?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm11c"><span>A sala da Coordenação é bem ventilada?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm12"><span>Há espaço para circulação?</span><span class="questao-info"></span></li>
															<li class="questao" id="adm13"><span>A iluminação está abaixo de 200 lux?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes9"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											<tr data-toggle="collapse" data-target="#alim" class="accordion-toggle">
												<td class="titulo-modulo">ALIMENTAÇÃO</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="alim" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="alim1"><span>Onde as crianças se alimentam?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim2"><span>Quais as condições de iluminação?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim3"><span>Quais as condições da ventilação?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim4"><span>Quais as condições do espaço de circulação?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim5"><span>Quais as condições de higiene?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim6"><span>Quais as condições do mobiliário?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim7"><span>Quais as condições do bebedouro?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim8"><span>Quais as condições dos utensílios?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim9"><span>A merenda é recebida?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim10"><span>Apresenta anormalidades?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim11"><span>É bem aceita pelos alunos?</span><span class="questao-info"></span></li>
															<li class="questao" id="alim12"><span>O cardápio é variado?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes10"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											<tr data-toggle="collapse" data-target="#em" class="accordion-toggle">
												<td class="titulo-modulo">MERENDA</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="em" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="em1"><span>A quantidade de alimentos supre a demanda?</span><span class="questao-info"></span></li>
															<li class="questao" id="em2"><span>Caso a merenda seja terceirizada, está sendo recebida dentro do horário?</span><span class="questao-info"></span></li>
															<li class="questao" id="em3"><span>Qual a procedência da água?</span><span class="questao-info"></span></li>
															<li class="questao" id="em3a"><span>Sendo filtrada, há manutenção do filtro?</span><span class="questao-info"></span></li>
															<li class="questao" id="em4"><span>Em dias de aulas extraclasse a merenda é garantida?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes10a"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											<tr data-toggle="collapse" data-target="#mdf" class="accordion-toggle">
												<td class="titulo-modulo">DIDÁTICO E FARDAMENTO</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="mdf" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="mdf1"><span>Os alunos recebem o Kit Escolar completo e em número suficiente?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf2a"><span>Os alunos recebem fardamento completo?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf2b"><span>Os alunos recebem fardamento em tamanho adequado?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf3"><span>Os alunos tem à disposição livros didáticos?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf4"><span>Os alunos tem à disposição livros literários?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf5"><span>Os alunos tem à disposição computadores?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf6"><span>Os alunos tem à disposição acesso à internet?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf7"><span>Os alunos tem à disposição jogos/brinquedos educativos?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf8"><span>Os alunos tem à disposição aparelho de TV com DVD?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf9"><span>Os alunos tem à disposição aparelho de som?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf10"><span>A escola dispõe de projetor?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf11"><span>A escola dispõe de material de artes (massas de modelar, tinta, etc.)?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf12"><span>A escola dispõe de aulas de campo?</span><span class="questao-info"></span></li>
															<li class="questao" id="mdf12a"><span>É garantida a merenda em aulas de campo?</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes11"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
											<tr data-toggle="collapse" data-target="#edfs" class="accordion-toggle">
												<td class="titulo-modulo">DIDÁTICA E SAÚDE</td>
												<td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
											</tr>
											<tr>
												<td colspan="6" class="hiddenRow">
													<div id="edfs" class="accordian-body collapse">
														<ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<li class="questao" id="edfs1"><span>Há canetas para quadro branco?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs2"><span>Há apagadores para quadro branco?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs3"><span>Há computadores para diário de classe?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs4"><span>Existe o programa Mais Educação?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs4o"><span>Oficinas:</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs5"><span>Existe o programa Escola Aberta?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs5o"><span>Oficinas:</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs6"><span>Existe o programa Segundo Tempo?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs6o"><span>Oficinas:</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs7"><span>Existe o programa de Robótica na Escola?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs7a"><span>Robótica funciona?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs7b"><span>Houve treinamento para professores?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs7o"><span>Oficinas:</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs8"><span>Existem outros programas?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs8o"><span>Quais?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs9"><span>Foram distribuídos tablets aos alunos?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs10"><span>Se não, foram recebidos os tablets para o espaço tecnológico?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs11"><span>Existe internet wireless para o uso nos computadores/tablets?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs12"><span>Foram instaladas mesas interativas da Positivo?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs13"><span>É atendido pelo PSE?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs13o"><span>Como?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs14"><span>Tem parceria com PSF?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs14o"><span>Como?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs15"><span>O PSF entrega materiais de saúde preventiva?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs15o"><span>Obs:</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs16"><span>As campanhas de vacinação chegam à escola?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs16o"><span>Obs:</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs17"><span>São realizadas escovações de dentes após as merendas?</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs17o"><span>Obs:</span><span class="questao-info"></span></li>
															<li class="questao">
																<span class="subquestao-titulo">Doenças que afetaram alunos e funcionários no ano corrente nesta unidade</span>
															</li>
															<li class="questao" id="edfs18a"><span class="subquestao">- Catapora</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs18b"><span class="subquestao">- Caxumba</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs18c"><span class="subquestao">- Chikungunya</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs18d"><span class="subquestao">- Conjutivite</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs18e"><span class="subquestao">- Dengue</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs18f"><span class="subquestao">- Hanseníase</span><span class="questao-info"></span></li>
															<li class="questao" id="edfs18g"><span class="subquestao">- Zika</span><span class="questao-info"></span></li>
															<li class="questao" id="anotacoes11a"><span>Anotações</span><span class="questao-info"></span></li>
														</ul>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
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
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="painel painel-compare">
			<div class="mobile-menu mobile-menu-compare">
				<div class="menu-left" onclick="fechaPainelMobile('compare')">
					<img alt="" src="<%=request.getContextPath()%>/views/assets/css/icons/arrow-left.svg">
				</div>
				<div class="menu-title">
					<span>Compare as escolas</span>
				</div>
				<div class="menu-right">
				</div>
			</div>
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
							<input id="pesquisaCompare" class="busca-input form-control" type="text"></input>
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
						<div>
							<span>Temperatura determinada pela ABNT:</span>
							<span class="questao-info">entre 20ºC e 23ºC</span>
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
		
		<div class="mobile-blur" onclick="fechaPainelMobile('filtro')"></div>
		
		<div class="mobile-painel mobile-filtro">
			<div class="mobile-painel-menu">
				<div class="menu-left menu-cancel" onclick="cancelaFiltro()">
					<span>Cancelar</span>
				</div>
				<div class="menu-title">
					<span>Filtros</span>
				</div>
				<div class="menu-right menu-save" onclick="salvaFiltro()">
					<span>Salvar</span>
				</div>
			</div>
			<div class="mobile-painel-content">
				<div class="filtro-ano-letivo">
					<h4>Ano letivo</h4>
					<div id='mobible-anos-radio' class='mobible-anos-radio'>
						<div id="tab" class="btn-group btn-group-justified" data-toggle="buttons">
							<a href="#" onclick="filtraTodosMobile()" id="btnTodosMobile" class="btn btn-primary active">
								<input type="radio" />Todos
							</a>
							<a href="#" onclick="filtraIniciaisMobile()" id="btnIniciaisMobile" class="btn btn-primary not-active">
								<input type="radio" />5º ano
							</a>
							<a href="#" onclick="filtraFinaisMobile()" id="btnFinaisMobile" class="btn btn-primary not-active">
								<input type="radio" />9º ano
							</a>
						</div>
					</div>
				</div>
				
				<div class="mobile-layers">
					<div class="layers-bg">
						<h4>Tipo do mapa</h4>
						<div class="layers-imgs">
							<div class="layers-rpas"></div>
							<div class="layers-bairros"></div>
						</div>
					</div>
					<div class="layers-info">
						<h4>Informações</h4>
						<div class="layers-imgs">
							<div class="layers-escolas"></div>
							<div class="layers-calor"></div>
						</div>
					</div>
				</div>
	
				<div class="mobile-filtro-opcoes">
					<h4>Filtros</h4>
					<div class="mobile-opcoes-lista">
						<label class="opcoes-item">
							<input type="checkbox" name="atingiu">
							<span class="opcoes-label">Atingiu a meta</span>
						</label>
						<label class="opcoes-item">
							<input type="checkbox" name="nunca">
							<span class="opcoes-label">Nunca atingiu a meta</span>
						</label>
						<label class="opcoes-item">
							<input type="checkbox" name="melhoresiniciais">
							<span class="opcoes-label">Melhores IDEBs (5ºano)</span>
						</label>
						<label class="opcoes-item">
							<input type="checkbox" name="pioresiniciais">
							<span class="opcoes-label">Piores IDEBs (5ºano)</span>
						</label>
						<label class="opcoes-item">
							<input type="checkbox" name="melhoresfinais">
							<span class="opcoes-label">Melhores IDEBs (9ºano)</span>
						</label>
						<label class="opcoes-item">
							<input type="checkbox" name="pioresfinais">
							<span class="opcoes-label">Piores IDEBs (9ºano)</span>
						</label>
						<label class="opcoes-item">
							<input type="checkbox" name="quadra">
							<span class="opcoes-label">Possui quadra</span>
						</label>
						<label class="opcoes-item">
							<input type="checkbox" name="acessibilidade">
							<span class="opcoes-label">Possui itens de acessibilidade</span>
						</label>
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
					<span class="filtro-opcoes">Marque abaixo os filtros que deseja aplicar ao mapa</span>
				</div>
				<div class="filtro-lista">
					<input type="checkbox" id="filtro-1" class="filtro-item" data-filter="meta">
					<label for="filtro-1">Escolas que atingiram a meta do IDEB</label>
					
					<div class="filtro-periodo">
						<input type="checkbox" id="filtro-13" class="filtro-grupos" data-filter="recentes">
						<label for="filtro-13">Por período da visita</label>

						<span>Informe a data inicial e final para obter as escolas fiscalizadas nesse período</span><br>
						<div>
							<label for="periodo-ini">Data inicial</label>
							<input id="periodo-ini" class="form-control" type="text" data-inputmask="'alias': 'date'"></input>
						</div>
						<div class="periodo-fim">
							<label for="periodo-fim">Data final</label>
							<input id="periodo-fim" class="form-control" type="text" data-inputmask="'alias': 'date'"></input>
						</div>
						<button type="button" class="btn btn-primary filtro-item" data-filter="periodo">Filtrar</button>
					</div>
					
					<div class="filtro-proficiencia">
						<input type="checkbox" id="filtro-16" class="filtro-grupos">
						<label for="filtro-16">Por taxas de aprovação</label>
						<span>Marque abaixo os filtros a serem aplicados</span><br>
						<div class="prof-filtro-lista">
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
						</div>
					</div>
					
					<input type="checkbox" id="filtro-14" class="filtro-item" data-filter="evolucao">
					<label for="filtro-14">Escolas com evolução sempre crescente da nota do IDEB</label>
						
					<input type="checkbox" id="filtro-15" class="filtro-item" data-filter="nunca">
					<label for="filtro-15">Escolas que nunca atigiram a meta do IDEB</label>
	
					<input type="checkbox" id="filtro-2" class="filtro-item" data-filter="quadras">
					<label for="filtro-2">Possuem quadra poliesportiva</label>
	
					<input type="checkbox" id="filtro-3" class="filtro-item" data-filter="aces">
					<label for="filtro-3">Possuem itens de acessibilidade</label>
	
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
		
		<div class="mobile-side-menu">
			<div class="mobile-side-menu-content">
				<img class="mobile-menu-logo" alt="" src="<%=request.getContextPath()%>/views/assets/css/img/marca-sistema-1.png">
				<div class="mobile-side-menu-group">
					<h2 class="mobile-side-menu-title">Menu</h2>
					<ul class="mobile-side-menu-lista">
						<li onclick="abrePainelMobile('lista')">Lista das escolas</li>
						<li onclick="abrePainelMobile('compare')">Compare escolas</li>
						<li onclick="abrePainelMobile('numeros')">Números da educação</li>
						<li onclick="abrePainelMobile('videos')">Vídeos</li>
						<li onclick="abreSiteAndre()">Conheça André Régis</li>
						<li onclick="abrePainelMobile('sobre')">Sobre o projeto</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="mapShadow1"></div>
		
		<div class="mapShadow2"></div>
		
		<!-- Quadro do MAPA -->
		<div class="map-container">
			<div class="map-container-blur" onclick="fechaPainelMobile('menu')"></div>
			<div class="map-container-loading"></div>
			<div class="mobile-menu mobile-menu-map">
				<div class="menu-left" onclick="abrePainelMobile('menu')">
					<img alt="" src="<%=request.getContextPath()%>/views/assets/css/icons/menu.svg">
				</div>
				<div class="menu-title">
					<span>Raio-X das Escolas</span>
				</div>
				<div class="menu-right" onclick="abrePainelMobile('filtro')">
					<img alt="" src="<%=request.getContextPath()%>/views/assets/css/icons/filter.svg">
				</div>
			</div>
			
			<div id="map"></div>
			
			<div class="mobile-list">
				<span class="mobile-busca-icon">
					<i class="fa fa-search fa-lg"></i>
				</span>
				<form class="mobile-pesquisa">
					<input id="mobile-pesquisa-input" class="form-control busca-input" type="text" placeholder="Pesquise aqui a sua escola..."></input>
				</form>
				<div class="mobile-list-order">
					<span class="mobile-list-label">Ordem: </span>
					<a id="order-radio-nome" href="#" class="order-radio active" onclick="listOrder('nome')">
						<span>Nome</span>
					</a>
					<a id="order-radio-melhorideb" href="#" class="order-radio" onclick="listOrder('melhornota')">
						<span>Melhor IDEB</span>
					</a>
					<a id="order-radio-piorideb" href="#" class="order-radio" onclick="listOrder('piornota')">
						<span>Pior IDEB</span>
					</a>
				</div>
				<ul class="mobile-list-items">
					
				</ul>
			</div>
			
			<div class="painel-escola-mobile">
				<div class="escola-mobile-blur" onclick="fechaPainelMobile('escola')"></div>
				<div class="escola-mobile-border" onclick="fechaPainelMobile('escola')"></div>
				<div class="escola-mobile-content">
					<span class="escola-mobile-nome"></span>
					<span class="escola-mobile-endereco"></span>
					<div class="fiscalizacao-datas"></div>
	
					<div class="escola-mobile-galeria">
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
								<a id="foto-visita-counter" class="fancybox boxes" href="#" rel="fotoescola" title="#">
									<img src="#">
								</a>
							</li>
						</ul>
					</div>
					
					<div class="escola-mobile-notas">
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					nweiuqfbqfiqb<br/>
					
					</div>
					
					<div class="escola-mobile-aprendizado">
					</div>
	
					<div class="escola-mobile-questionario">
					</div>
					
					<div class="escola-mobile-relatorio">
					</div>
					
					<div class="escola-mobile-requerimentos">
					</div>
				</div>				
			</div>
			
			<footer class="mobile-footer">
			<div class="footer-active-indicator"></div>
			<div id="footer-list" class="rpa-item footer-list" onclick="abrePainelMobile('lista')">
				<i class="fa fa-list footer-menu-inactive"></i>
			</div>
			<div id="footer-list" class="rpa-item footer-globe" onclick="fechaPainelMobile('lista')">
				<i class="fa fa-globe footer-menu-active footer-menu-inactive"></i>
			</div>
			<div class="mobile-legenda">
				<ul class="mobile-lista-legenda">
					<li id="pin-verde" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Superou a meta IDEB e ficou acima de 6">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/verde-15.png">
					</li>
					<li id="pin-azul" class="legenda-item" data-toggle="tooltip" data-placement="top" title="BOM">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/azul-15.png">
					</li>
					<li id="pin-amarelo" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Atingiu a meta IDEB mas ficou abaixo de 6">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/amarelo-15.png">
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
					<li id="heatmap-legend" class="legenda-item" data-toggle="tooltip" data-placement="top" title="">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/heatmap-legend.png">
					</li>
				</ul>
			</div>
		</footer>
		</div>
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
			<i class="fa fa-paper-plane"></i>
			<span>Clique aqui caso queira nos enviar uma denúncia ou sugestão</span>
		</div>
		
		<footer class="desktop-footer">
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
					<li id="pin-amarelo" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Atingiu a meta IDEB mas ficou abaixo de 6">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/amarelo-15.png">
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
					<li id="heatmap-legend" class="legenda-item" data-toggle="tooltip" data-placement="top" title="">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/heatmap-legend.png">
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
		<script src="<%=request.getContextPath()%>/views/assets/js/questionarioEscolas.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/mapaEscola.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/filters.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/inputmask.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/inputmask.extensions.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/inputmask.date.extensions.js"></script>
		<script src="<%=request.getContextPath()%>/views/assets/js/jquery.inputmask.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('[data-toggle="tooltip"]').tooltip(); 
				$("#periodo-ini").inputmask("99/99/9999",{ "placeholder": "dd/mm/yyyy" });
				$("#periodo-fim").inputmask("99/99/9999",{ "placeholder": "dd/mm/yyyy" });
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
			
			$(function() {
		        $('.lazy').lazy({
		        	delay: 5000
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