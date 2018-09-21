var menu;
var painel;

function abrePainelMobile(painel) {
	switch (painel) {
	case "filtro":
		$(".mobile-blur").fadeIn(500);
		$(".mobile-filtro").slideDown(500);
		break;
	case "menu":
		if(menu){
			fechaPainelMobile('menu');
		} else {
			menu = true;
			$(".background-menu").show();
//			$("#map").animate({left: "70%"},{duration: 500, queue: false});
//			$("#map").animate({height: "70%"},{duration: 500, queue: false});
//			$("#map").animate({top: "15%"},{duration: 500, queue: false});
			$("#map").addClass('menu-small');
//			$("#map").css("border-radius", "5px");
//			$(".mobile-menu").css("border-radius", "5px");
//			$(".mobile-footer").css("border-radius", "0 0 0 5px");
//			$("#container-floating").fadeOut({duration: 500, queue: false});
//			$(".mobile-menu-map").animate({left: "70%"},{duration: 500, queue: false});
//			$(".mobile-menu-map").animate({top: "15%"},{duration: 500, queue: false});
//			$(".mobile-footer").animate({left: "70%"},{duration: 500, queue: false});
//			$(".mobile-footer").animate({bottom: "15%"},{duration: 500, queue: false});
		}
		break;
	default:
		break;
	}
}

function fechaPainelMobile(painel) {
	switch (painel) {
	case "filtro":
		$(".mobile-blur").fadeOut(500);
		$(".mobile-painel").slideUp(500);
		break;
	case "menu":
		menu = false;
//		$("#map").animate({left: "0"},{duration: 500, queue: false});
//		$("#map").animate({height: "100%"},{duration: 500, queue: false});
//		$("#map").animate({top: "0"},{duration: 500, queue: false});
//		$("#map").animate({"border-radius": "0"},{duration: 500, queue: false});
		$("#map").removeClass('menu-small');
//		$(".mobile-menu").animate({"border-radius": "0"},{duration: 500, queue: false});
//		$(".mobile-footer").animate({"border-radius": "0"},{duration: 500, queue: false});
//		$("#container-floating").fadeIn({duration: 500, queue: false});
//		$(".mobile-menu-map").animate({left: "0"},{duration: 500, queue: false});
//		$(".mobile-menu-map").animate({top: "0"},{duration: 500, queue: false});
//		$(".mobile-footer").animate({left: "0"},{duration: 500, queue: false});
//		$(".mobile-footer").animate({bottom: "0"},{duration: 500, queue: false});
		break;
	default:
		break;
	}
}