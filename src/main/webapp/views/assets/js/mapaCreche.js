var creId, creNome, rel, creIdebComp1, creIdebComp2, ordemAtual;
var modo = 'all';
var viewWidth = $(window).width();
var rpaAtual = 0;
var actualMarker = undefined; 
var southWest = L.latLng(-8.203279, -35.308557),
	northEast = L.latLng(-7.714644, -34.522893),
	bounds = L.latLngBounds(southWest, northEast);

L.mapbox.accessToken = 'pk.eyJ1IjoibXZjYXJuZWlybyIsImEiOiIwZmIxOTNkNjU1NzNkN2E5OGRhNTE5NWIwMjZlMzVjMiJ9.5dFjUXu8lTpH3zoPF93mYQ';
var map = L.mapbox.map('map', 'mapbox.outdoors',
	{
		zoomControl: true,
		maxBounds: bounds,
		maxZoom: 19,
		minZoom: 11
	})
	.setView([-8.0529, -34.9330], 12);

// Desabilita o toque no mapa.
if (map.tap) map.tap.disable();

// Adiciona um novo controle de zoom no canto superior direito do mapa.
new L.Control.Zoom(
{
	position: 'bottomright'
}).addTo(map);


var bg_options = {
    color: '#fff',
    opacity: 0,
    weight: 0,
    fillColor: '#fff',
    fillOpacity: 0.1
};

function resetMap(){
	if(viewWidth < 750){
		map.setView([-8.0529, -34.9330], 11);
	} else {
		map.setView([-8.0529, -34.9330], 12);
	}
}

var bgLayer = L.circle([-8.069677, -34.901499], 100000, bg_options).addTo(map);
bgLayer.on('click', function(e)
{
	resetMap();
	replotMap();
	rpaAtual = 0;
	removeAllRpaLayers();
	setAllRpaLayers();
	resetActualMarker();
	$(".creche-title").slideDown();
	$(".menu-ui a").removeClass('active');
	$("#todas").addClass('active');
	showCreche("RECIFE", null);
});

function highlightLayer(e){
	e.layer.setStyle({
		weight: 4,
		opacity: 1,
		fillOpacity: 0.6
	});
};

function resetLayerStyle(e){
	e.layer.setStyle({
		weight: 1,
		opacity: 1,
		fillOpacity: 0.4
	});
}

function resetActualMarker(){
	if(actualMarker != undefined && actualMarker != null){
		if(modo === 'all' || modo === 'meta' || modo === 'novas'){
			actualMarker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/s-' + actualMarker.feature.properties.COR + '.png',
				iconSize: [15, 38]
			}));
		} else if(modo === 'quadras'){
			if(actualMarker.feature.properties.POSSUIQUADRA === 1){
				actualMarker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-black.png',
					iconSize: [15, 38]
				}));
			} else if(actualMarker.feature.properties.POSSUIQUADRA === 2){
				actualMarker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-yellow.png',
					iconSize: [15, 38]
				}));
			} else if(actualMarker.feature.properties.POSSUIQUADRA === 3){
				actualMarker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-blue.png',
					iconSize: [15, 38]
				}));
			}
		} else if(modo === 'acessibilidade'){
			if(actualMarker.feature.properties.ACESSIBILIDADE === 2){
				actualMarker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-yellow.png',
					iconSize: [15, 38]
				}));
			} else if(actualMarker.feature.properties.ACESSIBILIDADE === 3){
				actualMarker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-blue.png',
					iconSize: [15, 38]
				}));
			} else {
				actualMarker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-black.png',
					iconSize: [15, 38]
				}));
			}
		}
		actualMarker = undefined;
	}
}

var rpa1Layer;
function setRpa1(click){
	rpa1Layer = L.mapbox.featureLayer().addTo(map);
	rpa1Layer.setGeoJSON(rpa1);
	rpa1Layer.setStyle({'fillColor': '#ccff00', 'fillOpacity': 0.4, 'weight': 1});
	rpa1Layer.on('click', function(e)
	{
		resetActualMarker();
		map.setView(e.layer.getBounds().getCenter(), 13);
		showCreche(e.layer.feature.properties.RPA, null);
			});
	rpa1Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa1Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
		map.setView(rpa1Layer.getBounds().getCenter(), 13,{
			pan: {
				animate: true,
				duration: 1
			}, 
			zoom: {
				animate: true,
				duration: 2
			}
		});
		showCreche("RPA 1", null);
	}
}

setRpa1(false);

var rpa2Layer;
function setRpa2(click){
	rpa2Layer = L.mapbox.featureLayer().addTo(map);
	rpa2Layer.setGeoJSON(rpa2);
	rpa2Layer.setStyle({'fillColor': '#66cc99', 'fillOpacity': 0.4, 'weight': 1});
	rpa2Layer.on('click', function(e)
	{
//		resetActualMarker();
		map.setView(e.layer.getBounds().getCenter(), 13);
		showCreche(e.layer.feature.properties.RPA, null);
	});
	rpa2Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa2Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
		map.setView(rpa2Layer.getBounds().getCenter(), 13,{
			pan: {
				animate: true,
				duration: 1
			}, 
			zoom: {
				animate: true,
				duration: 2
			}
		});
		showCreche("RPA 2", null);
	}
}

setRpa2(false);

var rpa3Layer;

function setRpa3(click){
	rpa3Layer = L.mapbox.featureLayer().addTo(map);
	rpa3Layer.setGeoJSON(rpa3);
	rpa3Layer.setStyle({'fillColor': '#cc9933', 'fillOpacity': 0.4, 'weight': 1});
	rpa3Layer.on('click', function(e)
	{
//		resetActualMarker();
		map.setView(e.layer.getBounds().getCenter(), 12);
		showCreche(e.layer.feature.properties.RPA, null);
	});
	rpa3Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa3Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
		map.setView(rpa3Layer.getBounds().getCenter(), 12,{
			pan: {
				animate: true,
				duration: 1
			}, 
			zoom: {
				animate: true,
				duration: 2
			}
		});
		showCreche("RPA 3", null);
	}
}

setRpa3(false);

var rpa4Layer;

function setRpa4(click){
	rpa4Layer = L.mapbox.featureLayer().addTo(map);
	rpa4Layer.setGeoJSON(rpa4);
	rpa4Layer.setStyle({'fillColor': '#cc3366', 'fillOpacity': 0.4, 'weight': 1});
	rpa4Layer.on('click', function(e)
	{
//		resetActualMarker();
		map.setView(e.layer.getBounds().getCenter(), 13);
		showCreche(e.layer.feature.properties.RPA, null);
	});
	rpa4Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa4Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
		map.setView(rpa4Layer.getBounds().getCenter(), 13,{
			pan: {
				animate: true,
				duration: 1
			}, 
			zoom: {
				animate: true,
				duration: 2
			}
		});
		showCreche("RPA 4", null);
	}
}

setRpa4(false);

var rpa5Layer;

function setRpa5(click){
	rpa5Layer = L.mapbox.featureLayer().addTo(map);
	rpa5Layer.setGeoJSON(rpa5);
	rpa5Layer.setStyle({'fillColor': '#6666cc', 'fillOpacity': 0.4, 'weight': 1});
	rpa5Layer.on('click', function(e)
	{
//		resetActualMarker();
		map.setView(e.layer.getBounds().getCenter(), 13);
		showCreche(e.layer.feature.properties.RPA, null);
	});
	rpa5Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa5Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
		map.setView(rpa5Layer.getBounds().getCenter(), 13,{
			pan: {
				animate: true,
				duration: 1
			}, 
			zoom: {
				animate: true,
				duration: 2
			}
		});
		showCreche("RPA 5", null);
	}
}

setRpa5(false);

var rpa6Layer;

function setRpa6(click){
	rpa6Layer = L.mapbox.featureLayer().addTo(map);
	rpa6Layer.setGeoJSON(rpa6);
	rpa6Layer.setStyle({'fillColor': '#ff6633', 'fillOpacity': 0.4, 'weight': 1});
	rpa6Layer.on('click', function(e)
	{
//		resetActualMarker();
		map.setView(e.layer.getBounds().getCenter(), 13);
		showCreche(e.layer.feature.properties.RPA, null);
	});
	rpa6Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa6Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
		map.setView(rpa6Layer.getBounds().getCenter(), 13,{
			pan: {
				animate: true,
				duration: 1
			}, 
			zoom: {
				animate: true,
				duration: 2
			}
		});
		showCreche("RPA 6", null);
	}
}

setRpa6(false);

var crechesLayer = L.mapbox.featureLayer().addTo(map);

var crechesList = [];

var crechesListCompare = [];

var crechesData;

function carregaCreches(){
	$.ajax({
		url: 'carregaCreches',
		type: "GET",
		dataType: 'json',
		success: function(data) {
			crechesData = data;
			crechesLayer.setGeoJSON(data);
			crechesList = [];
			crechesListCompare = [];
			changeMarkers();
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

carregaCreches();

// Add custom popups to each using our custom feature properties
function crechesMouseOver(){
	crechesLayer.on('mouseover', function(e)
	{
		definePopup(e.layer);
		e.layer.openPopup();
	});
}

crechesMouseOver();

function crechesMouseOut(){
	crechesLayer.on('mouseout', function(e)
	{
		e.layer.closePopup();
	});
}

crechesMouseOut();

function definePopup(marker){
	var feature = marker.feature,
		foto;
	if(feature.properties.Foto != null){
		foto = contextPath + feature.properties.Foto;
	} else {
		foto = contextPath + '/views/assets/css/img/escola.jpg';
	}
	// Create custom popup content
	var popupContent = '<div class="pop"><div class="popup-texto"><span><strong>' + feature.properties.Creche + '</strong></span>' +
		'<p>' + feature.properties.Endereco + '</p></div>'+
		'<div class="crop"><img src="' + foto + '"/></div></div>';

	marker.bindPopup(popupContent,
	{
		closeButton: true,
		minWidth: 320
	});
}

function resizeMarker(marker){
	if(marker != actualMarker){
		showCreche(marker.feature.properties.Creche, marker.feature.properties.ID);
		$("#schools").val("");
		if(modo === 'all' || modo === "meta" || modo === "novas"){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/l-' + marker.feature.properties.COR + '.png',
				iconSize: [30, 70]
			}));
		} else if(modo === 'quadras'){
			if(marker.feature.properties.POSSUIQUADRA === 1){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/l-black.png',
					iconSize: [30, 70]
				}));
			} else if(marker.feature.properties.POSSUIQUADRA === 2){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/l-yellow.png',
					iconSize: [30, 70]
				}));
			} else if(marker.feature.properties.POSSUIQUADRA === 3){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/l-blue.png',
					iconSize: [30, 70]
				}));
			}
		} else if(modo === 'acessibilidade'){
			if(marker.feature.properties.ACESSIBILIDADE === 2){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/l-yellow.png',
					iconSize: [30, 70]
				}));
			} else if(marker.feature.properties.ACESSIBILIDADE === 3){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/l-blue.png',
					iconSize: [30, 70]
				}));
			} else {
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/l-black.png',
					iconSize: [30, 70]
				}));
			}
		}
		
		if(actualMarker != undefined && actualMarker != null){
			if(modo === 'all' || modo === "meta" || modo === "novas"){
				actualMarker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-' + actualMarker.feature.properties.COR + '.png',
					iconSize: [15, 38]
				}));
			} else if(modo === 'quadras'){
				if(actualMarker.feature.properties.POSSUIQUADRA === 1){
					actualMarker.setIcon(L.icon({
						iconUrl: contextPath + '/views/assets/css/img/s-black.png',
						iconSize: [15, 38]
					}));
				} else if(actualMarker.feature.properties.POSSUIQUADRA === 2){
					actualMarker.setIcon(L.icon({
						iconUrl: contextPath + '/views/assets/css/img/s-yellow.png',
						iconSize: [15, 38]
					}));
				} else if(actualMarker.feature.properties.POSSUIQUADRA === 3){
					actualMarker.setIcon(L.icon({
						iconUrl: contextPath + '/views/assets/css/img/s-blue.png',
						iconSize: [15, 38]
					}));
				}
			} else if(modo === 'acessibilidade'){
				if(actualMarker.feature.properties.ACESSIBILIDADE === 2){
					actualMarker.setIcon(L.icon({
						iconUrl: contextPath + '/views/assets/css/img/s-yellow.png',
						iconSize: [15, 38]
					}));
				} else if(actualMarker.feature.properties.ACESSIBILIDADE === 3){
					actualMarker.setIcon(L.icon({
						iconUrl: contextPath + '/views/assets/css/img/s-blue.png',
						iconSize: [15, 38]
					}));
				} else {
					actualMarker.setIcon(L.icon({
						iconUrl: contextPath + '/views/assets/css/img/s-black.png',
						iconSize: [15, 38]
					}));
				}
			}
		}
		
		actualMarker = marker;
	}
}

function crechesClick(){
	crechesLayer.on('click', function(e)
	{
		var marker = e.layer;
		goToPoint(marker);
		marker.closePopup();
		resizeMarker(marker);
	});
}

function goToPoint(marker){
	if(map.getZoom() != 15){
		map.setView(marker.getLatLng(), 15, {
			pan: {
				animate: true,
				duration: 1
			},
			zoom: {
				animate: true
			}
		});
		map.panTo(marker.getLatLng());
	} else {
		map.setView(marker.getLatLng(), 15, {
			pan: {
				animate: true,
				duration: 2
			},
			zoom: {
				animate: true
			}
		});
	}
}

function changeMarkers(){
	$('#marker-list').remove();
	var body = document.body;
	var markerList = body.appendChild(document.createElement('div'));
	markerList.id = "marker-list";
	$('.compare-lista').remove();
	$('.compare-resultado').append('<ul class="compare-lista">');
	$('.pesquisa-lista').remove();
	$('.pesquisa-resultado').append('<ul class="pesquisa-lista">');
	
	crechesLayer.eachLayer(function(marker) {
		crechesList.push({label: marker.feature.properties.Creche, value: marker.feature.properties.ID});
		crechesListCompare.push({label: marker.feature.properties.Creche, value: marker.feature.properties.ID});
		
		$('.pesquisa-lista').append('<li cre="' + marker.feature.properties.ID + '" class="pesquisa-creche-caixas" onclick="abreCreche('+ marker.feature.properties.ID +',\''+marker.feature.properties.Creche+'\')">'+
				'<h4 class="pesquisa-nome">'+marker.feature.properties.Creche+'</h4>'+
				'<h4 class="pesquisa-endereco">'+marker.feature.properties.Endereco+'</h4>'+
				'<div class="pesquisa-thumb">'+
					'<img src="'+contextPath + marker.feature.properties.Foto+'" alt="" class="thumb">'+
				'</div>'+
			'</li>');
		
		$('.compare-lista').append('<li cre="' + marker.feature.properties.ID + '" class="compare-item compare-creche-caixas" onclick="addCompara('+marker.feature.properties.ID+')">'+
				'<h4 class="pesquisa-nome">'+marker.feature.properties.Creche+'</h4>'+
				'<div class="pesquisa-thumb">'+
					'<img src="'+contextPath + marker.feature.properties.Foto+'" alt="" class="thumb">'+
				'</div>'+
			'</li>');
				
		marker.setIcon(L.icon({
			iconUrl: contextPath + '/views/assets/css/img/s-' + marker.feature.properties.COR + '.png',
			iconSize: [15, 38]
		}));
		
		var link = markerList.appendChild(document.createElement('a'));
		link.className = 'item';
		link.href = '#';
		link.id = marker.feature.properties.ID;
	
		// Populate content from each markers object.
		link.onclick = function() {
			map.setView(marker.getLatLng(), 15);
			resizeMarker(marker);
	
		// Create custom popup content
			definePopup(marker);
		}
		return false;
	});
	
	crechesMouseOver();
	crechesMouseOut();
	crechesClick();
};

$(document).ready(function()
{
	$('.search').submit(function(e)
	{
		e.preventDefault();
		$("#"+creId)[0].click();
		showCreche($('#schools').val(), null);
	});
});

function showCreche(cre, id){
	$(".creche-nome").html(cre);
	var fotoFachada = $('.pesquisa-lista').find('[cre="'+id+'"]').children('.pesquisa-thumb').children('.thumb').attr('src');
	$(".foto-fachada img").attr("src",fotoFachada);
	if(id != null){
		
		consultaNotas(id);
		$(".fiscalizacao-datas li").remove();
		mapVisita = new Object();
		ordemAtual = 0;
		consultaVistorias(id);
		abrePainel('creche');
	}
};

function consultaNotas(id){
	$.ajax({
		url: 'consultaNotas',
		type: "POST",
		data: JSON.stringify({ id: id }),
		contentType: 'application/json',
		async: false,
		success: function(data) {
			updateNotas(data);
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

//CRIA MAPA PARA AS VISITAS
var mapVisita = new Object(); // or var map = {};

function getVisita(k) {
    return mapVisita[k];
}

function changeVistoria(vistoria){
	consultaFotos(vistoria.id);
	updateVistorias(vistoria);
}

function consultaVistorias(id){
	$.ajax({
		url: 'consultaVistorias',
		type: "POST",
		data: JSON.stringify({ id: id }),
		contentType: 'application/json',
		async: false,
		success: function(data) {
			if(data != null & data != ''){
				processaVistorias(data);
			} else {
				visitasVazias();
				mapVisita = null;
			}
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

function processaVistorias(data){
	$(".fiscalizacao-datas").show();
	var qtd = data.length;
	var indice = 1;
	while(indice <= qtd){
		if(qtd === indice){
			$(".fiscalizacao-datas").append("<li class='vistoria-" + indice + " data-active' onclick='alteraVistoria("+ indice +")'><span>" + indice + "ª VISTORIA</span></li>");
		} else {
			$(".fiscalizacao-datas").append("<li class='vistoria-" + indice + "' onclick='alteraVistoria("+ indice +")'><span>" + indice + "ª VISTORIA</span></li>");
		}
		indice++;
	}
	$.each(data, function(i, vistoria){
		var ordem = i+1;
		if(ordem === qtd){
			changeVistoria(vistoria);
		}
		mapVisita[ordem] = vistoria;
	});
}

function alteraVistoria(ordem){
	$('.fiscalizacao-datas li').removeClass('data-active');
	$('.vistoria-'+ordem).addClass('data-active');
	
	var vistoria = getVisita(ordem);
	if(vistoria.relatorio != null){
		rel = true;
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio span").css('display', 'none');
		$(".fiscalicazaoRelatorio a").css('display', 'inline-block');
		$(".fiscalicazaoRelatorio a").attr('href', contextPath + vistoria.relatorio);
	} else {
		rel = false;
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio a").css('display', 'none');
		$(".fiscalicazaoRelatorio span").css('display', 'inline-block');
	}
	
	if(vistoria.sa1){
		if(ordemAtual != ordem){
			changeVistoria(vistoria);
			ordemAtual = ordem;
		}

		$(".fiscalizacao-fotos").show();
		$(".fiscalizacao-questionario").show();
	} else {
		$(".fiscalizacao-fotos").hide();
		$(".fiscalizacao-questionario").hide();
	}
};

$('.fiscalicazaoRelatorio span').on('click', function(){
	swal("Relatório indisponível", "Em breve iremos cadastrá-lo aqui", "error");
});

function consultaFotos(id){
	$.ajax({
		url: 'consultaFotosVistoriaCreche',
		type: "POST",
		data: JSON.stringify({ id: id }),
		contentType: 'application/json',
		async: false,
		success: function(data) {
			updateFotos(data);
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

function visitasVazias(){
	$(".fiscalizacao-header h2").text("Esta creche será visitada em breve pela equipe do Vereador André Régis");
	$(".fiscalizacao-datas").hide();
	$(".fiscalizacao-fotos").hide();
	$(".fiscalizacao-questionario").hide();
	$(".fiscalicazaoRelatorio").hide();
	rel = false;
};

function updateVistorias(vistoria){
	$(".fiscalizacao-header h2").text("FISCALIZAÇÃO");
	$(".fiscalizacao-datas").show();
	$(".fiscalizacao-fotos").show();
	$(".fiscalizacao-questionario").show();

	if(vistoria.relatorio != null){
		rel = true;
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio span").css('display', 'none');
		$(".fiscalicazaoRelatorio a").css('display', 'inline-block');
		$(".fiscalicazaoRelatorio a").attr('href', contextPath + vistoria.relatorio);
		
	} else {
		rel = false;
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio a").css('display', 'none');
		$(".fiscalicazaoRelatorio span").css('display', 'inline-block');
	}
	
	var dateOri = vistoria.data;
	var dateAr = dateOri.split('-');
	var finalDate = dateAr[2] + '/' + dateAr[1] + '/' + dateAr[0];
	$("#qdata .questao-info").html(finalDate);
	$("#qrpa .questao-info").html(vistoria.creche.rpa);
	$("#qendereco .questao-info").html(vistoria.creche.logradouro + ', ' + vistoria.creche.numero + ' - ' + vistoria.creche.bairro + '. CEP: ' + vistoria.creche.cep);
	$("#qtelefone .questao-info").html(vistoria.creche.telefone);
	$("#qnova .questao-info").html(vistoria.creche.nova);
	
	if(vistoria.situacao != null && vistoria.situacao != ""){
		$("#qsituacao .questao-info").html(vistoria.situacao);
	} else {
		$("#qsituacao .questao-info").html("Sem informação");
	}
	
	if(vistoria.ger1 != null){
		$("#qger1 .questao-info").html(vistoria.ger1);
	} else {
		$("#qger1 .questao-info").html("Sem informação");
	}
	
	if(vistoria.ger2 != null){
		$("#qger2 .questao-info").html(vistoria.ger2);
	} else {
		$("#qger2 .questao-info").html("Sem informação");
	}
	
	if(vistoria.ger3 != null){
		$("#qger3 .questao-info").html(vistoria.ger3);
	} else {
		$("#qger3 .questao-info").html("Sem informação");
	}
	
	if(vistoria.alim1 == 1){
		$(".questao-9 .questao-info").html("Sala de aula");
	} else if(vistoria.alim1 == 2) {
		$(".questao-9 .questao-info").html("Outros");
	} else if(vistoria.alim1 == 3){
		$(".questao-9 .questao-info").html("Refeitório");
	} else {
		$(".questao-9 .questao-info").html("Sem informação");
	}
}

function updateFotos(data){
	for (var i = 0; i <= 10; i++) {
		$("#foto-vistoria-"+i).fadeOut();
	}
	
	$.each(data, function(i, foto){
		if(foto.localizacao != null){
			if(i <= 10){
				i++;
				$("#foto-vistoria-"+i).fadeIn();
				$("#foto-vistoria-"+i).attr('href', contextPath + foto.localizacao);
				$("#foto-vistoria-"+i).attr('title', foto.nome);
				$("#foto-vistoria-"+i + " img").attr('src', contextPath + foto.localizacao);
			}
		}
	})
}

$(document).ready(function() {
	$(".fancybox").fancybox({
		helpers: {
            media: {}
		}
	});
	
	$(".entendavideo").fancybox({
		maxWidth	: 800,
		maxHeight	: 600,
		fitToView	: true,
		width		: '70%',
		height		: '70%',
		autoSize	: true,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none',
		helpers: {
            media: {}
		}
	});
	
	for (var i = 0; i <= 10; i++) {
		$("#foto-vistoria-"+i).fadeOut();
	}
});

function removePins(){
	if(rpaAtual != 0){
		crechesLayer.eachLayer(function(marker) {
			if(marker.feature.properties.RPA == rpaAtual){
			} else {
				map.removeLayer(marker);
			}
		});
	}
}

function mudaLegenda(filter){
	if(filter == 'quadras'){
		$("#pin-vermelho").hide();
		$("#pin-verde").hide();
		$("#pin-cinza").hide();
		$("#pin-amarelo").attr("title","REGULAR").tooltip("fixTitle");
		$("#pin-azul").show();
		$("#pin-azul").attr("title","BOM").tooltip("fixTitle");
		$("#pin-preto").show();
		$("#pin-preto").attr("title","RUIM").tooltip("fixTitle");
	} else if(filter == 'aces') {
		$("#pin-vermelho").hide();
		$("#pin-verde").hide();
		$("#pin-cinza").hide();
		$("#pin-amarelo").attr("title","Possui pelo menos um item básico").tooltip("fixTitle");
		$("#pin-azul").show();
		$("#pin-azul").attr("title","Possui todos os itens básicos").tooltip("fixTitle");
		$("#pin-preto").show();
		$("#pin-preto").attr("title","Não possui itens básicos de acessibilidade").tooltip("fixTitle");
	} else {
		$("#pin-vermelho").show();
		$("#pin-vermelho").attr("title","Não atingiu a meta do IDEB").tooltip("fixTitle");
		$("#pin-verde").show();
		$("#pin-verde").attr("title","Superou a meta IDEB e ficou acima de 6").tooltip("fixTitle");
		$("#pin-cinza").show();
		$("#pin-amarelo").attr("title","Atingiu a meta IDEB mas ficou abaixo de 6").tooltip("fixTitle");
		$("#pin-azul").hide();
		$("#pin-preto").hide();
	}
	$(".lista-legenda").attr("title","Legenda atualizada").tooltip("fixTitle").tooltip("enable").tooltip("show").delay(2000).queue(function (next) {
		$(".lista-legenda").tooltip("hide");
		$(".lista-legenda").tooltip("disable");
		next();
	});
}

$('.filtro-item').on('click', function(){
	actualMarker = undefined;
	if($(this).hasClass('active')){
		$(this).removeClass('active');
		var filter = 'null';
	} else {
		$(this).addClass('active').siblings().removeClass('active');
		var filter = $(this).data('filter');
	}
	if(filter === 'all'){
		replotMap();
		removePins();
		mudaLegenda(filter);
	} else if (filter === 'meta'){
		map.removeLayer(crechesLayer);
		crechesLayer = L.mapbox.featureLayer().addTo(map);
		crechesLayer.setGeoJSON(crechesData);
		crechesLayer.eachLayer(function(marker) {
			if(marker.feature.properties.ATINGIUMETA == true){
			} else {
				map.removeLayer(marker);
			}
		});
		removePins();
		crechesList = [];
		crechesListCompare = [];
		modo = 'meta';
		changeMarkers();
		mudaLegenda(filter);
	} else {
		replotMap();
		removePins();
		mudaLegenda(filter);
	}
	if($(window).width() <= 1024){
		fechaPainelFiltro();
	}
});

function changeMarkersMeta(){
	crechesLayer.eachLayer(function(marker) {
		if(marker.feature.properties.ATINGIUMETA == true){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/s-' + marker.feature.properties.COR + '.png',
				iconSize: [15, 38]
			}));
		} else {
			map.removeLayer(marker);
		}
	});
}

function changeMarkersQuadras(){
	
	crechesLayer.eachLayer(function(marker) {
		crechesList.push({label: marker.feature.properties.Creche, value: marker.feature.properties.ID});
		if(marker.feature.properties.POSSUIQUADRA === 1){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/s-black.png',
				iconSize: [15, 38]
			}));
		} else if(marker.feature.properties.POSSUIQUADRA === 2){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/s-yellow.png',
				iconSize: [15, 38]
			}));
		} else if(marker.feature.properties.POSSUIQUADRA === 3){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/s-blue.png',
				iconSize: [15, 38]
			}));
		} else {
			map.removeLayer(marker);
		}
		
		return false;
	});

	crechesMouseOver();
	crechesMouseOut();
	crechesClick();
};

function changeMarkersAcess(){
	crechesLayer.eachLayer(function(marker) {
		
		crechesList.push({label: marker.feature.properties.Creche, value: marker.feature.properties.ID});
		if(marker.feature.properties.ACESSIBILIDADE === 2){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/s-yellow.png',
				iconSize: [15, 38]
			}));
		} else if(marker.feature.properties.ACESSIBILIDADE === 3){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/s-blue.png',
				iconSize: [15, 38]
			}));
		} else {
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/s-black.png',
				iconSize: [15, 38]
			}));
		}
		
		return false;
	});

	crechesMouseOver();
	crechesMouseOut();
	crechesClick();
};

function focusRpa(rpa){
	rpaAtual = rpa;
	actualMarker = undefined;
	if(rpa === 0){
		$(".menu-ui a").removeClass('active');
		$("#todas").addClass('active');
		replotMap();
		removeAllRpaLayers();
		setAllRpaLayers();
		resetMap();
		$(".creche-title h2").html("RECIFE");
		fechaPaineis();
	} else {
		removeAllRpaLayers();
		map.removeLayer(crechesLayer);
		if(rpa == 1) { setRpa1(true); };
		if(rpa == 2) { setRpa2(true); };
		if(rpa == 3) { setRpa3(true); };
		if(rpa == 4) { setRpa4(true); };
		if(rpa == 5) { setRpa5(true); };
		if(rpa == 6) { setRpa6(true); };
		crechesLayer = L.mapbox.featureLayer().addTo(map);
		crechesLayer.setGeoJSON(crechesData);
		crechesLayer.eachLayer(function(marker) {
			if(marker.feature.properties.RPA == rpa){
			} else {
				map.removeLayer(marker);
			}
		});
		if(modo === "all" || modo === "ideb"){
			changeMarkers();
		} else if(modo === "quadras"){
			changeMarkersQuadras();
		} else if(modo === "acessibilidade"){
			changeMarkersAcess();
		} else if(modo === "meta"){
			changeMarkersMeta();
		} else if(modo === "novas"){
			changeMarkersMeta();
		}
	}
	
}

function replotMap(){
	map.removeLayer(crechesLayer);
	crechesLayer = L.mapbox.featureLayer().addTo(map);
	crechesLayer.setGeoJSON(crechesData);
	crechesList = [];
	crechesListCompare = [];
	modo = 'all';
	changeMarkers();
}

function removeAllRpaLayers(){
	map.removeLayer(rpa1Layer);
	map.removeLayer(rpa2Layer);
	map.removeLayer(rpa3Layer);
	map.removeLayer(rpa4Layer);
	map.removeLayer(rpa5Layer);
	map.removeLayer(rpa6Layer);
}

function setAllRpaLayers(){
	setRpa1(false);
	setRpa2(false);
	setRpa3(false);
	setRpa4(false);
	setRpa5(false);
	setRpa6(false);
}

function comparaCreches(comp1, comp2){
	
	$.ajax({
		url: 'consultaCrechesComparativo',
		type: "POST",
		data: {
			"id1" : comp1,
			"id2" : comp2
		},
		contentType: 'application/json',
		async: false,
		success: function(data) {
			exibeCompCreches(data, comp1, comp2);
		},
		error: function(xhr, ajaxOptions, thrownError){
			alert(xhr.status);
	        alert(thrownError);
		}
	});
}

function exibeCompCreches(data, comp1, comp2){
	var creNome1, creNome2;
	
	$.each(data, function(i, creche){
		if(i == 0){
			creNome1 = creche.nome;
		} else {
			creNome2 = creche.nome;
		}
	});
	
	$(".compare-titulo-creche1").text(creNome1);
	$(".compare-titulo-creche").text(creNome2);
	
	compareVisita(comp1, comp2, creNome1, creNome2);
}

function compareVisita(comp1, comp2, creNome1, creNome2){
	$("#galcre1 a").hide();
	$("#galcre1 h4").hide();
	$("#galcre2 a").hide();
	$("#galcre2 h4").hide();
	$.ajax({
		url: 'consultaVisitaComparativo',
		type: "POST",
		data: {
			"id1" : comp1,
			"id2" : comp2
		},
		contentType: 'application/json',
		async: false,
		success: function(data) {
			if(data != null & data != ''){
				$(".compare-creche").show();
				$(".compare-creche h3").hide();
				$.each(data, function(i, visita){
					if(visita.creche.id === parseInt(comp1)){
						$(".compare-creche .questao-1 #qcre1").html(visita.sa1);
						$(".compare-creche .questao-2 #qcre1").html(visita.sa4a + 'ºC');
						$(".compare-creche .questao-3 #qcre1").html(visita.sa5a + ' lux');
						
						if(visita.sa6 != null){
							$(".compare-creche .questao-4 #qcre1").html(visita.sa6);
						} else {
							$(".compare-creche .questao-4 #qcre1").html('0');
						}
						
						if(visita.bib1 == 'true'){
							$(".compare-creche .questao-5 #qcre1").html("Não");
						} else if(visita.bib1 != 'false'){
							$(".compare-creche .questao-5 #qcre1").html("Sim");
						} else {
							$(".compare-creche .questao-5 #qcre1").html("Sem informação");
						}
						
						if(visita.ace5 == 'true'){
							$(".compare-creche .questao-6 #qcre1").html("Sim");
						} else if(visita.ace5 == 'false'){
							$(".compare-creche .questao-6 #qcre1").html("Não");
						} else {
							$(".compare-creche .questao-6 #qcre1").html("Sem informação");
						}
						
						if(visita.se2 == 'true'){
							$(".compare-creche .questao-7 #qcre1").html("Sim");
						} else if(visita.se2 == 'false'){
							$(".compare-creche .questao-7 #qcre1").html("Não");
						} else {
							$(".compare-creche .questao-7 #qcre1").html("Sem informação");
						}
						
						if(visita.sp1 == 'true'){
							$(".compare-creche .questao-8 #qcre1").html("Sim");
						} else if(visita.sp1 == 'false'){
							$(".compare-creche .questao-8 #qcre1").html("Não");
						} else {
							$(".compare-creche .questao-8 #qcre1").html("Sem informação");
						}
						
						if(visita.alim1 == 1){
							$(".compare-creche .questao-9 #qcre1").html("Sala de aula");
						} else if(visita.alim1 == 2) {
							$(".compare-creche .questao-9 #qcre1").html("Outros");
						} else if(visita.alim1 == 3){
							$(".compare-creche .questao-9 #qcre1").html("Refeitório");
						} else {
							$(".compare-creche .questao-9 #qcre1").html("Sem informação");
						}
						
						if(visita.mdf2b == 'true'){
							$(".compare-creche .questao-10 #qcre1").html("Sim");
						} else if(visita.mdf2b == 'false'){
							$(".compare-creche .questao-10 #qcre1").html("Não");
						} else {
							$(".compare-creche .questao-10 #qcre1").html("Sem informação");
						}
						
						$("#galcre1 h4").html("Fotos da " + creNome1);
						compareFotosVisita(visita.id, 1);
						
					} else if(visita.creche.id === parseInt(comp2)){
						
						$(".compare-creche .questao-1 #qcre2").html(visita.sa1);
						$(".compare-creche .questao-2 #qcre2").html(visita.sa4a + 'ºC');
						$(".compare-creche .questao-3 #qcre2").html(visita.sa5a + ' lux');
						
						if(visita.sa6 != null){
							$(".compare-creche .questao-4 #qcre2").html(visita.sa6);
						} else {
							$(".compare-creche .questao-4 #qcre2").html('0');
						}
						
						if(visita.bib1 == 'true'){
							$(".compare-creche .questao-5 #qcre2").html("Não");
						} else if(visita.bib1 != 'false'){
							$(".compare-creche .questao-5 #qcre2").html("Sim");
						} else {
							$(".compare-creche .questao-5 #qcre2").html("Sem informação");
						}
						
						if(visita.ace5 == 'true'){
							$(".compare-creche .questao-6 #qcre2").html("Sim");
						} else if(visita.ace5 == 'false'){
							$(".compare-creche .questao-6 #qcre2").html("Não");
						} else {
							$(".compare-creche .questao-6 #qcre2").html("Sem informação");
						}
						
						if(visita.se2 == 'true'){
							$(".compare-creche .questao-7 #qcre2").html("Sim");
						} else if(visita.se2 == 'false'){
							$(".compare-creche .questao-7 #qcre2").html("Não");
						} else {
							$(".compare-creche .questao-7 #qcre2").html("Sem informação");
						}
						
						if(visita.sp1 == 'true'){
							$(".compare-creche .questao-8 #qcre2").html("Sim");
						} else if(visita.sp1 == 'false'){
							$(".compare-creche .questao-8 #qcre2").html("Não");
						} else {
							$(".compare-creche .questao-8 #qcre2").html("Sem informação");
						}
						
						if(visita.alim1 == 1){
							$(".compare-creche .questao-9 #qcre2").html("Sala de aula");
						} else if(visita.alim1 == 2) {
							$(".compare-creche .questao-9 #qcre2").html("Outros");
						} else if(visita.alim1 == 3){
							$(".compare-creche .questao-9 #qcre2").html("Refeitório");
						} else {
							$(".compare-creche .questao-9 #qcre2").html("Sem informação");
						}
						
						if(visita.mdf2b == 'true'){
							$(".compare-creche .questao-10 #qcre2").html("Sim");
						} else if(visita.mdf2b == 'false'){
							$(".compare-creche .questao-10 #qcre2").html("Não");
						} else {
							$(".compare-creche .questao-10 #qcre2").html("Sem informação");
						}
						
						$("#galcre2 h4").html("Fotos da " + creNome2);
						compareFotosVisita(visita.id, 2);
					}
				});
			}
		},
		
		error: function(xhr, ajaxOptions, thrownError){
			alert(xhr.status);
	        alert(thrownError);
		}
	});
}

var logo = $('.logo');
var img = $('.logo img');
var spans = $('.logo span');
var scrlld = false;

function closeComparativo(){
	replotMap();
	removeAllRpaLayers();
	setAllRpaLayers();
	resetMap();
}

function recarregaMapa(){
	rpaAtual = 0;
	actualMarker = undefined;
	modo = 'all';
	$(".menu-ui a").removeClass('active');
	replotMap();
	removeAllRpaLayers();
	setAllRpaLayers();
	resetMap();
}

function compareFotosVisita(visId, ordem){
	$.ajax({
		url: 'consultaFotosVisita',
		type: "POST",
		data: JSON.stringify({ id: visId }),
		contentType: 'application/json',
		success: function(data){
			if(data.length > 0){
				$("#galcre"+ordem+" a").show();
				$("#galcre"+ordem+" h4").show();
				if(ordem === 1){
					$.each(data, function(i, foto){
						if(foto.localizacao != null){
							if(i <= 6){
								i++;
								$("#fotocompesq"+i).fadeIn();
								$("#fotocompesq"+i).attr('href', contextPath + foto.localizacao);
								$("#fotocompesq"+i).attr('title', foto.nome);
								$("#fotocompesq"+i + " img").attr('src', contextPath + foto.localizacao);
							}
						}
					})
				} else {
					$.each(data, function(i, foto){
						if(foto.localizacao != null){
							if(i <= 6){
								i++;
								$("#fotocompdir"+i).fadeIn();
								$("#fotocompdir"+i).attr('href', contextPath + foto.localizacao);
								$("#fotocompdir"+i).attr('title', foto.nome);
								$("#fotocompdir"+i + " img").attr('src', contextPath + foto.localizacao);
							}
						}
					})
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}


//NOTAS DAS CRECHES
function updateNotas(data){
	
	$('.nota-geral').html(
		'<div class="notas">'+	
			'<h3>Nota Geral</h3>'+
			'<div class="nota-creche col-xs-12 col-sm-6 col-md-6 col-lg-6">'+
				'<div class="nota-creche-circle">'+
					'<div class="inner-notas">'+
						'<span>Creche</span>'+
						'<h4>'+data.geral+'</h4>'+
					'</div>'+
				'</div>'+
			'</div>'+
			'<div class="nota-recife col-xs-12 col-sm-6 col-md-6 col-lg-6">'+
				'<div class="nota-recife-circle">'+
					'<div class="inner-notas">'+
						'<span>Recife</span>'+
						'<h4>'+3.5+'</h4>'+
					'</div>'+
				'</div>'+
			'</div>'+
		'</div>'
	);
	
	$("#notaSala").html(data.sala);
	$("#notaBercario").html(data.bercario);
	$("#notaBanheiros").html(data.banheiros);
	$("#notaEspacosAlternativos").html(data.espacosAlternativos);
	$("#notaAcessibilidade").html(data.acessibilidade);
	$("#notaServicosEssenciais").html(data.servicosEssenciais);
	$("#notaMateriais").html(data.materiais);
	$("#notaAlimentacao").html(data.alimentacao);
	$("#notaLavanderia").html(data.lavanderia);
	$("#notaSaude").html(data.saude);
		
}