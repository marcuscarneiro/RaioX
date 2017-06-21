var escId, escNome, rel, escIdebComp1, escIdebComp2, ordemAtual;
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
	escondeDados();
	resetMap();
	replotMap();
	rpaAtual = 0;
	removeAllRpaLayers();
	setAllRpaLayers();
//	info.innerHTML = '';
	resetActualMarker();
	$(".escola-title").slideDown();
	$(".menu-ui a").removeClass('active');
	$("#todas").addClass('active');
	showEscola("RECIFE", null);
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
		escondeDados();
		resetActualMarker();
//		info.innerHTML = '';
		map.setView(e.layer.getBounds().getCenter(), 13);
		showEscola(e.layer.feature.properties.RPA, null);
			});
	rpa1Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa1Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
//		info.innerHTML = '';
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
		showEscola("RPA 1", null);
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
		escondeDados();
		resetActualMarker();
//		info.innerHTML = '';
		map.setView(e.layer.getBounds().getCenter(), 13);
		showEscola(e.layer.feature.properties.RPA, null);
	});
	rpa2Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa2Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
//		info.innerHTML = '';
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
		showEscola("RPA 2", null);
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
		escondeDados();
		resetActualMarker();
//		info.innerHTML = '';
		map.setView(e.layer.getBounds().getCenter(), 12);
		showEscola(e.layer.feature.properties.RPA, null);
	});
	rpa3Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa3Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
//		info.innerHTML = '';
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
		showEscola("RPA 3", null);
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
		escondeDados();
		resetActualMarker();
//		info.innerHTML = '';
		map.setView(e.layer.getBounds().getCenter(), 13);
		showEscola(e.layer.feature.properties.RPA, null);
	});
	rpa4Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa4Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
//		info.innerHTML = '';
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
		showEscola("RPA 4", null);
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
		escondeDados();
		resetActualMarker();
//		info.innerHTML = '';
		map.setView(e.layer.getBounds().getCenter(), 13);
		showEscola(e.layer.feature.properties.RPA, null);
	});
	rpa5Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa5Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
//		info.innerHTML = '';
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
		showEscola("RPA 5", null);
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
		escondeDados();
		resetActualMarker();
//		info.innerHTML = '';
		map.setView(e.layer.getBounds().getCenter(), 13);
		showEscola(e.layer.feature.properties.RPA, null);
	});
	rpa6Layer.on('mousemove', function(e){highlightLayer(e);});
	rpa6Layer.on('mouseout', function(e){resetLayerStyle(e);});
	if(click == true){
		resetActualMarker();
//		info.innerHTML = '';
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
		showEscola("RPA 6", null);
	}
}

setRpa6(false);

var escolasLayer = L.mapbox.featureLayer().addTo(map);

var escolasList = [];

var escolasListCompare = [];

var escolasData;

function carregaEscolas(){
	$.ajax({
		url: 'carregaEscolas',
		type: "GET",
		dataType: 'json',
		success: function(data) {
			escolasData = data;
			escolasLayer.setGeoJSON(data);
			escolasList = [];
			escolasListCompare = [];
			changeMarkers();
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

carregaEscolas();

// Add custom popups to each using our custom feature properties
function escolasMouseOver(){
	escolasLayer.on('mouseover', function(e)
	{
//		if(e.layer != actualMarker){
//			highlightMarker(e);
//		}
		definePopup(e.layer);
		e.layer.openPopup();
	});
}

escolasMouseOver();

function escolasMouseOut(){
	escolasLayer.on('mouseout', function(e)
	{
//		if(e.layer != actualMarker){
//			resetMarker(e);
////			info.innerHTML = '';
//			if(actualMarker != null){
////				definePopup(actualMarker);
//			}
//		}
		e.layer.closePopup();
	});
}

escolasMouseOut();

function highlightMarker(e){
	var marker = e.layer;
	if(modo === 'all' || modo === "meta" || modo === "novas"){
		marker.setIcon(L.icon({
			iconUrl: contextPath + '/views/assets/css/img/m-' + marker.feature.properties.COR + '.png',
			iconSize: [20, 50]
		}));
	} else if(modo === 'quadras'){
		if(marker.feature.properties.POSSUIQUADRA === 1){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/m-black.png',
				iconSize: [20, 50]
			}));
		} else if(marker.feature.properties.POSSUIQUADRA === 2){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/m-yellow.png',
				iconSize: [20, 50]
			}));
		} else if(marker.feature.properties.POSSUIQUADRA === 3){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/m-blue.png',
				iconSize: [20, 50]
			}));
		}
	} else if(modo === 'acessibilidade'){
		if(marker.feature.properties.ACESSIBILIDADE === 2){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/m-yellow.png',
				iconSize: [20, 50]
			}));
		} else if(marker.feature.properties.ACESSIBILIDADE === 3){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/m-blue.png',
				iconSize: [20, 50]
			}));
		} else {
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/m-black.png',
				iconSize: [20, 50]
			}));
		}
	}
}

function definePopup(marker){
	var feature = marker.feature,
		foto;
	if(feature.properties.Foto != null){
		foto = contextPath + feature.properties.Foto;
	} else {
		foto = contextPath + '/views/assets/css/img/escola.jpg';
	}
	// Create custom popup content
	var popupContent = '<div class="pop"><div class="popup-texto"><span><strong>' + feature.properties.Escola + '</strong></span>' +
		'<p>' + feature.properties.Endereco + '</p></div>'+
		'<div class="crop"><img src="' + foto + '"/></div></div>';

//	if(viewWidth >= 750){
//		info.innerHTML = popupContent;
//	}
	
	marker.bindPopup(popupContent,
	{
		closeButton: true,
		minWidth: 320
	});
}

function resetMarker(e){
	var marker = e.layer;
	if(modo === 'all' || modo === "meta" || modo === "novas"){
		marker.setIcon(L.icon({
			iconUrl: contextPath + '/views/assets/css/img/s-' + marker.feature.properties.COR + '.png',
			iconSize: [15, 38]
		}));
	} else if(modo === 'quadras'){
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
		}
	} else if(modo === 'acessibilidade'){
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
	}
}

function resizeMarker(marker){
	if(marker != actualMarker){
		showEscola(marker.feature.properties.Escola, marker.feature.properties.ID);
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

function escolasClick(){
	escolasLayer.on('click', function(e)
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

function fechar()
{
	e.layer.closePopup();
};

function changeMarkers(){
	$('#marker-list').remove();
	var body = document.body;
	var markerList = body.appendChild(document.createElement('div'));
	markerList.id = "marker-list";
	$('.compare-lista').remove();
	$('.compare-resultado').append('<ul class="compare-lista">');
	$('.pesquisa-lista').remove();
	$('.pesquisa-resultado').append('<ul class="pesquisa-lista">');
	
	escolasLayer.eachLayer(function(marker) {
		escolasList.push({label: marker.feature.properties.Escola, value: marker.feature.properties.ID});
		escolasListCompare.push({label: marker.feature.properties.Escola, value: marker.feature.properties.ID});
		
		$('.pesquisa-lista').append('<li esc="' + marker.feature.properties.ID + '" class="pesquisa-escola-caixas" onclick="abreEscola('+ marker.feature.properties.ID +',\''+marker.feature.properties.Escola+'\')">'+
				'<h4 class="pesquisa-nome">'+marker.feature.properties.Escola+'</h4>'+
				'<h4 class="pesquisa-endereco">'+marker.feature.properties.Endereco+'</h4>'+
				'<div class="pesquisa-thumb">'+
					'<img src="'+contextPath + marker.feature.properties.Foto+'" alt="" class="thumb">'+
				'</div>'+
			'</li>');
		
		$('.compare-lista').append('<li esc="' + marker.feature.properties.ID + '" class="compare-item compare-escola-caixas" onclick="addCompara('+marker.feature.properties.ID+')">'+
				'<h4 class="pesquisa-nome">'+marker.feature.properties.Escola+'</h4>'+
				'<div class="pesquisa-thumb">'+
					'<img src="'+contextPath + marker.feature.properties.Foto+'" alt="" class="thumb">'+
				'</div>'+
			'</li>');
				
		if(marker.feature.properties.ID === 262){
			marker.setZIndexOffset(9999);
		}
		
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
	
	escolasMouseOver();
	escolasMouseOut();
	escolasClick();
};

function preencheEscolas(){
	$.each(escolasListCompare, function(i, escola){
		$("#listaEscola1").append('<li id="'+escola.value+'" class="escolaItem list-group-item" onclick="escolheEscola1('+escola.value+')"><span>'+ escola.label +'</span></li>');
		$("#listaEscola2").append('<li id="'+escola.value+'" class="escolaItem list-group-item" onclick="escolheEscola2('+escola.value+')"><span>'+ escola.label +'</span></li>');
	});
}

function escolheEscola1(id){
	var esc1;
	$.each(escolasListCompare, function(i, esc){
	if(esc.value == id){
			esc1 = esc.label;
		}
	});
	
	$("#compareId1").val(id);
	$("#compareEnt1").val(esc1);
}

function escolheEscola2(id){
	var esc2;
	$.each(escolasListCompare, function(i, esc){
	if(esc.value == id){
			esc2 = esc.label;
		}
	});
	
	$("#compareId2").val(id);
	$("#compareEnt2").val(esc2);
}

//function mostraEscolasComparativo(esc1, esc2){
//	escolasLayer.eachLayer(function(marker) {
//		if(marker.feature.properties.ID == esc1 || marker.feature.properties.ID == esc2){
//		} else {
//			map.removeLayer(marker);
//		}
//	});
//	resetMap();
//}

function comparaEscolas(comp1, comp2){
//	var comp1 = $("#compareId1").val();
//	var comp2 = $("#compareId2").val();
	
//	mostraEscolasComparativo(comp1, comp2);
	
	$.ajax({
		url: 'consultaEscolasComparativo',
		type: "POST",
		data: {
			"id1" : comp1,
			"id2" : comp2
		},
		contentType: 'application/json',
		async: false,
		success: function(data) {
			exibeCompEscolas(data, comp1, comp2);
		},
		error: function(xhr, ajaxOptions, thrownError){
			alert(xhr.status);
	        alert(thrownError);
		}
	});
}

function exibeCompEscolas(data, comp1, comp2){
	var escNome1, escNome2;
	
	$.each(data, function(i, escol){
		if(i == 0){
			escNome1 = escol.nome;
		} else {
			escNome2 = escol.nome;
		}
	});
	
	$(".compare-titulo-escola1").text(escNome1);
	$(".compare-titulo-escola2").text(escNome2);
	
//	$(".compare").slideDown();
//	$(".compare").css("visibility", "block");
//	
//	$(".ideb").slideUp();
//	$(".ideb").css("visibility", "none");
//	
//	$(".fiscalizacao").slideUp();
//	$(".fiscalizacao").css("visibility", "none");
//	
//	$(".comentarios").slideUp();
//	$(".comentarios").css("visibility", "none");
//	
//	$(".escola-title").slideUp();
//	$(".escola-title").css("visibility", "none");
	
	compareIdeb(comp1, comp2, escNome1, escNome2);
	compareAprendizado(comp1, comp2, escNome1, escNome2);
	compareVisita(comp1, comp2, escNome1, escNome2);
}

//$(function(){
//	var accentMap = {"ẚ": "a", "Á": "a", "á": "a", "À": "a", "à": "a", "Ă": "a", "ă": "a", "Ắ": "a", "ắ": "a", "Ằ": "a", "ằ": "a", "Ẵ": "a", "ẵ": "a", "Ẳ": "a", "ẳ": "a", "Â": "a", "â": "a", "Ấ": "a", "ấ": "a", "Ầ": "a", "ầ": "a", "Ẫ": "a", "ẫ": "a", "Ẩ": "a", "ẩ": "a", "Ǎ": "a", "ǎ": "a", "Å": "a", "å": "a", "Ǻ": "a", "ǻ": "a", "Ä": "a", "ä": "a", "Ǟ": "a", "ǟ": "a", "Ã": "a", "ã": "a", "Ȧ": "a", "ȧ": "a", "Ǡ": "a", "ǡ": "a", "Ą": "a", "ą": "a", "Ā": "a", "ā": "a", "Ả": "a", "ả": "a", "Ȁ": "a", "ȁ": "a", "Ȃ": "a", "ȃ": "a", "Ạ": "a", "ạ": "a", "Ặ": "a", "ặ": "a", "Ậ": "a", "ậ": "a", "Ḁ": "a", "ḁ": "a", "Ⱥ": "a", "ⱥ": "a", "Ǽ": "a", "ǽ": "a", "Ǣ": "a", "ǣ": "a", "Ḃ": "b", "ḃ": "b", "Ḅ": "b", "ḅ": "b", "Ḇ": "b", "ḇ": "b", "Ƀ": "b", "ƀ": "b", "ᵬ": "b", "Ɓ": "b", "ɓ": "b", "Ƃ": "b", "ƃ": "b", "Ć": "c", "ć": "c", "Ĉ": "c", "ĉ": "c", "Č": "c", "č": "c", "Ċ": "c", "ċ": "c", "Ç": "c", "ç": "c", "Ḉ": "c", "ḉ": "c", "Ȼ": "c", "ȼ": "c", "Ƈ": "c", "ƈ": "c", "ɕ": "c", "Ď": "d", "ď": "d", "Ḋ": "d", "ḋ": "d", "Ḑ": "d", "ḑ": "d", "Ḍ": "d", "ḍ": "d", "Ḓ": "d", "ḓ": "d", "Ḏ": "d", "ḏ": "d", "Đ": "d", "đ": "d", "ᵭ": "d", "Ɖ": "d", "ɖ": "d", "Ɗ": "d", "ɗ": "d", "Ƌ": "d", "ƌ": "d", "ȡ": "d", "ð": "d", "É": "e", "Ə": "e", "Ǝ": "e", "ǝ": "e", "é": "e", "È": "e", "è": "e", "Ĕ": "e", "ĕ": "e", "Ê": "e", "ê": "e", "Ế": "e", "ế": "e", "Ề": "e", "ề": "e", "Ễ": "e", "ễ": "e", "Ể": "e", "ể": "e", "Ě": "e", "ě": "e", "Ë": "e", "ë": "e", "Ẽ": "e", "ẽ": "e", "Ė": "e", "ė": "e", "Ȩ": "e", "ȩ": "e", "Ḝ": "e", "ḝ": "e", "Ę": "e", "ę": "e", "Ē": "e", "ē": "e", "Ḗ": "e", "ḗ": "e", "Ḕ": "e", "ḕ": "e", "Ẻ": "e", "ẻ": "e", "Ȅ": "e", "ȅ": "e", "Ȇ": "e", "ȇ": "e", "Ẹ": "e", "ẹ": "e", "Ệ": "e", "ệ": "e", "Ḙ": "e", "ḙ": "e", "Ḛ": "e", "ḛ": "e", "Ɇ": "e", "ɇ": "e", "ɚ": "e", "ɝ": "e", "Ḟ": "f", "ḟ": "f", "ᵮ": "f", "Ƒ": "f", "ƒ": "f", "Ǵ": "g", "ǵ": "g", "Ğ": "g", "ğ": "g", "Ĝ": "g", "ĝ": "g", "Ǧ": "g", "ǧ": "g", "Ġ": "g", "ġ": "g", "Ģ": "g", "ģ": "g", "Ḡ": "g", "ḡ": "g", "Ǥ": "g", "ǥ": "g", "Ɠ": "g", "ɠ": "g", "Ĥ": "h", "ĥ": "h", "Ȟ": "h", "ȟ": "h", "Ḧ": "h", "ḧ": "h", "Ḣ": "h", "ḣ": "h", "Ḩ": "h", "ḩ": "h", "Ḥ": "h", "ḥ": "h", "Ḫ": "h", "ḫ": "h", H: "h", "̱": "h", "ẖ": "h", "Ħ": "h", "ħ": "h", "Ⱨ": "h", "ⱨ": "h", "Í": "i", "í": "i", "Ì": "i", "ì": "i", "Ĭ": "i", "ĭ": "i", "Î": "i", "î": "i", "Ǐ": "i", "ǐ": "i", "Ï": "i", "ï": "i", "Ḯ": "i", "ḯ": "i", "Ĩ": "i", "ĩ": "i", "İ": "i", i: "i", "Į": "i", "ı": "i", "į": "i", "Ī": "i", "ī": "i", "Ỉ": "i", "ỉ": "i", "Ȉ": "i", "ȉ": "i", "Ȋ": "i", "ȋ": "i", "Ị": "i", "ị": "i", "Ḭ": "i", "ḭ": "i", I: "i", "ı": "i", "Ɨ": "i", "ɨ": "i", "Ĵ": "j", "ĵ": "j", J: "j", "̌": "j", "ǰ": "j", "ȷ": "j", "Ɉ": "j", "ɉ": "j", "ʝ": "j", "ɟ": "j", "ʄ": "j", "Ḱ": "k", "ḱ": "k", "Ǩ": "k", "ǩ": "k", "Ķ": "k", "ķ": "k", "Ḳ": "k", "ḳ": "k", "Ḵ": "k", "ḵ": "k", "Ƙ": "k", "ƙ": "k", "Ⱪ": "k", "ⱪ": "k", "Ĺ": "a", "ĺ": "l", "Ľ": "l", "ľ": "l", "Ļ": "l", "ļ": "l", "Ḷ": "l", "ḷ": "l", "Ḹ": "l", "ḹ": "l", "Ḽ": "l", "ḽ": "l", "Ḻ": "l", "ḻ": "l", "Ł": "l", "ł": "l", "Ł": "l", "̣": "l", "ł": "l", "̣": "l", "Ŀ": "l", "ŀ": "l", "Ƚ": "l", "ƚ": "l", "Ⱡ": "l", "ⱡ": "l", "Ɫ": "l", "ɫ": "l", "ɬ": "l", "ɭ": "l", "ȴ": "l", "Ḿ": "m", "ḿ": "m", "Ṁ": "m", "ṁ": "m", "Ṃ": "m", "ṃ": "m", "ɱ": "m", "Ń": "n", "ń": "n", "Ǹ": "n", "ǹ": "n", "Ň": "n", "ň": "n", "Ñ": "n", "ñ": "n", "Ṅ": "n", "ṅ": "n", "Ņ": "n", "ņ": "n", "Ṇ": "n", "ṇ": "n", "Ṋ": "n", "ṋ": "n", "Ṉ": "n", "ṉ": "n", "Ɲ": "n", "ɲ": "n", "Ƞ": "n", "ƞ": "n", "ɳ": "n", "ȵ": "n", N: "n", "̈": "n", n: "n", "̈": "n", "Ó": "o", "ó": "o", "Ò": "o", "ò": "o", "Ŏ": "o", "ŏ": "o", "Ô": "o", "ô": "o", "Ố": "o", "ố": "o", "Ồ": "o", "ồ": "o", "Ỗ": "o", "ỗ": "o", "Ổ": "o", "ổ": "o", "Ǒ": "o", "ǒ": "o", "Ö": "o", "ö": "o", "Ȫ": "o", "ȫ": "o", "Ő": "o", "ő": "o", "Õ": "o", "õ": "o", "Ṍ": "o", "ṍ": "o", "Ṏ": "o", "ṏ": "o", "Ȭ": "o", "ȭ": "o", "Ȯ": "o", "ȯ": "o", "Ȱ": "o", "ȱ": "o", "Ø": "o", "ø": "o", "Ǿ": "o", "ǿ": "o", "Ǫ": "o", "ǫ": "o", "Ǭ": "o", "ǭ": "o", "Ō": "o", "ō": "o", "Ṓ": "o", "ṓ": "o", "Ṑ": "o", "ṑ": "o", "Ỏ": "o", "ỏ": "o", "Ȍ": "o", "ȍ": "o", "Ȏ": "o", "ȏ": "o", "Ơ": "o", "ơ": "o", "Ớ": "o", "ớ": "o", "Ờ": "o", "ờ": "o", "Ỡ": "o", "ỡ": "o", "Ở": "o", "ở": "o", "Ợ": "o", "ợ": "o", "Ọ": "o", "ọ": "o", "Ộ": "o", "ộ": "o", "Ɵ": "o", "ɵ": "o", "Ṕ": "p", "ṕ": "p", "Ṗ": "p", "ṗ": "p", "Ᵽ": "p", "Ƥ": "p", "ƥ": "p", P: "p", "̃": "p", p: "p", "̃": "p", "ʠ": "q", "Ɋ": "q", "ɋ": "q", "Ŕ": "r", "ŕ": "r", "Ř": "r", "ř": "r", "Ṙ": "r", "ṙ": "r", "Ŗ": "r", "ŗ": "r", "Ȑ": "r", "ȑ": "r", "Ȓ": "r", "ȓ": "r", "Ṛ": "r", "ṛ": "r", "Ṝ": "r", "ṝ": "r", "Ṟ": "r", "ṟ": "r", "Ɍ": "r", "ɍ": "r", "ᵲ": "r", "ɼ": "r", "Ɽ": "r", "ɽ": "r", "ɾ": "r", "ᵳ": "r", "ß": "s", "Ś": "s", "ś": "s", "Ṥ": "s", "ṥ": "s", "Ŝ": "s", "ŝ": "s", "Š": "s", "š": "s", "Ṧ": "s", "ṧ": "s", "Ṡ": "s", "ṡ": "s", "ẛ": "s", "Ş": "s", "ş": "s", "Ṣ": "s", "ṣ": "s", "Ṩ": "s", "ṩ": "s", "Ș": "s", "ș": "s", "ʂ": "s", S: "s", "̩": "s", s: "s", "̩": "s", "Þ": "t", "þ": "t", "Ť": "t", "ť": "t", T: "t", "̈": "t", "ẗ": "t", "Ṫ": "t", "ṫ": "t", "Ţ": "t", "ţ": "t", "Ṭ": "t", "ṭ": "t", "Ț": "t", "ț": "t", "Ṱ": "t", "ṱ": "t", "Ṯ": "t", "ṯ": "t", "Ŧ": "t", "ŧ": "t", "Ⱦ": "t", "ⱦ": "t", "ᵵ": "t", "ƫ": "t", "Ƭ": "t", "ƭ": "t", "Ʈ": "t", "ʈ": "t", "ȶ": "t", "Ú": "u", "ú": "u", "Ù": "u", "ù": "u", "Ŭ": "u", "ŭ": "u", "Û": "u", "û": "u", "Ǔ": "u", "ǔ": "u", "Ů": "u", "ů": "u", "Ü": "u", "ü": "u", "Ǘ": "u", "ǘ": "u", "Ǜ": "u", "ǜ": "u", "Ǚ": "u", "ǚ": "u", "Ǖ": "u", "ǖ": "u", "Ű": "u", "ű": "u", "Ũ": "u", "ũ": "u", "Ṹ": "u", "ṹ": "u", "Ų": "u", "ų": "u", "Ū": "u", "ū": "u", "Ṻ": "u", "ṻ": "u", "Ủ": "u", "ủ": "u", "Ȕ": "u", "ȕ": "u", "Ȗ": "u", "ȗ": "u", "Ư": "u", "ư": "u", "Ứ": "u", "ứ": "u", "Ừ": "u", "ừ": "u", "Ữ": "u", "ữ": "u", "Ử": "u", "ử": "u", "Ự": "u", "ự": "u", "Ụ": "u", "ụ": "u", "Ṳ": "u", "ṳ": "u", "Ṷ": "u", "ṷ": "u", "Ṵ": "u", "ṵ": "u", "Ʉ": "u", "ʉ": "u", "Ṽ": "v", "ṽ": "v", "Ṿ": "v", "ṿ": "v", "Ʋ": "v", "ʋ": "v", "Ẃ": "w", "ẃ": "w", "Ẁ": "w", "ẁ": "w", "Ŵ": "w", "ŵ": "w", W: "w", "̊": "w", "ẘ": "w", "Ẅ": "w", "ẅ": "w", "Ẇ": "w", "ẇ": "w", "Ẉ": "w", "ẉ": "w", "Ẍ": "x", "ẍ": "x", "Ẋ": "x", "ẋ": "x", "Ý": "y", "ý": "y", "Ỳ": "y", "ỳ": "y", "Ŷ": "y", "ŷ": "y", Y: "y", "̊": "y", "ẙ": "y", "Ÿ": "y", "ÿ": "y", "Ỹ": "y", "ỹ": "y", "Ẏ": "y", "ẏ": "y", "Ȳ": "y", "ȳ": "y", "Ỷ": "y", "ỷ": "y", "Ỵ": "y", "ỵ": "y", "ʏ": "y", "Ɏ": "y", "ɏ": "y", "Ƴ": "y", "ƴ": "y", "Ź": "z", "ź": "z", "Ẑ": "z", "ẑ": "z", "Ž": "z", "ž": "z", "Ż": "z", "ż": "z", "Ẓ": "z", "ẓ": "z", "Ẕ": "z", "ẕ": "z", "Ƶ": "z", "ƶ": "z", "Ȥ": "z", "ȥ": "z", "ʐ": "z", "ʑ": "z", "Ⱬ": "z", "ⱬ": "z", "Ǯ": "z", "ǯ": "z", "ƺ": "z", "２": "2", "６": "6", "Ｂ": "B", "Ｆ": "F", "Ｊ": "J", "Ｎ": "N", "Ｒ": "R", "Ｖ": "V", "Ｚ": "Z", "ｂ": "b", "ｆ": "f", "ｊ": "j", "ｎ": "n", "ｒ": "r", "ｖ": "v", "ｚ": "z", "１": "1", "５": "5", "９": "9", "Ａ": "A", "Ｅ": "E", "Ｉ": "I", "Ｍ": "M", "Ｑ": "Q", "Ｕ": "U", "Ｙ": "Y", "ａ": "a", "ｅ": "e", "ｉ": "i", "ｍ": "m", "ｑ": "q", "ｕ": "u", "ｙ": "y", "０": "0", "４": "4", "８": "8", "Ｄ": "D", "Ｈ": "H", "Ｌ": "L", "Ｐ": "P", "Ｔ": "T", "Ｘ": "X", "ｄ": "d", "ｈ": "h", "ｌ": "l", "ｐ": "p", "ｔ": "t", "ｘ": "x", "３": "3", "７": "7", "Ｃ": "C", "Ｇ": "G", "Ｋ": "K", "Ｏ": "O", "Ｓ": "S", "Ｗ": "W", "ｃ": "c", "ｇ": "g", "ｋ": "k", "ｏ": "o", "ｓ": "s", "ｗ": "w"
//	};
//	var normalize = function( term ) {
//		var ret = "";
//		for ( var i = 0; i < term.length; i++ ) {
//			ret += accentMap[ term.charAt(i) ] || term.charAt(i);
//		}
//		return ret;
//	};
//	$("#schools").autocomplete({
//		source: function(request, response)
//		{
////			var results = $.ui.autocomplete.filter(escolasList, request.term);
////			response(results.slice(0, 10));
//			
//			var matcher = new RegExp( $.ui.autocomplete.escapeRegex( request.term ), "i" );
//	        response( $.grep( escolasList, function( value ) {
//	          value = value.label || value.value || value;
//	          return matcher.test( value ) || matcher.test( normalize( value ) );
//	        }) );
//		},
//		focus: function(event, ui)
//		{
//			$(".schools").val(ui.item.label);
//			return false;
//		},
//		select: function(event, ui)
//		{
//			event.preventDefault();
//			$("#schools").val(ui.item.label);
//			escId = ui.item.value;
//			escNome = ui.item.label;
//			$("#"+escId).click();
////					showEscola($('#schools').val(), escId);
//		}
//	});
//});

$(document).ready(function()
{
	$('.search').submit(function(e)
	{
		e.preventDefault();
		$("#"+escId)[0].click();
		showEscola($('#schools').val(), null);
	});
});

function showEscola(esc, id){
	$(".escola-nome").html(esc);
	var fotoFachada = $('.pesquisa-lista').find('[esc="'+id+'"]').children('.pesquisa-thumb').children('.thumb').attr('src');
	$(".foto-fachada img").attr("src",fotoFachada);
	if(id != null){
		
		$(".fiscalizacao").show();
		$(".comentarios").show();
		consultaDadosIdeb(id);
		consultaProvaBrasil(id);
		$(".fiscalizacao-datas li").remove();
		mapVisita = new Object();
		ordemAtual = 0;
		consultaVisitas(id);
		consultaAvaliacaoPublica(id);
		abrePainel('escola');
	}
};

function consultaDadosIdeb(id){
	$.ajax({
		url: 'consultaDadosIdeb',
		type: "POST",
		data: JSON.stringify({ id: id }),
		contentType: 'application/json',
		async: false,
		success: function(data) {
			if(data.escola.requerimentos != null){
				$(".fiscalicazaoRequerimento a").attr('href', contextPath + data.escola.requerimentos);
			}
			if(data.did_ideb_2013_ini != null || data.did_ideb_2013_fin != null){
				updateIdeb(data);
			} else {
				idebVazio();
			}
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

function consultaProvaBrasil(id){
	$.ajax({
		url: 'consultaProvaBrasil',
		type: "POST",
		data: JSON.stringify({ id: id }),
		contentType: 'application/json',
		success: function(data) {
			updateAprendizado(data);
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

function changeVisita(visita){
	consultaFotos(visita.id);
	updateVisitas(visita);
}

function consultaVisitas(id){
	$.ajax({
		url: 'consultaVisitas',
		type: "POST",
		data: JSON.stringify({ id: id }),
		contentType: 'application/json',
		async: false,
		success: function(data) {
			if(data != null & data != ''){
				processaVisitas(data);
			} else {
				visitasVazias();
				mapVisita = null;
			}
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

function processaVisitas(data){
	$(".fiscalizacao-datas").show();
	var qtd = data.length;
	var indice = 1;
	while(indice <= qtd){
		if(qtd === indice){
			$(".fiscalizacao-datas ul").append("<li class='vistoria-" + indice + " data-active' onclick='alteraVistoria("+ indice +")'><span>" + indice + "ª VISTORIA</span></li>");
		} else {
			$(".fiscalizacao-datas ul").append("<li class='vistoria-" + indice + "' onclick='alteraVistoria("+ indice +")'><span>" + indice + "ª VISTORIA</span></li>");
		}
		indice++;
	}
	$.each(data, function(i, visita){
		var ordem = i+1;
		if(ordem === qtd){
			changeVisita(visita);
		}
		mapVisita[ordem] = visita;
//		$(anoVisita + " a").attr('href', contextPath + visita.relatorio)
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
			changeVisita(vistoria);
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
		url: 'consultaFotosVisita',
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
	$(".fiscalizacao-header h2").text("Esta escola será visitada em breve pela equipe do Vereador André Régis");
	$(".fiscalizacao-datas").hide();
	$(".fiscalizacao-fotos").hide();
	$(".fiscalizacao-questionario").hide();
	$(".fiscalicazaoRelatorio").hide();
	rel = false;
};

function updateVisitas(visita){
	$(".fiscalizacao-header h2").text("FISCALIZAÇÃO");
	$(".fiscalizacao-datas").show();
	$(".fiscalizacao-fotos").show();
	$(".fiscalizacao-questionario").show();
	
//		var dateOri = visita.data;
//		var dateAr = dateOri.split('-');
//		var finalDate = dateAr[1] + '/' + dateAr[2] + '/' + dateAr[0];
//		$("#visita-"+i).html(finalDate);
	
	if(visita.relatorio != null){
		rel = true;
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio span").css('display', 'none');
		$(".fiscalicazaoRelatorio a").css('display', 'inline-block');
		$(".fiscalicazaoRelatorio a").attr('href', contextPath + visita.relatorio);
		
	} else {
		rel = false;
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio a").css('display', 'none');
		$(".fiscalicazaoRelatorio span").css('display', 'inline-block');
	}
	
	var dateOri = visita.data;
	var dateAr = dateOri.split('-');
	var finalDate = dateAr[2] + '/' + dateAr[1] + '/' + dateAr[0];
	$(".data-vistoria span").html(finalDate);
	$(".questao-1 .questao-info").html(visita.sa1);
	$(".questao-2 .questao-info").html(visita.sa4a + 'ºC');
	$(".questao-3 .questao-info").html(visita.sa5a + ' lux');
	
	if(visita.sa6 != null){
		$(".questao-4 .questao-info").html(visita.sa6);
	} else {
		$(".questao-4 .questao-info").html('0');
	}
	
	if(visita.bib1 == 'true'){
		$(".questao-5 .questao-info").html("Sim");
	} else if(visita.bib1 == 'false'){
		$(".questao-5 .questao-info").html("Não");
	} else {
		$(".questao-5 .questao-info").html("Sem informação");
	}
	
	if(visita.ace5 == 'true'){
		$(".questao-6 .questao-info").html("Sim");
	} else if(visita.ace5 == 'false'){
		$(".questao-6 .questao-info").html("Não");
	} else {
		$(".questao-6 .questao-info").html("Sem informação");
	}
	
	if(visita.se2 == 'true'){
		$(".questao-7 .questao-info").html("Sim");
	} else if(visita.se2 == 'false'){
		$(".questao-7 .questao-info").html("Não");
	} else {
		$(".questao-7 .questao-info").html("Sem informação");
	}
	
	if(visita.sp1 == 'true'){
		$(".questao-8 .questao-info").html("Sim");
	} else if(visita.sp1 == 'false'){
		$(".questao-8 .questao-info").html("Não");
	} else {
		$(".questao-8 .questao-info").html("Sem informação");
	}
	
	if(visita.alim1 == 1){
		$(".questao-9 .questao-info").html("Sala de aula");
	} else if(visita.alim1 == 2) {
		$(".questao-9 .questao-info").html("Outros");
	} else if(visita.alim1 == 3){
		$(".questao-9 .questao-info").html("Refeitório");
	} else {
		$(".questao-9 .questao-info").html("Sem informação");
	}
	
	if(visita.mdf2b == 'true'){
		$(".questao-10 .questao-info").html("Sim");
	} else if(visita.mdf2b == 'false'){
		$(".questao-10 .questao-info").html("Não");
	} else {
		$(".questao-10 .questao-info").html("Sem informação");
	}
}

function consultaAvaliacaoPublica(id){
	$.ajax({
		url: 'consultaAvaliacaoPublica',
		type: "POST",
		data: JSON.stringify({ id: id }),
		contentType: 'application/json',
		async: false,
		success: function(data) {
			updateComentarios(data);
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

//IDEB VAZIO
function idebVazio(){
	$(".ideb-intro h2").text("Ainda não existem dados do IDEB para esta escola");
	$(".linha").hide();
	$(".ideb-aprendizado").hide();
}

//NOTAS DO IDEB
function updateIdeb(data){
	$(".ideb-intro h2").text("DADOS DO IDEB");
	
	var notasIniciais, metasIniciais, notasFinais, metasFinais;
	if(data.did_ideb_2019_ini != null || data.did_ideb_2019_fin != null){
		notasIniciais = data.did_ideb_2019_ini;
		metasIniciais = data.did_meta_2019_ini;
		notasFinais = data.did_ideb_2019_fin;
		metasFinais = data.did_meta_2019_fin;
	} else if(data.did_ideb_2017_ini != null || data.did_ideb_2017_fin != null){
		notasIniciais = data.did_ideb_2017_ini;
		metasIniciais = data.did_meta_2017_ini;
		notasFinais = data.did_ideb_2017_fin;
		metasFinais = data.did_meta_2017_fin;
	} else if(data.did_ideb_2015_ini != null || data.did_ideb_2015_fin != null){
		notasIniciais = data.did_ideb_2015_ini;
		metasIniciais = data.did_meta_2015_ini;
		notasFinais = data.did_ideb_2015_fin;
		metasFinais = data.did_meta_2015_fin;
	} else if(data.did_ideb_2013_ini != null || data.did_ideb_2013_fin != null){
		notasIniciais = data.did_ideb_2013_ini;
		metasIniciais = data.did_meta_2013_ini;
		notasFinais = data.did_ideb_2013_fin;
		metasFinais = data.did_meta_2013_fin;
	}
	
	if(notasIniciais != null){
		$('#linha1').show();
		$('#linha1 .col-esq').html(
				'<div class="ideb-notas">'+
				'<h3>Nota e meta do IDEB - Fundamental I</h3>'+
				'<div class="notas-iniciais col-xs-12 col-sm-6 col-md-6 col-lg-6">'+
					'<div class="notas-circle">'+
						'<div class="inner-notas">'+
							'<span>Nota</span>'+
							'<h4>'+notasIniciais+'</h4>'+
						'</div>'+
					'</div>'+
				'</div>'+
				'<div class="metas-iniciais col-xs-12 col-sm-6 col-md-6 col-lg-6">'+
					'<div class="metas-circle">'+
						'<div class="inner-notas">'+
							'<span>Meta</span>'+
							'<h4>'+metasIniciais+'</h4>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>');
		if(notasFinais != null){
			$('#linha1 .col-dir').html(
				'<div class="ideb-metas">'+
					'<h3>Nota e meta do IDEB - Fundamental II</h3>'+
					'<div class="notas-finais col-xs-12 col-sm-6 col-md-6 col-lg-6">'+
						'<div class="notas-circle">'+
							'<div class="inner-notas">'+
								'<span>Nota</span>'+
								'<h4>'+notasFinais+'</h4>'+
							'</div>'+
						'</div>'+
					'</div>'+
					'<div class="metas-finais col-xs-12 col-sm-6 col-md-6 col-lg-6">'+
						'<div class="metas-circle">'+
							'<div class="inner-notas">'+
								'<span>Meta</span>'+
								'<h4>'+metasFinais+'</h4>'+
							'</div>'+
						'</div>'+
					'</div>'+
				'</div>');
			$('#linha2').show();
			$('#linha2 .col-esq').html(
				'<div class="ideb-evolucao">'+
					'<h3>Evolução do IDEB - Fundamental I</h3>'+
					'<div class="evolucao-iniciais">'+
						'<canvas id="evolucao5" width="400" height="300"></canvas>'+
					'</div>'+
				'</div>');
			$('#linha2 .col-dir').html(
				'<div class="ideb-evolucao">'+
					'<div class="evolucao-finais">'+
						'<h3>Evolução do IDEB - Fundamental II</h3>'+
						'<canvas id="evolucao9" width="400" height="300"></canvas>'+
					'</div>'+
				'</div>');
		} else {
			$('#linha2').hide();
			$('#linha1 .col-dir').html(
				'<div class="ideb-evolucao">'+
					'<h3>Evolução do IDEB - Fundamental I</h3>'+
					'<div class="evolucao-iniciais">'+
						'<canvas id="evolucao5" width="400" height="300"></canvas>'+
					'</div>'+
				'</div>');
		}
	} else {
		$('#linha2').hide();
		$('#linha1 .col-esq').html(
				'<div class="ideb-metas">'+
				'<h3>Nota e meta do IDEB - Fundamental II</h3>'+
				'<div class="notas-finais col-xs-12 col-sm-6 col-md-6 col-lg-6">'+
					'<div class="notas-circle">'+
						'<div class="inner-notas">'+
							'<span>Nota</span>'+
							'<h4>'+notasFinais+'</h4>'+
						'</div>'+
					'</div>'+
				'</div>'+
				'<div class="metas-finais col-xs-12 col-sm-6 col-md-6 col-lg-6">'+
					'<div class="metas-circle">'+
						'<div class="inner-notas">'+
							'<span>Meta</span>'+
							'<h4>'+metasFinais+'</h4>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>');
		$('#linha1 .col-dir').html(
				'<div class="ideb-evolucao">'+
				'<div class="evolucao-finais">'+
					'<h3>Evolução do IDEB - Fundamental II</h3>'+
					'<canvas id="evolucao9" width="400" height="300"></canvas>'+
				'</div>'+
			'</div>');
	}
	
	updateGraficoIdeb(data);
}

function trataNotas(nota){
	if(nota === null){
		return;
	} else {
		return nota;
	}
}

//GRÁFICOS DA EVOLUÇÃO
function updateGraficoIdeb(data){
	if(data.did_ideb_2013_ini != null){
		var grafEvo5Data = {
				labels: ["2005", "2007", "2009", "2011", "2013", "2015", "2017", "2019", "2021"],
				datasets: [
				           {
				        	   label: "Nota alcançada",
				        	   fillColor: "",
				        	   strokeColor: "rgba(120,170,190,1)",
				        	   pointColor: "rgba(120,170,190,1)",
				        	   pointStrokeColor: "#fff",
				        	   pointHighlightFill: "#fff",
				        	   pointHighlightStroke: "rgba(120,170,190,1)",
				        	   data: [trataNotas(data.did_ideb_2005_ini), trataNotas(data.did_ideb_2007_ini), trataNotas(data.did_ideb_2009_ini), trataNotas(data.did_ideb_2011_ini), trataNotas(data.did_ideb_2013_ini), trataNotas(data.did_ideb_2015_ini), trataNotas(data.did_ideb_2017_ini), trataNotas(data.did_ideb_2019_ini), trataNotas(data.did_ideb_2021_ini)]
				           },
				           {
				        	   label: "Meta",
				        	   fillColor: "",
				        	   strokeColor: "rgba(161,161,161,1)",
				        	   pointColor: "rgba(161,161,161,1)",
				        	   pointStrokeColor: "#fff",
				        	   pointHighlightFill: "#fff",
				        	   pointHighlightStroke: "rgba(161,161,161,1)",
				        	   data: [trataNotas(data.did_meta_2005_ini), trataNotas(data.did_meta_2007_ini), trataNotas(data.did_meta_2009_ini), trataNotas(data.did_meta_2011_ini), trataNotas(data.did_meta_2013_ini), trataNotas(data.did_meta_2015_ini), trataNotas(data.did_meta_2017_ini), trataNotas(data.did_meta_2019_ini), trataNotas(data.did_meta_2021_ini)]
				           }
				           ]};
		
		var ctxE5 = $("#evolucao5").get(0).getContext("2d");
		var grafEvo5 = new Chart(ctxE5).Line(grafEvo5Data,{
			scaleShowGridLines : true,
			scaleOverride: true,
			scaleSteps: 7,
			scaleStepWidth: 1,
			scaleStartValue: 0,
			scaleIntegersOnly: true,
			scaleGridLineColor : "rgba(0,0,0,.05)",
			scaleGridLineWidth : 1,
			scaleShowHorizontalLines: true,
			scaleShowVerticalLines: true,
			annotateDisplay: true,
			annotateLabel: '<b><%=v1%></b><br><%=v2%>: <%=v3%>',
			annotatePadding: "5px 5px 5px 5px",
			annotateFontFamily: "'Helvetica'",
			annotateFontStyle: "normal normal",
			annotateFontColor: "rgba(0,0,0,1)",
			annotateFontSize: 12,
			annotateBorderRadius: "5px",
			annotateBorder: "1px rgba(170,170,170,0.7) solid ",
			annotateBackgroundColor: 'rgba(255,255,255,0.75)',
			bezierCurve : false,
			bezierCurveTension : 0.4,
			pointDot : true,
			pointDotRadius : 4,
			pointDotStrokeWidth : 1,
			pointHitDetectionRadius : 20,
			datasetStroke : true,
			datasetStrokeWidth : 2,
			datasetFill : false,
			legend: true,
			legendBorders: false,
			responsive: true,
			responsiveMaxHeight: 300,
			responsiveMaxWidth: 400,
			responsiveMinHeight : 200,
			responsiveMinWidth : 300
		});
	}
	
	if(data.did_ideb_2013_fin != null){
		$('.evolucao-finais').show();
		var grafEvo9Data = {
				labels: ["2005", "2007", "2009", "2011", "2013", "2015", "2017", "2019", "2021"],
				datasets: [
				           {
				        	   label: "Nota alcançada",
				        	   fillColor: "",
				        	   strokeColor: "rgba(120,170,190,1)",
				        	   pointColor: "rgba(120,170,190,1)",
				        	   pointStrokeColor: "#fff",
				        	   pointHighlightFill: "#fff",
				        	   pointHighlightStroke: "rgba(120,170,190,1)",
				        	   data: [trataNotas(data.did_ideb_2005_fin), trataNotas(data.did_ideb_2007_fin), trataNotas(data.did_ideb_2009_fin), trataNotas(data.did_ideb_2011_fin), trataNotas(data.did_ideb_2013_fin), trataNotas(data.did_ideb_2015_fin), trataNotas(data.did_ideb_2017_fin), trataNotas(data.did_ideb_2019_fin), trataNotas(data.did_ideb_2021_fin)]
				           },
				           {
				        	   label: "Meta",
				        	   fillColor: "",
				        	   strokeColor: "rgba(161,161,161,1)",
				        	   pointColor: "rgba(161,161,161,1)",
				        	   pointStrokeColor: "#fff",
				        	   pointHighlightFill: "#fff",
				        	   pointHighlightStroke: "rgba(161,161,161,1)",
				        	   data: [trataNotas(data.did_meta_2005_fin), trataNotas(data.did_meta_2007_fin), trataNotas(data.did_meta_2009_fin), trataNotas(data.did_meta_2011_fin), trataNotas(data.did_meta_2013_fin), trataNotas(data.did_meta_2015_fin), trataNotas(data.did_meta_2017_fin), trataNotas(data.did_meta_2019_fin), trataNotas(data.did_meta_2021_fin)]
				           }
				           ]};
		
		var ctxE9 = $("#evolucao9").get(0).getContext("2d");
		var grafEvo9 = new Chart(ctxE9).Line(grafEvo9Data,{
			scaleShowGridLines : true,
			scaleOverride: true,
			scaleSteps: 7,
			scaleStepWidth: 1,
			scaleStartValue: 0,
			scaleIntegersOnly: true,
			scaleGridLineColor : "rgba(0,0,0,.05)",
			scaleGridLineWidth : 1,
			scaleShowHorizontalLines: true,
			scaleShowVerticalLines: true,
			annotateDisplay: true,
			annotateLabel: '<b><%=v1%></b><br><%=v2%>: <%=v3%>',
			annotatePadding: "5px 5px 5px 5px",
			annotateFontFamily: "'Helvetica'",
			annotateFontStyle: "normal normal",
			annotateFontColor: "rgba(0,0,0,1)",
			annotateFontSize: 12,
			annotateBorderRadius: "5px",
			annotateBorder: "1px rgba(170,170,170,0.7) solid ",
			annotateBackgroundColor: 'rgba(255,255,255,0.75)',
			bezierCurve : false,
			bezierCurveTension : 0.4,
			pointDot : true,
			pointDotRadius : 4,
			pointDotStrokeWidth : 1,
			pointHitDetectionRadius : 20,
			datasetStroke : true,
			datasetStrokeWidth : 2,
			datasetFill : false,
			legend: true,
			legendBorders: false,
			responsive: true,
			responsiveMaxHeight: 300,
			responsiveMaxWidth: 400,
			responsiveMinHeight : 200,
			responsiveMinWidth : 300
		});
	}
}

function dispPct2(numtxt,valtxt,ctx,config,posX,posY,borderX,borderY,overlay,data,animPC){
	return(Math.round(animPC*data[0].value)+ "%");
}

//GRÁFICOS DO APRENDIZADO
function updateAprendizado(data){
	var porc_aprend_lp_5, porc_aprend_mt_5, porc_aprend_lp_9, porc_aprend_mt_9;

	if(data.porc_2021_lp_5 != null){
		porc_aprend_lp_5 = data.porc_2021_lp_5;
		porc_aprend_mt_5 = data.porc_2021_mt_5;
		porc_aprend_lp_9 = data.porc_2021_lp_9;
		porc_aprend_mt_9 = data.porc_2021_mt_9;
	} else if(data.porc_2019_lp_5 != null){
		porc_aprend_lp_5 = data.porc_2019_lp_5;
		porc_aprend_mt_5 = data.porc_2019_mt_5;
		porc_aprend_lp_9 = data.porc_2019_lp_9;
		porc_aprend_mt_9 = data.porc_2019_mt_9;
	} else if(data.porc_2017_lp_5 != null){
		porc_aprend_lp_5 = data.porc_2017_lp_5;
		porc_aprend_mt_5 = data.porc_2017_mt_5;
		porc_aprend_lp_9 = data.porc_2017_lp_9;
		porc_aprend_mt_9 = data.porc_2017_mt_9;
	} else if(data.porc_2015_lp_5 != null){
		porc_aprend_lp_5 = data.porc_2015_lp_5;
		porc_aprend_mt_5 = data.porc_2015_mt_5;
		porc_aprend_lp_9 = data.porc_2015_lp_9;
		porc_aprend_mt_9 = data.porc_2015_mt_9;
	} else if(data.porc_2013_lp_5 != null){
		porc_aprend_lp_5 = data.porc_2013_lp_5;
		porc_aprend_mt_5 = data.porc_2013_mt_5;
		porc_aprend_lp_9 = data.porc_2013_lp_9;
		porc_aprend_mt_9 = data.porc_2013_mt_9;
	}
	
	if(porc_aprend_lp_5 != null){
		$(".ideb-aprendizado").show();
		$("#pizza1").html(
				'<p>Português - Fundamental I</p>'+
				'<canvas id="grafpi1" width="250" height="250"></canvas>');
		$("#pizza1").show();
		
		$("#pizza2").html(
				'<p>Matemática - Fundamental I</p>'+
				'<canvas id="grafpi2" width="250" height="250"></canvas>');
		$("#pizza2").show();
		
		// PT-5
		var grafApr5PtData = [
		                      {
		                          value: porc_aprend_lp_5,
		                          color: "#46BFBD",
		                          highlight: "#5AD3D1",
		                          label: "Aprendeu adequadamente"
		                      },
		                      {
		                          value: 100 - porc_aprend_lp_5,
		                          color:"#F7464A",
		                          highlight: "#FF5A5E"
		                      }
		                  ];
		var ctxA5pt = $("#grafpi1").get(0).getContext("2d");
		var grafApr5Pt = new Chart(ctxA5pt).Doughnut(grafApr5PtData,{
			segmentShowStroke : true,
			segmentStrokeColor : "#fff",
			segmentStrokeWidth : 2,
			percentageInnerCutout : 50, // This is 0 for Pie charts
			animationSteps : 100,
			animationEasing : "easeOutBounce",
			animateRotate : true,
			animateScale : false,
			crossText : ["%call function..."],
			crossTextOverlay :   [true],
			crossTextFontSize : [40],
			crossTextFontColor : ["black"],
			crossTextRelativePosX : [2],
			crossTextRelativePosY : [2],
			crossTextFunction : dispPct2,
			percentageInnerCutout: 70,
			legend: true,
			showSingleLegend: true,
			legendBorders: false
		});
		
		// MT-5
		var grafApr5MtData = [
		                      {
		                          value: porc_aprend_mt_5,
		                          color: "#46BFBD",
		                          highlight: "#5AD3D1",
		                          label: "Aprendeu adequadamente"
		                      },
		                      {
		                          value: 100 - porc_aprend_mt_5,
		                          color:"#F7464A",
		                          highlight: "#FF5A5E"
		                      }
		                  ];
		var ctxA5mt = $("#grafpi2").get(0).getContext("2d");
		var grafApr5Mt = new Chart(ctxA5mt).Doughnut(grafApr5MtData,{
			segmentShowStroke : true,
			segmentStrokeColor : "#fff",
			segmentStrokeWidth : 2,
			percentageInnerCutout : 50, // This is 0 for Pie charts
			animationSteps : 100,
			animationEasing : "easeOutBounce",
			animateRotate : true,
			animateScale : false,
			crossText : ["%call function..."],
			crossTextOverlay :   [true],
			crossTextFontSize : [40],
			crossTextFontColor : ["black"],
			crossTextRelativePosX : [2],
			crossTextRelativePosY : [2],
			crossTextFunction : dispPct2,
			percentageInnerCutout: 70,
			legend: true,
			showSingleLegend: true,
			legendBorders: false
		});
		
		if(porc_aprend_lp_9 != null){
			$("#pizza3").html(
					'<p>Português - Fundamental II</p>'+
					'<canvas id="grafpi3" width="250" height="250"></canvas>');
			$("#pizza3").show();
			
			$("#pizza4").html(
					'<p>Matemática - Fundamental II</p>'+
					'<canvas id="grafpi4" width="250" height="250"></canvas>');
			$("#pizza4").show();
			
			$(".grafico-pizza").switchClass("col-sm-12", "col-sm-6");
//			$(".grafico-pizza").switchClass("col-lg-6", "col-lg-3");
			// PT-9
			var grafApr9PtData = [
			                      {
			                          value: porc_aprend_lp_9,
			                          color: "#46BFBD",
			                          highlight: "#5AD3D1",
			                          label: "Aprendeu adequadamente"
			                      },
			                      {
			                          value: 100 - porc_aprend_lp_9,
			                          color:"#F7464A",
			                          highlight: "#FF5A5E"
			                      }
			                  ];
			var ctxA9pt = $("#grafpi3").get(0).getContext("2d");
			var grafApr9Pt = new Chart(ctxA9pt).Doughnut(grafApr9PtData,{
				segmentShowStroke : true,
				segmentStrokeColor : "#fff",
				segmentStrokeWidth : 2,
				percentageInnerCutout : 50, // This is 0 for Pie charts
				animationSteps : 100,
				animationEasing : "easeOutBounce",
				animateRotate : true,
				animateScale : false,
				crossText : ["%call function..."],
				crossTextOverlay :   [true],
				crossTextFontSize : [40],
				crossTextFontColor : ["black"],
				crossTextRelativePosX : [2],
				crossTextRelativePosY : [2],
				crossTextFunction : dispPct2,
				percentageInnerCutout: 70,
				legend: true,
				showSingleLegend: true,
				legendBorders: false
			});
			
			// MT-9
			var grafApr9MtData = [
			                      {
			                          value: porc_aprend_mt_9,
			                          color: "#46BFBD",
			                          highlight: "#5AD3D1",
			                          label: "Aprendeu adequadamente"
			                      },
			                      {
			                          value: 100 - porc_aprend_mt_9,
			                          color:"#F7464A",
			                          highlight: "#FF5A5E"
			                      }
			                  ];
			var ctxA9mt = $("#grafpi4").get(0).getContext("2d");
			var grafApr9Mt = new Chart(ctxA9mt).Doughnut(grafApr9MtData,{
				segmentShowStroke : true,
				segmentStrokeColor : "#fff",
				segmentStrokeWidth : 2,
				percentageInnerCutout : 50, // This is 0 for Pie charts
				animationSteps : 100,
				animationEasing : "easeOutBounce",
				animateRotate : true,
				animateScale : false,
				crossText : ["%call function..."],
				crossTextOverlay :   [true],
				crossTextFontSize : [40],
				crossTextFontColor : ["black"],
				crossTextRelativePosX : [2],
				crossTextRelativePosY : [2],
				crossTextFunction : dispPct2,
				percentageInnerCutout: 70,
				legend: true,
				showSingleLegend: true,
				legendBorders: false
			});
		} else {
			$("#pizza1").html(
					'<p>Português - Fundamental I</p>'+
					'<canvas id="grafpi1" width="280" height="280"></canvas>');
			$("#pizza1").show();
			
			$("#pizza2").html(
					'<p>Matemática - Fundamental I</p>'+
					'<canvas id="grafpi2" width="280" height="280"></canvas>');
			$("#pizza2").show();
			
			$("#pizza3").html();
			$("#pizza3").hide();
			
			$("#pizza4").html();
			$("#pizza4").hide();
			
			$(".grafico-pizza").switchClass("col-sm-6", "col-sm-12");
			$(".grafico-pizza").switchClass("col-lg-3", "col-lg-6");
			
			// PT-5
			var grafApr5PtData = [
			                      {
			                          value: porc_aprend_lp_5,
			                          color: "#46BFBD",
			                          highlight: "#5AD3D1",
			                          label: "Aprendeu adequadamente"
			                      },
			                      {
			                          value: 100 - porc_aprend_lp_5,
			                          color:"#F7464A",
			                          highlight: "#FF5A5E"
			                      }
			                  ];
			var ctxA5pt = $("#grafpi1").get(0).getContext("2d");
			var grafApr5Pt = new Chart(ctxA5pt).Doughnut(grafApr5PtData,{
				segmentShowStroke : true,
				segmentStrokeColor : "#fff",
				segmentStrokeWidth : 2,
				percentageInnerCutout : 50, // This is 0 for Pie charts
				animationSteps : 100,
				animationEasing : "easeOutBounce",
				animateRotate : true,
				animateScale : false,
				crossText : ["%call function..."],
				crossTextOverlay :   [true],
				crossTextFontSize : [40],
				crossTextFontColor : ["black"],
				crossTextRelativePosX : [2],
				crossTextRelativePosY : [2],
				crossTextFunction : dispPct2,
				percentageInnerCutout: 70,
				legend: true,
				showSingleLegend: true,
				legendBorders: false
			});
			
			// MT-5
			var grafApr5MtData = [
			                      {
			                          value: porc_aprend_mt_5,
			                          color: "#46BFBD",
			                          highlight: "#5AD3D1",
			                          label: "Aprendeu adequadamente"
			                      },
			                      {
			                          value: 100 - porc_aprend_mt_5,
			                          color:"#F7464A",
			                          highlight: "#FF5A5E"
			                      }
			                  ];
			var ctxA5mt = $("#grafpi2").get(0).getContext("2d");
			var grafApr5Mt = new Chart(ctxA5mt).Doughnut(grafApr5MtData,{
				segmentShowStroke : true,
				segmentStrokeColor : "#fff",
				segmentStrokeWidth : 2,
				percentageInnerCutout : 50, // This is 0 for Pie charts
				animationSteps : 100,
				animationEasing : "easeOutBounce",
				animateRotate : true,
				animateScale : false,
				crossText : ["%call function..."],
				crossTextOverlay :   [true],
				crossTextFontSize : [40],
				crossTextFontColor : ["black"],
				crossTextRelativePosX : [2],
				crossTextRelativePosY : [2],
				crossTextFunction : dispPct2,
				percentageInnerCutout: 70,
				legend: true,
				showSingleLegend: true,
				legendBorders: false
			});
		}
	} else if(porc_aprend_lp_9 != null){
		$(".ideb-aprendizado").show();
		$("#pizza1").html(
				'<p>Português - Fundamental II</p>'+
				'<canvas id="grafpi1" width="280" height="280"></canvas>');
		$("#pizza1").show();
		
		$("#pizza2").html(
				'<p>Matemática - Fundamental II</p>'+
				'<canvas id="grafpi2" width="280" height="280"></canvas>');
		$("#pizza2").show();
		
		$("#pizza3").html();
		$("#pizza3").hide();
		
		$("#pizza4").html();
		$("#pizza4").hide();
		
		$(".grafico-pizza").switchClass("col-sm-6", "col-sm-12");
		$(".grafico-pizza").switchClass("col-lg-3", "col-lg-6");
		
		// PT-9
		var grafApr9PtData = [
		                      {
		                          value: porc_aprend_lp_9,
		                          color: "#46BFBD",
		                          highlight: "#5AD3D1",
		                          label: "Aprendeu adequadamente"
		                      },
		                      {
		                          value: 100 - porc_aprend_lp_9,
		                          color:"#F7464A",
		                          highlight: "#FF5A5E"
		                      }
		                  ];
		var ctxA9pt = $("#grafpi1").get(0).getContext("2d");
		var grafApr9Pt = new Chart(ctxA9pt).Doughnut(grafApr9PtData,{
			segmentShowStroke : true,
			segmentStrokeColor : "#fff",
			segmentStrokeWidth : 2,
			percentageInnerCutout : 50, // This is 0 for Pie charts
			animationSteps : 100,
			animationEasing : "easeOutBounce",
			animateRotate : true,
			animateScale : false,
			crossText : ["%call function..."],
			crossTextOverlay :   [true],
			crossTextFontSize : [40],
			crossTextFontColor : ["black"],
			crossTextRelativePosX : [2],
			crossTextRelativePosY : [2],
			crossTextFunction : dispPct2,
			percentageInnerCutout: 70,
			legend: true,
			showSingleLegend: true,
			legendBorders: false
		});
		
		// MT-9
		var grafApr9MtData = [
		                      {
		                          value: porc_aprend_mt_9,
		                          color: "#46BFBD",
		                          highlight: "#5AD3D1",
		                          label: "Aprendeu adequadamente"
		                      },
		                      {
		                          value: 100 - porc_aprend_mt_9,
		                          color:"#F7464A",
		                          highlight: "#FF5A5E"
		                      }
		                  ];
		var ctxA9mt = $("#grafpi2").get(0).getContext("2d");
		var grafApr9Mt = new Chart(ctxA9mt).Doughnut(grafApr9MtData,{
			segmentShowStroke : true,
			segmentStrokeColor : "#fff",
			segmentStrokeWidth : 2,
			percentageInnerCutout : 50, // This is 0 for Pie charts
			animationSteps : 100,
			animationEasing : "easeOutBounce",
			animateRotate : true,
			animateScale : false,
			crossText : ["%call function..."],
			crossTextOverlay :   [true],
			crossTextFontSize : [40],
			crossTextFontColor : ["black"],
			crossTextRelativePosX : [2],
			crossTextRelativePosY : [2],
			crossTextFunction : dispPct2,
			percentageInnerCutout: 70,
			legend: true,
			showSingleLegend: true,
			legendBorders: false
		});
	} else {
		$(".ideb-aprendizado").hide();
	}
}

function updateFotos(data){
	for (var i = 0; i <= 10; i++) {
		$("#foto-visita-"+i).fadeOut();
	}
	
	$.each(data, function(i, foto){
		if(foto.localizacao != null){
			if(i <= 10){
				i++;
				$("#foto-visita-"+i).fadeIn();
				$("#foto-visita-"+i).attr('href', contextPath + foto.localizacao);
				$("#foto-visita-"+i).attr('title', foto.nome);
				$("#foto-visita-"+i + " img").attr('src', contextPath + foto.localizacao);
			}
		}
	})
}

function updateComentarios(data){
	$.each(data, function(i, comentario){
		
	})
}

function gravaAvaliacao(){
	alert("Avaliação salva com sucesso. Em breve nossa equipe irá analisá-la.");
	$("#escola").val('');
	$("#comentarios").val('');
	$("#nome").val('');
	$("#email").val('');
//	$("#myDropzone").removeAllFiles();
	$(".compare").slideDown();
	$(".compare").css("visibility", "block");
};

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
		$("#foto-visita-"+i).fadeOut();
	}
});

function removePins(){
	if(rpaAtual != 0){
		escolasLayer.eachLayer(function(marker) {
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
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		escolasLayer.setGeoJSON(escolasData);
		escolasLayer.eachLayer(function(marker) {
			if(marker.feature.properties.ATINGIUMETA == true){
			} else {
				map.removeLayer(marker);
			}
		});
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'meta';
		changeMarkers();
		mudaLegenda(filter);
	} else if (filter === 'novas'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		escolasLayer.setGeoJSON(escolasData);
		escolasLayer.eachLayer(function(marker) {
			if(marker.feature.properties.Nova == "true"){
			} else {
				map.removeLayer(marker);
			}
		});
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'novas';
		changeMarkers();
		mudaLegenda(filter);
	} else if (filter === 'melhorIdeb5'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'melhorIdeb5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'piorIdeb5'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'piorIdeb5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'melhorIdeb9'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'melhorIdeb9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'piorIdeb9'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'piorIdeb9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'melhorProfPort5'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'melhorProfPort5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'piorProfPort5'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'piorProfPort5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'melhorProfPort9'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'melhorProfPort9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'piorProfPort9'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'piorProfPort9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'melhorProfMat5'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'melhorProfMat5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'piorProfMat5'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'piorProfMat5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'melhorProfMat9'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'melhorProfMat9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'piorProfMat9'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		$.ajax({
			url: 'piorProfMat9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				escolasLayer.setGeoJSON(data);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
		mudaLegenda(filter);
	} else if (filter === 'quadras'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		escolasLayer.setGeoJSON(escolasData);
		escolasLayer.eachLayer(function(marker) {
			if(marker.feature.properties.POSSUIQUADRAS === 0 || marker.feature.properties.POSSUIQUADRAS === "null"){
				map.removeLayer(marker);
			}
		});
		removePins();
		escolasList = [];
		modo = 'quadras';
		changeMarkersQuadras();
		mudaLegenda(filter);
	} else if (filter === 'aces'){
		map.removeLayer(escolasLayer);
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		escolasLayer.setGeoJSON(escolasData);
		escolasList = [];
		modo = 'acessibilidade';
		removePins();
		changeMarkersAcess();
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
	escolasLayer.eachLayer(function(marker) {
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

function changeMarkersNovas(){
	escolasLayer.eachLayer(function(marker) {
		if(marker.feature.properties.Nova == true){
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
	
	escolasLayer.eachLayer(function(marker) {
		escolasList.push({label: marker.feature.properties.Escola, value: marker.feature.properties.ID});
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

	escolasMouseOver();
	escolasMouseOut();
	escolasClick();
};

function changeMarkersAcess(){
	escolasLayer.eachLayer(function(marker) {
		
		escolasList.push({label: marker.feature.properties.Escola, value: marker.feature.properties.ID});
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

	escolasMouseOver();
	escolasMouseOut();
	escolasClick();
};

//function changeLegend(){
//	if (modo === 'all' || modo === 'meta' || modo === 'ideb') {
//		var html = '<strong>Cores das escolas</strong>'+
//				'<hr>'+
//				'<nav class="legend clearfix">'+
//					'<div class="legend-spans">'+
//						'<span style="background: green"></span>'+
//						'<span style="background: yellow"></span>'+
//						'<span style="background: red"></span>'+
//						'<span style="background: #bdbdbd"></span>'+
//					'</div>'+
//					'<div class="legend-labels">'+
//						'<label>Superou a meta IDEB e ficou acima de <strong>6</strong></label>'+
//						'<label>Atingiu a meta IDEB mas ficou abaixo de <strong>6</strong></label>'+
//						'<label>Não atingiu a meta do IDEB</label>'+
//						'<label>Sem dados do IDEB</label>'+
//					'</div>';
//		
////		$(".map-legends").animate({
////		    width: "240px"
////		  }, 500 );
////		$(".map-legend").css("width", "240px");
//		legend.innerHTML = html;
//		addLegend();
//		
//	} else if (modo === 'quadras') {
//		var html = '<strong>Estado de conservação da quadra</strong>'+
//		'<hr>'+
//		'<nav class="legend clearfix">'+
//			'<div class="legend-spans">'+
//				'<span style="background: blue"></span>'+
//				'<span style="background: yellow"></span>'+
//				'<span style="background: black"></span>'+
//			'</div>'+
//			'<div class="legend-labels">'+
//				'<label>BOM</label>'+
//				'<label>REGULAR</label>'+
//				'<label>RUIM</label>'+
//			'</div>';
//		
//		
////		$("").css("width", "150px");
////		$(".wax-legend").css("width", "150px");
//		legend.innerHTML = html;
//		addLegend();
//		
//	} else if (modo === 'acessibilidade') {
//		var html = '<strong>Itens de acessibilidade</strong>'+
//		'<hr>'+
//		'<nav class="legend clearfix">'+
//			'<div class="legend-spans">'+
//				'<span style="background: blue"></span>'+
//				'<span style="background: yellow"></span>'+
//				'<span style="background: black"></span>'+
//			'</div>'+
//			'<div class="legend-labels">'+
//				'<label>Possui todos os itens</label>'+
//				'<label>Possui pelo menos um item</label>'+
//				'<label>Não possui itens de acessibilidade</label>'+
//			'</div>';
//
////		$(".map-legends").animate({
////		    width: "240px"
////		  }, 500 );
////		$(".map-legend").css("width", "240px");
//		legend.innerHTML = html;
//		addLegend();
//	}
//}

function escondeDados(){
//	$(".compare").slideUp();
//	$(".compare").css("visibility", "none");
	
//	$(".ideb").slideUp();
//	$(".ideb").css("visibility", "none");
	
	$(".fiscalizacao").slideUp();
	$(".fiscalizacao").css("visibility", "none");
	
	$(".comentarios").slideUp();
	$(".comentarios").css("visibility", "none");
	
	$(".escola-title").slideDown();
	$(".escola-title").css("visibility", "block");
}

function focusRpa(rpa){
	rpaAtual = rpa;
	actualMarker = undefined;
	if(rpa === 0){
		$(".menu-ui a").removeClass('active');
		$("#todas").addClass('active');
		escondeDados();
		replotMap();
		removeAllRpaLayers();
		setAllRpaLayers();
		resetMap();
		$(".escola-title h2").html("RECIFE");
		fechaPaineis();
	} else {
		removeAllRpaLayers();
		map.removeLayer(escolasLayer);
		escondeDados();
		if(rpa == 1) { setRpa1(true); };
		if(rpa == 2) { setRpa2(true); };
		if(rpa == 3) { setRpa3(true); };
		if(rpa == 4) { setRpa4(true); };
		if(rpa == 5) { setRpa5(true); };
		if(rpa == 6) { setRpa6(true); };
		escolasLayer = L.mapbox.featureLayer().addTo(map);
		escolasLayer.setGeoJSON(escolasData);
		escolasLayer.eachLayer(function(marker) {
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
//	info.innerHTML = '';
//	showPesquisa();
	map.removeLayer(escolasLayer);
	escolasLayer = L.mapbox.featureLayer().addTo(map);
	escolasLayer.setGeoJSON(escolasData);
	escolasList = [];
	escolasListCompare = [];
	modo = 'all';
//	removeLegend();
//	changeLegend();
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

//function hidePesquisa(){
//	var logo = $(".logo");
//	$(".pesquisa").slideUp(500);
//	$(".menu-ui").animate({
//	    top: "130px"
//	  }, 500 );
//	$("#info").css("top", "61px");
//	logo.css('height', '55px');
//   	logo.css('padding-top', '5px')
//	$(".logo img").hide();
//}

//function showPesquisa(){
//	if(viewWidth >= 750){
//		var logo = $(".logo");
//		$(".pesquisa").slideDown(500);
//		$(".menu-ui").animate({
//		    top: "180px"
//		  }, 500 );
//		$("#info").css("top", "111px");
//		logo.css('height', '105px');
//	   	logo.css('padding-top', '0px');
//	   	$(".logo img").show();
//	}
//}

$('#listaEscola1').btsListFilter('#compareEnt1', {
	itemChild: 'span',
	initial: false});
$('#listaEscola2').btsListFilter('#compareEnt2', {
	itemChild: 'span',
	initial: false});

function compareIdeb(esc1Id, esc2Id, nome1, nome2){
	$.ajax({
		url: 'consultaIdebComparativo',
		type: "POST",
		data: {
			"id1" : esc1Id,
			"id2" : esc2Id
		},
		contentType: 'application/json',
		success: function(data) {
			if(data != null & data != ''){
				$(".compare-ideb p").show();
				$(".compare-ideb canvas").show();
				$(".compare-ideb h3").hide();
				var esc1I5, esc1I7, esc1I9, esc1I11, esc1I13, esc1I15, esc1I17, esc1I19, esc1I21;
				var esc2I5, esc2I7, esc2I9, esc2I11, esc2I13, esc2I15, esc2I17, esc2I19, esc2I21;
				$.each(data, function(i, ideb){
					if(parseInt(ideb.escola.id) === parseInt(esc1Id)){
						escIdebComp1 = ideb;
						esc1I5 = ideb.did_ideb_2005_ini;
						esc1I7 = ideb.did_ideb_2007_ini;
						esc1I9 = ideb.did_ideb_2009_ini;
						esc1I11 = ideb.did_ideb_2011_ini;
						esc1I13 = ideb.did_ideb_2013_ini;
						esc1I15 = ideb.did_ideb_2015_ini;
						esc1I17 = ideb.did_ideb_2017_ini;
						esc1I19 = ideb.did_ideb_2019_ini;
						esc1I21 = ideb.did_ideb_2021_ini;
					} else if(parseInt(ideb.escola.id) === parseInt(esc2Id)){
						escIdebComp2 = ideb;
						esc2I5 = ideb.did_ideb_2005_ini;
						esc2I7 = ideb.did_ideb_2007_ini;
						esc2I9 = ideb.did_ideb_2009_ini;
						esc2I11 = ideb.did_ideb_2011_ini;
						esc2I13 = ideb.did_ideb_2013_ini;
						esc2I15 = ideb.did_ideb_2015_ini;
						esc2I17 = ideb.did_ideb_2017_ini;
						esc2I19 = ideb.did_ideb_2019_ini;
						esc2I21 = ideb.did_ideb_2021_ini;
					}
				});
				
				var grafIdebCompare = {
					labels: ["2005", "2007", "2009", "2011", "2013", "2015", "2017", "2019", "2021"],
					datasets: [
					           {
					        	   label: nome1,
					        	   fillColor: "",
					        	   strokeColor: "rgba(11,149,232,1)",
					        	   pointColor: "rgba(11,149,232,1)",
					        	   pointStrokeColor: "#fff",
					        	   pointHighlightFill: "#fff",
					        	   pointHighlightStroke: "rgba(11,149,232,1)",
					        	   data: [trataNotas(esc1I5), trataNotas(esc1I7), trataNotas(esc1I9), trataNotas(esc1I11), trataNotas(esc1I13), trataNotas(esc1I15), trataNotas(esc1I17), trataNotas(esc1I19), trataNotas(esc1I21)]
					           },
					           {
					        	   label: nome2,
					        	   fillColor: "",
					        	   strokeColor: "rgba(66,221,146,1)",
					        	   pointColor: "rgba(66,221,146,1)",
					        	   pointStrokeColor: "#fff",
					        	   pointHighlightFill: "#fff",
					        	   pointHighlightStroke: "rgba(66,221,146,1)",
					        	   data: [trataNotas(esc2I5), trataNotas(esc2I7), trataNotas(esc2I9), trataNotas(esc2I11), trataNotas(esc2I13), trataNotas(esc2I15), trataNotas(esc2I17), trataNotas(esc2I19), trataNotas(esc2I21)]
					           }
					           ]};
				
				var ctxidebcompare = $(".idebcompare").get(0).getContext("2d");
				var grafEvo9 = new Chart(ctxidebcompare).Line(grafIdebCompare,{
					scaleShowGridLines : true,
					scaleOverride: true,
					scaleSteps: 7,
					scaleStepWidth: 1,
					scaleStartValue: 0,
					scaleIntegersOnly: true,
					scaleGridLineColor : "rgba(0,0,0,.05)",
					scaleGridLineWidth : 1,
					scaleShowHorizontalLines: true,
					scaleShowVerticalLines: true,
					bezierCurve : false,
					bezierCurveTension : 0.4,
					pointDot : true,
					pointDotRadius : 4,
					pointDotStrokeWidth : 1,
					pointHitDetectionRadius : 7,
					datasetStroke : true,
					datasetStrokeWidth : 3,
					datasetFill : false,
					annotateDisplay: true,
					annotateLabel: '<b><%=v1%></b><br><%=v2%>: <%=v3%>',
					annotatePadding: "5px 5px 5px 5px",
					annotateFontFamily: "'Helvetica'",
					annotateFontStyle: "normal normal",
					annotateFontColor: "rgba(0,0,0,1)",
					annotateFontSize: 12,
					annotateBorderRadius: "5px",
					annotateBorder: "1px rgba(170,170,170,0.7) solid ",
					annotateBackgroundColor: 'rgba(255,255,255,0.75)',
					multiTooltipTemplate: "<%= value %>",
					legend: true,
					legendBorders: false,
					legendSpaceBetweenTextHorizontal: 5,
					graphTitle: "Evolução das notas do IDEB",
					graphTitleSpaceBefore: 5,
					graphTitleSpaceAfter: 5,
					graphTitleBorders: false,
					graphTitleBordersStyle: "solid",
					graphTitleBordersColor: "rgba(0,0,0,1)",
					graphTitleFontStyle: "normal normal",
					graphTitleFontSize: 22,
					responsive: true,
					responsiveMaxHeight: 400,
					responsiveMaxWidth: 700
				});
			} else {
				$(".compare-ideb p").hide();
				$(".compare-ideb canvas").hide();
				$(".compare-ideb h3").show();
			}
		},
		error: function(xhr, ajaxOptions, thrownError){
			alert(xhr.status);
			alert(thrownError);
//			
//			$(".compare-ideb p").hide();
//			$(".compare-ideb canvas").hide();
//			$(".compare-ideb h3").show();
		}
	});
}

function compareAprendizado(comp1, comp2, nome1, nome2){
	$.ajax({
		url: 'consultaAprendizadoComparativo',
		type: "POST",
		data: {
			"id1" : comp1,
			"id2" : comp2
		},
		contentType: 'application/json',
		success: function(data) {
			if(data != null & data != ''){
				$(".compare-aprendizado p").show();
				$(".compare-aprendizado canvas").show();
				$(".compare-aprendizado h3").hide();
				var esc1P5, esc1M5, esc1P9, esc1M9, esc1Ano;
				var esc2P5, esc2M5, esc2P9, esc2M9;
				$.each(data, function(i, aprendizado){
					if(aprendizado.escola.id === parseInt(comp1)){
						if(aprendizado.porc_2021_lp_5 != null){
							esc1P5 = aprendizado.porc_2021_lp_5;
							esc1M5 = aprendizado.porc_2021_mt_5;
							esc1P9 = aprendizado.porc_2021_lp_9;
							esc1M9 = aprendizado.porc_2021_mt_9;
							esc1Ano = 2021;
						} else if(aprendizado.porc_2019_lp_5 != null){
							esc1P5 = aprendizado.porc_2019_lp_5;
							esc1M5 = aprendizado.porc_2019_mt_5;
							esc1P9 = aprendizado.porc_2019_lp_9;
							esc1M9 = aprendizado.porc_2019_mt_9;
							esc1Ano = 2019;
						} else if(aprendizado.porc_2017_lp_5 != null){
							esc1P5 = aprendizado.porc_2017_lp_5;
							esc1M5 = aprendizado.porc_2017_mt_5;
							esc1P9 = aprendizado.porc_2017_lp_9;
							esc1M9 = aprendizado.porc_2017_mt_9;
							esc1Ano = 2017;
						} else if(aprendizado.porc_2015_lp_5 != null){
							esc1P5 = aprendizado.porc_2015_lp_5;
							esc1M5 = aprendizado.porc_2015_mt_5;
							esc1P9 = aprendizado.porc_2015_lp_9;
							esc1M9 = aprendizado.porc_2015_mt_9;
							esc1Ano = 2015;
						} else if(aprendizado.porc_2013_lp_5 != null){
							esc1P5 = aprendizado.porc_2013_lp_5;
							esc1M5 = aprendizado.porc_2013_mt_5;
							esc1P9 = aprendizado.porc_2013_lp_9;
							esc1M9 = aprendizado.porc_2013_mt_9;
							esc1Ano = 2013;
						}
					} else if(aprendizado.escola.id === parseInt(comp2)){
						if(aprendizado.porc_2021_lp_5 != null && esc1Ano == 2021){
							esc2P5 = aprendizado.porc_2021_lp_5;
							esc2M5 = aprendizado.porc_2021_mt_5;
							esc2P9 = aprendizado.porc_2021_lp_9;
							esc2M9 = aprendizado.porc_2021_mt_9;
						} else if(aprendizado.porc_2019_lp_5 != null && esc1Ano == 2019){
							esc2P5 = aprendizado.porc_2019_lp_5;
							esc2M5 = aprendizado.porc_2019_mt_5;
							esc2P9 = aprendizado.porc_2019_lp_9;
							esc2M9 = aprendizado.porc_2019_mt_9;
						} else if(aprendizado.porc_2017_lp_5 != null && esc1Ano == 2017){
							esc2P5 = aprendizado.porc_2017_lp_5;
							esc2M5 = aprendizado.porc_2017_mt_5;
							esc2P9 = aprendizado.porc_2017_lp_9;
							esc2M9 = aprendizado.porc_2017_mt_9;
						} else if(aprendizado.porc_2015_lp_5 != null && esc1Ano == 2015){
							esc2P5 = aprendizado.porc_2015_lp_5;
							esc2M5 = aprendizado.porc_2015_mt_5;
							esc2P9 = aprendizado.porc_2015_lp_9;
							esc2M9 = aprendizado.porc_2015_mt_9;
						} else if(aprendizado.porc_2013_lp_5 != null && esc1Ano == 2013){
							esc2P5 = aprendizado.porc_2013_lp_5;
							esc2M5 = aprendizado.porc_2013_mt_5;
							esc2P9 = aprendizado.porc_2013_lp_9;
							esc2M9 = aprendizado.porc_2013_mt_9;
						}
					}
				});
				if(esc1P5 != null || esc1M5 != null || esc1P9 != null || esc1M9 != null || esc2P5 != null || esc2M5 != null || esc2P9 != null || esc2M9){
					montaCompareAprendizado(nome1, nome2, esc1P5, esc1M5, esc1P9, esc1M9, esc2P5, esc2M5, esc2P9, esc2M9, esc1Ano);
				} else {
					$(".compare-aprendizado p").hide();
					$(".compare-aprendizado canvas").hide();
					$(".compare-aprendizado h3").show();
				}
			} else {
				$(".compare-aprendizado p").hide();
				$(".compare-aprendizado canvas").hide();
				$(".compare-aprendizado h3").show();
			}
		},
		error: function(){
			alert("erro");
			$(".compare-aprendizado p").hide();
			$(".compare-aprendizado canvas").hide();
			$(".compare-aprendizado h3").show();
		}
	});
}

function montaCompareAprendizado(nome1, nome2, esc1P5, esc1M5, esc1P9, esc1M9, esc2P5, esc2M5, esc2P9, esc2M9, esc1Ano){
	var ChartData = {
			labels: ["Português 5º ano", "Matemática 5º ano", "Português 9º ano", "Matemática 9º ano" ],
			datasets: [
			           {
			        	   fillColor: "rgba(52,152,219,1)",
			        	   strokeColor: "rgba(52,152,219,0.5)",
			        	   pointColor: "rgba(52,152,219,1)",
			        	   markerShape: "circle",
			        	   pointStrokeColor: "rgba(255,255,255,1)",
			        	   data: [esc1P5, esc1M5, esc1P9, esc1M9],
			        	   title: nome1
			           },
			           {
			        	   fillColor: "rgba(46,204,113,1)",
			        	   strokeColor: "rgba(46,204,113,1)",
			        	   pointColor: "rgba(46,204,113,1)",
			        	   markerShape: "circle",
			        	   pointStrokeColor: "rgba(255,255,255,1)",
			        	   data: [esc2P5, esc2M5, esc2P9, esc2M9],
			        	   title: nome2
			           }, ]
	};
	ChartOptions = {
			spaceLeft: 12,
			spaceRight: 12,
			spaceTop: 12,
			spaceBottom: 12,
			canvasBorders: false,
			canvasBordersWidth: 1,
			canvasBordersStyle: "solid",
			scaleLabel: "<%=value+''%>",
			yAxisMinimumInterval: 1,
			scaleShowLabels: true,
			scaleShowLine: true,
			scaleLineStyle: "solid",
			scaleLineWidth: 1,
			scaleOverlay: false,
			scaleOverride: true,
			scaleSteps: 10,
			scaleStepWidth: 10,
			scaleStartValue: 0,
			inGraphDataShow: true,
			inGraphDataTmpl: '<%=v3%>%',
			inGraphDataFontStyle: "normal bold",
			inGraphDataFontSize: 12,
			inGraphDataPaddingX: -1,
			inGraphDataPaddingY: 19,
			inGraphDataAlign: "center",
			inGraphDataVAlign: "top",
			inGraphDataXPosition: 2,
			inGraphDataYPosition: 3,
			inGraphDataAnglePosition: 2,
			inGraphDataRadiusPosition: 2,
			inGraphDataRotate: 0,
			inGraphDataPaddingAngle: 0,
			inGraphDataPaddingRadius: 0,
			inGraphDataBorders: false,
			inGraphDataBordersXSpace: 1,
			inGraphDataBordersYSpace: 1,
			inGraphDataBordersWidth: 1,
			inGraphDataBordersStyle: "solid",
			legend: true,
			maxLegendCols: 5,
			legendColorIndicatorStrokeWidth: 1,
			legendPosX: -2,
			legendPosY: 4,
			legendXPadding: 0,
			legendYPadding: 0,
			legendBorders: false,
			legendBordersWidth: 1,
			legendBordersStyle: "solid",
			legendBordersSpaceBefore: 5,
			legendBordersSpaceLeft: 5,
			legendBordersSpaceRight: 5,
			legendBordersSpaceAfter: 5,
			legendSpaceBeforeText: 5,
			legendSpaceLeftText: 10,
			legendSpaceRightText: 10,
			legendSpaceAfterText: 5,
			legendSpaceBetweenBoxAndText: 5,
			legendSpaceBetweenTextHorizontal: 5,
			legendSpaceBetweenTextVertical: 5,
			showYAxisMin: false,
			rotateLabels: "smart",
			xAxisBottom: true,
			yAxisLeft: true,
			yAxisRight: false,
			graphTitleSpaceBefore: 5,
			graphTitleSpaceAfter: 5,
			graphTitleBorders: false,
			graphTitleBordersXSpace: 1,
			graphTitleBordersYSpace: 1,
			graphTitleBordersWidth: 1,
			graphTitle: "Nível de aprendizagem adequado",
			graphTitleFontStyle: "normal normal",
			graphTitleFontSize: 26,
			graphSubTitleSpaceBefore: 5,
			graphSubTitleSpaceAfter: 5,
			graphSubTitleBorders: false,
			graphSubTitleBordersXSpace: 1,
			graphSubTitleBordersYSpace: 1,
			graphSubTitleBordersWidth: 1,
			graphSubTitleBordersStyle: "solid",
			graphSubTitle: "Comparativo do ano de" + esc1Ano,
			graphSubTitleFontStyle: "normal normal",
			graphSubTitleFontSize: 16,
			scaleFontStyle: "normal normal",
			scaleFontSize: 12,
			pointLabelFontStyle: "normal normal",
			pointLabelFontSize: 12,
			angleShowLineOut: true,
			angleLineStyle: "solid",
			angleLineWidth: 1,
			percentageInnerCutout: 50,
			scaleShowGridLines: true,
			scaleGridLineStyle: "solid",
			scaleGridLineWidth: 1,
			scaleXGridLinesStep: 1,
			scaleYGridLinesStep: 3,
			segmentShowStroke: true,
			segmentStrokeStyle: "solid",
			segmentStrokeWidth: 2,
			datasetStroke: true,
			datasetFill: true,
			datasetStrokeStyle: "solid",
			datasetStrokeWidth: 2,
			bezierCurve: true,
			bezierCurveTension: 0.4,
			pointDotStrokeStyle: "solid",
			pointDotStrokeWidth: 1,
			pointDotRadius: 3,
			pointDot: true,
			scaleTickSizeBottom: 5,
			scaleTickSizeTop: 5,
			scaleTickSizeLeft: 5,
			scaleTickSizeRight: 5,
			graphMin: 0,
			graphMax: 100,
			barShowStroke: false,
			barBorderRadius: -1,
			barStrokeStyle: "solid",
			barStrokeWidth: 1,
			barValueSpacing: 15,
			barDatasetSpacing: 0,
			scaleShowLabelBackdrop: true,
			scaleBackdropPaddingX: 2,
			scaleBackdropPaddingY: 2,
			animation: true,
			responsive: true,
			responsiveMaxHeight: 400,
			responsiveMaxWidth: 700
	};
	
	var ctxCompare = $(".aprendizadocompare").get(0).getContext("2d");
	var grafCompare = new Chart(ctxCompare).Bar(ChartData,ChartOptions);
}

function compareVisita(comp1, comp2, escNome1, escNome2){
	$("#galesc1 a").hide();
	$("#galesc1 h4").hide();
	$("#galesc2 a").hide();
	$("#galesc2 h4").hide();
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
				$(".compare-escola").show();
				$(".compare-escola h3").hide();
				$.each(data, function(i, visita){
					if(visita.escola.id === parseInt(comp1)){
						$(".compare-escola .questao-1 #qesc1").html(visita.sa1);
						$(".compare-escola .questao-2 #qesc1").html(visita.sa4a + 'ºC');
						$(".compare-escola .questao-3 #qesc1").html(visita.sa5a + ' lux');
						
						if(visita.sa6 != null){
							$(".compare-escola .questao-4 #qesc1").html(visita.sa6);
						} else {
							$(".compare-escola .questao-4 #qesc1").html('0');
						}
						
						if(visita.bib1 == 'true'){
							$(".compare-escola .questao-5 #qesc1").html("Não");
						} else if(visita.bib1 != 'false'){
							$(".compare-escola .questao-5 #qesc1").html("Sim");
						} else {
							$(".compare-escola .questao-5 #qesc1").html("Sem informação");
						}
						
						if(visita.ace5 == 'true'){
							$(".compare-escola .questao-6 #qesc1").html("Sim");
						} else if(visita.ace5 == 'false'){
							$(".compare-escola .questao-6 #qesc1").html("Não");
						} else {
							$(".compare-escola .questao-6 #qesc1").html("Sem informação");
						}
						
						if(visita.se2 == 'true'){
							$(".compare-escola .questao-7 #qesc1").html("Sim");
						} else if(visita.se2 == 'false'){
							$(".compare-escola .questao-7 #qesc1").html("Não");
						} else {
							$(".compare-escola .questao-7 #qesc1").html("Sem informação");
						}
						
						if(visita.sp1 == 'true'){
							$(".compare-escola .questao-8 #qesc1").html("Sim");
						} else if(visita.sp1 == 'false'){
							$(".compare-escola .questao-8 #qesc1").html("Não");
						} else {
							$(".compare-escola .questao-8 #qesc1").html("Sem informação");
						}
						
						if(visita.alim1 == 1){
							$(".compare-escola .questao-9 #qesc1").html("Sala de aula");
						} else if(visita.alim1 == 2) {
							$(".compare-escola .questao-9 #qesc1").html("Outros");
						} else if(visita.alim1 == 3){
							$(".compare-escola .questao-9 #qesc1").html("Refeitório");
						} else {
							$(".compare-escola .questao-9 #qesc1").html("Sem informação");
						}
						
						if(visita.mdf2b == 'true'){
							$(".compare-escola .questao-10 #qesc1").html("Sim");
						} else if(visita.mdf2b == 'false'){
							$(".compare-escola .questao-10 #qesc1").html("Não");
						} else {
							$(".compare-escola .questao-10 #qesc1").html("Sem informação");
						}
						
						$("#galesc1 h4").html("Fotos da " + escNome1);
						compareFotosVisita(visita.id, 1);
						
					} else if(visita.escola.id === parseInt(comp2)){
						
						$(".compare-escola .questao-1 #qesc2").html(visita.sa1);
						$(".compare-escola .questao-2 #qesc2").html(visita.sa4a + 'ºC');
						$(".compare-escola .questao-3 #qesc2").html(visita.sa5a + ' lux');
						
						if(visita.sa6 != null){
							$(".compare-escola .questao-4 #qesc2").html(visita.sa6);
						} else {
							$(".compare-escola .questao-4 #qesc2").html('0');
						}
						
						if(visita.bib1 == 'true'){
							$(".compare-escola .questao-5 #qesc2").html("Não");
						} else if(visita.bib1 != 'false'){
							$(".compare-escola .questao-5 #qesc2").html("Sim");
						} else {
							$(".compare-escola .questao-5 #qesc2").html("Sem informação");
						}
						
						if(visita.ace5 == 'true'){
							$(".compare-escola .questao-6 #qesc2").html("Sim");
						} else if(visita.ace5 == 'false'){
							$(".compare-escola .questao-6 #qesc2").html("Não");
						} else {
							$(".compare-escola .questao-6 #qesc2").html("Sem informação");
						}
						
						if(visita.se2 == 'true'){
							$(".compare-escola .questao-7 #qesc2").html("Sim");
						} else if(visita.se2 == 'false'){
							$(".compare-escola .questao-7 #qesc2").html("Não");
						} else {
							$(".compare-escola .questao-7 #qesc2").html("Sem informação");
						}
						
						if(visita.sp1 == 'true'){
							$(".compare-escola .questao-8 #qesc2").html("Sim");
						} else if(visita.sp1 == 'false'){
							$(".compare-escola .questao-8 #qesc2").html("Não");
						} else {
							$(".compare-escola .questao-8 #qesc2").html("Sem informação");
						}
						
						if(visita.alim1 == 1){
							$(".compare-escola .questao-9 #qesc2").html("Sala de aula");
						} else if(visita.alim1 == 2) {
							$(".compare-escola .questao-9 #qesc2").html("Outros");
						} else if(visita.alim1 == 3){
							$(".compare-escola .questao-9 #qesc2").html("Refeitório");
						} else {
							$(".compare-escola .questao-9 #qesc2").html("Sem informação");
						}
						
						if(visita.mdf2b == 'true'){
							$(".compare-escola .questao-10 #qesc2").html("Sim");
						} else if(visita.mdf2b == 'false'){
							$(".compare-escola .questao-10 #qesc2").html("Não");
						} else {
							$(".compare-escola .questao-10 #qesc2").html("Sem informação");
						}
						
						$("#galesc2 h4").html("Fotos da " + escNome2);
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
	//compareFotoVisita(comp1, comp2);
}

var logo = $('.logo');
var img = $('.logo img');
var spans = $('.logo span');
var scrlld = false;

//$(window).scroll(function () {
//    
//    if ($(window).scrollTop() > 30 && !scrlld) {
//    	img.hide();
//        logo.css('height', '55px');
//        logo.css('padding-top', '5px');
//        scrlld = true;
//    }
//
//   if ($(window).scrollTop() < 30 && scrlld && modo === 'all') {
//	   	logo.css('height', '105px');
//	   	logo.css('padding-top', '0px')
//	   	img.show();
//	   	scrlld = false;      
//    }
//});

function closeComparativo(){
	escondeDados();
	replotMap();
	removeAllRpaLayers();
	setAllRpaLayers();
	resetMap();
	$(".escola-title h2").html("RECIFE");
}

function recarregaMapa(){
	rpaAtual = 0;
	actualMarker = undefined;
	modo = 'all';
	$(".menu-ui a").removeClass('active');
	$("#todas").addClass('active');
	escondeDados();
	replotMap();
	removeAllRpaLayers();
	setAllRpaLayers();
	resetMap();
	$(".escola-title h2").html("RECIFE");
}

function compareFotosVisita(visId, ordem){
	$.ajax({
		url: 'consultaFotosVisita',
		type: "POST",
		data: JSON.stringify({ id: visId }),
		contentType: 'application/json',
		success: function(data){
			if(data.length > 0){
				$("#galesc"+ordem+" a").show();
				$("#galesc"+ordem+" h4").show();
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

//function updateSize(){
//    // Get the dimensions of the viewport
//	viewWidth = $(window).width();
//    
//	if(viewWidth < 1100){
//		$(".navbar-brand").show();
//		$(".logo").hide();
//		$(".pesquisa-input").css("padding-left","15px");
//		if (viewWidth > 750 || viewWidth < 450) {
//			$(".menu-social").hide();
//		} else {
//			$(".menu-social").show();
//		}
//	} else {
//		$(".navbar-brand").hide();
//    	$(".logo").show();
//		$(".menu-social").show();
//		$(".pesquisa-input").css("padding-left","262px");
//		$(".navbar").hide().fadeIn('fast');
//	}
//	
//    if(viewWidth < 750){
////    	removeLegend();
//    	$("#filtro").hide();
////    	$(".lista-rpas").hide();
//    	$(".fiscalizacao-datas li").addClass("col-xs-4");
//    	$(".fiscalizacao-datas li").addClass("col-sm-4");
//    	map.setZoom(11);
//    	map.dragging.disable();
////    	
////    	$("#map").css("height","400px");
//    	$(".questoes-esquerda").css("text-align", "left");
//    	$(".questoes-esquerda").css("border-right", "0px #495D77 groove");
//    	if(viewWidth < 400){
//    		$(".boxes img").css("width","120px");
//    		$(".boxes img").css("height","120px");
//    		$(".boxes").css("width","130px");
//    		$(".boxes").css("height","130px");
//    	} else {
//    		$(".boxes img").css("width","150px");
//    		$(".boxes img").css("height","150px");
//    		$(".boxes").css("width","160px");
//    		$(".boxes").css("height","160px");
//    	}
//    	
//    } else {
////    	removeLegend();
////    	addLegend();
//    	$("#filtro").show();
////    	$(".lista-rpas").show();
//    	$(".fiscalizacao-datas li").removeClass("col-xs-4");
//    	$(".fiscalizacao-datas li").removeClass("col-sm-4");
//    	map.setZoom(12);
//    	map.dragging.enable();
////    	showPesquisa();
//    	
////    	$("#map").css("height","450px");
//    	$(".questoes-esquerda").css("text-align", "right");
//    	$(".questoes-esquerda").css("border-right", "1px #495D77 groove");
//    }
//};

//$(document).ready(updateSize);    // When the page first loads
//$(window).resize(updateSize);     // When the browser changes size