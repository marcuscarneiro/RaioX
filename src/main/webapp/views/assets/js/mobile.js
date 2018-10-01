let menu = false;
let lista = false;
let todos = true;
let anosiniciais = true, anosfinais = true, atingiu, naoatingiu, melhoresiniciais, pioresiniciais, melhoresfinais, pioresfinais, quadra, acessibilidade;

function abrePainelMobile(painel) {
	switch (painel) {
	case "filtro":
		$(".mobile-blur").addClass('mobile-blur-show');
		$(".mobile-filtro").addClass('mobile-filtro-show');
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
		if(!lista){
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
		anosfinais = true;
		anosiniciais = false;
	}
};

function cancelaFiltro() {
	filtraTodosMobile();
	$('.opcoes-item input[type=checkbox]').removeAttr('checked');
	$('.opcoes-item input[type=checkbox]').button('refresh');
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
		} else if(name === 'nunca') {
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
	filtraMobile();
	fechaPainelMobile('filtro');
}
function filtraMobile(){
	map.removeLayer(escolasLayer);
	escolasLayer = L.geoJSON().addTo(map);
	escolasLayer.addData(escolasData);
	changeMarkers();
	if(anosiniciais && anosfinais){
	} else if(anosiniciais) {
		filtraIniciais('iniciais');
	} else {
		filtraFinais('finais');
	}
	if(atingiu){
		filtraMeta('meta');
	}
	if(naoatingiu){
		filtraNaoAtingiu('naoatingiu');
	}
	if(melhoresiniciais){
		filtraMelhorIdeb5('melhorIdeb5');
	}
	if(pioresiniciais){
		filtraPiorIdeb5('piorIdeb5');
	}
	if(melhoresfinais){
		filtraMelhorIdeb9('melhorIdeb9');
	}
	if(pioresfinais){
		filtraPiorIdeb9('piorIdeb9');
	}
	if(quadra){
		filtraQuadras('quadras');
	}
	if(acessibilidade){
		filtraAcessibilidade('acessibilidade');
	}
}