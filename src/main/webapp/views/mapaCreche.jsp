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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/mapaCreches.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/frontpageCreches.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/views/assets/css/ranking.css" />
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
		<script src="<%=request.getContextPath()%>/views/assets/js/mapCreche.js"></script>
		
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
						<li onclick="abrePainel('ranking')"><a href="#">Números da educação</a></li>
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
				<div class="cabecalho-pesquisa">
					<h2>Pesquisa de creches</h2>
					<div class="busca">
						<span class="busca-icone">
							<i class="fa fa-search fa-lg"></i>
						</span>
						<form class="search">
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
				<div class="ranking-filtro btn-group">
					<a href="#"	class="btn btn-primary" onclick="updateRanking('sala')">Salas de aula</a>
					<a href="#"	class="btn btn-primary" onclick="updateRanking('bercario')">Berçário</a>
					<a href="#" class="btn btn-primary" onclick="updateRanking('banheiros')">Banheiros</a>
					<a href="#"	class="btn btn-primary" onclick="updateRanking('espacosAlternativos')">Espaços alternativos</a>
					<a href="#"	class="btn btn-primary" onclick="updateRanking('acessibilidade')">Acessibilidade</a>
					<a href="#" class="btn btn-primary" onclick="updateRanking('servicosEssenciais')">Serviços essenciais</a>
					<a href="#"	class="btn btn-primary" onclick="updateRanking('materiais')">Materiais</a>
					<a href="#"	class="btn btn-primary" onclick="updateRanking('alimentacao')">Alimentação</a>
					<a href="#"	class="btn btn-primary" onclick="updateRanking('lavanderia')">Lavanderia</a>
					<a href="#" class="btn btn-primary" onclick="updateRanking('saude')">Saúde</a>
				</div>
				<div class="ranking-table">
					<table cellspacing='0' class="table table-bordered">
					
						<!-- Table Header -->
						<thead>
							<tr>
								<th>#</th>
								<th>Creche</th>
								<th>Nota</th>
							</tr>
						</thead>
					
						<tbody>
					
							
					
						</tbody>
					
					</table>
				</div>
				
			</div>
		</div>
		
		<div class="painel painel-creche">
			<div class="detalhe-creche detalhe">
				<span id="fecha-creche" class="painel-close" onclick="fechaPaineis()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<div class="creche-cabecalho cabecalho">
					<h2 class="creche-nome"></h2>
				</div>
				
				<div class="nota-geral">
					
				</div>
				
				<h3 class="titulo-questionario">Questionário aplicado</h3>
				<table class="table table-condensed fiscalizacao-questionario" style="border-collapse:collapse;">
				    <tbody>
				        <tr data-toggle="collapse" data-target="#gerais" class="accordion-toggle">
				            <td class="titulo-modulo">INFORMAÇÕES GERAIS</td>
				            <td class="nota-modulo"> </td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6" class="hiddenRow">
				                <div class="accordian-body collapse" id="gerais">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qrpa">
				                            <span>Região Político-Administrativa (RPA):</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qendereco">
				                            <span>Endereço:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qtelefone">
				                            <span>Telefone:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qnova">
				                            <span>Creche entregue recentemente?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qdata">
				                            <span>Data da coleta:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qsituacao">
				                            <span>Situação do prédio:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <br>				
				                        <li class="questao" id="qger1">
				                            <span>Total de Alunos:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qger2">
				                            <span>Número de salas:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qger3">
				                            <span>Turmas oferecidas:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qger4">
				                            <span>Há deficiência no quadro de funcionários?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="hidden-question questao" id="qger4o">
				                            <span>Observações:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="hidden-question questao" id="qgerinf">
				                            <span>Mais informações:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
				                </div>
				            </td>
				        </tr>
				        <tr data-toggle="collapse" data-target="#sala" class="accordion-toggle">
				            <td class="titulo-modulo">SALA DE AULA</td>
				            <td class="nota-modulo" id="notaSala"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6" class="hiddenRow">
				                <div id="sala" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qsal1">
				                            <span>Quantas salas são climatizadas?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qsal2">
				                            <span>Quantas salas possuem temperatura entre 20 e 26ºC?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qsal3">
				                            <span>Quantas salas têm iluminação abaixo de 200 ou acima de 750 Lux?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qsal4">
				                            <span>Qual o aspecto de conservação do mobiliário em sala de aula?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="hidden-question questao" id="qsalinf">
				                            <span>Mais informações:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
				                </div>
				            </td>
				        </tr>
				        <tr data-toggle="collapse" data-target="#bercario" class="accordion-toggle">
				            <td class="titulo-modulo">BERÇÁRIO</td>
				            <td class="nota-modulo" id="notaBercario"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6"  class="hiddenRow">
				                <div id="bercario" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qber1">
				                            <span>Existe berçário na unidade?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qber2">
				                            <span>O berçário apresenta temperatura entre 20 e 26ºC?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qber3">
				                            <span>O berçário apresenta luminosidade entre 200 e 750Lux?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qber4">
				                            <span>Os berços estão em quantidade suficiente e em boas condições de uso?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qber5">
				                            <span>Existe lactário?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qber6">
				                            <span>Existe fraldário?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qber7">
				                            <span>Existe risco de acidente no fraldário?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="questao" id="qber8">
				                            <span>Há chuveiro elétrico funcionando no fraldário?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                        <li class="hidden-question questao" id="qberinf">
				                            <span>Mais informações:</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
				                </div>
				            </td>
				        </tr>
				        
				        <tr data-toggle="collapse" data-target="#banheiros" class="accordion-toggle">
				            <td class="titulo-modulo">BANHEIROS</td>
				            <td class="nota-modulo" id="notaBanheiros"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6"  class="hiddenRow">
				                <div id="banheiros" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qber1">
				                            <span>Existe berçário na unidade?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
								</div>
							</td>
						</tr>
						
				        <tr data-toggle="collapse" data-target="#espacosAlternativos" class="accordion-toggle">
				            <td class="titulo-modulo">ESPAÇOS ALTERNATIVOS DE APRENDIZAGEM E LAZER</td>
				            <td class="nota-modulo" id="notaEspacosAlternativos"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6"  class="hiddenRow">
				                <div id="espacosAlternativos" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qber1">
				                            <span>Existe berçário na unidade?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
								</div>
							</td>
						</tr>
						
				        <tr data-toggle="collapse" data-target="#acessibilidade" class="accordion-toggle">
				            <td class="titulo-modulo">ACESSIBILIDADE E ATENDIMENTO EDUCACIONAL ESPECIALIZADO</td>
				            <td class="nota-modulo" id="notaAcessibilidade"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6"  class="hiddenRow">
				                <div id="acessibilidade" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qber1">
				                            <span>Existe berçário na unidade?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
								</div>
							</td>
						</tr>
						
				        <tr data-toggle="collapse" data-target="#servicosEssenciais" class="accordion-toggle">
				            <td class="titulo-modulo">SERVIÇOS ESSENCIAIS / ESTRUTURA BÁSICA</td>
				            <td class="nota-modulo" id="notaServicosEssenciais"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6"  class="hiddenRow">
				                <div id="servicosEssenciais" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qber1">
				                            <span>Existe berçário na unidade?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
								</div>
							</td>
						</tr>
						
				        <tr data-toggle="collapse" data-target="#materiais" class="accordion-toggle">
				            <td class="titulo-modulo">MATERIAIS</td>
				            <td class="nota-modulo" id="notaMateriais"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6"  class="hiddenRow">
				                <div id="materiais" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qber1">
				                            <span>Existe berçário na unidade?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
								</div>
							</td>
						</tr>
						
				        <tr data-toggle="collapse" data-target="#alimentacao" class="accordion-toggle">
				            <td class="titulo-modulo">ALIMENTAÇÃO</td>
				            <td class="nota-modulo" id="notaAlimentacao"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6"  class="hiddenRow">
				                <div id="alimentacao" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qber1">
				                            <span>Existe berçário na unidade?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
								</div>
							</td>
						</tr>
						
				        <tr data-toggle="collapse" data-target="#lavanderia" class="accordion-toggle">
				            <td class="titulo-modulo">LAVANDERIA</td>
				            <td class="nota-modulo" id="notaLavanderia"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6"  class="hiddenRow">
				                <div id="lavanderia" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qber1">
				                            <span>Existe berçário na unidade?</span>
				                            <span class="questao-info"></span>
				                        </li>
				                    </ul>
								</div>
							</td>
						</tr>
						
				        <tr data-toggle="collapse" data-target="#saude" class="accordion-toggle">
				            <td class="titulo-modulo">SAÚDE</td>
				            <td class="nota-modulo" id="notaSaude"></td>
				            <td class="expand-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></td>
				        </tr>
				        <tr>
				            <td colspan="6"  class="hiddenRow">
				                <div id="saude" class="accordian-body collapse">
				                    <ul class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				                        <li class="questao" id="qber1">
				                            <span>Existe berçário na unidade?</span>
				                            <span class="questao-info"></span>
				                        </li>
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
				
				<h3 class="fotos-vistoria">Fotos da Vistoria</h3>
				<div class="galeria-fotos">
					<div class="foto-galeria">
						<a id="foto-vistoria-1" class="fancybox big-box" href="#" rel="fotocreche" title="#">
							<img src="#">
						</a>
					</div>
					<ul class="fiscalizacao-fotos">
						<li>
							<a id="foto-vistoria-2" class="fancybox boxes" href="#" rel="fotocreche" title="#">
								<img src="#">
							</a>
						</li>
						<li>
							<a id="foto-vistoria-3" class="fancybox boxes" href="#" rel="fotocreche" title="#">
								<img src="#">
							</a>
						</li>
						<li>
							<a id="foto-vistoria-4" class="fancybox boxes" href="#" rel="fotocreche" title="#">
								<img src="#">
							</a>
						</li>
						<li>
							<a id="foto-vistoria-5" class="fancybox boxes" href="#" rel="fotocreche" title="#">
								<img src="#">
							</a>
						</li>
						<li>
							<a id="foto-vistoria-6" class="fancybox boxes" href="#" rel="fotocreche" title="#">
								<img src="#">
							</a>
						</li>
						<li>
							<a id="foto-vistoria-7" class="fancybox boxes" href="#" rel="fotocreche" title="#">
								<img src="#">
							</a>
						</li>
						<li>
							<a id="foto-vistoria-8" class="fancybox boxes" href="#" rel="fotocreche" title="#">
								<img src="#">
							</a>
						</li>
						<li>
							<a id="foto-vistoria-9" class="fancybox boxes" href="#" rel="fotocreche" title="#">
								<img src="#">
							</a>
						</li>
						<li>
							<a id="foto-vistoria-10" class="fancybox boxes" href="#" rel="fotocreche" title="#">
								<img src="#">
							</a>
						</li>
					</ul>
			</div>
	
			</div>
			
		</div>
		
		<div class="painel painel-compare">
			<div class="dados-compare">
				<span id="fecha-compare" class="painel-close" onclick="fechaPainelCompareCreche()">
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
				<span id="fecha-compare-desk" class="painel-close" onclick="fechaPainelCompareCreche()">
					<i class="fa fa-close fa-2x"></i>
				</span>
				<header class="compare-header">
					<h2>SELECIONE AO LADO AS CRECHES QUE DESEJA COMPARAR</h2>
				</header>
				<div class="tabela-comparativo">
					<table class="table">
						<thead>
							<tr>
								<th>Módulo</th>
								<th class="comp-cre1"></th>
								<th class="comp-cre2"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="comp-modulo">SALA DE AULA</td>
								<td class="comp-sala-cre1 col-1"></td>
								<td class="comp-sala-cre2 col-2"></td>
							</tr>
							<tr>
								<td class="comp-modulo">BERÇÁRIO</td>
								<td class="comp-bercario-cre1 col-1"></td>
								<td class="comp-bercario-cre2 col-2"></td>
							</tr>
							<tr>
								<td class="comp-modulo">BANHEIROS</td>
								<td class="comp-banheiros-cre1 col-1"></td>
								<td class="comp-banheiros-cre2 col-2"></td>
							</tr>
							<tr>
								<td class="comp-modulo">ESPAÇOS ALTERNATIVOS DE APRENDIZAGEM E LAZER</td>
								<td class="comp-espacos-cre1 col-1"></td>
								<td class="comp-espacos-cre2 col-2"></td>
							</tr>
							<tr>
								<td class="comp-modulo">ACESSIBILIDADE E ATENDIMENTO EDUCACIONAL ESPECIALIZADO</td>
								<td class="comp-acessibilidade-cre1 col-1"></td>
								<td class="comp-acessibilidade-cre2 col-2"></td>
							</tr>
							<tr>
								<td class="comp-modulo">SERVIÇOS ESSENCIAIS / ESTRUTURA BÁSICA</td>
								<td class="comp-servicos-cre1 col-1"></td>
								<td class="comp-servicos-cre2 col-2"></td>
							</tr>
							<tr>
								<td class="comp-modulo">MATERIAIS</td>
								<td class="comp-materiais-cre1 col-1"></td>
								<td class="comp-materiais-cre2 col-2"></td>
							</tr>
							<tr>
								<td class="comp-modulo">ALIMENTAÇÃO</td>
								<td class="comp-alimentacao-cre1 col-1"></td>
								<td class="comp-alimentacao-cre2 col-2"></td>
							</tr>
							<tr>
								<td class="comp-modulo">LAVANDERIA</td>
								<td class="comp-lavanderia-cre1 col-1"></td>
								<td class="comp-lavanderia-cre2 col-2"></td>
							</tr>
							<tr>
								<td class="comp-modulo">SAÚDE</td>
								<td class="comp-saude-cre1 col-1"></td>
								<td class="comp-saude-cre2 col-2"></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<hr>

				<div class="compare-creche">
					<h3>Ainda não existem dados de vistorias para estas creches</h3>
					
					<h4>Dados da última vistoria</h4>
	
					<div class="compare-titulos">
						<h4 class="compare-titulo-creche1"></h4>
						<h4 class="compare-titulo-creche2"></h4>
					</div>
	
					<div class="questoes">
						<div class="questao-1">
							<b id="qcre1"></b> <span> - Número de alunos - <b id="qcre2"></b></span>
						</div>
						<div class="questao-2">
							<b id="qcre1"></b> <span> - Quantas salas de aula há na unidade? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-3">
							<b id="qcre1"></b> <span> - Possui parquinho? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-4">
							<b id="qcre1"></b> <span> - Existe berçário na unidade? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-5">
							<b id="qcre1"></b> <span> - Há banheiros infantis plenamente adaptados para cadeirantes? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-6">
							<b id="qcre1"></b> <span> - Os alimentos estão sendo recebidos? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-7">
							<b id="qcre1"></b> <span> - Os fardamentos foram distribuídos em quantidade suficiente para atender à demanda? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-8">
							<b id="qcre1"></b> <span> - Há infiltrações/mofo? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-9">
							<b id="qcre1"></b> <span> - O enxoval supre a demanda? - <b id="qcre2"></b></span>
						</div>
						<div class="questao-10">
							<b id="qcre1"></b> <span> - Os materiais de higiene pessoal suprem a demanda? - <b id="qcre2"></b></span>
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
				<div class="cabecalho-filtro">
					<h2>Filtros das creches</h2>
					<span class="filtro-opcoes">Marque abaixo o filtro que deseja aplicar no mapa</span>
				</div>
				<div class="filtro-lista">
					<!-- <input type="checkbox" id="filtro-1" class="filtro-item" data-filter="ranking">
					<label for="filtro-1">Classificação do Ranking</label>-->
	
					<input type="checkbox" id="filtro-2" class="filtro-item" data-filter="bercario">
					<label for="filtro-2">Creches que possuem berçario</label>
	
					<input type="checkbox" id="filtro-3" class="filtro-item" data-filter="novas">
					<label for="filtro-3">Creches com nova sede</label>
	
					<input type="checkbox" id="filtro-4" class="filtro-item" data-filter="lazer">
					<label for="filtro-4">Creches com itens de lazer</label>
	
					<input type="checkbox" id="filtro-5" class="filtro-item" data-filter="grupos">
					<label for="filtro-5">Creches que oferecem grupos escolares</label>
	
					<input type="checkbox" id="filtro-6" class="filtro-item" data-filter="saneamento">
					<label for="filtro-6">Qualidade do saneamento básico nas creches</label>
	
					<input type="checkbox" id="filtro-7" class="filtro-item" data-filter="acessibilidade">
					<label for="filtro-7">Creches com itens de acessibilidade</label>
	
					<input type="checkbox" id="filtro-8" class="filtro-item" data-filter="climatizadas">
					<label for="filtro-8">Creches com salas climatizadas</label>
	
					<input type="checkbox" id="filtro-9" class="filtro-item" data-filter="crechexcmei">
					<label for="filtro-9">Creche X CMEI</label>
	
					<input type="checkbox" id="filtro-10" class="filtro-item" data-filter="temperatura">
					<label for="filtro-10">Nível de temperatura nas creches</label>
	
					<input type="checkbox" id="filtro-11" class="filtro-item" data-filter="iluminacao">
					<label for="filtro-11">Nível de iluminação</label>
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
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/z7LGlgb_5PI?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/z7LGlgb_5PI/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/lvUD4VIRm2c?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/lvUD4VIRm2c/mqdefault.jpg">
							</a>
						</li>
						<li>
							<a class="videos fancybox.iframe" href="http://www.youtube.com/embed/GGqLzBzdPOk?autoplay=1">
								<img alt="" src="http://i1.ytimg.com/vi/GGqLzBzdPOk/mqdefault.jpg">
							</a>
						</li>
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
					<li id="pin-vermelho" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Nota geral entre 0 e 2.5">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/nivel1-15.png">
					</li>
					<li id="pin-azul-claro" class="legenda-item" data-toggle="tooltip" data-placement="top" title="BOM">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/s-lightblue.png">
					</li>
					<li id="pin-azul" class="legenda-item" data-toggle="tooltip" data-placement="top" title="BOM">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/s-blue.png">
					</li>
					<li id="pin-amarelo" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Nota geral entre 2.5 e 5.0">
						<img  src="<%=request.getContextPath()%>/views/assets/css/img/nivel2-15.png">
					</li>
					<li id="pin-verde-claro" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Nota geral entre 5.1 e 7.5">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/nivel3-15.png">
					</li>
					<li id="pin-verde" class="legenda-item" data-toggle="tooltip" data-placement="top" title="Nota geral acima de 7.5">
						<img src="<%=request.getContextPath()%>/views/assets/css/img/nivel4-15.png">
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