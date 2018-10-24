function loadEscolaMobile(id, nome, endereco) {
	if(lista){
		fechaPainelMobile('lista');
	}
	$('.map-container-loading').addClass('loading-show');
	$('.escola-mobile-nome').html(nome);
	$('.escola-mobile-endereco').html(endereco);
	$(".fiscalizacao-datas li").remove();
	$(".fiscalizacao-datas-mobile ul li").remove();
	getEscolaMobileInfo(id).then(function(result) {
		abrePainelMobile('escola');
	});
}

function getEscolaMobileInfo(id){
	return new Promise(function (resolve, reject) {
		setTimeout(function() {
			regionFill = 0;
			removeAllRpaLayers();
			setAllRpaLayers();
			$('#'+id).click();
			consultaDadosIdebMobile(id);
			consultaProvaBrasilMobile(id);
			consultaVisitas(id);
			
			resolve()
		}, 500);
	});
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
			try {
				if(data.escola.requerimentos != null){
					$(".fiscalicazaoRequerimento a").attr('href', data.escola.requerimentos);
					$(".fiscalicazaoRequerimento").css('display', 'block');
					$(".fiscalicazaoRequerimento a").css('display', 'inline-block');
				} else {
					$(".fiscalicazaoRequerimento").css('display', 'none');
				}
				
			} catch (e) {
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
	
	updateGraficoIdebMobile(data);
}

function updateGraficoIdebMobile(data, colorIni, colorFin){
	var chartDataIni = [{
			time: '2005',
			value: trataNotas(data.did_meta_2005_ini),
			type: 'Meta'
		}, {
			time: '2007',
			value: trataNotas(data.did_meta_2007_ini),
			type: 'Meta'
		}, {
			time: '2009',
			value: trataNotas(data.did_meta_2009_ini),
			type: 'Meta'
		}, {
			time: '2011',
			value: trataNotas(data.did_meta_2011_ini),
			type: 'Meta'
		}, {
			time: '2013',
			value: trataNotas(data.did_meta_2013_ini),
			type: 'Meta'
		}, {
			time: '2015',
			value: trataNotas(data.did_meta_2015_ini),
			type: 'Meta'
		}, {
			time: '2017',
			value: trataNotas(data.did_meta_2017_ini),
			type: 'Meta'
		}, {
			time: '2019',
			value: trataNotas(data.did_meta_2019_ini),
			type: 'Meta'
		}, {
			time: '2021',
			value: trataNotas(data.did_meta_2021_ini),
			type: 'Meta'
		}, {
			time: '2005',
			value: trataNotas(data.did_ideb_2005_ini),
			type: 'Nota'
		}, {
			time: '2007',
			value: trataNotas(data.did_ideb_2007_ini),
			type: 'Nota'
		}, {
			time: '2009',
			value: trataNotas(data.did_ideb_2009_ini),
			type: 'Nota'
		}, {
			time: '2011',
			value: trataNotas(data.did_ideb_2011_ini),
			type: 'Nota'
		}, {
			time: '2013',
			value: trataNotas(data.did_ideb_2013_ini),
			type: 'Nota'
		}, {
			time: '2015',
			value: trataNotas(data.did_ideb_2015_ini),
			type: 'Nota'
		}, {
			time: '2017',
			value: trataNotas(data.did_ideb_2017_ini),
			type: 'Nota'
		}, {
			time: '2019',
			value: trataNotas(data.did_ideb_2019_ini),
			type: 'Nota'
		}, {
			time: '2021',
			value: trataNotas(data.did_ideb_2021_ini),
			type: 'Nota'
		}
	];
	
	var chartDataFin = [{
			time: '2005',
			value: trataNotas(data.did_meta_2005_fin),
			type: 'Meta'
		}, {
			time: '2007',
			value: trataNotas(data.did_meta_2007_fin),
			type: 'Meta'
		}, {
			time: '2009',
			value: trataNotas(data.did_meta_2009_fin),
			type: 'Meta'
		}, {
			time: '2011',
			value: trataNotas(data.did_meta_2011_fin),
			type: 'Meta'
		}, {
			time: '2013',
			value: trataNotas(data.did_meta_2013_fin),
			type: 'Meta'
		}, {
			time: '2015',
			value: trataNotas(data.did_meta_2015_fin),
			type: 'Meta'
		}, {
			time: '2017',
			value: trataNotas(data.did_meta_2017_fin),
			type: 'Meta'
		}, {
			time: '2019',
			value: trataNotas(data.did_meta_2019_fin),
			type: 'Meta'
		}, {
			time: '2021',
			value: trataNotas(data.did_meta_2021_fin),
			type: 'Meta'
		}, {
			time: '2005',
			value: trataNotas(data.did_ideb_2005_fin),
			type: 'Nota'
		}, {
			time: '2007',
			value: trataNotas(data.did_ideb_2007_fin),
			type: 'Nota'
		}, {
			time: '2009',
			value: trataNotas(data.did_ideb_2009_fin),
			type: 'Nota'
		}, {
			time: '2011',
			value: trataNotas(data.did_ideb_2011_fin),
			type: 'Nota'
		}, {
			time: '2013',
			value: trataNotas(data.did_ideb_2013_fin),
			type: 'Nota'
		}, {
			time: '2015',
			value: trataNotas(data.did_ideb_2015_fin),
			type: 'Nota'
		}, {
			time: '2017',
			value: trataNotas(data.did_ideb_2017_fin),
			type: 'Nota'
		}, {
			time: '2019',
			value: trataNotas(data.did_ideb_2019_fin),
			type: 'Nota'
		}, {
			time: '2021',
			value: trataNotas(data.did_ideb_2021_fin),
			type: 'Nota'
		}
	];

	if(testaIdebIni(data)){
		renderMobileIdebChart(chartDataIni, 'mobile-ideb-ini-grafico', colorIni);
	}
	
	if(testaIdebFin(data)){
		renderMobileIdebChart(chartDataFin, 'mobile-ideb-fin-grafico', colorFin);
	}
}

function renderMobileIdebChart(data, periodo, color){
	var chart = new F2.Chart({
		id: periodo,
		pixelRatio: window.devicePixelRatio
	});
	chart.source(data, {
		value: {
			nice: false,
			min: 2,
			max: 7,
			tickCount: 6
		}
	});
	chart.scale('time', {
		tickCount: 5
	});
	chart.axis('time');
	chart.axis('value');

	chart.tooltip({
		showCrosshairs: true,
		custom: true,
		onChange: function onChange(obj) {
			var legend = chart.get('legendController').legends.top[0];
			var tooltipItems = obj.items;
			var legendItems = legend.items;
			var map = {};
			legendItems.map(function(item) {
				map[item.name] = _.clone(item);
			});
			tooltipItems.map(function(item) {
				var name = item.name;
				var value = item.value;
				if (map[name]) {
					map[name].value = value;
				}
			});
			legend.setItems(_.values(map));
		},
		onHide: function onHide() {
			var legend = chart.get('legendController').legends.top[0];
			legend.setItems(chart.getLegendItems().type);
		}
	});
	chart.area().position('time*value').color('type', function(val) {
		if (val === 'Nota') {
	        return color;
	      } else if (val === 'Meta') {
		        return '#808080';
	      }
	    }).shape('smooth');
	chart.line().position('time*value').color('type', function(val) {
		if (val === 'Nota') {
	        return color;
	      } else if (val === 'Meta') {
		        return '#808080';
	      }
	    }).shape('smooth');
	chart.point().position('time*value').color('type', function(val) {
	    if (val === 'Nota') {
	        return color;
	      } else if (val === 'Meta') {
		        return '#808080';
	      }
	    }).style({
		stroke: '#fff',
		lineWidth: 1
	});
	chart.render();
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

		if(porc_aprend_lp_5 < '50'){
			if(porc_aprend_lp_5 < '1'){
				$('.port-ini-text').html('<strong>Nenhum dos alunos aprendeu adequadamente</strong>');
			} else {
				$('.port-ini-text').html('Apenas <strong>' + porc_aprend_lp_5 + '%</strong> dos alunos aprenderam adequadamente');
			}
		} else {
			$('.port-ini-text').html('<strong>'+porc_aprend_lp_5 + '%</strong> dos alunos aprenderam adequadamente');
		}
		fillAprendizadoChart('port-ini', porc_aprend_lp_5);
		
		if(porc_aprend_mt_5 < '50'){
			if(porc_aprend_mt_5 < '1'){
				$('.mat-ini-text').html('<strong>Nenhum dos alunos aprendeu adequadamente</strong>');
			} else {
				$('.mat-ini-text').html('Apenas <strong>' + porc_aprend_mt_5 + '%</strong> dos alunos aprenderam adequadamente');
			}
		} else {
			$('.mat-ini-text').html('<strong>'+porc_aprend_mt_5 + '%</strong> dos alunos aprenderam adequadamente');
		}
		fillAprendizadoChart('mat-ini', porc_aprend_mt_5);
	}
	
	if(porc_aprend_lp_9 != null){
		$('.aprendizado-port-fin').show();
		$('.aprendizado-mat-fin').show();
		if(porc_aprend_lp_9 < '50'){
			if(porc_aprend_lp_9 < '1'){
				$('.port-fin-text').html('<strong>Nenhum dos alunos aprendeu adequadamente</strong>');
			} else {
				$('.port-fin-text').html('Apenas <strong>' + porc_aprend_lp_9 + '%</strong> dos alunos aprenderam adequadamente');
			}
		} else {
			$('.port-fin-text').html('<strong>'+porc_aprend_lp_9 + '%</strong> dos alunos aprenderam adequadamente');
		}
		fillAprendizadoChart('port-fin', porc_aprend_lp_9);
		
		if(porc_aprend_mt_9 < '50'){
			if(porc_aprend_mt_9 < '1'){
				$('.mat-fin-text').html('<strong>Nenhum dos alunos aprendeu adequadamente</strong>');
			} else {
				$('.mat-fin-text').html('Apenas <strong>' + porc_aprend_mt_9 + '%</strong> dos alunos aprenderam adequadamente');
			}
		} else {
			$('.mat-fin-text').html('<strong>'+porc_aprend_mt_9 + '%</strong> dos alunos aprenderam adequadamente');
		}
		fillAprendizadoChart('mat-fin', porc_aprend_mt_9);
	}
}

function fillAprendizadoChart(targetClass,  grade){
	for (var i = 0; i < Math.ceil(grade/10)*2; i++) {
		$('.'+targetClass+'-grafico' + ' #'+targetClass+'-circle-'+i).addClass('aprendizado-'+Math.ceil(grade/10));
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