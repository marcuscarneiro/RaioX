function loadEscolaMobile(id, nome, endereco) {
	if(lista){
		fechaPainelMobile('lista');
	}
    $('.map-container-loading').addClass('loading-show');
    $('.escola-mobile-nome').html(nome);
    $('.escola-mobile-endereco').html(endereco);
    getEscolaMobileInfo(id);
}

function getEscolaMobileInfo(id){
	setTimeout(function() {
		regionFill = 0;
		removeAllRpaLayers();
		setAllRpaLayers();
		$('#'+id).click();
    	consultaDadosIdebMobile(id);
		consultaProvaBrasilMobile(id);
		consultaVisitas(id);
		abrePainelMobile('escola');
    }, 2000);
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
				updateIdeb(data);
			} else {
				idebVazio();
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
	
//	updateGraficoIdeb(data);
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

L.Map.prototype.panToOffset = function (latlng, offset, options) {
    var x = this.latLngToContainerPoint(latlng).x - offset[0]
    var y = this.latLngToContainerPoint(latlng).y - offset[1]
    var point = this.containerPointToLatLng([x, y])
    return this.setView(point, this._zoom, { pan: options })
}

L.Map.prototype.setViewOffset = function (latlng, offset, targetZoom) {
    var targetPoint = this.project(latlng, targetZoom).subtract(offset),
    targetLatLng = this.unproject(targetPoint, targetZoom);
    return this.setView(targetLatLng, targetZoom);
}