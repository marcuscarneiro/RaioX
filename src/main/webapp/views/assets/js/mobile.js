var menu;
var painel;

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
			$(".background-menu").show();
			$(".map-container").addClass('menu-small');
			$(".mapShadow1").addClass('shadow1-show');
			$(".mapShadow2").addClass('shadow2-show');
			$("#container-floating").fadeOut({duration: 500, queue: false});
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
		$(".map-container").removeClass('menu-small');
		$(".mapShadow1").removeClass('shadow1-show');
		$(".mapShadow2").removeClass('shadow2-show');
		$("#container-floating").fadeIn({duration: 500, queue: false});
		break;
	default:
		break;
	}
}