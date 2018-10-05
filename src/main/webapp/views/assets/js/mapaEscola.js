var escId, escNome, rel, escIdebComp1, escIdebComp2, ordemAtual, filtrosIds = [], heatData = [];
var modo = 'all';
var anosIni = false;
var anosFin = false;
var regionFill = 0.6;
var viewWidth = $(window).width();
var rpaAtual = 0;
var actualMarker = undefined; 
var southWest = L.latLng(-8.203279, -35.308557),
	northEast = L.latLng(-7.714644, -34.522893),
	bounds = L.latLngBounds(southWest, northEast);
var initialzoom = 12;
if(viewWidth < 640) {
	initialzoom = 11;
}

var map = L.map('map', 'mapbox.outdoors',
	{
		zoomControl: true,
		maxBounds: bounds,
		maxZoom: 19,
		minZoom: 11
	})
	.setView([-8.0529, -34.9330], initialzoom);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
	attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
		'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
		'Imagery © <a href="http://mapbox.com">Mapbox</a>',
	id: 'mapbox.light'
}).addTo(map);

// Desabilita o toque no mapa.

var layers = $('#layers-options');

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
    fillOpacity: 0
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
		fillOpacity: 0.8
	});
};

function resetLayerStyle(e){
	e.layer.setStyle({
		weight: 1,
		opacity: 1,
		fillOpacity: regionFill
	});
}

function resetActualMarker(){
	var cor;
	if(anosIni && anosFin){
		cor = actualMarker.feature.properties.COR;
	} else if (anosIni){
		cor = actualMarker.feature.properties.CORIni;
	} else if (anosFin){
		cor = actualMarker.feature.properties.CORFin;
	} else {
		cor = actualMarker.feature.properties.COR;
	}
	
	if(actualMarker != undefined && actualMarker != null){
		if(modo === 'all' || modo === 'meta' || modo === 'novas'){
			actualMarker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/s-' + cor + '.png',
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

var bairrosLayer;
function setBairros(click){
	bairrosLayer = L.geoJSON(bairrosGeo, {
	    style: function(feature) {
	        switch (feature.properties.RPA) {
	            case '1': return {color: "#ccff00"};
	            case '2': return {color: "#66cc99"};
	            case '3': return {color: "#cc9933"};
	            case '4': return {color: "#cc3366"};
	            case '5': return {color: "#6666cc"};
	            case '6': return {color: "#ff6633"};
		        }
		    }
		});
		addLayer(bairrosLayer, "Bairros", 2, 'bairroslayer');
		bairrosLayer.setStyle({'fillOpacity': regionFill, 'weight': 1});
		bairrosLayer.on('mousemove', function(e){highlightLayer(e);});
		bairrosLayer.on('mouseout', function(e){resetLayerStyle(e);});
}

setBairros(false);

var rpa1Layer;
function setRpa1(click){
	rpa1Layer = L.geoJSON().addTo(map);
	rpa1Layer.addData(rpa1);
	rpa1Layer.setStyle({color: '#ccff00', 'fillOpacity': regionFill, 'weight': 1});
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
	rpa2Layer = L.geoJSON().addTo(map);
	rpa2Layer.addData(rpa2);
	rpa2Layer.setStyle({color: '#66cc99', 'fillOpacity': regionFill, 'weight': 1});
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
	rpa3Layer = L.geoJSON().addTo(map);
	rpa3Layer.addData(rpa3);
	rpa3Layer.setStyle({color: '#cc9933', 'fillOpacity': regionFill, 'weight': 1});
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
	rpa4Layer = L.geoJSON().addTo(map);
	rpa4Layer.addData(rpa4);
	rpa4Layer.setStyle({color: '#cc3366', 'fillOpacity': regionFill, 'weight': 1});
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
	rpa5Layer = L.geoJSON().addTo(map);
	rpa5Layer.addData(rpa5);
	rpa5Layer.setStyle({color: '#6666cc', 'fillOpacity': regionFill, 'weight': 1});
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
	rpa6Layer = L.geoJSON().addTo(map);
	rpa6Layer.addData(rpa6);
	rpa6Layer.setStyle({color: '#ff6633', 'fillOpacity': regionFill, 'weight': 1});
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

addLayer('', "RPAs", 3, 'rpasLayer');

var escolasLayer = L.geoJSON().addTo(map);
addLayer(escolasLayer, "Escolas", 3, 'escolaslayer');

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
			escolasLayer.addData(data);
			escolasList = [];
			escolasListCompare = [];
			changeMarkers();
			guardaIds(data);
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
		requestAnimationFrame(inView);
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
	var cor;
	if(anosIni && anosFin){
		cor = marker.feature.properties.COR;
	} else if (anosIni){
		cor = marker.feature.properties.CORIni;
	} else if (anosFin){
		cor = marker.feature.properties.CORFin;
	} else {
		cor = marker.feature.properties.COR;
	}

	if(modo === 'all' || modo === "meta" || modo === "novas"){
		marker.setIcon(L.icon({
			iconUrl: contextPath + '/views/assets/css/img/m-' + cor + '.png',
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
	if(feature.properties.FotoMin != null){
		foto = contextPath + feature.properties.FotoMin;
	} else {
		foto = contextPath + '/views/assets/css/img/escola.jpg';
	}
	// Create custom popup content
	var popupContent = '<div class="pop"><div class="popup-texto"><span><strong>' + feature.properties.Escola + '</strong></span>' +
		'<p>' + feature.properties.Endereco + '</p></div>'+
		'<div class="crop">'+
			'<a href="'+contextPath + marker.feature.properties.Foto+'" class="progressive replace">'+
				'<img src="'+foto+'" alt="Fachada da '+marker.feature.properties.Escola+'" class="preview">'+
			'</a>'+
		'</div></div>';
	
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
	var cor;
	if(anosIni && anosFin){
		cor = marker.feature.properties.COR;
	} else if (anosIni){
		cor = marker.feature.properties.CORIni;
	} else if (anosFin){
		cor = marker.feature.properties.CORFin;
	} else {
		cor = marker.feature.properties.COR;
	}

	if(modo === 'all' || modo === "meta" || modo === "novas"){
		marker.setIcon(L.icon({
			iconUrl: contextPath + '/views/assets/css/img/s-' + cor + '.png',
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
	var cor;
	if(anosIni && anosFin){
		cor = marker.feature.properties.COR;
	} else if (anosIni){
		cor = marker.feature.properties.CORIni;
	} else if (anosFin){
		cor = marker.feature.properties.CORFin;
	} else {
		cor = marker.feature.properties.COR;
	}

	if(marker != actualMarker){
		showEscola(marker.feature.properties.Escola, marker.feature.properties.ID);
		$("#schools").val("");
		if(modo === 'all' || modo === "meta" || modo === "novas"){
			marker.setIcon(L.icon({
				iconUrl: contextPath + '/views/assets/css/img/l-' + cor + '.png',
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
			var actcor;
			if(anosIni && anosFin){
				actcor = actualMarker.feature.properties.COR;
			} else if (anosIni){
				actcor = actualMarker.feature.properties.CORIni;
			} else if (anosFin){
				actcor = actualMarker.feature.properties.CORFin;
			} else {
				actcor = actualMarker.feature.properties.COR;
			}
			if(modo === 'all' || modo === "meta" || modo === "novas"){
				actualMarker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-' + actcor + '.png',
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

var heatmapLayer;
function changeMarkers(){
	$('#contEscola').find('option').remove();
	$('#marker-list').remove();
	var body = document.body;
	var markerList = body.appendChild(document.createElement('div'));
	markerList.id = "marker-list";
	$('.compare-lista').remove();
	$('.compare-resultado').append('<ul class="compare-lista">');
	$('.pesquisa-lista').remove();
	$('.pesquisa-resultado').append('<ul class="pesquisa-lista">');
	$('#contEscola').append('<option value="" selected disabled>Escolha a sua escola*</option>');
	heatData = [];
	escolasLayer.eachLayer(function(marker) {
		heatData.push({lat:marker._latlng.lat, lng:marker._latlng.lng, count:5});
		escolasList.push({label: marker.feature.properties.Escola, value: marker.feature.properties.ID});
		escolasListCompare.push({label: marker.feature.properties.Escola, value: marker.feature.properties.ID});
		$('#contEscola').append('<option value="'+ marker.feature.properties.Escola + '">' + marker.feature.properties.Escola + '</option>');
		$('.compare-lista').append('<li esc="' + marker.feature.properties.ID + '" class="compare-item compare-escola-caixas" onclick="addCompara('+marker.feature.properties.ID+')">'+
				'<h4 class="pesquisa-nome">'+marker.feature.properties.Escola+'</h4>'+
				'<div class="pesquisa-thumb">'+
				'<a href="'+contextPath + marker.feature.properties.Foto+'" class="full progressive replace">'+
				'<img src="'+contextPath + marker.feature.properties.FotoMin+'" alt="Fachada: '+marker.feature.properties.Escola+'" class="preview">'+
				'</a>'+
				'</div>'+
		'</li>');
		if(viewWidth > 620){
			$('.pesquisa-lista').append('<li esc="' + marker.feature.properties.ID + '" class="pesquisa-escola-caixas" onclick="abreEscola('+ marker.feature.properties.ID +',\''+marker.feature.properties.Escola+'\')">'+
					'<h4 class="pesquisa-nome">'+marker.feature.properties.Escola+'</h4>'+
					'<h4 class="pesquisa-endereco">'+marker.feature.properties.Endereco+'</h4>'+
					'<div class="pesquisa-thumb">'+
					'<a href="'+contextPath + marker.feature.properties.Foto+'" class="progressive replace">'+
					'<img src="'+contextPath + marker.feature.properties.FotoMin+'" alt="Fachada da '+marker.feature.properties.Escola+'" class="preview">'+
					'</a>'+
					'</div>'+
			'</li>');
		} else {
			var nota;
			var idebini = parseFloat(marker.feature.properties.IDEBini).toFixed(1);
			var idebfin = parseFloat(marker.feature.properties.IDEBfin).toFixed(1);
			
			if(idebini > 0 && idebfin > 0) {
				nota = idebini + ' / ' + idebfin;
			} else if(idebini > 0) {
				nota = idebini;
			} else if(idebfin > 0) {
				nota = idebfin;
			} else {
				nota = '--';
			}
			
			$('.mobile-list-items').append('<li esc="' + marker.feature.properties.ID + '" class="mobile-list-item" onclick="loadEscolaMobile('+ marker.feature.properties.ID +',\''+marker.feature.properties.Escola+'\',\''+marker.feature.properties.Endereco+'\')">'+
					'<div class="mobile-school-image"><img class="lazy" data-src="'+ contextPath + marker.feature.properties.Foto +'" alt="Fachada da '+marker.feature.properties.Escola+'"></div>'+
					'<div class="mobile-list-info">'+
						'<span class="mobile-list-nome">'+marker.feature.properties.Escola+'</span>'+
						'<span class="mobile-list-endereco">'+marker.feature.properties.Endereco+'</span>'+
						'<span class="mobile-list-nota mobile-nota-'+marker.feature.properties.COR+'">'+nota+'</span>'+
					'</div></li>');
		}
				
		if(marker.feature.properties.ID === 262){
			marker.setZIndexOffset(9999);
		}
		
		var cor;
		if(anosIni && anosFin){
			cor = marker.feature.properties.COR;
		} else if (anosIni){
			cor = marker.feature.properties.CORIni;
		} else if (anosFin){
			cor = marker.feature.properties.CORFin;
		} else {
			cor = marker.feature.properties.COR;
		}
		
		marker.setIcon(L.icon({
			iconUrl: contextPath + '/views/assets/css/img/s-' + cor + '.png',
			iconSize: [15, 38]
		}));
		
		var link = markerList.appendChild(document.createElement('a'));
		link.className = 'item';
		link.href = '#';
		link.id = marker.feature.properties.ID;
	
		// Populate content from each markers object.
		link.onclick = function() {
			if(viewWidth < 620){
				map.setViewOffset(marker.getLatLng(),[0,-150],15);
			} else {
				map.setView(marker.getLatLng(), 15);
				resizeMarker(marker);
				
				// Create custom popup content
				definePopup(marker);
			}
		}
		
		return false;
	});
	
	$(function() {
        $('.lazy').lazy({
        	delay: 5000
        });
    });
	
	var mapaCalor = $('#mapaCalor')[0];
	
	if(!mapaCalor){
		var cfg = {"radius": 0.0025,"maxOpacity": .8,"scaleRadius": true,"useLocalExtrema": false,latField: 'lat',lngField: 'lng',valueField: 'count'};
		var testData = {max: 8, data: heatData};
		heatmapLayer = new HeatmapOverlay(cfg);
		heatmapLayer.setData(testData);
		addLayer(heatmapLayer, 'Mapa de Calor', 3, 'mapaCalor');
	}
	escolasMouseOver();
	escolasMouseOut();
	escolasClick();
};

function scaleBetween(unscaledNum, minAllowed, maxAllowed, min, max) {
	return (maxAllowed - minAllowed) * (unscaledNum - min) / (max - min) + minAllowed;
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
	
	compareIdeb(comp1, comp2, escNome1, escNome2);
	compareAprendizado(comp1, comp2, escNome1, escNome2);
	compareVisita(comp1, comp2, escNome1, escNome2);
}


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
		$(".fiscalizacao-datas-mobile li").remove();
		mapVisita = new Object();
		ordemAtual = 0;
		consultaVisitas(id);
		consultaAvaliacaoPublica(id);
		$("#modalEscola").modal();
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
				$(".fiscalicazaoRequerimento a").attr('href', data.escola.requerimentos);
				$(".fiscalicazaoRequerimento").css('display', 'block');
				$(".fiscalicazaoRequerimento a").css('display', 'inline-block');
			} else {
				$(".fiscalicazaoRequerimento").css('display', 'none');
			}
			if(data.did_ideb_2017_ini != null || data.did_ideb_2017_fin != null){
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
	if(viewWidth < 620){
		while(indice <= qtd){
			if(qtd === indice){
				$(".fiscalizacao-datas-mobile ul").append("<li class='vistoria-" + indice + " data-active' onclick='alteraVistoria("+ indice +")'><span>" + indice + "ª VISTORIA</span></li>");
			} else {
				$(".fiscalizacao-datas-mobile ul").append("<li class='vistoria-" + indice + "' onclick='alteraVistoria("+ indice +")'><span>" + indice + "ª VISTORIA</span></li>");
			}
			indice++;
		}
	} else {
		while(indice <= qtd){
			if(qtd === indice){
				$(".fiscalizacao-datas ul").append("<li class='vistoria-" + indice + " data-active' onclick='alteraVistoria("+ indice +")'><span>" + indice + "ª VISTORIA</span></li>");
			} else {
				$(".fiscalizacao-datas ul").append("<li class='vistoria-" + indice + "' onclick='alteraVistoria("+ indice +")'><span>" + indice + "ª VISTORIA</span></li>");
			}
			indice++;
		}
	}
	$.each(data, function(i, visita){
		var ordem = i+1;
		mapVisita[ordem] = visita;
		if(ordem === qtd){
			changeVisita(visita);
			alteraVistoria(ordem);
		}
	});
}

function alteraVistoria(ordem){
	$('.fiscalizacao-datas li').removeClass('data-active');
	$('.vistoria-'+ordem).addClass('data-active');
	
	$(".fiscalicazaoRelatorio").fadeOut();
	var vistoria = getVisita(ordem);
	if(vistoria.relatorio != null){
		rel = true;
		$(".fiscalicazaoRelatorio").fadeIn();
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio span").css('display', 'none');
		$(".fiscalicazaoRelatorio a").css('display', 'inline-block');
		$(".fiscalicazaoRelatorio a").attr('href', contextPath + vistoria.relatorio);
	} else {
		rel = false;
		$(".fiscalicazaoRelatorio").fadeIn();
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio a").css('display', 'none');
		$(".fiscalicazaoRelatorio span").css('display', 'inline-block');
	}
	
	if(vistoria.sa1){
		if(ordemAtual != ordem){
			updateVisitas(vistoria);
			ordemAtual = ordem;
		}
		
		$(".fiscalizacao-questionario").show();
		$(".fiscalizacao-questionario ul").show();
		$(".fiscalizacao-questionario h3").text("Informações da escola");
	} else {
		if(vistoria.atualizacao == "true"){
			$(".fiscalizacao-questionario").show();
			$(".fiscalizacao-questionario ul").hide();
			$(".fiscalizacao-questionario h3").text("Vistoria de atualização");
		} else {
			$(".fiscalizacao-questionario").hide();
		}
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
	if(viewWidth < 620) {
		var tableQuestionario = $('.detalhe-escola .fiscalizacao-questionario');
		$('.escola-mobile-questionario').append(tableQuestionario);
		$('.detalhe-escola .fiscalizacao-questionario').remove();
		$(".fiscalizacao-questionario").show();
	} else {
		$(".fiscalizacao-questionario").show();
	}
	
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
	
	preencheQuestionario(visita);
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
	$(".mobile-ideb").hide();
	$(".mobile-ideb-resume").hide();
	$(".notas-title-ini").hide();
	$(".mobile-ideb-info-ini").hide();
	$(".notas-title-fin").hide();
	$(".mobile-ideb-info-fin").hide();
	$(".mobile-aprendizado").hide();
	$(".escola-mobile-aprendizado").hide();
	
}

//NOTAS DO IDEB
function updateIdeb(data){
	$(".ideb-intro h2").text("DADOS DO IDEB");
	
	var notasIniciais = null, metasIniciais = "-", notasFinais = null, metasFinais = "-", anoIniciais, anoFinais;

	if(data.did_ideb_2007_ini != null){
		notasIniciais = data.did_ideb_2007_ini;
		anoIniciais = 2007;
		if(data.did_meta_2007_ini != null){
			metasIniciais = data.did_meta_2007_ini;
		}
	}
	if(data.did_ideb_2007_fin != null){
		notasFinais = data.did_ideb_2007_fin;
		anoFinais = 2007;
		if(data.did_meta_2007_fin != null){
			metasFinais = data.did_meta_2007_fin;
		}
	}
	if(data.did_ideb_2009_ini != null){
		notasIniciais = data.did_ideb_2009_ini;
		anoIniciais = 2009;
		if(data.did_meta_2009_ini != null){
			metasIniciais = data.did_meta_2009_ini;
		}
	}
	if(data.did_ideb_2009_fin != null){
		notasFinais = data.did_ideb_2009_fin;
		anoFinais = 2009;
		if(data.did_meta_2009_fin != null){
			metasFinais = data.did_meta_2009_fin;
		}
	}
	if(data.did_ideb_2011_ini != null){
		notasIniciais = data.did_ideb_2011_ini;
		anoIniciais = 2011;
		if(data.did_meta_2011_ini != null){
			metasIniciais = data.did_meta_2011_ini;
		}
	}
	if(data.did_ideb_2011_fin != null){
		notasFinais = data.did_ideb_2011_fin;
		anoFinais = 2011;
		if(data.did_meta_2011_fin != null){
			metasFinais = data.did_meta_2011_fin;
		}
	}
	if(data.did_ideb_2013_ini != null){
		notasIniciais = data.did_ideb_2013_ini;
		anoIniciais = 2013;
		if(data.did_meta_2013_ini != null){
			metasIniciais = data.did_meta_2013_ini;
		}
	}
	if(data.did_ideb_2013_fin != null){
		notasFinais = data.did_ideb_2013_fin;
		anoFinais = 2013;
		if(data.did_meta_2013_fin != null){
			metasFinais = data.did_meta_2013_fin;
		}
	}
	if(data.did_ideb_2015_ini != null){
		notasIniciais = data.did_ideb_2015_ini;
		anoIniciais = 2015;
		if(data.did_meta_2015_ini != null){
			metasIniciais = data.did_meta_2015_ini;
		}
	}
	if(data.did_ideb_2015_fin != null){
		notasFinais = data.did_ideb_2015_fin;
		anoFinais = 2015;
		if(data.did_meta_2015_fin != null){
			metasFinais = data.did_meta_2015_fin;
		}
	}
	if(data.did_ideb_2017_ini != null){
		notasIniciais = data.did_ideb_2017_ini;
		anoIniciais = 2017;
		if(data.did_meta_2017_ini != null){
			metasIniciais = data.did_meta_2017_ini;
		}
	}
	if(data.did_ideb_2017_fin != null){
		notasFinais = data.did_ideb_2017_fin;
		anoFinais = 2017;
		if(data.did_meta_2017_fin != null){
			metasFinais = data.did_meta_2017_fin;
		}
	}
	if(data.did_ideb_2019_ini != null){
		notasIniciais = data.did_ideb_2019_ini;
		anoIniciais = 2019;
		if(data.did_meta_2019_ini != null){
			metasIniciais = data.did_meta_2019_ini;
		}
	}
	if(data.did_ideb_2019_fin != null){
		notasFinais = data.did_ideb_2019_fin;
		anoFinais = 2019;
		if(data.did_meta_2019_fin != null){
			metasFinais = data.did_meta_2019_fin;
		}
	}
	if(data.did_ideb_2021_fin != null){
		notasFinais = data.did_ideb_2021_fin;
		anoFinais = 2021;
		if(data.did_meta_2021_fin != null){
			metasFinais = data.did_meta_2021_fin;
		}
	}
	if(data.did_ideb_2021_ini != null){
		notasIniciais = data.did_ideb_2021_ini;
		anoIniciais = 2021;
		if(data.did_meta_2021_ini != null){
			metasIniciais = data.did_meta_2021_ini;
		}
	}
	
	if(notasIniciais != null){
		notasIniciais = parseFloat(notasIniciais).toFixed(1);
		metasIniciais = parseFloat(metasIniciais).toFixed(1);
	}
	if(notasFinais != null){
		notasFinais = parseFloat(notasFinais).toFixed(1);
		metasFinais = parseFloat(metasFinais).toFixed(1);
	}
	
	if(viewWidth < 620) {
		$(".mobile-group-title").show();
		$(".mobile-ideb-resume").show();
		$(".mobile-nota-ini").removeClass('nota-red');
		$(".mobile-nota-ini").removeClass('nota-green');
		$(".mobile-nota-ini").removeClass('nota-yellow');
		$(".mobile-nota-fin").removeClass('nota-red');
		$(".mobile-nota-fin").removeClass('nota-green');
		$(".mobile-nota-fin").removeClass('nota-yellow');
		if(notasIniciais != null && notasFinais != null){
			$(".notas-title-ini").show();
			$(".mobile-ideb-info-ini").show();
			$(".notas-title-fin").show();
			$(".mobile-ideb-info-fin").show();
			$(".notas-title-ini").text('IDEB ' + anoIniciais + ' (5º ano)');
			$(".meta-ini-valor").text(metasIniciais);
			$(".nota-ini-valor").text(notasIniciais);
			if(notasIniciais >= metasIniciais){
				if(notasIniciais >= 6){
					$(".mobile-nota-ini").addClass('nota-green');
				} else {
					$(".mobile-nota-ini").addClass('nota-yellow');
				}
			} else {
				$(".mobile-nota-ini").addClass('nota-red');
			}
			$(".notas-title-fin").text('IDEB ' + anoFinais + ' (9º ano)');
			$(".meta-fin-valor").text(metasFinais);
			$(".nota-fin-valor").text(notasFinais);
			if(notasFinais >= metasFinais){
				if(notasFinais >= 6){
					$(".mobile-nota-fin").addClass('nota-red');
				} else {
					$(".mobile-nota-fin").addClass('nota-yellow');
				}
			} else {
				$(".mobile-nota-fin").addClass('nota-red');
			}
		} else if(notasIniciais != null){
			$(".notas-title-ini").show();
			$(".mobile-ideb-info-ini").show();
			$(".notas-title-fin").hide();
			$(".mobile-ideb-info-fin").hide();
			$(".notas-title-ini").text('IDEB ' + anoIniciais + ' (5º ano)');
			$(".meta-ini-valor").text(metasIniciais);
			$(".nota-ini-valor").text(notasIniciais);
			if(notasIniciais >= metasIniciais){
				if(notasIniciais >= 6){
					$(".mobile-nota-ini").addClass('nota-green');
				} else {
					$(".mobile-nota-ini").addClass('nota-yellow');
				}
			} else {
				$(".mobile-nota-ini").addClass('nota-red');
			}
			$(".notas-title-fin").text('');
			$(".meta-fin-valor").text('');
			$(".nota-fin-valor").text('');
		} else if(notasIniciais != null){
			$(".notas-title-ini").hide();
			$(".mobile-ideb-info-ini").hide();
			$(".notas-title-fin").show();
			$(".mobile-ideb-info-fin").show();
			$(".notas-title-ini").text('');
			$(".meta-ini-valor").text('');
			$(".nota-ini-valor").text('');
			$(".notas-title-fin").text('IDEB ' + anoFinais + ' (9º ano)');
			$(".meta-fin-valor").text(metasFinais);
			$(".nota-fin-valor").text(notasFinais);
			if(notasFinais >= metasFinais){
				if(notasFinais >= 6){
					$(".mobile-nota-fin").addClass('nota-green');
				} else {
					$(".mobile-nota-fin").addClass('nota-yellow');
				}
			} else {
				$(".mobile-nota-fin").addClass('nota-red');
			}
		} else {
			$(".notas-title-ini").hide();
			$(".mobile-ideb-info-ini").hide();
			$(".notas-title-fin").hide();
			$(".mobile-ideb-info-fin").hide();
			$(".mobile-group-title").hide();
			$(".mobile-ideb-resume").hide();
		}
	} else {
		if(notasIniciais != null){
			$('#linha1').show();
			$('#linha1 .col-esq').html(
					'<div class="ideb-notas">'+
					'<h3>Nota e meta do IDEB - Fundamental I</h3>'+
					'<h3>'+anoIniciais+'</h3>'+
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
						'<h3>'+anoFinais+'</h3>'+
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
						'<hr>'+
						'<div class="ideb-evolucao">'+
						'<h3>Evolução do IDEB - Fundamental I</h3>'+
						'<div class="evolucao-iniciais">'+
						getCanvas("evolucao5")+
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
						'<hr>'+
						'<div class="ideb-evolucao">'+
						'<h3>Evolução do IDEB - Fundamental I</h3>'+
						'<div class="evolucao-iniciais">'+
						getCanvas("evolucao5")+
						'</div>'+
				'</div>');
			}
		} else {
			$('#linha2').hide();
			$('#linha1 .col-esq').html(
					'<div class="ideb-metas">'+
					'<h3>Nota e meta do IDEB - Fundamental II</h3>'+
					'<h3>'+anoFinais+'</h3>'+
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
					'<hr>'+
					'<div class="ideb-evolucao">'+
					'<div class="evolucao-finais">'+
					'<h3>Evolução do IDEB - Fundamental II</h3>'+
					'<canvas id="evolucao9" width="400" height="300"></canvas>'+
					'</div>'+
			'</div>');
		}
	}
	
	if(viewWidth < 620){
		
	} else {
		updateGraficoIdeb(data);
	}
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
	if(testaIdebIni(data)){
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
			legendBorders: false
		});
	}
	
	if(testaIdebFin(data)){
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

function testaIdebIni(data){
	if(data.did_ideb_2007_ini != null || data.did_ideb_2009_ini != null || data.did_ideb_2011_ini != null || data.did_ideb_2013_ini != null || data.did_ideb_2015_ini != null || data.did_ideb_2017_ini != null || data.did_ideb_2019_ini != null || data.did_ideb_2021_ini != null){
		return true;
	} else {
		return false;
	}
}

function testaIdebFin(data){
	if(data.did_ideb_2007_fin != null || data.did_ideb_2009_fin != null || data.did_ideb_2011_fin != null || data.did_ideb_2013_fin != null || data.did_ideb_2015_fin != null || data.did_ideb_2017_fin != null || data.did_ideb_2019_fin != null || data.did_ideb_2021_fin != null){
		return true;
	} else {
		return false;
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
	$(".fiscalizacao-fotos img").attr('src', '');
	$(".fiscalizacao-fotos .foto-hidden").remove();
	var fotoCounter = '+'+(data.length - 4)+' fotos';
	
	$.each(data, function(i, foto){
		if(foto.localizacao != null){
			i++;
			var localizacao = contextPath + foto.localizacao;
			if(i <= 4){
				$(".escola-mobile-galeria #foto-visita-"+i).attr("href", localizacao);
				$(".escola-mobile-galeria #foto-visita-"+i).attr("title", foto.nome);
				$(".escola-mobile-galeria #foto-visita-"+i + " img").attr('src', localizacao);
			} else if(i == 5) {
				$(".escola-mobile-galeria #foto-visita-counter .counter").text(fotoCounter);
				$(".escola-mobile-galeria #foto-visita-counter").attr("href", localizacao);
				$(".escola-mobile-galeria #foto-visita-counter").attr("title", foto.nome);
				$(".escola-mobile-galeria #foto-visita-counter" + " img").attr('src', localizacao);
			} else {
				$(".fiscalizacao-fotos").append('<li class="foto-hidden"><a id="foto-visita-'+i+'" class="fancybox boxes" href="'+localizacao+'" rel="fotoescola" title="'+foto.nome+'"><img src="'+localizacao+'"></a></li>');
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
		$("#pin-amarelo").show();
		$("#pin-amarelo").attr("title","REGULAR").tooltip("fixTitle");
		$("#pin-azul").show();
		$("#pin-azul").attr("title","BOM").tooltip("fixTitle");
		$("#pin-preto").show();
		$("#pin-preto").attr("title","RUIM").tooltip("fixTitle");
		$("#heatmap-legend").hide();
	} else if(filter == 'aces') {
		$("#pin-vermelho").hide();
		$("#pin-verde").hide();
		$("#pin-cinza").hide();
		$("#pin-amarelo").show();
		$("#pin-amarelo").attr("title","Possui pelo menos um item básico").tooltip("fixTitle");
		$("#pin-azul").show();
		$("#pin-azul").attr("title","Possui todos os itens básicos").tooltip("fixTitle");
		$("#pin-preto").show();
		$("#pin-preto").attr("title","Não possui itens básicos de acessibilidade").tooltip("fixTitle");
		$("#heatmap-legend").hide();
	} else if(filter == 'heatmap') {
		$("#pin-vermelho").hide();
		$("#pin-verde").hide();
		$("#pin-cinza").hide();
		$("#pin-amarelo").hide();
		$("#pin-azul").hide();
		$("#pin-preto").hide();
		$("#heatmap-legend").show();
		$('#heatmap-legend').attr("title","O mapa de calor representa a concentração de escolas em uma área e o seu alcance de acordo com a quantidade de vagas oferecidas.").tooltip("fixTitle").tooltip("enable").tooltip("show").delay(10000).queue(function (next) {
			$("#heatmap-legend").tooltip("hide");
			next();
		});
	} else {
		$("#pin-vermelho").show();
		$("#pin-vermelho").attr("title","Não atingiu a meta do IDEB").tooltip("fixTitle");
		$("#pin-verde").show();
		$("#pin-verde").attr("title","Superou a meta IDEB e ficou acima de 6").tooltip("fixTitle");
		$("#pin-cinza").show();
		$("#pin-amarelo").show();
		$("#pin-amarelo").attr("title","Atingiu a meta IDEB mas ficou abaixo de 6").tooltip("fixTitle");
		$("#pin-azul").hide();
		$("#pin-preto").hide();
		$("#heatmap-legend").hide();
	}
	
	if (filter != 'heatmap') {
		$("#heatmap-legend").tooltip("hide");
		$(".lista-legenda").attr("title","Legenda atualizada").tooltip("fixTitle").tooltip("enable").tooltip("show").delay(2000).queue(function (next) {
			$(".lista-legenda").tooltip("hide");
			$(".lista-legenda").tooltip("disable");
			next();
		});
	} else {
		$(".lista-legenda").tooltip("hide");
	}
}

$('#filtro-16').on('click', function(){
	$(this).toggle();
	if($(this).hasClass('active')){
		$(".filtro-proficiencia div").slideUp("slow");
		$(".filtro-proficiencia span").slideUp("slow");
		$(".filtro-proficiencia button").slideUp("slow");
		$(this).removeClass('active');
	} else {
		$(".filtro-proficiencia div").slideDown("slow");
		$(".filtro-proficiencia span").slideDown("slow");
		$(".filtro-proficiencia button").slideDown("slow");
		$(this).addClass('active');
	}
});

$('#filtro-13').on('click', function(){
	$(this).toggle();
	if($(this).hasClass('active')){
		$(this).removeClass('active');
	} else {
		$(this).addClass('active');
	}
});

function escondeDados(){
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
		$(".footer-list i").removeClass('footer-menu-active');
		$(".footer-globe i").addClass('footer-menu-active');
		$(".footer-list i").addClass('footer-menu-inactive');
		$(".footer-globe i").removeClass('footer-menu-inactive');
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
		escolasLayer = L.geoJSON().addTo(map);
		escolasLayer.addData(escolasData);
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
	escolasLayer = L.geoJSON().addTo(map);
	escolasLayer.addData(escolasData);
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
}

//var logo = $('.logo');
//var img = $('.logo img');
var spans = $('.logo span');
var scrlld = false;

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
	regionFill = 0.6;
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

function compare(a,b) {
	if (a.feature.properties.DataVisita < b.feature.properties.DataVisita)
		return -1;
	if (a.feature.properties.DataVisita > b.feature.properties.DataVisita)
		return 1;
	return 0;
}

function limitTen(escolas){
	$.escolas(a, function(i, escola){
		
	});
}

$(".helper").hover(
		function(){
			$('.helper span').css('display', 'block');
		},
		function(){
			$('.helper span').hide();
		}
);

function getCanvas(canvas){
	if(canvas === "evolucao5"){
		if(isSmallScreen() == true){
			return '<canvas id="evolucao5" width="300" height="200"></canvas>';
		} else {
			return '<canvas id="evolucao5" width="400" height="300"></canvas>';
		}
	}
}

function isSmallScreen(){
	if(viewWidth <= 750){
		return true;
	} else {
		return false;
	}
}



function addLayer(layer, name, zIndex, id) {
	
    // Create a simple layer switcher that
    // toggles layers on and off.
    if($('#' + id).length){
    } else {
    	var link = document.createElement('a');
    	link.href = '#';
    	link.className = 'active';
    	link.id = id;
    	
    	link.onclick = function(e) {
    		e.preventDefault();
    		e.stopPropagation();
    		
    		if (name == 'RPAs'){
    			if (map.hasLayer(rpa1Layer)) {
        			map.removeLayer(rpa1Layer);
        			map.removeLayer(rpa2Layer);
        			map.removeLayer(rpa3Layer);
        			map.removeLayer(rpa4Layer);
        			map.removeLayer(rpa5Layer);
        			map.removeLayer(rpa6Layer);
        			$(".layers-rpas").removeClass('layer-active');
        		} else {
        			map.addLayer(rpa1Layer);
        			map.addLayer(rpa2Layer);
        			map.addLayer(rpa3Layer);
        			map.addLayer(rpa4Layer);
        			map.addLayer(rpa5Layer);
        			map.addLayer(rpa6Layer);
        			$(".layers-rpas").addClass('layer-active');
        			$(".layers-bairros").removeClass('layer-active');
        			map.removeLayer(bairrosLayer);
        		}
    		} else {
    			if (map.hasLayer(layer)) {
        			map.removeLayer(layer);
        			this.parentElement.classList.remove('layer-active');
        		} else {
        			map.addLayer(layer);
        			if(name == 'Bairros'){
        				map.removeLayer(rpa1Layer);
            			map.removeLayer(rpa2Layer);
            			map.removeLayer(rpa3Layer);
            			map.removeLayer(rpa4Layer);
            			map.removeLayer(rpa5Layer);
            			map.removeLayer(rpa6Layer);
        				$(".layers-rpas").removeClass('layer-active');
        				$(".layers-bairros").addClass('layer-active');
        			} else if(name == 'Mapa de Calor'){
        				mudaLegenda('heatmap');
        				map.removeLayer(escolasLayer);
        				$(".layers-calor").addClass('layer-active');
        				$(".layers-escolas").removeClass('layer-active');
        			} else if(name == 'Escolas'){
        				mudaLegenda();
        				map.removeLayer(heatmapLayer);
        				$(".layers-escolas").addClass('layer-active');
        				$(".layers-calor").removeClass('layer-active');
        			}
        		}
    		}
    	};
    	
    	if (name == 'RPAs'){
    		link.innerHTML = '<img alt="Camada de RPAs" src="'+ contextPath +'/views/assets/css/img/layers-rpas.jpg">' + name;
    		$(".layers-rpas").addClass('layer-active');
    		$(".layers-rpas").append(link);
    	} else if (name == 'Mapa de Calor'){
    		link.innerHTML = '<img alt="Mapa de Calor" src="'+ contextPath +'/views/assets/css/img/layers-calor.jpg">' + 'Alcance';
    		$(".layers-calor").append(link);
    	} else if (name == 'Bairros'){
    		link.innerHTML = '<img alt="Camada de Bairros" src="'+ contextPath +'/views/assets/css/img/layers-bairros.jpg">' + name;
    		$(".layers-bairros").append(link);
    	} else if (name == 'Escolas'){
    		link.innerHTML = '<img alt="Escolas" src="'+ contextPath +'/views/assets/css/img/layers-escolas.jpg">' + name;
    		$(".layers-escolas").addClass('layer-active');
    		$(".layers-escolas").append(link);
    	}
    }
}

var pItem = document.getElementsByClassName('progressive replace'), timer;
function loadFullImage(item) {
	if (!item || !item.href) return;

	// load image
	var img = new Image();
	if (item.dataset) {
		img.srcset = item.dataset.srcset || '';
		img.sizes = item.dataset.sizes || '';
	}
	img.src = item.href;
	img.className = 'reveal';
	if (img.complete) addImg();
	else img.onload = addImg;

	function addImg() {
		// disable click
		item.addEventListener('click', function(e) { e.preventDefault(); }, false);

		// add full image
		item.appendChild(img).addEventListener('animationend', function(e) {
			// remove preview image
			var pImg = item.querySelector && item.querySelector('img.preview');

			if (pImg) {
				e.target.alt = pImg.alt || '';
				item.removeChild(pImg);
				e.target.classList.remove('reveal');
			}
		});
	}
}

function inView() {
	var wT = window.pageYOffset, wB = wT + window.innerHeight, cRect, pT, pB, p = 0;
	while (p < pItem.length) {

		cRect = pItem[p].getBoundingClientRect();
		pT = wT + cRect.top;
		pB = pT + cRect.height;

		if (wT < pB && wB > pT) {
			loadFullImage(pItem[p]);
			pItem[p].classList.remove('replace');
		}
		else p++;
	}
}

inView();

var overlayMaps = {
//	    "BackGround": bgLayer,
	    "Escolas": escolasLayer,
	    "Bairros": bairrosLayer
	};

//L.control.layers(overlayMaps).addTo(map);


$("#layers-ui").on('mouseover', function() {
	$("#layers-options").show();
});

$("#layers-options").on('mouseout', function() {
	$("#layers-options").hide();
});