function loadEscolaMobile(id, nome) {
	if(lista){
		fechaPainelMobile('lista');
	}
    $('.map-container-loading').addClass('loading-show');
    $('.escola-mobile-nome').text(nome);
    getEscolaMobileInfo();
}

function getEscolaMobileInfo(){
	setTimeout(function() {
    	consultaDadosIdebMobile(id);
		consultaProvaBrasilMobile(id);
		consultaVisitas(id);
        $('.map-container-loading').removeClass('loading-show');
    }, 0).then(showEscolaMobile);
}

function showEscolaMobile(){
	$('.painel-escola-mobile').addClass('escola-show');
}

function consultaDadosIdebMobile(id){
	$.ajax({
		url: 'consultaDadosIdeb',
		type: "POST",
		data: JSON.stringify({ id: id }),
		contentType: 'application/json',
		async: false,
		success: function(data) {
			if(data.did_ideb_2017_ini != null || data.did_ideb_2017_fin != null){
				updateIdebMobile(data);
			} else {
				idebVazioMobile();
			}
			
			if(data.escola.requerimentos != null){
				$(".fiscalicazaoRequerimento a").attr('href', data.escola.requerimentos);
				$(".fiscalicazaoRequerimento").css('display', 'block');
				$(".fiscalicazaoRequerimento a").css('display', 'inline-block');
			} else {
				$(".fiscalicazaoRequerimento").css('display', 'none');
			}
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

function updateIdebMobile(data){
	var notasIniciais = null, metasIniciais = "-", notasFinais = null, metasFinais = "-";

	// NOTAS INICIAIS
	if(data.did_ideb_2017_ini != null){
		notasIniciais = data.did_ideb_2017_ini;
		metasIniciais = data.did_meta_2017_ini;
	}
	
	// NOTAS FINAIS
	if(data.did_ideb_2017_fin != null){
		notasFinais = data.did_ideb_2017_fin;
		metasFinais = data.did_meta_2017_fin;
	}
	
	// TO-DO UPDATE INFORMAÇÕES
	
	updateGraficoIdeb(data);
}

function idebVazio(){
	// TO-DO LIMPAR E ESCONDER DIVS
}

function consultaProvaBrasilMobile(id){
	$.ajax({
		url: 'consultaProvaBrasil',
		type: "POST",
		data: JSON.stringify({ id: id }),
		contentType: 'application/json',
		success: function(data) {
			updateAprendizadoMobile(data);
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

function updateAprendizadoMobile(data){
	var porc_aprend_lp_5, porc_aprend_mt_5, porc_aprend_lp_9, porc_aprend_mt_9;

	if(data.porc_2017_lp_5 != null){
		porc_aprend_lp_5 = data.porc_2017_lp_5;
		porc_aprend_mt_5 = data.porc_2017_mt_5;
		porc_aprend_lp_9 = data.porc_2017_lp_9;
		porc_aprend_mt_9 = data.porc_2017_mt_9;
	}
	
	// TO-DO EXIBIR OU ESCONDER INFORMAÇÕES
	// PREENCHER OU LIMPAR GRÁFICOS DE BOLINHAS
}