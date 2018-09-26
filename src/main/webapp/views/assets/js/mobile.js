var menu, painel, lista;

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
			$(".mobile-side-menu-content").addClass('menu-content-show');
			$(".mobile-menu-map").addClass('mobile-menu-map-small');
			$(".mobile-footer").addClass('mobile-footer-small');
			$(".mapShadow1").addClass('shadow1-show');
			$(".mapShadow2").addClass('shadow2-show');
			$("#container-floating").addClass('container-floating-hide');
		}
		break;
	case "lista":
		if(!lista){
			lista = true;
			$(".footer-active-indicator").addClass('list-indicator');
			$(".footer-list i").addClass('footer-menu-active');
			$(".footer-globe i").removeClass('footer-menu-active');
			$(".mobile-list").addClass('mobile-list-show');
			$("#container-floating").addClass('container-floating-hide');
		}
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
		$(".mobile-side-menu-content").removeClass('menu-content-show');
		$(".mobile-menu-map").removeClass('mobile-menu-map-small');
		$(".mobile-footer").removeClass('mobile-footer-small');
		$(".mapShadow1").removeClass('shadow1-show');
		$(".mapShadow2").removeClass('shadow2-show');
		$("#container-floating").removeClass('container-floating-hide');
		break;
	case "lista":
		lista = false;
		$(".footer-list i").removeClass('footer-menu-active');
		$(".footer-globe i").addClass('footer-menu-active');
		$(".footer-active-indicator").removeClass('list-indicator');
		$(".mobile-list").removeClass('mobile-list-show');
		$("#container-floating").removeClass('container-floating-hide');
	default:
		break;
	}
}