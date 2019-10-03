$(document).ready(function() {
	$('#saveMedicoes').on("click", function(e) {
		var medicoes = new Array(); 
		$(".ambiente :input").each(function() {
			medicoes.push($(this));
		}); 
        createJSON(medicoes);
  });
});

function createJSON(medicoes){
	var medicao = {
			ambiente: "",
			temperatura: "",
			luminosidade: ""
	};
	$(medicoes).each(function() {
		const ambiente = $(this).val();
		const ambienteid = $(this).attr('id');
		let position;
		if(ambienteid != 'undefined' && ambienteid != ""){
			position = ambienteid.substring(8, ambienteid.len);
			if(ambiente != 'undefined' && ambiente != ""){
				medicao.ambiente = ambiente;
				const temperatura = $("#temperatura"+position).val();
				if(temperatura != 'undefined' && temperatura != ""){
					medicao.temperatura = temperatura;
				}
				const luminosidade = $("#luminosidade"+position).val();
				if(luminosidade != 'undefined' && luminosidade != ""){
					medicao.luminosidade = luminosidade;
				}
			}
		}
		saveMedicao(medicao);
	});
}

function saveMedicao(medicao){
	$.ajax({
		type: "POST",
		url: "salvaMedicaoEscola",
		data: medicao
	});
}

function requestMedicoes(visid){
	$.ajax({
		url: 'listaMedicoesEscola',
		type: "POST",
		data: JSON.stringify({ id: visid }),
		contentType: 'application/json',
		success: function(data) {
			loadMedicoes(data);
		},
		error: function(xhr, ajaxOptions, thrownError){
		}
	});
}

function showMedicoes(data){
	
}

function addLine(data){
	if(data != 'undefined' && data != ""){
		$('#medicaoList').append(
				'<div id="medicao'+id+'" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">'+
					'<div class="form-group">'+
						'<label class="col-sm-6 control-label"><strong>Ambiente</strong></label>'+
						'<div class="col-sm-6">'+
							'<input id="ambiente'+id+'" type="text" class="form-control" />'+
						'</div>'+
					'</div>'+
					'<div class="form-group">'+
						'<label class="col-sm-3 control-label"><strong>Temperatura</strong></label>'+
						'<div class="col-sm-3">'+
							'<input id="temperatura'+id+'" type="text" class="form-control" />'+
						'</div>'+
					'</div>'+
					'<div class="form-group">'+
						'<label class="col-sm-3 control-label"><strong>Luminosidade</strong></label>'+
						'<div class="col-sm-3">'+
							'<input id="luminosidade'+id+'" type="text" class="form-control" />'+
						'</div>'+
					'</div>'+
				'</div>'
			);
	} else {
		
	}
}

function removeLine(){
	
}