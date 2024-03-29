function fechaPaineis() {
	$(".footer-list i").removeClass('footer-menu-active');
	$(".footer-globe i").addClass('footer-menu-active');
	$(".footer-list i").addClass('footer-menu-inactive');
	$(".footer-globe i").removeClass('footer-menu-inactive');
	actualMarker = undefined;
	if($(".painel-filtro").hasClass("isActive")){
		fechaPainelFiltro();
	}
	if($(".painel-compare").hasClass("isActive")){
		fechaPainelCompare();
	}
	$(".painel-resultado-compare").animate({width: "-1px"},350);
	$(".painel-videos").removeClass('videos-show');
	$(".painel-contato").animate({width: "-1px"},350);
	$(".detalhe-contato").hide();
	$(".painel-projeto").animate({width: "-1px"},350);
	$(".painel-pesquisa").animate({width: "-1px"},350);
	$(".painel-filtro").animate({width: "-1px"},350);
	$("#modalEscola").modal('hide');
	$(".painel-numeros").animate({left: "-3000px"},350);
	$(".painel").removeClass("isActive");
	return true;
}

function abrePainel(nomePainel) {
	if ($(".painel-"+nomePainel).hasClass("isActive") && nomePainel != 'escola') {
		fechaPaineis();
	} else {
		if($(".painel").hasClass("isActive")){
			fechaPaineis();
		}
		if (nomePainel == 'numeros'){
			$(".painel-"+nomePainel).animate({left: "0"},350);
			$(".painel-"+nomePainel).addClass("isActive");
		}
		
		if (nomePainel == 'compare' || nomePainel == 'resultado-compare' || nomePainel == 'projeto' ) {
			if(nomePainel == 'compare'){
				requestAnimationFrame(inView);
				if($(window).width() > 1024){
					$("#pesquisaCompare").focus();
				}
			}
			$(".painel-"+nomePainel).animate({width: "100%"},350);
			$(".painel-"+nomePainel).addClass("isActive");
		}
		
		if (nomePainel == 'pesquisa' || nomePainel == 'filtro') {
			if(nomePainel == 'pesquisa'){
				$(".footer-globe i").removeClass('footer-menu-active');
				$(".footer-list i").addClass('footer-menu-active');
				$(".footer-globe i").addClass('footer-menu-inactive');
				$(".footer-list i").removeClass('footer-menu-inactive');
				requestAnimationFrame(inView);
			}
			if(nomePainel == 'filtro'){
				anosIni = false;
				anosFin = false;
				$('#btnIniciais').addClass('not-active');
				$('#btnFinais').addClass('not-active');
				plotAnos();
			}
			if($(window).width() <= 1024){
				$(".painel-"+nomePainel).animate({width: "100%"},350);
				$(".painel-"+nomePainel).addClass("isActive");
			} else {
				$(".painel-"+nomePainel).animate({width: "40%"},350);
				$(".painel-"+nomePainel).addClass("isActive");
				if(nomePainel == 'pesquisa'){
					$("#pesquisaEscola").focus();
				}
			}
		}
		
		if (nomePainel == 'videos') {
			if(!videosState){
				callVideos();
			}
			$(".painel-videos").addClass('videos-show');
			$(".painel-"+nomePainel).addClass("isActive");
		}
		
		if (nomePainel == 'contato') {
			$(".detalhe-contato").show();
			if($(window).width() <= 1024){
				$(".painel-"+nomePainel).animate({width: "100%"},350);
				$(".painel-"+nomePainel).addClass("isActive");
			} else {
				$(".painel-"+nomePainel).animate({width: "40%"},350);
				$(".painel-"+nomePainel).addClass("isActive");
			}
		}
	}
}

function fechaPainelFiltro() {
	$(".painel-filtro").animate({width: "-1px"},350);
	$(".painel-filtro").removeClass("isActive");
	$(".filtro-lista input").removeClass("active");
	if($(window).width() > 1024){
		$(".filtro-item").prop('checked', false);
		replotMap();
		removePins();
		mudaLegenda("null");
	}
}

function fechaPainelCompare() {
	$(".painel-compare").animate({width: "-1px"},350);
	$(".painel-compare").removeClass("isActive");
	$(".compare-selecionados li").each(function(index){
		$(".compare-lista").append(this);
	});
	$(".compare-header h2").html("SELECIONE AO LADO AS ESCOLAS QUE DESEJA COMPARAR");
	$(".compare-titulo-escola1").html("");
	$(".compare-titulo-escola2").html("");
	$("#idebcompare").slideUp();
	$("#aprendizadocompare").slideUp();
	$(".compare-ideb h4").hide();
	$(".compare-aprendizado h4").hide();
	$(".compare-escola").slideUp();
	$(".compare-galerias").slideUp();
	if($(window).width() <= 1024){
		$(".compare-resultado").slideDown();
	}
	ordenaEscolas();
}

function fechaPainelResultadoCompare() {
	$(".compare-selecionados li").each(function(index){
		$(".compare-lista").append(this);
	});
	$(".compare-header h2").html("SELECIONE AO LADO AS ESCOLAS QUE DESEJA COMPARAR");
	$(".compare-titulo-escola1").html("");
	$(".compare-titulo-escola2").html("");
	$("#idebcompare").slideUp();
	$("#aprendizadocompare").slideUp();
	$(".compare-ideb h4").hide();
	$(".compare-aprendizado h4").hide();
	$(".compare-escola").slideUp();
	$(".compare-galerias").slideUp();
	if($(window).width() <= 1024){
		$(".compare-resultado").slideDown();
	}
	ordenaEscolas();
}

//COMPARATIVO
function addCompara(esc){
	var compareLi = $(".dados-compare").find('[esc="'+esc+'"]');
	var listaSize = $(".compare-selecionados li").length;
	
	if(compareLi.parent().hasClass('compare-lista')){
		if (listaSize == 0) {
			compareLi.fadeOut(250, function() {
				$(".compare-selecionados").append(compareLi);
				compareLi.fadeIn(250);
			});
		} else if(listaSize < 2){
			compareLi.fadeOut(250, function() {
				$(".compare-selecionados").append(compareLi);
				compareLi.fadeIn(250, function(){
					var comp1 = $(".compare-selecionados li").first().attr('esc');;
					var comp2 = $(".compare-selecionados li").last().attr('esc');
					comparaEscolas(comp1, comp2);
					$(".compare-header h2").html("COMPARATIVO");
					$(".compare-escola").slideDown();
					$(".compare-galerias").slideDown();
					$(".idebcompare").slideDown();
					$(".aprendizadocompare").slideDown();
					if($(window).width() <= 1024){
						$(".compare-resultado").slideUp();
					}
				});
			});
		} else {
			var lastLi = $(".compare-selecionados li").last();
			lastLi.fadeOut(250, function(){
				$(".compare-lista").append(lastLi);
				ordenaEscolas();
				lastLi.fadeIn(250);
			});
			compareLi.fadeOut(250, function() {
				$(".compare-selecionados").append(compareLi);
				compareLi.fadeIn(250, function(){
					var comp1 = $(".compare-selecionados li").first().attr('esc');;
					var comp2 = $(".compare-selecionados li").last().attr('esc');
					comparaEscolas(comp1, comp2);
				});
				
			});
		}
	} else {
		if(listaSize == 1){
			$(".compare-header h2").html("SELECIONE AO LADO AS ESCOLAS QUE DESEJA COMPARAR");
			$(".idebcompare").slideUp();
			$(".aprendizadocompare").slideUp();
			$(".compare-escola").slideUp();
			$(".compare-galerias").slideUp();
			$(".compare-titulo-escola1").html("");
			$(".compare-titulo-escola2").html("");
		}
		compareLi.fadeOut(250, function(){
			if($(window).width() <= 1024){
				$(".compare-resultado").slideDown();
			}
			$(".compare-lista").append(compareLi);
			ordenaEscolas();
			compareLi.fadeIn(250);
		});
	}	
};

function mudaFormatoCompare(formato){
	if (formato == 'caixas') {
		$('.compare-resultado li').addClass('compare-escola-caixas');
		$('.compare-resultado li').removeClass('compare-escola-lista');
		$('.compare-resultado .pesquisa-thumb').show();
		$('.compare-selecionados li').addClass('compare-escola-caixas');
		$('.compare-selecionados li').removeClass('compare-escola-lista');
		$('.compare-selecionados .pesquisa-thumb').show();
	} else {
		$('.compare-resultado li').addClass('compare-escola-lista');
		$('.compare-resultado li').removeClass('compare-escola-caixas');
		$('.compare-resultado .pesquisa-thumb').hide();
		$('.compare-selecionados li').addClass('compare-escola-lista');
		$('.compare-selecionados li').removeClass('compare-escola-caixas');
		$('.compare-selecionados .pesquisa-thumb').hide();
	}
}

function mudaFormatoPesquisa(formato){
	if (formato == 'caixas') {
		$('.pesquisa-lista li').addClass('pesquisa-escola-caixas');
		$('.pesquisa-lista li').removeClass('pesquisa-escola-lista');
		$('.pesquisa-lista .pesquisa-thumb').show();
	} else {
		$('.pesquisa-lista li').addClass('pesquisa-escola-lista');
		$('.pesquisa-lista li').removeClass('pesquisa-escola-caixas');
		$('.pesquisa-lista .pesquisa-thumb').hide();
	}
}

function addRemoveCompare(checkbox) {
	var compareLi = $(checkbox).parent();
}

// BUSCA POR ESCOLA
$(document).ready(function(){
    $('.collapse a').on('click', function(){
        $('.navbar-toggle').click();
    });
	    
	var accentMap = {"ẚ": "a", "Á": "a", "á": "a", "À": "a", "à": "a", "Ă": "a", "ă": "a", "Ắ": "a", "ắ": "a", "Ằ": "a", "ằ": "a", "Ẵ": "a", "ẵ": "a", "Ẳ": "a", "ẳ": "a", "Â": "a", "â": "a", "Ấ": "a", "ấ": "a", "Ầ": "a", "ầ": "a", "Ẫ": "a", "ẫ": "a", "Ẩ": "a", "ẩ": "a", "Ǎ": "a", "ǎ": "a", "Å": "a", "å": "a", "Ǻ": "a", "ǻ": "a", "Ä": "a", "ä": "a", "Ǟ": "a", "ǟ": "a", "Ã": "a", "ã": "a", "Ȧ": "a", "ȧ": "a", "Ǡ": "a", "ǡ": "a", "Ą": "a", "ą": "a", "Ā": "a", "ā": "a", "Ả": "a", "ả": "a", "Ȁ": "a", "ȁ": "a", "Ȃ": "a", "ȃ": "a", "Ạ": "a", "ạ": "a", "Ặ": "a", "ặ": "a", "Ậ": "a", "ậ": "a", "Ḁ": "a", "ḁ": "a", "Ⱥ": "a", "ⱥ": "a", "Ǽ": "a", "ǽ": "a", "Ǣ": "a", "ǣ": "a", "Ḃ": "b", "ḃ": "b", "Ḅ": "b", "ḅ": "b", "Ḇ": "b", "ḇ": "b", "Ƀ": "b", "ƀ": "b", "ᵬ": "b", "Ɓ": "b", "ɓ": "b", "Ƃ": "b", "ƃ": "b", "Ć": "c", "ć": "c", "Ĉ": "c", "ĉ": "c", "Č": "c", "č": "c", "Ċ": "c", "ċ": "c", "Ç": "c", "ç": "c", "Ḉ": "c", "ḉ": "c", "Ȼ": "c", "ȼ": "c", "Ƈ": "c", "ƈ": "c", "ɕ": "c", "Ď": "d", "ď": "d", "Ḋ": "d", "ḋ": "d", "Ḑ": "d", "ḑ": "d", "Ḍ": "d", "ḍ": "d", "Ḓ": "d", "ḓ": "d", "Ḏ": "d", "ḏ": "d", "Đ": "d", "đ": "d", "ᵭ": "d", "Ɖ": "d", "ɖ": "d", "Ɗ": "d", "ɗ": "d", "Ƌ": "d", "ƌ": "d", "ȡ": "d", "ð": "d", "É": "e", "Ə": "e", "Ǝ": "e", "ǝ": "e", "é": "e", "È": "e", "è": "e", "Ĕ": "e", "ĕ": "e", "Ê": "e", "ê": "e", "Ế": "e", "ế": "e", "Ề": "e", "ề": "e", "Ễ": "e", "ễ": "e", "Ể": "e", "ể": "e", "Ě": "e", "ě": "e", "Ë": "e", "ë": "e", "Ẽ": "e", "ẽ": "e", "Ė": "e", "ė": "e", "Ȩ": "e", "ȩ": "e", "Ḝ": "e", "ḝ": "e", "Ę": "e", "ę": "e", "Ē": "e", "ē": "e", "Ḗ": "e", "ḗ": "e", "Ḕ": "e", "ḕ": "e", "Ẻ": "e", "ẻ": "e", "Ȅ": "e", "ȅ": "e", "Ȇ": "e", "ȇ": "e", "Ẹ": "e", "ẹ": "e", "Ệ": "e", "ệ": "e", "Ḙ": "e", "ḙ": "e", "Ḛ": "e", "ḛ": "e", "Ɇ": "e", "ɇ": "e", "ɚ": "e", "ɝ": "e", "Ḟ": "f", "ḟ": "f", "ᵮ": "f", "Ƒ": "f", "ƒ": "f", "Ǵ": "g", "ǵ": "g", "Ğ": "g", "ğ": "g", "Ĝ": "g", "ĝ": "g", "Ǧ": "g", "ǧ": "g", "Ġ": "g", "ġ": "g", "Ģ": "g", "ģ": "g", "Ḡ": "g", "ḡ": "g", "Ǥ": "g", "ǥ": "g", "Ɠ": "g", "ɠ": "g", "Ĥ": "h", "ĥ": "h", "Ȟ": "h", "ȟ": "h", "Ḧ": "h", "ḧ": "h", "Ḣ": "h", "ḣ": "h", "Ḩ": "h", "ḩ": "h", "Ḥ": "h", "ḥ": "h", "Ḫ": "h", "ḫ": "h", H: "h", "̱": "h", "ẖ": "h", "Ħ": "h", "ħ": "h", "Ⱨ": "h", "ⱨ": "h", "Í": "i", "í": "i", "Ì": "i", "ì": "i", "Ĭ": "i", "ĭ": "i", "Î": "i", "î": "i", "Ǐ": "i", "ǐ": "i", "Ï": "i", "ï": "i", "Ḯ": "i", "ḯ": "i", "Ĩ": "i", "ĩ": "i", "İ": "i", i: "i", "Į": "i", "ı": "i", "į": "i", "Ī": "i", "ī": "i", "Ỉ": "i", "ỉ": "i", "Ȉ": "i", "ȉ": "i", "Ȋ": "i", "ȋ": "i", "Ị": "i", "ị": "i", "Ḭ": "i", "ḭ": "i", I: "i", "ı": "i", "Ɨ": "i", "ɨ": "i", "Ĵ": "j", "ĵ": "j", J: "j", "̌": "j", "ǰ": "j", "ȷ": "j", "Ɉ": "j", "ɉ": "j", "ʝ": "j", "ɟ": "j", "ʄ": "j", "Ḱ": "k", "ḱ": "k", "Ǩ": "k", "ǩ": "k", "Ķ": "k", "ķ": "k", "Ḳ": "k", "ḳ": "k", "Ḵ": "k", "ḵ": "k", "Ƙ": "k", "ƙ": "k", "Ⱪ": "k", "ⱪ": "k", "Ĺ": "a", "ĺ": "l", "Ľ": "l", "ľ": "l", "Ļ": "l", "ļ": "l", "Ḷ": "l", "ḷ": "l", "Ḹ": "l", "ḹ": "l", "Ḽ": "l", "ḽ": "l", "Ḻ": "l", "ḻ": "l", "Ł": "l", "ł": "l", "Ł": "l", "̣": "l", "ł": "l", "̣": "l", "Ŀ": "l", "ŀ": "l", "Ƚ": "l", "ƚ": "l", "Ⱡ": "l", "ⱡ": "l", "Ɫ": "l", "ɫ": "l", "ɬ": "l", "ɭ": "l", "ȴ": "l", "Ḿ": "m", "ḿ": "m", "Ṁ": "m", "ṁ": "m", "Ṃ": "m", "ṃ": "m", "ɱ": "m", "Ń": "n", "ń": "n", "Ǹ": "n", "ǹ": "n", "Ň": "n", "ň": "n", "Ñ": "n", "ñ": "n", "Ṅ": "n", "ṅ": "n", "Ņ": "n", "ņ": "n", "Ṇ": "n", "ṇ": "n", "Ṋ": "n", "ṋ": "n", "Ṉ": "n", "ṉ": "n", "Ɲ": "n", "ɲ": "n", "Ƞ": "n", "ƞ": "n", "ɳ": "n", "ȵ": "n", N: "n", "̈": "n", n: "n", "̈": "n", "Ó": "o", "ó": "o", "Ò": "o", "ò": "o", "Ŏ": "o", "ŏ": "o", "Ô": "o", "ô": "o", "Ố": "o", "ố": "o", "Ồ": "o", "ồ": "o", "Ỗ": "o", "ỗ": "o", "Ổ": "o", "ổ": "o", "Ǒ": "o", "ǒ": "o", "Ö": "o", "ö": "o", "Ȫ": "o", "ȫ": "o", "Ő": "o", "ő": "o", "Õ": "o", "õ": "o", "Ṍ": "o", "ṍ": "o", "Ṏ": "o", "ṏ": "o", "Ȭ": "o", "ȭ": "o", "Ȯ": "o", "ȯ": "o", "Ȱ": "o", "ȱ": "o", "Ø": "o", "ø": "o", "Ǿ": "o", "ǿ": "o", "Ǫ": "o", "ǫ": "o", "Ǭ": "o", "ǭ": "o", "Ō": "o", "ō": "o", "Ṓ": "o", "ṓ": "o", "Ṑ": "o", "ṑ": "o", "Ỏ": "o", "ỏ": "o", "Ȍ": "o", "ȍ": "o", "Ȏ": "o", "ȏ": "o", "Ơ": "o", "ơ": "o", "Ớ": "o", "ớ": "o", "Ờ": "o", "ờ": "o", "Ỡ": "o", "ỡ": "o", "Ở": "o", "ở": "o", "Ợ": "o", "ợ": "o", "Ọ": "o", "ọ": "o", "Ộ": "o", "ộ": "o", "Ɵ": "o", "ɵ": "o", "Ṕ": "p", "ṕ": "p", "Ṗ": "p", "ṗ": "p", "Ᵽ": "p", "Ƥ": "p", "ƥ": "p", P: "p", "̃": "p", p: "p", "̃": "p", "ʠ": "q", "Ɋ": "q", "ɋ": "q", "Ŕ": "r", "ŕ": "r", "Ř": "r", "ř": "r", "Ṙ": "r", "ṙ": "r", "Ŗ": "r", "ŗ": "r", "Ȑ": "r", "ȑ": "r", "Ȓ": "r", "ȓ": "r", "Ṛ": "r", "ṛ": "r", "Ṝ": "r", "ṝ": "r", "Ṟ": "r", "ṟ": "r", "Ɍ": "r", "ɍ": "r", "ᵲ": "r", "ɼ": "r", "Ɽ": "r", "ɽ": "r", "ɾ": "r", "ᵳ": "r", "ß": "s", "Ś": "s", "ś": "s", "Ṥ": "s", "ṥ": "s", "Ŝ": "s", "ŝ": "s", "Š": "s", "š": "s", "Ṧ": "s", "ṧ": "s", "Ṡ": "s", "ṡ": "s", "ẛ": "s", "Ş": "s", "ş": "s", "Ṣ": "s", "ṣ": "s", "Ṩ": "s", "ṩ": "s", "Ș": "s", "ș": "s", "ʂ": "s", S: "s", "̩": "s", s: "s", "̩": "s", "Þ": "t", "þ": "t", "Ť": "t", "ť": "t", T: "t", "̈": "t", "ẗ": "t", "Ṫ": "t", "ṫ": "t", "Ţ": "t", "ţ": "t", "Ṭ": "t", "ṭ": "t", "Ț": "t", "ț": "t", "Ṱ": "t", "ṱ": "t", "Ṯ": "t", "ṯ": "t", "Ŧ": "t", "ŧ": "t", "Ⱦ": "t", "ⱦ": "t", "ᵵ": "t", "ƫ": "t", "Ƭ": "t", "ƭ": "t", "Ʈ": "t", "ʈ": "t", "ȶ": "t", "Ú": "u", "ú": "u", "Ù": "u", "ù": "u", "Ŭ": "u", "ŭ": "u", "Û": "u", "û": "u", "Ǔ": "u", "ǔ": "u", "Ů": "u", "ů": "u", "Ü": "u", "ü": "u", "Ǘ": "u", "ǘ": "u", "Ǜ": "u", "ǜ": "u", "Ǚ": "u", "ǚ": "u", "Ǖ": "u", "ǖ": "u", "Ű": "u", "ű": "u", "Ũ": "u", "ũ": "u", "Ṹ": "u", "ṹ": "u", "Ų": "u", "ų": "u", "Ū": "u", "ū": "u", "Ṻ": "u", "ṻ": "u", "Ủ": "u", "ủ": "u", "Ȕ": "u", "ȕ": "u", "Ȗ": "u", "ȗ": "u", "Ư": "u", "ư": "u", "Ứ": "u", "ứ": "u", "Ừ": "u", "ừ": "u", "Ữ": "u", "ữ": "u", "Ử": "u", "ử": "u", "Ự": "u", "ự": "u", "Ụ": "u", "ụ": "u", "Ṳ": "u", "ṳ": "u", "Ṷ": "u", "ṷ": "u", "Ṵ": "u", "ṵ": "u", "Ʉ": "u", "ʉ": "u", "Ṽ": "v", "ṽ": "v", "Ṿ": "v", "ṿ": "v", "Ʋ": "v", "ʋ": "v", "Ẃ": "w", "ẃ": "w", "Ẁ": "w", "ẁ": "w", "Ŵ": "w", "ŵ": "w", W: "w", "̊": "w", "ẘ": "w", "Ẅ": "w", "ẅ": "w", "Ẇ": "w", "ẇ": "w", "Ẉ": "w", "ẉ": "w", "Ẍ": "x", "ẍ": "x", "Ẋ": "x", "ẋ": "x", "Ý": "y", "ý": "y", "Ỳ": "y", "ỳ": "y", "Ŷ": "y", "ŷ": "y", Y: "y", "̊": "y", "ẙ": "y", "Ÿ": "y", "ÿ": "y", "Ỹ": "y", "ỹ": "y", "Ẏ": "y", "ẏ": "y", "Ȳ": "y", "ȳ": "y", "Ỷ": "y", "ỷ": "y", "Ỵ": "y", "ỵ": "y", "ʏ": "y", "Ɏ": "y", "ɏ": "y", "Ƴ": "y", "ƴ": "y", "Ź": "z", "ź": "z", "Ẑ": "z", "ẑ": "z", "Ž": "z", "ž": "z", "Ż": "z", "ż": "z", "Ẓ": "z", "ẓ": "z", "Ẕ": "z", "ẕ": "z", "Ƶ": "z", "ƶ": "z", "Ȥ": "z", "ȥ": "z", "ʐ": "z", "ʑ": "z", "Ⱬ": "z", "ⱬ": "z", "Ǯ": "z", "ǯ": "z", "ƺ": "z", "２": "2", "６": "6", "Ｂ": "B", "Ｆ": "F", "Ｊ": "J", "Ｎ": "N", "Ｒ": "R", "Ｖ": "V", "Ｚ": "Z", "ｂ": "b", "ｆ": "f", "ｊ": "j", "ｎ": "n", "ｒ": "r", "ｖ": "v", "ｚ": "z", "１": "1", "５": "5", "９": "9", "Ａ": "A", "Ｅ": "E", "Ｉ": "I", "Ｍ": "M", "Ｑ": "Q", "Ｕ": "U", "Ｙ": "Y", "ａ": "a", "ｅ": "e", "ｉ": "i", "ｍ": "m", "ｑ": "q", "ｕ": "u", "ｙ": "y", "０": "0", "４": "4", "８": "8", "Ｄ": "D", "Ｈ": "H", "Ｌ": "L", "Ｐ": "P", "Ｔ": "T", "Ｘ": "X", "ｄ": "d", "ｈ": "h", "ｌ": "l", "ｐ": "p", "ｔ": "t", "ｘ": "x", "３": "3", "７": "7", "Ｃ": "C", "Ｇ": "G", "Ｋ": "K", "Ｏ": "O", "Ｓ": "S", "Ｗ": "W", "ｃ": "c", "ｇ": "g", "ｋ": "k", "ｏ": "o", "ｓ": "s", "ｗ": "w"
	};
	var normalize = function( term ) {
		var ret = "";
		for ( var i = 0; i < term.length; i++ ) {
			ret += accentMap[ term.charAt(i) ] || term.charAt(i);
		}
		return ret;
	};

	$('#mobile-pesquisa-input').on('keyup keypress', function(e) {
		var keyCode = e.keyCode || e.which;
		if (keyCode === 13) { 
			e.preventDefault();
			return false;
		}
	});
	
	$('#mobile-pesquisa-input').keyup(function(){
		var that = this, $allListElements = $('.mobile-list-items > li');
	    var $matchingListElements = $allListElements.filter(function(i, li){
	    	
	        var listItemText = normalize($(li).text()).toUpperCase(), searchText = normalize(that.value).toUpperCase();
	        return ~listItemText.indexOf(searchText);
	    });
	    
	    $allListElements.hide();
	    $matchingListElements.show();
	});
	
	$('#pesquisaEscola').on('keyup keypress', function(e) {
		var keyCode = e.keyCode || e.which;
		if (keyCode === 13) { 
			e.preventDefault();
			return false;
		}
	});
	
	$('#pesquisaEscola').keyup(function(){
		var that = this, $allListElements = $('.pesquisa-lista > li');
	    var $matchingListElements = $allListElements.filter(function(i, li){
	    	
	        var listItemText = normalize($(li).text()).toUpperCase(), searchText = normalize(that.value).toUpperCase();
	        return ~listItemText.indexOf(searchText);
	    });
	    
	    $allListElements.hide();
	    $matchingListElements.show();
	});
	
	$('#pesquisaCompare').on('keyup keypress', function(e) {
		var keyCode = e.keyCode || e.which;
		if (keyCode === 13) { 
			e.preventDefault();
			return false;
		}
	});
	
	$('#pesquisaCompare').keyup(function(){
		var that = this, $allListElements = $('.compare-lista > li');
	    var $matchingListElements = $allListElements.filter(function(i, li){
	    	
	        var listItemText = normalize($(li).text()).toUpperCase(), searchText = normalize(that.value).toUpperCase();
	        return ~listItemText.indexOf(searchText);
	    });
	    
	    $allListElements.hide();
	    $matchingListElements.show();
	});
});

//ABRE ESCOLA DA PESQUISA
function abreEscola(id, nome){
	escId = id;
	escNome = nome;
	$("#"+id).click();
}

//ABRE SITE ANDRÉ RÉGIS
function abreSiteAndre(){
	window.open('http://www.andreregis.com.br', '_blank');
};

//ABRE INSTAGRAM ANDRÉ RÉGIS
function abreInstagram(){
	window.open('http://www.instagram.com/andreregis1', '_blank');
};

//ABRE SITE RAIO-X DAS CRECHES
function abreSiteCreches(){
	window.open('http://www.raioxdasescolas.com.br/raiox/creches', '_self');
};

//TEMPORIZADOR DA ANIMAÇÃO DO LOGO
setInterval(function(){
		$("#flip").flip('toggle');
	}, 20000);

//ORDENA ESCOLAS
function ordenaEscolas() {
	var listaComp = $('.compare-lista');
	var listaitems = listaComp.children('li').get();
	listaitems.sort(function(a, b) {
	   return $(a).text().toUpperCase().localeCompare($(b).text().toUpperCase());
	})
	$.each(listaitems, function(idx, itm) { listaComp.append(itm); });
};

function enviaForm(){
	$("#sending").show();
	$("#sendButton").text("ENVIANDO");
	if($("#contNome").val() != "" && $("#contEmail").val() != "" && $("#contAssunto").val() != "" && $("#contMensagem").val() != ""){
		var data = {};
		data["nome"] = $("#contNome").val();
		data["email"] = $("#contEmail").val();
		data["escola"] = $("#contEscola").val();
		data["assunto"] = $("#contAssunto").val();
		data["mensagem"] = 	$("#contMensagem").val();
		$.ajax({
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			type: 'POST',
			async: false,
			url: 'sendMail',
				data: JSON.stringify(data),
				success: function (data){
					if(data === true){
						swal("Formulário enviado!", "Em breve iremos retornar o contato", "success")
					} else {
						swal("Erro inesperado!", "Alguma coisa aconteceu", "error");
					}
					$("#contNome").val("");
					$("#contEmail").val("");
					$("#contEscola").val("");
					$("#contAssunto").val("");
					$("#contMensagem").val("");
					$("#sending").hide();
					$("#sendButton").text("ENVIAR");
					fechaPaineis();
				},
				error: function (callback) {
					console.log(callback);
				}
			});
	} else {
		$("#sending").hide();
		$("#sendButton").text("ENVIAR");
		swal("Formulário incompleto!", "Antes de enviar, preencha todos os campos", "error");
	}
}

function fechaLayers(){
	$('#layers-options').hide();
}

function changeLayer(layer){
	if(layer == 'rpas'){
		if($('#rpasLayer').hasClass('layer-active')){
			$('#rpasLayer').removeClass('layer-active');
		} else {
			$('#rpasLayer').addClass('layer-active');
			$('#bairrosLayer').removeClass('layer-active');
		}
	} else if(layer == 'bairros'){
		if($('.layers-bairros').hasClass('layer-active')){
			$('.layers-bairros').removeClass('layer-active');
		} else {
			$('.layers-rpas').removeClass('layer-active');
			$('.layers-bairros').addClass('layer-active');
		}
	} else if(layer == 'escolas'){
		if($('.layers-escolas').hasClass('layer-active')){
			$('.layers-escolas').removeClass('layer-active');
		} else {
			$('.layers-calor').removeClass('layer-active');
			$('.layers-escolas').addClass('layer-active');
		}
	} else if(layer == 'calor'){
		if($('.layers-calor').hasClass('layer-active')){
			$('.layers-calor').removeClass('layer-active');
		} else {
			$('.layers-calor').addClass('layer-active');
			$('.layers-escolas').removeClass('layer-active');
		}
	}
}

function changeIniciais(){
	if($('#btnIniciais').hasClass('not-active')){
		$('#btnIniciais').removeClass('not-active');
		anosIni = true;
	} else {
		$('#btnIniciais').addClass('not-active');
		anosIni = false;
	}
	plotAnos();
};

function changeFinais(){
	if($('#btnFinais').hasClass('not-active')){
		$('#btnFinais').removeClass('not-active');
		anosFin = true;
	} else {
		$('#btnFinais').addClass('not-active');
		anosFin = false;
	}
	plotAnos();
};

function plotAnos(){
	if($(".painel-filtro").hasClass("isActive")){
		fechaPainelFiltro();
	}
	map.removeLayer(escolasLayer);
	escolasLayer = L.geoJSON().addTo(map);
	escolasLayer.addData(escolasData);
	if(anosIni && anosFin){
		
	} else if(anosIni){
		escolasLayer.eachLayer(function(marker) {
			if(marker.feature.properties.FundI == true){
			} else {
				map.removeLayer(marker);
			}
		});
	} else if(anosFin){
		escolasLayer.eachLayer(function(marker) {
			if(marker.feature.properties.FundII == true){
			} else {
				map.removeLayer(marker);
			}
		});
	}
	removePins();
	escolasList = [];
	escolasListCompare = [];
	changeMarkers();
}