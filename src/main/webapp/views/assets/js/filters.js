var filter, selectedFilters = [], filtroMeta = [], filtroNovas = [], filtroEvolucao = [], filtroNunca = [], filtroRecentes = [], filtroMelhorIdeb5 = [], filtroMelhorIdeb9 = [], filtroPiorIdeb5 = [], filtroPiorIdeb9 = [],
filtroMelhorProfPort5 = [], filtroPiorProfPort5 = [], filtroMelhorProfPort9 = [], filtroPiorProfPort9 = [], filtroMelhorProfMat5 = [], filtroPiorProfMat5 = [], filtroMelhorProfMat9 = [], filtroPiorProfMat9 = [],
filtroQuadras = [], filtroAces = [];

$('.filtro-item').on('click', function(){
	clickFiltro(this);
});

$('.filtro-grupos').on('click', function(){
	clickFiltro(this);
});

function clickFiltro(that){
	actualMarker = undefined;
	
	if($(that).data('filter') === 'periodo'){
		filter = 'periodo';
	} else {
		if($.inArray($(that).data('filter'), selectedFilters) != -1){
			if($(that).data('filter') === 'recentes'){
				$("#periodo-ini").val('');
				$("#periodo-fim").val('');
				$(".filtro-periodo div").hide();
				$(".filtro-periodo span").hide();
				$(".filtro-periodo button").hide();
			}
			filter = 'null';
		} else {
			if($(that).data('filter') === 'recentes'){
				$(".filtro-periodo div").show();
				$(".filtro-periodo span").show();
				$(".filtro-periodo button").show();
			}
			selectedFilters.push($(that).data('filter'));
			filter = $(that).data('filter');
		}
	}
	
	if ($(".filtro-item:checked").length == 0 && $(".filtro-grupos:checked").length == 0) {
		selectedFilters = [];
		recarregaMapa();
	} else {
		if(filter === 'null'){
			updateSelectedFilters();
			map.removeLayer(escolasLayer);
			escolasLayer = L.mapbox.featureLayer().addTo(map);
			escolasLayer.setGeoJSON(escolasData);
		}
		if ($.inArray('meta', selectedFilters) != -1){
			filtraMeta('meta');
		}
		if ($.inArray('novas', selectedFilters) != -1){
			filtraNova('novas');
		}
		if ($.inArray('evolucao', selectedFilters) != -1){
			filtraEvolucao('evolucao');
		}
		if ($.inArray('nunca', selectedFilters) != -1){
			filtraNunca('nunca');
		} 
		if ($.inArray('recentes', selectedFilters) != -1){
			filtraRecentes('recentes');
		} 
		if ($.inArray('melhorIdeb5', selectedFilters) != -1){
			filtraMelhorIdeb5('melhorIdeb5');
		}
		if ($.inArray('piorIdeb5', selectedFilters) != -1){
			filtraPiorIdeb5('piorIdeb5');
		}
		if ($.inArray('melhorIdeb9', selectedFilters) != -1){
			filtraMelhorIdeb9('melhorIdeb9');
		}
		if ($.inArray('piorIdeb9', selectedFilters) != -1){
			filtraPiorIdeb9('piorIdeb9');
		}
		if ($.inArray('melhorProfPort5', selectedFilters) != -1){
			filtraMelhorProfPort5('melhorProfPort5');
		}
		if ($.inArray('piorProfPort5', selectedFilters) != -1){
			filtraPiorProfPort5('piorProfPort5');
		}
		if ($.inArray('melhorProfPort9', selectedFilters) != -1){
			filtraMelhorProfPort9('melhorProfPort9');
		}
		if ($.inArray('piorProfPort9', selectedFilters) != -1){
			filtraPiorProfPort9('piorProfPort9');
		}
		if ($.inArray('melhorProfMat5', selectedFilters) != -1){
			filtraMelhorProfMat5('melhorProfMat5');
		}
		if ($.inArray('piorProfMat5', selectedFilters) != -1){
			filtraPiorProfMat5('piorProfMat5');
		}
		if ($.inArray('melhorProfMat9', selectedFilters) != -1){
			filtraMelhorProfMat9('melhorProfMat9');
		}
		if ($.inArray('piorProfMat9', selectedFilters) != -1){
			filtraPiorProfMat9('piorProfMat9');
		}
		if ($.inArray('quadras', selectedFilters) != -1){
			filtraQuadras('quadras');
		}
		if ($.inArray('aces', selectedFilters) != -1){
			filtraAcessibilidade('aces');
		}
	}
	
	mudaLegenda(selectedFilters[selectedFilters.length-1]);
	
	if($(window).width() <= 1024){
		fechaPainelFiltro();
	}
};

function filtraMeta(filter){
	escolasLayer.eachLayer(function(marker) {
		if(marker.feature.properties.ATINGIUMETA == true){
		} else {
			map.removeLayer(marker);
		}
	});
	removePins();
	escolasList = [];
	escolasListCompare = [];
	modo = 'meta';
	changeMarkers();
}

function filtraNova(filter){
	escolasLayer.eachLayer(function(marker) {
		if(marker.feature.properties.Nova == "true"){
		} else {
			map.removeLayer(marker);
		}
	});
	removePins();
	escolasList = [];
	escolasListCompare = [];
	modo = 'novas';
	changeMarkers();
}

function filtraEvolucao(filter){
	escolasLayer.eachLayer(function(marker) {
		if(marker.feature.properties.Evolucao == "true"){
		} else {
			map.removeLayer(marker);
		}
	});
	removePins();
	escolasList = [];
	escolasListCompare = [];
	modo = 'evolucao';
	changeMarkers();
}

function filtraNunca(filter){
	escolasLayer.eachLayer(function(marker) {
		if(marker.feature.properties.NuncaAtingiu == "true"){
		} else {
			map.removeLayer(marker);
		}
	});
	removePins();
	escolasList = [];
	escolasListCompare = [];
	modo = 'nunca';
	changeMarkers();
}

function filtraRecentes(filter){
	if($("#periodo-ini").val() != "" || $("#periodo-fim").val() != ""){
		var recIni, recFim;
		
		if($("#periodo-ini").val() != ""){
			var d = new Date($("#periodo-ini").val().split("/").reverse().join("-"));
			var dd = d.getDate();
			var mm = d.getMonth()+1;
			var yy = d.getFullYear();
			var recIni = yy + "-" + mm + "-" + dd;
		} else {
			recIni = 'null';
		}
		
		if($("#periodo-fim").val() != ""){
			var d = new Date($("#periodo-fim").val().split("/").reverse().join("-"));
			var dd = d.getDate();
			var mm = d.getMonth()+1;
			var yy = d.getFullYear();
			var recFim = yy + "-" + mm + "-" + dd;
		} else {
			recFim = 'null';
		}
		
		$.ajax({
			url: 'consultaRecentes',
			type: "POST",
			data: {
				"ini" : recIni,
				"fim" : recFim
			},
			contentType: 'application/json',
			dataType: 'json',
			success: function(data) {
				filtroRecentes = [];
				if(data != null){
					$.each(data.features, function(i, escola){
						filtroRecentes.push(escola.properties.ID);
					});
				}
				removeFilterLayers(filtroRecentes);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	}
}

function filtraMelhorIdeb5(filter){
	if(filtroMelhorIdeb5.length === 0){
		$.ajax({
			url: 'melhorIdeb5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroMelhorIdeb5.push(escola.properties.ID);
				});
				removeFilterLayers(filtroMelhorIdeb5);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroMelhorIdeb5);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraPiorIdeb5(filter){
	if(filtroPiorIdeb5.length === 0){
		$.ajax({
			url: 'piorIdeb5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroPiorIdeb5.push(escola.properties.ID);
				});
				removeFilterLayers(filtroPiorIdeb5);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroPiorIdeb5);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraMelhorIdeb9(filter){
	if(filtroMelhorIdeb9.length === 0){
		$.ajax({
			url: 'melhorIdeb9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroMelhorIdeb9.push(escola.properties.ID);
				});
				removeFilterLayers(filtroMelhorIdeb9);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroMelhorIdeb9);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraPiorIdeb9(filter){
	if(filtroPiorIdeb9.length === 0){
		$.ajax({
			url: 'piorIdeb9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroPiorIdeb9.push(escola.properties.ID);
				});
				removeFilterLayers(filtroPiorIdeb9);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroPiorIdeb9);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraMelhorProfPort5(filter){
	if(filtroMelhorProfPort5.length === 0){
		$.ajax({
			url: 'melhorProfPort5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroMelhorProfPort5.push(escola.properties.ID);
				});
				removeFilterLayers(filtroMelhorProfPort5);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroMelhorProfPort5);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraPiorProfPort5(filter){
	if(filtroPiorProfPort5.length === 0){
		$.ajax({
			url: 'piorProfPort5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroPiorProfPort5.push(escola.properties.ID);
				});
				removeFilterLayers(filtroPiorProfPort5);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroPiorProfPort5);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraMelhorProfPort9(filter){
	if(filtroMelhorProfPort9.length === 0){
		$.ajax({
			url: 'melhorProfPort9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroMelhorProfPort9.push(escola.properties.ID);
				});
				removeFilterLayers(filtroMelhorProfPort9);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroMelhorProfPort9);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraPiorProfPort9(filter){
	if(filtroPiorProfPort9.length === 0){
		$.ajax({
			url: 'piorProfPort9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroPiorProfPort9.push(escola.properties.ID);
				});
				removeFilterLayers(filtroPiorProfPort9);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroPiorProfPort9);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraMelhorProfMat5(filter){
	if(filtroMelhorProfMat5.length === 0){
		$.ajax({
			url: 'melhorProfMat5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroMelhorProfMat5.push(escola.properties.ID);
				});
				removeFilterLayers(filtroMelhorProfMat5);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroMelhorProfMat5);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraPiorProfMat5(filter){
	if(filtroPiorProfMat5.length === 0){
		$.ajax({
			url: 'piorProfMat5',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroPiorProfMat5.push(escola.properties.ID);
				});
				removeFilterLayers(filtroPiorProfMat5);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroPiorProfMat5);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraMelhorProfMat9(filter){
	if(filtroMelhorProfMat9.length === 0){
		$.ajax({
			url: 'melhorProfMat9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroMelhorProfMat9.push(escola.properties.ID);
				});
				removeFilterLayers(filtroMelhorProfMat9);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroMelhorProfMat9);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraPiorProfMat9(filter){
	if(filtroPiorProfMat9.length === 0){
		$.ajax({
			url: 'piorProfMat9',
			type: "GET",
			dataType: 'json',
			success: function(data) {
				$.each(data.features, function(i, escola){
					filtroPiorProfMat9.push(escola.properties.ID);
				});
				removeFilterLayers(filtroPiorProfMat9);
				removePins();
				escolasList = [];
				escolasListCompare = [];
				modo = 'ideb';
				changeMarkers();
			},
			error: function(xhr, ajaxOptions, thrownError){
			}
		});
	} else {
		removeFilterLayers(filtroPiorProfMat9);
		removePins();
		escolasList = [];
		escolasListCompare = [];
		modo = 'ideb';
		changeMarkers();
	}
}

function filtraQuadras(filter){
	escolasLayer.eachLayer(function(marker) {
		if(marker.feature.properties.POSSUIQUADRAS === 0 || marker.feature.properties.POSSUIQUADRAS === "null"){
			map.removeLayer(marker);
		}
	});
	removePins();
	escolasList = [];
	modo = 'quadras';
	personalizeMarkers(filter);
}

function filtraAcessibilidade(filter){
	escolasList = [];
	modo = 'acessibilidade';
	removePins();
	personalizeMarkers(filter);
}

function guardaIds(data){
	$.each(data.features, function(i, escola){
		filtrosIds.push(escola.properties.ID);
	});
}

function personalizeMarkers(filter){
	if(filter == 'meta'){
		escolasLayer.eachLayer(function(marker) {
			if(marker.feature.properties.ATINGIUMETA == true){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-' + marker.feature.properties.COR + '.png',
					iconSize: [15, 38]
				}));
			} else {
				map.removeLayer(marker);
			}
		});
	} else if (filter == 'novas'){
		escolasLayer.eachLayer(function(marker) {
			if(marker.feature.properties.Nova == true){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-' + marker.feature.properties.COR + '.png',
					iconSize: [15, 38]
				}));
			} else {
				map.removeLayer(marker);
			}
		});
	} else if (filter == 'quadras'){
		escolasLayer.eachLayer(function(marker) {
			escolasList.push({label: marker.feature.properties.Escola, value: marker.feature.properties.ID});
			if(marker.feature.properties.POSSUIQUADRA === 1){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-black.png',
					iconSize: [15, 38]
				}));
			} else if(marker.feature.properties.POSSUIQUADRA === 2){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-yellow.png',
					iconSize: [15, 38]
				}));
			} else if(marker.feature.properties.POSSUIQUADRA === 3){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-blue.png',
					iconSize: [15, 38]
				}));
			} else {
				map.removeLayer(marker);
			}
			
			return false;
		});

		escolasMouseOver();
		escolasMouseOut();
		escolasClick();
	} else if (filter == 'aces'){
		escolasLayer.eachLayer(function(marker) {
			
			escolasList.push({label: marker.feature.properties.Escola, value: marker.feature.properties.ID});
			if(marker.feature.properties.ACESSIBILIDADE === 2){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-yellow.png',
					iconSize: [15, 38]
				}));
			} else if(marker.feature.properties.ACESSIBILIDADE === 3){
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-blue.png',
					iconSize: [15, 38]
				}));
			} else {
				marker.setIcon(L.icon({
					iconUrl: contextPath + '/views/assets/css/img/s-black.png',
					iconSize: [15, 38]
				}));
			}
			
			return false;
		});

		escolasMouseOver();
		escolasMouseOut();
		escolasClick();
	}
}

function removeFilterLayers(arr){
	var others = $.grep(filtrosIds, function(value) {
	    return $.inArray(value, arr) < 0;
	});
	escolasLayer.eachLayer(function(marker) {
		$.each(others, function(i, esc){
			if(marker.feature.properties.ID == esc){
				map.removeLayer(marker);
			}
		})
	});
}

function updateSelectedFilters(){
	selectedFilters = [];
	$.each($('.filtro-item:checkbox:checked'), function(i, el){
		selectedFilters.push($(el).data('filter'));
	});
}

$("#periodo-ini").blur(function(){
	var parts = $(this).val().split("/");
	var dt = new Date(parseInt(parts[2], 10),
	                  parseInt(parts[1], 10) - 1,
	                  parseInt(parts[0], 10));
	if(dt-Date.parse(new Date())>0){
		swal("Atenção!", "A data precisa ser anterior a hoje", "error");
		$(this).val('');
	}
});

$("#periodo-fim").blur(function(){
	var fimParts = $(this).val().split("/");
	var fimDt = new Date(parseInt(fimParts[2], 10),
	                  parseInt(fimParts[1], 10) - 1,
	                  parseInt(fimParts[0], 10));
	var iniParts = $("#periodo-ini").val().split("/");
	var iniDt = new Date(parseInt(iniParts[2], 10),
	                  parseInt(iniParts[1], 10) - 1,
	                  parseInt(iniParts[0], 10));
	if($("#periodo-ini").val() != null){
		if(iniDt-fimDt>0){
			swal("Atenção!", "A data final precisa ser posterior à data inicial", "error");
			$(this).val('');
		}
	}
});