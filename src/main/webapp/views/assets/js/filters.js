var mapaEscolaFiltros, filtroMeta, filtroNovas, filtroEvolucao, filtroNunca, filtroRecentes, filtroMelhorIdeb5, filtroMelhorIdeb9, filtroPiorIdeb5, filtroPiorIdeb9,
filtroMelhorProfPort5, filtroPiorProfPort5, filtroMelhorProfPort9, filtroPiorProfPort9, filtroMelhorProfMat5, filtroPiorProfMat5, filtroMelhorProfMat9, filtroPiorProfMat9,
filtroQuadras, filtroAces;

//Se desmarcar todos, reinicia mapa
$(document).ready(function(){
	$(".filtro-item").change(function(){
		if ($(".filtro-item:checked").length == 0) {
			recarregaMapa();
		}
	});
});

$('.filtro-item').on('click', function(){
	actualMarker = undefined;
	
	if($(this).hasClass('active')){
		$(this).removeClass('active');
		var filter = 'null';
	} else {
		var filter = $(this).data('filter');
	}
	
	if(filter === 'null'){
		replotMap();
		removePins();
		mudaLegenda(filter);
	} else if (filter === 'meta'){
		filtraMeta(filter);
	} else if (filter === 'novas'){
		filtraNova(filter);
	} else if (filter === 'evolucao'){
		filtraEvolucao(filter);
	} else if (filter === 'nunca'){
		filtraNunca(filter);
	} else if (filter === 'recentes'){
		filtraRecentes(filter);
	} else if (filter === 'melhorIdeb5'){
		filtraMelhorIdeb5(filter);
	} else if (filter === 'piorIdeb5'){
		filtraPiorIdeb5(filter);
	} else if (filter === 'melhorIdeb9'){
		filtraMelhorIdeb9(filter);
	} else if (filter === 'piorIdeb9'){
		filtraPiorIdeb9(filter);
	} else if (filter === 'melhorProfPort5'){
		filtraMelhorProfPort5(filter);
	} else if (filter === 'piorProfPort5'){
		filtraPiorProfPort5(filter);
	} else if (filter === 'melhorProfPort9'){
		filtraMelhorProfPort9(filter);
	} else if (filter === 'piorProfPort9'){
		filtraPiorProfPort9(filter);
	} else if (filter === 'melhorProfMat5'){
		filtraMelhorProfMat5(filter);
	} else if (filter === 'piorProfMat5'){
		filtraPiorProfMat5(filter);
	} else if (filter === 'melhorProfMat9'){
		filtraMelhorProfMat9(filter);
	} else if (filter === 'piorProfMat9'){
		filtraPiorProfMat9(filter);
	} else if (filter === 'quadras'){
		filtraQuadras(filter);
	} else if (filter === 'aces'){
		filtraAcessibilidade(filter);
	} else {
		replotMap();
		removePins();
		mudaLegenda(filter);
	}
	
	if($(window).width() <= 1024){
		fechaPainelFiltro();
	}
});

function filtraMeta(filter){
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
}

function filtraNova(filter){
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
}

function filtraEvolucao(filter){
	map.removeLayer(escolasLayer);
	escolasLayer = L.mapbox.featureLayer().addTo(map);
	escolasLayer.setGeoJSON(escolasData);
	escolasLayer.eachLayer(function(marker) {
		if(marker.feature.properties.Evolucao == "true"){
		} else {
			map.removeLayer(marker);
		}
	});
	removePins();
	escolasList = [];
	escolasListCompare = [];
	modo = 'evolucao';
	changeMarkers();
	mudaLegenda(filter);
}

function filtraNunca(filter){
	map.removeLayer(escolasLayer);
	escolasLayer = L.mapbox.featureLayer().addTo(map);
	escolasLayer.setGeoJSON(escolasData);
	escolasLayer.eachLayer(function(marker) {
		if(marker.feature.properties.NuncaAtingiu == "true"){
		} else {
			map.removeLayer(marker);
		}
	});
	removePins();
	escolasList = [];
	escolasListCompare = [];
	modo = 'nunca';
	changeMarkers();
	mudaLegenda(filter);
}

function filtraRecentes(filter){
	map.removeLayer(escolasLayer);
	escolasLayer = L.mapbox.featureLayer().addTo(map);
	$.ajax({
		url: 'consultaRecentes',
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
}

function filtraMelhorIdeb5(filter){
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
}

function filtraPiorIdeb5(filter){
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
}

function filtraMelhorIdeb9(filter){
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
}

function filtraPiorIdeb9(filter){
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
}

function filtraMelhorProfPort5(filter){
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
}

function filtraPiorProfPort5(filter){
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
}

function filtraMelhorProfPort9(filter){
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
}

function filtraPiorProfPort9(filter){
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
}

function filtraMelhorMatPort5(filter){
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
}

function filtraPiorMatPort5(filter){
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
}

function filtraMelhorMatPort9(filter){
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
}

function filtraPiorMatPort9(filter){
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
}

function filtraQuadras(filter){
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
}

function filtraAcessibilidade(filter){
	map.removeLayer(escolasLayer);
	escolasLayer = L.mapbox.featureLayer().addTo(map);
	escolasLayer.setGeoJSON(escolasData);
	escolasList = [];
	modo = 'acessibilidade';
	removePins();
	changeMarkersAcess();
	mudaLegenda(filter);
}