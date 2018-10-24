let menu = false;
let lista = false;
let todos = true;
let painelEscola = false;
let filtroAplicado = false;
let filtroMelhorIdeb5Mob = [], filtroMelhorIdeb9Mob = [], filtroPiorIdeb5Mob = [], filtroPiorIdeb9Mob = [];
let anosiniciais = true, anosfinais = true, atingiu, naoatingiu, melhoresiniciais, pioresiniciais, melhoresfinais, pioresfinais, quadra, acessibilidade;
let estadoRealFiltros = [
	{name: 'anosiniciais', value: true},
	{name: 'anosfinais', value: true},
	{name: 'atingiu', value: false},
	{name: 'naoatingiu', value: false},
	{name: 'melhoresiniciais', value: false},
	{name: 'pioresiniciais', value: false},
	{name: 'melhoresfinais', value: false},
	{name: 'pioresfinais', value: false},
	{name: 'quadra', value: false},
	{name: 'acessibilidade', value: false}
];
let estadoTemporarioFiltros = JSON.parse(JSON.stringify(estadoRealFiltros));

function showFab() {
	if($('#container-floating').hasClass('floating-show')){
		$('.plus').removeClass('plus-rotate');
		$('.nds').removeClass('nds-show');
		$('#container-floating').removeClass('floating-show');
	} else {
		$('.plus').addClass('plus-rotate');
		$('.nds').addClass('nds-show');
		$('#container-floating').addClass('floating-show');
	}
}

function abrePainelMobile(painel) {
	switch (painel) {
	case "filtro":
		$(".mobile-blur").addClass('mobile-blur-show');
		$(".mobile-filtro").addClass('mobile-filtro-show');
		if(filtroAplicado){
			$(".menu-cancel").hide();
			$(".menu-reset").show();
		} else {
			$(".menu-cancel").show();
			$(".menu-reset").hide();
		}
		fechaPainelMobile('escola');
		break;
	case "menu":
		if(menu){
			fechaPainelMobile('menu');
		} else {
			menu = true;
			$(".mobile-side-menu").css('opacity', '1');
			$("#map").addClass('map-small');
			$(".map-container").addClass('menu-small');
			$(".map-container-blur").addClass('blur-show');
			$(".mobile-side-menu-content").addClass('menu-content-show');
			$(".mobile-menu-map").addClass('mobile-menu-map-small');
			$(".mobile-footer").addClass('mobile-footer-small');
			$(".mapShadow1").addClass('shadow1-show');
			$(".mapShadow2").addClass('shadow2-show');
			$("#container-floating").addClass('container-floating-hide');
		}
		break;
	case "lista":
		var menuopen = menu;
		if(menu){
			fechaPainelMobile('menu');
		}
		if(painelEscola){
			fechaPainelMobile('escola');
		}
		if(!lista){
			lista = true;
			$(".footer-active-indicator").addClass('list-indicator');
			$(".footer-list i").addClass('footer-menu-active');
			$(".footer-globe i").removeClass('footer-menu-active');
			$(".mobile-list").addClass('mobile-list-show');
			$(".mobile-menu-map").addClass('menu-map-solid');
			$("#container-floating").addClass('container-floating-hide');
		} 
		if(menuopen){
			$(".mobile-list").animate({scrollTop: $(".mobile-pesquisa").offset().top - 200},"0");
		} else {
			$(".mobile-list").animate({scrollTop: $(".mobile-pesquisa").offset().top - 70},"1000");
		}
		break;
	case "compare":
		$(".painel-compare").addClass('compare-show');
		break;
	case "escola":
		painelEscola = true;
		$('.painel-escola-mobile').addClass('escola-show');
		$('.map-container-loading').removeClass('loading-show');
		$("#container-floating").addClass('container-floating-hide');
		break;
	default:
		break;
	}
}

function fechaPainelMobile(painel) {
	switch (painel) {
	case "filtro":
		$(".mobile-blur").removeClass('mobile-blur-show');
		$(".mobile-filtro").removeClass('mobile-filtro-show');
		break;
	case "menu":
		menu = false;
		$("#map").removeClass('map-small');
		$(".map-container").removeClass('menu-small');
		$(".map-container-blur").removeClass('blur-show');
		$(".mobile-side-menu-content").removeClass('menu-content-show');
		$(".mobile-menu-map").removeClass('mobile-menu-map-small');
		$(".mobile-footer").removeClass('mobile-footer-small');
		$(".mapShadow1").removeClass('shadow1-show');
		$(".mapShadow2").removeClass('shadow2-show');
		if(!lista && !painelEscola){
			$("#container-floating").removeClass('container-floating-hide');
		}
		break;
	case "lista":
		lista = false;
		$(".footer-list i").removeClass('footer-menu-active');
		$(".footer-globe i").addClass('footer-menu-active');
		$(".mobile-menu-map").removeClass('menu-map-solid');
		$(".footer-active-indicator").removeClass('list-indicator');
		$(".mobile-list").removeClass('mobile-list-show');
		$("#container-floating").removeClass('container-floating-hide');
		break;
	case "compare":
		$(".painel-compare").removeClass('compare-show');
		break;
	case "escola":
		painelEscola = false;
		$("#container-floating").removeClass('container-floating-hide');
		$('.painel-escola-mobile').removeClass('escola-show');
		regionFill = 0.6;
		map.setView([-8.0529, -34.9330], initialzoom);
		removeAllRpaLayers();
		setAllRpaLayers();
		break;
	default:
		break;
	}
}

function mobileOrder(parent, childSelector, keySelector, order) {
    var items = parent.children(childSelector).sort(function(a, b) {
        var vA = $(keySelector, a).text();
        var vB = $(keySelector, b).text();
        if (order === 'asc') {
        	vA = vA.replace("--", "999");
        	vB = vB.replace("--", "999");
        	return (vA < vB) ? -1 : (vA > vB) ? 1 : 0;
		} else {
			return (vA > vB) ? -1 : (vA < vB) ? 1 : 0;
		}
    });
    parent.append(items);
}

//mobileOrder($('#sortThis'), "div", "span.price");


function listOrder(key) {
	$('.mobile-list-order a').removeClass('active');
	switch (key) {
	case 'nome':
		$('#order-radio-nome').addClass('active');
		mobileOrder($('.mobile-list-items'), "li", '.mobile-list-nome', "asc");
		break;
	case 'melhornota':
		$('#order-radio-melhorideb').addClass('active');
		mobileOrder($('.mobile-list-items'), "li", '.mobile-list-nota', "desc");
		break;
	case 'piornota':
		$('#order-radio-piorideb').addClass('active');
		mobileOrder($('.mobile-list-items'), "li", '.mobile-list-nota', "asc");
		break;
	default:
		break;
	}
}

$(document).ready(function(){
	$(".mobile-opcoes-lista [type=checkbox]").on('click', function() {
		var index = estadoTemporarioFiltros.findIndex(e => e.name == $(this).attr('name'));
		estadoTemporarioFiltros[index].value = $(this).is(':checked');
		testFilterChange();
	});
});

function testFilterChange(){
	if(JSON.stringify(estadoTemporarioFiltros) === JSON.stringify(estadoRealFiltros)) {
		$('.menu-save').addClass('menu-save-disabled');
		$('.menu-save').attr('onclick', '');
	} else {
		$('.menu-save').removeClass('menu-save-disabled');
		$('.menu-save').attr('onclick', 'salvaFiltro()');
	}
}

function filtraTodosMobile(){
	if($('#btnTodosMobile').hasClass('not-active')){
		$('#btnTodosMobile').removeClass('not-active');
		$('#btnTodosMobile').addClass('active');
		$('#btnIniciaisMobile').removeClass('active');
		$('#btnIniciaisMobile').addClass('not-active');
		$('#btnFinaisMobile').removeClass('active');
		$('#btnFinaisMobile').addClass('not-active');
		anosiniciais = true;
		anosfinais = true;
		estadoTemporarioFiltros[0].value = true;
		estadoTemporarioFiltros[1].value = true;
		testFilterChange();
	}
}	

function filtraIniciaisMobile(){
	if($('#btnIniciaisMobile').hasClass('not-active')){
		$('#btnIniciaisMobile').removeClass('not-active');
		$('#btnIniciaisMobile').addClass('active');
		$('#btnFinaisMobile').removeClass('active');
		$('#btnFinaisMobile').addClass('not-active');
		$('#btnTodosMobile').addClass('not-active');
		$('#btnTodosMobile').removeClass('active');
		anosiniciais = true;
		anosfinais = false;
		estadoTemporarioFiltros[0].value = true;
		estadoTemporarioFiltros[1].value = false;
		testFilterChange();
	}
};

function filtraFinaisMobile(){
	if($('#btnFinaisMobile').hasClass('not-active')){
		$('#btnFinaisMobile').removeClass('not-active');
		$('#btnFinaisMobile').addClass('active');
		$('#btnIniciaisMobile').removeClass('active');
		$('#btnIniciaisMobile').addClass('not-active');
		$('#btnTodosMobile').addClass('not-active');
		$('#btnTodosMobile').removeClass('active');
		anosiniciais = false;
		anosfinais = true;
		estadoTemporarioFiltros[0].value = false;
		estadoTemporarioFiltros[1].value = true;
		testFilterChange();
	}
};

function cancelaFiltro() {
	filtraTodosMobile();
	$('.opcoes-item input[type=checkbox]').removeAttr('checked');
	$('.opcoes-item input[type=checkbox]').button('refresh');
	$('.menu-save').addClass('menu-save-disabled');
	$('.menu-save').attr('onclick', '');
	estadoTemporarioFiltros = JSON.parse(JSON.stringify(estadoRealFiltros));
	resetaVariaveis();
}

function resetaVariaveis() {
	anosiniciais = true;
	anosfinais = true;
	atingiu = false;
	naoatingiu = false;
	melhoresiniciais = false;
	pioresiniciais = false;
	melhoresfinais = false;
	pioresfinais = false;
	quadra = false;
	acessibilidade = false;
}

function resetaFiltroMobile() {
	cancelaFiltro();
	estadoRealFiltros = [
		{name: 'anosiniciais', value: true},
		{name: 'anosfinais', value: true},
		{name: 'atingiu', value: false},
		{name: 'naoatingiu', value: false},
		{name: 'melhoresiniciais', value: false},
		{name: 'pioresiniciais', value: false},
		{name: 'melhoresfinais', value: false},
		{name: 'pioresfinais', value: false},
		{name: 'quadra', value: false},
		{name: 'acessibilidade', value: false}
	];
	estadoTemporarioFiltros = JSON.parse(JSON.stringify(estadoRealFiltros));
	salvaFiltro();
}

function salvaFiltro() {
	atingiu = false;
	naoatingiu = false;
	melhoresiniciais = false;
	pioresiniciais = false;
	melhoresfinais = false;
	pioresfinais = false;
	quadra = false;
	acessibilidade = false;
	$('.mobile-opcoes-lista input[type=checkbox]:checked').each(function(){
		var name = $(this).attr('name');
		if(name === 'atingiu') {
			atingiu = true;
		} else if(name === 'naoatingiu') {
			naoatingiu = true;
		} else if(name === 'melhoresiniciais') {
			melhoresiniciais = true;
		} else if(name === 'pioresiniciais') {
			pioresiniciais = true;
		} else if(name === 'melhoresfinais') {
			melhoresfinais = true;
		} else if(name === 'pioresfinais') {
			pioresfinais = true;
		} else if(name === 'quadra') {
			quadra = true;
		} else if(name === 'acessibilidade') {
			acessibilidade = true;
		}
	});
	if(anosiniciais == false || anosfinais == false || atingiu || naoatingiu || melhoresiniciais || pioresiniciais || melhoresfinais || pioresfinais || quadra || acessibilidade){
		$('.filter-applied').show();
		filtroAplicado = true;
	} else {
		$('.filter-applied').hide();
		filtroAplicado = false;
	}
	$('.map-container-loading').addClass('loading-show');
	filtraMobile().then(function(result) {
		$('.map-container-loading').removeClass('loading-show');
	});
	estadoRealFiltros = JSON.parse(JSON.stringify(estadoTemporarioFiltros));
	$('.menu-save').addClass('menu-save-disabled');
	$('.menu-save').attr('onclick', '');
	fechaPainelMobile('filtro');
}

function removeFromDataEscola(id){
	var index = escolasData.features.findIndex(escola => escola.properties.ID == id);
	escolasData.features.splice(index,1);
}

function removeFilterLayersMobile(arr){
	var others = $.grep(escolasDataBackup.features, function(value) {
	    return $.inArray(value, arr.features) < 0;
	});
	escolasData.features.forEach(function(marker) {
		$.each(others, function(i, esc){
			if(marker.properties.ID == esc){
				removeFromDataEscola(marker.properties.ID);
			}
		})
	});
}

function filtraMobile(){
	return new Promise(function (resolve, reject) {
		setTimeout(function() {
			escolasData = JSON.parse(JSON.stringify(escolasDataBackup));
			$('.mobile-list-items').empty();
			if(anosiniciais && anosfinais){
			} else if(anosiniciais) {
				escolasData.features.forEach(function(marker){
					if(marker.properties.FundI == true){
					} else {
						removeFromDataEscola(marker.properties.ID);
					}
				});
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'all';
			} else {
				escolasData.features.forEach(function(marker) {
					if(marker.properties.FundII == true){
					} else {
						removeFromDataEscola(marker.properties.ID);
					}
				});
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'all';
			}
			if(atingiu){
				escolasData.features.forEach(function(marker) {
					if(marker.properties.ATINGIUMETA == true){
					} else {
						removeFromDataEscola(marker.properties.ID);
					}
				});
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'meta';
			}
			if(naoatingiu){
				escolasData.features.forEach(function(marker) {
					if(marker.properties.ATINGIUMETA == false){
					} else {
						removeFromDataEscola(marker.properties.ID);
					}
				});
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'meta';
			}
			if(melhoresiniciais){
				removeFilterLayersMobile(filtroMelhorIdeb5Mob);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
			}
			if(pioresiniciais){
				removeFilterLayersMobile(filtroPiorIdeb5Mob);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
			}
			if(melhoresfinais){
				removeFilterLayersMobile(filtroMelhorIdeb9Mob);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
			}
			if(pioresfinais){
				removeFilterLayersMobile(filtroPiorIdeb9Mob);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
			}
			if(quadra){
				escolasData.features.forEach(function(marker) {
					if(marker.properties.POSSUIQUADRA === 0 || marker.properties.POSSUIQUADRA === "null" || marker.properties.POSSUIQUADRA === undefined){
						removeFromDataEscola(marker.properties.ID);
					}
				});
				removePins();
				escolasList = [];
				modo = 'quadras';
				personalizeMarkers('quadras');
			}
			if(acessibilidade){
				filtraAcessibilidade('acessibilidade');
			}
			map.removeLayer(escolasLayer);
			escolasLayer = L.geoJSON().addTo(map);
			escolasLayer.addData(escolasData);
			changeMarkers();
			resolve()
		}, 500);
	});
}

$(document).ready(function() {
	$.ajax({
		url: 'melhorIdeb5',
		type: "GET",
		dataType: 'json',
		success: function(data) {
			$.each(data.features, function(i, escola){
				filtroMelhorIdeb5Mob.push(escola.properties.ID);
			});
		}
	});
	
	$.ajax({
		url: 'piorIdeb5',
		type: "GET",
		dataType: 'json',
		success: function(data) {
			$.each(data.features, function(i, escola){
				filtroPiorIdeb5Mob.push(escola.properties.ID);
			});
		}
	});
	
	$.ajax({
		url: 'melhorIdeb9',
		type: "GET",
		dataType: 'json',
		success: function(data) {
			$.each(data.features, function(i, escola){
				filtroMelhorIdeb9Mob.push(escola.properties.ID);
			});
		}
	});
	
	$.ajax({
		url: 'piorIdeb9',
		type: "GET",
		dataType: 'json',
		success: function(data) {
			$.each(data.features, function(i, escola){
				filtroPiorIdeb9Mob.push(escola.properties.ID);
			});
		}
	});
});