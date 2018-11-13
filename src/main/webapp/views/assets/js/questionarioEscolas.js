function preencheQuestionario(visita){
	
	//ESPECIAIS
	
	var dateOri = visita.data;
	var dateAr = dateOri.split('-');
	var finalDate = dateAr[2] + '/' + dateAr[1] + '/' + dateAr[0];
	$("#data_visita .questao-info").html(finalDate);
	
	if(visita.sa5a != null){
		$("#sa5a .questao-info").html(visita.sa5a + ' lux');
		if(visita.sa5a < 200){
			$("#sa5a .questao-info").addClass('red-mark');
			$("#sa5a .questao-info").removeClass('grey-mark');
		} else {
			$("#sa5a .questao-info").removeClass('red-mark');
			$("#sa5a .questao-info").removeClass('grey-mark');
		}
	} else {
		$("#sa5a .questao-info").html("Sem informação");
		$("#sa5a .questao-info").addClass('grey-mark');
		$("#sa5a .questao-info").removeClass('red-mark');
	}
	
	if(visita.eef7 == "false" || visita.eef7 == "" || visita.eef7 == null){
		$("#eef7a").addClass('hidden-question');
	} else if(visita.eef7 == "true"){
		if(visita.eef7a == "true"){
			$("#eef7a .questao-info").html("Sim");
			$("#eef7a .questao-info").removeClass('red-mark');
			$("#eef7a .questao-info").removeClass('grey-mark');
			$("#eef7a").removeClass('hidden-question');
		} else if(visita.eef7a == "false"){
			$("#eef7a .questao-info").html("Não");
			$("#eef7a .questao-info").addClass('red-mark');
			$("#eef7a .questao-info").removeClass('grey-mark');
			$("#eef7a").removeClass('hidden-question');
		} else {
			$("#eef7a .questao-info").html("Sem informação");
			$("#eef7a .questao-info").addClass('grey-mark');
			$("#eef7a .questao-info").removeClass('red-mark');
			$("#eef7a").removeClass('hidden-question');
		}
	}
	
	if(visita.sa4a != null){
		$("#sa4a .questao-info").html(visita.sa4a + 'ºC');
		if(parseInt(visita.sa4a) < 23 || parseInt(visita.sa4a) > 26){
			$("#sa4a .questao-info").addClass('red-mark');
			$("#sa4a .questao-info").removeClass('grey-mark');
		} else {
			$("#sa4a .questao-info").removeClass('red-mark');
			$("#sa4a .questao-info").removeClass('grey-mark');
		}
	} else {
		$("#sa4a .questao-info").html("Sem informação");
		$("#sa4a .questao-info").addClass('grey-mark');
		$("#sa4a .questao-info").removeClass('red-mark');
	}
	
	if(visita.alim1 == 1){
		$("#alim1 .questao-info").html("Sala de aula");
		$("#alim1 .questao-info").addClass('red-mark');
		$("#alim1 .questao-info").removeClass('grey-mark');
	} else if(visita.alim1 == 2) {
		$("#alim1 .questao-info").html("Outros");
		$("#alim1 .questao-info").removeClass('red-mark');
		$("#alim1 .questao-info").addClass('grey-mark');
	} else if(visita.alim1 == 3){
		$("#alim1 .questao-info").html("Refeitório");
		$("#alim1 .questao-info").removeClass('red-mark');
		$("#alim1 .questao-info").removeClass('grey-mark');
	} else {
		$("#alim1 .questao-info").html("Sem informação");
		$("#alim1 .questao-info").removeClass('red-mark');
		$("#alim1 .questao-info").addClass('grey-mark');
	}
	
	if(visita.alim10 == '5'){
		$("#alim10 .questao-info").html("Sempre");
		$("#alim10 .questao-info").addClass('red-mark');
		$("#alim10 .questao-info").removeClass('grey-mark');
	} else if(visita.alim10 == '4'){
		$("#alim10 .questao-info").html("De vez em quando");
		$("#alim10 .questao-info").addClass('red-mark');
		$("#alim10 .questao-info").removeClass('grey-mark');
	} else if(visita.alim10 == '3'){
		$("#alim10 .questao-info").html("Indiferente");
		$("#alim10 .questao-info").removeClass('red-mark');
		$("#alim10 .questao-info").removeClass('grey-mark');
	} else if(visita.alim10 == '2'){
		$("#alim10 .questao-info").html("Raramente");
		$("#alim10 .questao-info").removeClass('red-mark');
		$("#alim10 .questao-info").removeClass('grey-mark');
	} else if(visita.alim10 == '1'){
		$("#alim10 .questao-info").html("Nunca");
		$("#alim10 .questao-info").removeClass('red-mark');
		$("#alim10 .questao-info").removeClass('grey-mark');
	} else {
		$("#alim10 .questao-info").html("Sem informação");
		$("#alim10 .questao-info").removeClass('red-mark');
		$("#alim10 .questao-info").addClass('grey-mark');
	}
	
	if(visita.situacao == 'proprio'){
		$("#situacao .questao-info").html("Próprio");
		$("#situacao .questao-info").removeClass('red-mark');
		$("#situacao .questao-info").removeClass('grey-mark');
	} else if(visita.situacao == 'cedido') {
		$("#situacao .questao-info").html("Cedido");
		$("#situacao .questao-info").removeClass('red-mark');
		$("#situacao .questao-info").removeClass('grey-mark');
	} else if(visita.situacao == 'alugado'){
		$("#situacao .questao-info").html("Alugado");
		$("#situacao .questao-info").addClass('red-mark');
		$("#situacao .questao-info").removeClass('grey-mark');
	} else {
		$("#situacao .questao-info").html("Sem informação");
		$("#situacao .questao-info").removeClass('red-mark');
		$("#situacao .questao-info").addClass('grey-mark');
	}
	
	if(visita.turnoVisita == 'manha'){
		$("#turnovisita .questao-info").html("Manhã");
		$("#turnovisita .questao-info").removeClass('grey-mark');
	} else if(visita.turnoVisita == 'tarde') {
		$("#turnovisita .questao-info").html("Tarde");
		$("#turnovisita .questao-info").removeClass('grey-mark');
	} else {
		$("#turnovisita .questao-info").html("Sem informação");
		$("#turnovisita .questao-info").addClass('grey-mark');
	}
	
	if(visita.sa4b != null){
		if(visita.sa4b < visita.sa2){
			$("#sa4b .questao-info").html(visita.sa4b);
			$("#sa4b .questao-info").addClass('red-mark');
			$("#sa4b .questao-info").removeClass('grey-mark');
		} else {
			$("#sa4b .questao-info").html(visita.sa4b);
			$("#sa4b .questao-info").removeClass('red-mark');
			$("#sa4b .questao-info").removeClass('grey-mark');
		}
	} else {
		$("#sa4b .questao-info").html("Sem informação");
		$("#sa4b .questao-info").addClass('grey-mark');
		$("#sa4b .questao-info").removeClass('red-mark');
	}
	
	if(visita.sa5b != null){
		if(visita.sa5b < visita.sa2){
			$("#sa5b .questao-info").html(visita.sa5b);
			$("#sa5b .questao-info").addClass('red-mark');
			$("#sa5b .questao-info").removeClass('grey-mark');
		} else {
			$("#sa5b .questao-info").html(visita.sa5b);
			$("#sa5b .questao-info").removeClass('red-mark');
			$("#sa5b .questao-info").removeClass('grey-mark');
		}
	} else {
		$("#sa5b .questao-info").html("Sem informação");
		$("#sa5b .questao-info").addClass('grey-mark');
		$("#sa5b .questao-info").removeClass('red-mark');
	}

	if(visita.sa6 != null){
		if(visita.sa6 < visita.sa2){
			$("#sa6 .questao-info").html(visita.sa6);
			$("#sa6 .questao-info").addClass('red-mark');
			$("#sa6 .questao-info").removeClass('grey-mark');
		} else {
			$("#sa6 .questao-info").html(visita.sa6);
			$("#sa6 .questao-info").removeClass('red-mark');
			$("#sa6 .questao-info").removeClass('grey-mark');
		}
	} else {
		$("#sa6 .questao-info").html("Sem informação");
		$("#sa6 .questao-info").addClass('grey-mark');
		$("#sa6 .questao-info").removeClass('red-mark');
	}
	
	if(visita.sa7 != null && visita.sa7 != ""){
		if(visita.sa6 < visita.sa2){
			var qtdClim = visita.sa2 - visita.sa6;
			if(visita.sa7 < qtdClim){
				$("#sa7 .questao-info").html(visita.sa7);
				$("#sa7 .questao-info").addClass('red-mark');
				$("#sa7 .questao-info").removeClass('grey-mark');
			} else {
				$("#sa7 .questao-info").html(visita.sa7);
				$("#sa7 .questao-info").removeClass('red-mark');
				$("#sa7 .questao-info").removeClass('grey-mark');
			}
		} else {
			$("#sa7 .questao-info").html(visita.sa7);
			$("#sa7 .questao-info").removeClass('red-mark');
			$("#sa7 .questao-info").removeClass('grey-mark');
		}
	} else {
		$("#sa7 .questao-info").html("Sem informação");
		$("#sa7 .questao-info").addClass('grey-mark');
		$("#sa7 .questao-info").removeClass('red-mark');
	}
	
	if(visita.sa8 != null){
		if(visita.sa8 < visita.sa2){
			$("#sa8 .questao-info").html(visita.sa8);
			$("#sa8 .questao-info").addClass('red-mark');
			$("#sa8 .questao-info").removeClass('grey-mark');
		} else {
			$("#sa8 .questao-info").html(visita.sa8);
			$("#sa8 .questao-info").removeClass('red-mark');
			$("#sa8 .questao-info").removeClass('grey-mark');
		}
	} else {
		$("#sa8 .questao-info").html("Sem informação");
		$("#sa8 .questao-info").addClass('grey-mark');
		$("#sa8 .questao-info").removeClass('red-mark');
	}
	
	if(visita.sa9 != null){
		if(visita.sa9 < visita.sa2){
			$("#sa9 .questao-info").html(visita.sa9);
			$("#sa9 .questao-info").addClass('red-mark');
			$("#sa9 .questao-info").removeClass('grey-mark');
		} else {
			$("#sa9 .questao-info").html(visita.sa9);
			$("#sa9 .questao-info").removeClass('red-mark');
			$("#sa9 .questao-info").removeClass('grey-mark');
		}
	} else {
		$("#sa9 .questao-info").html("Sem informação");
		$("#sa9 .questao-info").addClass('grey-mark');
		$("#sa9 .questao-info").removeClass('red-mark');
	}
	
	var eee1Flag;
	var textoEee1 = null;
	
	if(visita.eee1a != null){
		if(visita.eee1a == "true"){
			textoEee1 = 'Educação infantil';
			eee1Flag = true;
		}
	}
	
	if(visita.eee1b != null){
		if(visita.eee1b == "true"){
			if(eee1Flag == true){
				textoEee1 = textoEee1 + ', Ensino fundamental I';
			} else {
				textoEee1 = 'Ensino fundamental I';
			}
			eee1Flag = true;
		}
	}
	
	if(visita.eee1c != null){
		if(visita.eee1c == "true"){
			if(eee1Flag == true){
				textoEee1 = textoEee1 + ', Ensino fundamental II';
			} else {
				textoEee1 = 'Ensino fundamental II';
			}
			eee1Flag = true;
		}
	}
	
	if(visita.eee1d != null){
		if(visita.eee1d == "true"){
			if(eee1Flag == true){
				textoEee1 = textoEee1 + ', EJA';
			} else {
				textoEee1 = 'EJA';
			}
			eee1Flag = true;
		}
	}
	
	if(visita.eee1e != null){
		if(visita.eee1e == "true"){
			if(eee1Flag == true){
				textoEee1 = textoEee1 + ', PROJOVEM';
			} else {
				textoEee1 = 'PROJOVEM';
			}
			eee1Flag = true;
		}
	}
	
	if(visita.eee1f != null){
		if(visita.eee1f == "true"){
			if(eee1Flag == true){
				textoEee1 = textoEee1 + ', Lição de vida';
			} else {
				textoEee1 = 'Lição de vida';
			}
			eee1Flag = true;
		}
	}
	
	if(visita.eee1g != null){
		if(visita.eee1g == "true"){
			if(eee1Flag == true){
				textoEee1 = textoEee1 + ', Acelera';
			} else {
				textoEee1 = 'Acelera';
			}
			eee1Flag = true;
		}
	}
	
	if(visita.eee1h != null){
		if(visita.eee1h == "true"){
			if(eee1Flag == true){
				textoEee1 = textoEee1 + ', Se liga!';
			} else {
				textoEee1 = 'Se liga!';
			}
			eee1Flag = true;
		}
	}
	
	if(visita.eee1i != null){
		if(visita.eee1i == "true"){
			if(eee1Flag == true){
				textoEee1 = textoEee1 + ', Outros';
			} else {
				textoEee1 = 'Outros';
			}
			eee1Flag = true;
		}
	}
	
	if(textoEee1 != null){
		$("#eee1 .questao-info").html(textoEee1);
	} else {
		$("#eee1 .questao-info").html("Nenhuma");
	}

	if(visita.eef5 != null){
		if(visita.eef5 == '0'){
			$("#eef5 .questao-info").html(visita.eef5);
			$("#eef5 .questao-info").addClass('red-mark');
			$("#eef5 .questao-info").removeClass('grey-mark');
		} else {
			$("#eef5 .questao-info").html(visita.eef5);
			$("#eef5 .questao-info").removeClass('red-mark');
			$("#eef5 .questao-info").removeClass('grey-mark');
		}
	} else {
		$("#eef5 .questao-info").html("Sem informação");
		$("#eef5 .questao-info").removeClass('red-mark');
		$("#eef5 .questao-info").addClass('grey-mark');
	}
	
	if(visita.eef8 == 'barreira'){
		$("#eef8 .questao-info").html("Barreira");
		$("#eef8 .questao-info").removeClass('grey-mark');
	} else if(visita.eef8 == 'encosta'){
		$("#eef8 .questao-info").html("Encosta");
		$("#eef8 .questao-info").removeClass('grey-mark');
	} else {
		$("#eef8 .questao-info").html("Sem informação");
		$("#eef8 .questao-info").addClass('grey-mark');
	}
	
	if(visita.alim2 >= 250 && visita.alim2 <= 750){
		$("#alim2 .questao-info").html("Entre 200 e 750 Lux");
		$("#alim2 .questao-info").removeClass('red-mark');
		$("#alim2 .questao-info").removeClass('grey-mark');
	} else if(visita.alim2 < 250 || visita.alim2 > 750){
		$("#alim2 .questao-info").html("Abaixo de 200 ou acima de 750 Lux");
		$("#alim2 .questao-info").addClass('red-mark');
		$("#alim2 .questao-info").removeClass('grey-mark');
	} else {
		$("#alim2 .questao-info").html("Sem informação");
		$("#alim2 .questao-info").removeClass('red-mark');
		$("#alim2 .questao-info").addClass('grey-mark');
	}
	
	if(visita.em3 == 'filtrada'){
		$("#em3 .questao-info").html("Filtrada");
		$("#em3 .questao-info").removeClass('grey-mark');
	} else if(visita.em3 == 'fervida'){
		$("#em3 .questao-info").html("Fervida");
		$("#em3 .questao-info").removeClass('grey-mark');
	} else if(visita.em3 == 'mineral'){
		$("#em3 .questao-info").html("Mineral");
		$("#em3 .questao-info").removeClass('grey-mark');
	} else {
		$("#em3 .questao-info").html("Sem informação");
		$("#em3 .questao-info").addClass('grey-mark');
	}
	
	if(visita.et9 == "false" || visita.et9 == "" || visita.et9 == null){
		preenchePadrao('formacaoInf','et10', 'none');
	} else {
		preenchePadrao('formacaoInf','et10', visita.et10);
	}

	if(visita.inf9 == "false" || visita.inf9 == "" || visita.inf9 == null){
		preenchePadrao('formacaoInf','inf10', 'none');
	} else {
		preenchePadrao('formacaoInf','inf10', visita.inf10);
	}
	
	if(visita.eef4 == "false" || visita.eef4 == "" || visita.eef4 == null){
		preenchePadrao('boolNao','eef4a', 'none');
	} else {
		preenchePadrao('boolNao','eef4a', visita.eef4a);
	}
	

	if(visita.ace7 == "true"){
		preenchePadrao('boolNao','eac3a', visita.eac3a);
		preenchePadrao('boolNao','eac3b', visita.eac3b);
		preenchePadrao('boolNao','eac3c', visita.eac3c);
		preenchePadrao('boolNao','eac3d', visita.eac3d);
	} else {
		preenchePadrao('boolNao','eac3a', 'none');
		preenchePadrao('boolNao','eac3b', 'none');
		preenchePadrao('boolNao','eac3c', 'none');
		preenchePadrao('boolNao','eac3d', 'none');
	}
	
	if(visita.anotacoes6 != null && visita.anotacoes6a != null){
		preenchePadrao('anotacao','anotacoes6', visita.anotacoes6 + '. ' + visita.anotacoes6a);
	} else if(visita.anotacoes6 != null){
		preenchePadrao('anotacao','anotacoes6', visita.anotacoes6);
	} else if(visita.anotacoes6a != null){
		preenchePadrao('anotacao','anotacoes6', visita.anotacoes6a);
	} else {
		preenchePadrao('anotacao','anotacoes6', null);
	}

	//PADRÕES
	
	preenchePadrao('text','rpa', visita.escola.rpa);
	preenchePadrao('text','endereco', visita.escola.logradouro + ', ' + visita.escola.numeroEnd + ' - ' + visita.escola.bairro + '. CEP: ' + visita.escola.cep);
	preenchePadrao('text','telefone', visita.escola.telefone);
	preenchePadrao('text','gestor', visita.gestor);
	preenchePadrao('boolNao','idebvisivel', visita.idebVisivel);
	preenchePadrao('boolNao','chuva', visita.chuva);
	preenchePadrao('text','problemaschuva', visita.problemasChuva);
	preenchePadrao('text','sa1', visita.sa1);
	preenchePadrao('text','sa2', visita.sa2);
	preenchePadrao('text','sa3', visita.sa3);
	preenchePadrao('text','sa11', visita.sa11);
	preenchePadrao('likert','sa10', visita.sa10);
	preenchePadrao('anotacao','anotacoes1', visita.anotacoes1);
	preenchePadrao('text','eee2', visita.eee2);
	preenchePadrao('text','eee3', visita.eee3);
	preenchePadrao('text','eee4', visita.eee4);
	preenchePadrao('text','eee5', visita.eee5);
	preenchePadrao('zeroOk','eee6', visita.eee6);
	preenchePadrao('text','eee7', visita.eee7);
	preenchePadrao('zeroOk','eee8', visita.eee8);
	preenchePadrao('neutro','eee9', visita.eee9);
	preenchePadrao('anotacao','anotacoes1a', visita.anotacoes1a);
	preenchePadrao('boolNao','bib1', visita.bib1);
	preenchePadrao('boolNao','bib2', visita.bib2);
	preenchePadrao('boolNao','bib3', visita.bib3);
	preenchePadrao('boolNao','bib4', visita.bib4);
	preenchePadrao('boolNao','bib5', visita.bib5);
	preenchePadrao('boolNao','bib6', visita.bib6);
	preenchePadrao('boolNao','bib7', visita.bib7);
	preenchePadrao('boolNao','bib8', visita.bib8);
	preenchePadrao('boolNao','bib9', visita.bib9);
	preenchePadrao('boolNao','bib10', visita.bib10);
	preenchePadrao('formacao','bib11', visita.bib11);
	preenchePadrao('boolNao','bib12', visita.bib12);
	preenchePadrao('formacao','bib13', visita.bib13);
	preenchePadrao('boolNao','bib14', visita.bib14);
	preenchePadrao('anotacao','anotacoes2', visita.anotacoes2);
	preenchePadrao('boolNao','inf1', visita.inf1);
	preenchePadrao('boolNao','inf2', visita.inf2);
	preenchePadrao('boolNao','inf3', visita.inf3);
	preenchePadrao('boolNao','inf4', visita.inf4);
	preenchePadrao('boolNao','inf5', visita.inf5);
	preenchePadrao('text','inf6', visita.inf6);
	preenchePadrao('text','inf7', visita.inf7);
	preenchePadrao('text','inf8', visita.inf8);
	preenchePadrao('boolNao','inf9', visita.inf9);
	preenchePadrao('boolNao','inf11', visita.inf11);
	preenchePadrao('anotacao','anotacoes3', visita.anotacoes3);
	preenchePadrao('boolNao','et1', visita.et1);
	preenchePadrao('boolNao','et2', visita.et2);
	preenchePadrao('boolNao','et3', visita.et3);
	preenchePadrao('boolNao','et4', visita.et4);
	preenchePadrao('boolNao','et5', visita.et5);
	preenchePadrao('text','et6', visita.et6);
	preenchePadrao('text','et7', visita.et7);
	preenchePadrao('text','et8', visita.et8);
	preenchePadrao('boolNao','et9', visita.et9);
	preenchePadrao('boolNao','et11', visita.et11);
	preenchePadrao('anotacao','anotacoes4', visita.anotacoes4);
	preenchePadrao('escala','rl1', visita.rl1);
	preenchePadrao('escala','rl2', visita.rl2);
	preenchePadrao('escala','rl3', visita.rl3);
	preenchePadrao('escala','rl4', visita.rl4);
	preenchePadrao('escala','rl5', visita.rl5);
	preenchePadrao('invBool','rl6', visita.rl6);
	preenchePadrao('anotacao','anotacoes5', visita.anotacoes5);
	preenchePadrao('neutro','ace1', visita.ace1);
	preenchePadrao('neutro','ace2', visita.ace2);
	preenchePadrao('neutro','ace3', visita.ace3);
	preenchePadrao('neutro','ace4', visita.ace4);
	preenchePadrao('boolNao','ace5', visita.ace5);
	preenchePadrao('boolNao','ace6', visita.ace6);
	preenchePadrao('boolNao','ace7', visita.ace7);
	preenchePadrao('boolNao','ace8', visita.ace8);
	preenchePadrao('boolNao','ace9', visita.ace9);
	preenchePadrao('boolNao','ace10', visita.ace10);
	preenchePadrao('boolNao','eac1', visita.eac1);
	preenchePadrao('boolNao','eac2', visita.eac2);
	preenchePadrao('boolNao','se1', visita.se1);
	preenchePadrao('boolNao','se2', visita.se2);
	preenchePadrao('boolNao','se3', visita.se3);
	preenchePadrao('boolNao','se4', visita.se4);
	preenchePadrao('invBool','se5', visita.se5);
	preenchePadrao('invBool','se6', visita.se6);
	preenchePadrao('invBool','se7', visita.se7);
	preenchePadrao('anotacao','anotacoes7', visita.anotacoes7);
	preenchePadrao('invBool','eef1', visita.eef1);
	preenchePadrao('boolNao','eef2', visita.eef2);
	preenchePadrao('invBool','eef3', visita.eef3);
	preenchePadrao('anotacao','eef3a', visita.eef3a);
	preenchePadrao('boolNao','eef4', visita.eef4);
	preenchePadrao('zeroOk','eef6', visita.eef6);
	preenchePadrao('boolNao','eef7', visita.eef7);
	preenchePadrao('zeroOk','eef9', visita.eef9);
	preenchePadrao('anotacao','eef10', visita.eef10);
	preenchePadrao('boolNao','eef10a', visita.eef10a);
	preenchePadrao('anotacao','eef10b', visita.eef10b);
	preenchePadrao('boolNao','eef11', visita.eef11);
	preenchePadrao('boolNao','eef12', visita.eef12);
	preenchePadrao('boolNao','eef13', visita.eef13);
	preenchePadrao('boolNao','eef14', visita.eef14);
	preenchePadrao('boolNao','eef15', visita.eef15);
	preenchePadrao('boolNao','eef16', visita.eef16);
	preenchePadrao('boolNao','eef17', visita.eef17);
	preenchePadrao('anotacao','anotacoes7a', visita.anotacoes7a);
	preenchePadrao('boolNao','sp1', visita.sp1);
	preenchePadrao('boolNao','sp2', visita.sp2);
	preenchePadrao('boolNao','sp3', visita.sp3);
	preenchePadrao('boolNao','sp4', visita.sp4);
	preenchePadrao('boolNao','sp5', visita.sp5);
	preenchePadrao('boolNao','sp6', visita.sp6);
	preenchePadrao('boolNao','sp7', visita.sp7);
	preenchePadrao('invBool','sp8', visita.sp8);
	preenchePadrao('boolNao','sp9', visita.sp9);
	preenchePadrao('boolNao','sp10', visita.sp10);
	preenchePadrao('anotacao','anotacoes8', visita.anotacoes8);
	preenchePadrao('neutro','adm1', visita.adm1);
	preenchePadrao('boolNao','adm2', visita.adm2);
	preenchePadrao('boolNao','adm3', visita.adm3);
	preenchePadrao('boolNao','adm4', visita.adm4);
	preenchePadrao('boolNao','adm5', visita.adm5);
	preenchePadrao('boolNao','adm6', visita.adm6);
	preenchePadrao('boolNao','adm7', visita.adm7);
	preenchePadrao('boolNao','adm8', visita.adm8);
	preenchePadrao('boolNao','adm9', visita.adm9);
	preenchePadrao('boolNao','adm10', visita.adm10);
	preenchePadrao('boolNao','adm10a', visita.adm10a);
	preenchePadrao('boolNao','adm10b', visita.adm10b);
	preenchePadrao('boolNao','adm10c', visita.adm10c);
	preenchePadrao('boolNao','adm11', visita.adm11);
	preenchePadrao('boolNao','adm11a', visita.adm11a);
	preenchePadrao('boolNao','adm11b', visita.adm11b);
	preenchePadrao('boolNao','adm11c', visita.adm11c);
	preenchePadrao('boolNao','adm12', visita.adm12);
	preenchePadrao('invBool','adm13', visita.adm13);
	preenchePadrao('boolNaoHid','adm14', visita.adm14);
	preenchePadrao('boolNaoHid','adm14a', visita.adm14a);
	preenchePadrao('boolNaoHid','adm14b', visita.adm14b);
	preenchePadrao('boolNaoHid','adm14c', visita.adm14c);
	preenchePadrao('anotacao','anotacoes9', visita.anotacoes9);
	preenchePadrao('likert','alim3', visita.alim3);
	preenchePadrao('boolNaoHid','alim3a', visita.alim3a);
	preenchePadrao('likert','alim4', visita.alim4);
	preenchePadrao('likert','alim5', visita.alim5);
	preenchePadrao('likert','alim6', visita.alim6);
	preenchePadrao('likert','alim7', visita.alim7);
	preenchePadrao('likert','alim8', visita.alim8);
	preenchePadrao('escalaAlim','alim9', visita.alim9);
	preenchePadrao('escalaAlim','alim11', visita.alim11);
	preenchePadrao('escalaAlim','alim12', visita.alim12);
	preenchePadrao('anotacao','anotacoes10', visita.anotacoes10);
	preenchePadrao('boolNao','em1', visita.em1);
	preenchePadrao('boolNao','em2', visita.em2);
	preenchePadrao('boolNao','em3a', visita.em3a);
	preenchePadrao('boolNao','em4', visita.em4);
	preenchePadrao('anotacao','anotacoes10a', visita.anotacoes10a);
	preenchePadrao('boolNao','mdf1', visita.mdf1);
	preenchePadrao('boolNao','mdf2a', visita.mdf2a);
	preenchePadrao('boolNao','mdf2b', visita.mdf2b);
	preenchePadrao('boolNao','mdf3', visita.mdf3);
	preenchePadrao('boolNao','mdf4', visita.mdf4);
	preenchePadrao('boolNao','mdf5', visita.mdf5);
	preenchePadrao('boolNao','mdf6', visita.mdf6);
	preenchePadrao('boolNao','mdf7', visita.mdf7);
	preenchePadrao('boolNao','mdf8', visita.mdf8);
	preenchePadrao('boolNao','mdf9', visita.mdf9);
	preenchePadrao('boolNao','mdf10', visita.mdf10);
	preenchePadrao('boolNao','mdf11', visita.mdf11);
	preenchePadrao('boolNao','mdf12', visita.mdf12);
	preenchePadrao('boolNao','mdf12a', visita.mdf12a);
	preenchePadrao('anotacao','anotacoes11', visita.anotacoes11);
	preenchePadrao('insu','edfs1', visita.edfs1);
	preenchePadrao('insu','edfs2', visita.edfs2);
	preenchePadrao('insu','edfs3', visita.edfs3);
	preenchePadrao('neutro','edfs4', visita.edfs4);
	preenchePadrao('anotacao','edfs4o', visita.edfs4o);
	preenchePadrao('neutro','edfs5', visita.edfs5);
	preenchePadrao('anotacao','edfs5o', visita.edfs5o);
	preenchePadrao('neutro','edfs6', visita.edfs6);
	preenchePadrao('anotacao','edfs6o', visita.edfs6o);
	preenchePadrao('boolNao','edfs7', visita.edfs7);
	preenchePadrao('boolNao','edfs7a', visita.edfs7a);
	preenchePadrao('boolNao','edfs7b', visita.edfs7b);
	preenchePadrao('anotacao','edfs7o', visita.edfs7o);
	preenchePadrao('neutro','edfs8', visita.edfs8);
	preenchePadrao('anotacao','edfs8o', visita.edfs8o);
	preenchePadrao('boolNao','edfs9', visita.edfs9);
	preenchePadrao('boolNao','edfs10', visita.edfs10);
	preenchePadrao('boolNao','edfs11', visita.edfs11);
	preenchePadrao('boolNao','edfs12', visita.edfs12);
	preenchePadrao('neutro','edfs13', visita.edfs13);
	preenchePadrao('anotacao','edfs13o', visita.edfs13o);
	preenchePadrao('neutro','edfs14', visita.edfs14);
	preenchePadrao('anotacao','edfs14o', visita.edfs14o);
	preenchePadrao('neutro','edfs15', visita.edfs15);
	preenchePadrao('anotacao','edfs15o', visita.edfs15o);
	preenchePadrao('boolNao','edfs16', visita.edfs16);
	preenchePadrao('anotacao','edfs16o', visita.edfs16o);
	preenchePadrao('boolNao','edfs17', visita.edfs17);
	preenchePadrao('anotacao','edfs17o', visita.edfs17o);
	preenchePadrao('invBool','edfs18a', visita.edfs18a);
	preenchePadrao('invBool','edfs18b', visita.edfs18b);
	preenchePadrao('invBool','edfs18c', visita.edfs18c);
	preenchePadrao('invBool','edfs18d', visita.edfs18d);
	preenchePadrao('invBool','edfs18e', visita.edfs18e);
	preenchePadrao('invBool','edfs18f', visita.edfs18f);
	preenchePadrao('invBool','edfs18g', visita.edfs18g);
	preenchePadrao('invBool','edfs19', visita.edfs19);
	preenchePadrao('text','edfs20', visita.edfs20);
	preenchePadrao('boolNaoHid','edfs21', visita.edfs21);
	preenchePadrao('text','edfs22', visita.edfs22);
	preenchePadrao('anotacao','anotacoes11a', visita.anotacoes11a);
}

function preenchePadrao(caso, questao, val){
	if(caso == 'boolNao'){
		if(val == 'false'){
			$("#" + questao + " .questao-info").html("Não");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
			$("#" + questao).removeClass('hidden-question');
		} else if(val == 'true'){
			$("#" + questao + " .questao-info").html("Sim");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
			$("#" + questao).removeClass('hidden-question');
		} else if(val == 'none'){
			$("#" + questao).addClass('hidden-question');
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").addClass('grey-mark');
			$("#" + questao).removeClass('hidden-question');
		}
	} else if(caso == 'boolNaoHid'){
		if(val == 'false'){
			$("#" + questao + " .questao-info").html("Não");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
			$("#" + questao).removeClass('hidden-question');
		} else if(val == 'true'){
			$("#" + questao + " .questao-info").html("Sim");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
			$("#" + questao).removeClass('hidden-question');
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").addClass('grey-mark');
			$("#" + questao).addClass('hidden-question');
		}
	} else if(caso == 'neutro'){
		if(val == 'false'){
			$("#" + questao + " .questao-info").html("Não");
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == 'true'){
			$("#" + questao + " .questao-info").html("Sim");
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	} else if(caso == 'invBool'){
		if(val == 'false'){
			$("#" + questao + " .questao-info").html("Não");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == 'true'){
			$("#" + questao + " .questao-info").html("Sim");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	} else if(caso == 'insu'){
		if(val == 'false'){
			$("#" + questao + " .questao-info").html("Não");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == 'true'){
			$("#" + questao + " .questao-info").html("Sim");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == 'Insuficiente'){
			$("#" + questao + " .questao-info").html("Sim");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	} else if(caso == 'escala'){
		if(val == '3'){
			$("#" + questao + " .questao-info").html("Bom");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '2'){
			$("#" + questao + " .questao-info").html("Regular");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '1'){
			$("#" + questao + " .questao-info").html("Ruim");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '0'){
			$("#" + questao + " .questao-info").html("Inexistente");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	} else if(caso == 'likert'){
		if(val == '6'){
			$("#" + questao + " .questao-info").html("Ótima");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '5'){
			$("#" + questao + " .questao-info").html("Boa");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '4'){
			$("#" + questao + " .questao-info").html("Regular");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '3'){
			$("#" + questao + " .questao-info").html("Ruim");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '2'){
			$("#" + questao + " .questao-info").html("Péssima");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '1'){
			$("#" + questao + " .questao-info").html("Inexistente");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	} else if(caso == 'escalaAlim'){
		if(val == '5'){
			$("#" + questao + " .questao-info").html("Sempre");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '4'){
			$("#" + questao + " .questao-info").html("De vez em quando");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '3'){
			$("#" + questao + " .questao-info").html("Indiferente");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '2'){
			$("#" + questao + " .questao-info").html("Raramente");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else if(val == '1'){
			$("#" + questao + " .questao-info").html("Nunca");
			$("#" + questao + " .questao-info").addClass('red-mark');
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	} else if(caso == 'text'){	
		if(val != null && val != ""){
			$("#" + questao + " .questao-info").html(val);
			$("#" + questao + " .questao-info").removeClass('grey-mark');
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	} else if(caso == 'anotacao'){
		if(val != null && val != ""){
			$("#" + questao + " .questao-info").html(val);
			$("#" + questao).removeClass('hidden-question');
		} else {
			$("#" + questao).addClass('hidden-question');
		}
	} else if(caso == 'formacao'){
		if(val != null && val != ""){
			$("#" + questao + " .questao-info").removeClass('grey-mark');
			if(val == "1"){
				$("#" + questao + " .questao-info").html("Nível médio");
				$("#" + questao).removeClass('hidden-question');
			} else if(val == "2"){
				$("#" + questao + " .questao-info").html("Superior incompleto");
				$("#" + questao).removeClass('hidden-question');
			} else if(val == "3"){
				$("#" + questao + " .questao-info").html("Superior completo");
				$("#" + questao).removeClass('hidden-question');
			} else if(val == "none"){
				$("#" + questao).addClass('hidden-question');
			}
		} else {
			$("#" + questao).removeClass('hidden-question');
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	} else if(caso == 'formacaoInf'){
		if(val != null && val != ""){
			$("#" + questao + " .questao-info").removeClass('grey-mark');
			if(val == "1"){
				$("#" + questao + " .questao-info").html("Na área de informática");
				$("#" + questao).removeClass('hidden-question');
			} else if(val == "0"){
				$("#" + questao + " .questao-info").html("Em outra área");
				$("#" + questao).removeClass('hidden-question');
			} else if(val == "none"){
				$("#" + questao).addClass('hidden-question');
			}
		} else {
			$("#" + questao).removeClass('hidden-question');
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	} else if(caso == 'zeroOk'){
		if(val != null && val != ""){
			$("#" + questao + " .questao-info").removeClass('grey-mark');
			if(val == '0'){
				$("#" + questao + " .questao-info").html(val);
				$("#" + questao + " .questao-info").removeClass('red-mark');
			} else {
				$("#" + questao + " .questao-info").html(val);
				$("#" + questao + " .questao-info").addClass('red-mark');
			}
		} else {
			$("#" + questao + " .questao-info").html("Sem informação");
			$("#" + questao + " .questao-info").removeClass('red-mark');
			$("#" + questao + " .questao-info").addClass('grey-mark');
		}
	}
}