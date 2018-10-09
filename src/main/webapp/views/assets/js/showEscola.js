function loadEscolaMobile(id, nome, endereco) {
	if(lista){
		fechaPainelMobile('lista');
	}
    $('.map-container-loading').addClass('loading-show');
    $('.escola-mobile-nome').html(nome);
    $('.escola-mobile-endereco').html(endereco);
    $(".fiscalizacao-datas li").remove();
	$(".fiscalizacao-datas-mobile ul li").remove();
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
			$('.aprendizado-port-ini').hide();
			$('.aprendizado-mat-ini').hide();
			$('.aprendizado-port-fin').hide();
			$('.aprendizado-mat-fin').hide();
			$('.mobile-aprendizado').hide();
			$('.escola-mobile-aprendizado').hide();
			$('.aprendizado-grafico > span').removeAttr('class');
			updateAprendizadoMobile(data);
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

function updateAprendizadoMobile(data){
	var porc_aprend_lp_5, porc_aprend_mt_5, porc_aprend_lp_9, porc_aprend_mt_9;

	if(data.porc_2017_lp_5 != null || data.porc_2017_lp_9 != null){
		$('.mobile-aprendizado').show();
		$('.mobile-aprendizado').text('Nível do aprendizado (2017)');
		$('.escola-mobile-aprendizado').show();
		porc_aprend_lp_5 = data.porc_2017_lp_5;
		porc_aprend_mt_5 = data.porc_2017_mt_5;
		porc_aprend_lp_9 = data.porc_2017_lp_9;
		porc_aprend_mt_9 = data.porc_2017_mt_9;
		porc_ano = 2017;
	} else if(data.porc_2015_lp_5 != null || data.porc_2015_lp_9 != null){
		$('.mobile-aprendizado').show();
		$('.mobile-aprendizado').text('Nível do aprendizado (2015)');
		$('.escola-mobile-aprendizado').show();
		porc_aprend_lp_5 = data.porc_2015_lp_5;
		porc_aprend_mt_5 = data.porc_2015_mt_5;
		porc_aprend_lp_9 = data.porc_2015_lp_9;
		porc_aprend_mt_9 = data.porc_2015_mt_9;
	}
	
	if(porc_aprend_lp_5 != null) {
		$('.aprendizado-port-ini').show();
		$('.aprendizado-mat-ini').show();

		if(porc_aprend_lp_5 < '60'){
			$('.port-ini-text').text('Apenas ' + porc_aprend_lp_5 + '% dos alunos aprenderam adequadamente');
		} else {
			$('.port-ini-text').text(porc_aprend_lp_5 + '% dos alunos aprenderam adequadamente');
		}
		fillAprendizadoChart('port-ini', porc_aprend_lp_5.toString().slice(0, -1));
		
		if(porc_aprend_mt_5 < '60'){
			$('.mat-ini-text').text('Apenas ' + porc_aprend_mt_5 + '% dos alunos aprenderam adequadamente');
		} else {
			$('.mat-ini-text').text(porc_aprend_mt_5 + '% dos alunos aprenderam adequadamente');
		}
		fillAprendizadoChart('mat-ini', porc_aprend_mt_5.toString().slice(0, -1));
	} else if (porc_aprend_lp_9 != null){
		$('.aprendizado-port-fin').show();
		$('.aprendizado-mat-fin').show();
		if(porc_aprend_lp_9 < '60'){
			$('.port-fin-text').text('Apenas ' + porc_aprend_lp_9 + '% dos alunos aprenderam adequadamente');
		} else {
			$('.port-fin-text').text(porc_aprend_lp_9 + '% dos alunos aprenderam adequadamente');
		}
		fillAprendizadoChart('port-fin', porc_aprend_lp_9.toString().slice(0, -1));
		
		if(porc_aprend_mt_9 < '60'){
			$('.mat-fin-text').text('Apenas ' + porc_aprend_mt_9 + '% dos alunos aprenderam adequadamente');
		} else {
			$('.mat-fin-text').text(porc_aprend_mt_9 + '% dos alunos aprenderam adequadamente');
		}
		fillAprendizadoChart('mat-fin', porc_aprend_mt_9.toString().slice(0, -1));
	}
}

function fillAprendizadoChart(targetClass,  grade){
	for (var i = 0; i < (grade*2)+1; i++) {
		$('.'+targetClass+'-grafico' + ' #'+targetClass+'-circle-'+i).addClass('aprendizado-'+grade);
	}
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