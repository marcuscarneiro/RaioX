function updateVistorias(vistoria){
	$(".fiscalizacao-header h2").text("FISCALIZAÇÃO");
	$(".fiscalizacao-datas").show();
	$(".fiscalizacao-fotos").show();
	$(".fiscalizacao-questionario").show();

	if(vistoria.relatorio != null){
		rel = true;
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio span").css('display', 'none');
		$(".fiscalicazaoRelatorio a").css('display', 'inline-block');
		$(".fiscalicazaoRelatorio a").attr('href', contextPath + vistoria.relatorio);
		
	} else {
		rel = false;
		$(".fiscalicazaoRelatorio").css('display', 'block');
		$(".fiscalicazaoRelatorio a").css('display', 'none');
		$(".fiscalicazaoRelatorio span").css('display', 'inline-block');
	}
	
	var dateOri = vistoria.data;
	var dateAr = dateOri.split('-');
	var finalDate = dateAr[2] + '/' + dateAr[1] + '/' + dateAr[0];
	$("#qdata .questao-info").html(finalDate);
	$("#qrpa .questao-info").html(vistoria.creche.rpa);
	$("#qendereco .questao-info").html(vistoria.creche.logradouro + ', ' + vistoria.creche.numeroEnd + ' - ' + vistoria.creche.bairro + '. CEP: ' + vistoria.creche.cep);
	$("#qtelefone .questao-info").html(vistoria.creche.telefone);
	
	if(vistoria.creche.nova == 'false'){
		$("#qnova .questao-info").html("Não");
	} else if(vistoria.creche.nova == 'true'){
		$("#qnova .questao-info").html("Sim");
	} else {
		$("#qnova .questao-info").html("Sem informação");
	}
	
	if(vistoria.situacao != null && vistoria.situacao != ""){
		if(vistoria.situacao == 'proprio'){
			$("#qsituacao .questao-info").html("Próprio");
		} else if(vistoria.situacao == 'cedido'){
			$("#qsituacao .questao-info").html("Cedido");
		} else if(vistoria.situacao == 'alugado'){
			$("#qsituacao .questao-info").html("Alugado");
		}
	} else {
		$("#qsituacao .questao-info").html("Sem informação");
	}
	
	if(vistoria.ger1 != null){
		$("#qger1 .questao-info").html(vistoria.ger1);
	} else {
		$("#qger1 .questao-info").html("Sem informação");
	}
	
	if(vistoria.ger2 != null){
		$("#qger2 .questao-info").html(vistoria.ger2);
	} else {
		$("#qger2 .questao-info").html("Sem informação");
	}
	
	var ger3Flag;
	var textoGer3 = null;
	
	if(vistoria.ger3a != null){
		if(vistoria.ger3a == true){
			textoGer3 = 'Berçário';
			ger3Flag = true;
		}
	}
	
	if(vistoria.ger3b != null){
		if(vistoria.ger3b == true){
			if(ger3Flag == true){
				textoGer3 = textoGer3 + ', Grupo I';
			} else {
				textoGer3 = 'Grupo I';
			}
			ger3Flag = true;
		}
	}
	
	if(vistoria.ger3c != null){
		if(vistoria.ger3c == true){
			if(ger3Flag == true){
				textoGer3 = textoGer3 + ', Grupo II';
			} else {
				textoGer3 = 'Grupo II';
			}
			ger3Flag = true;
		}
	}
	
	if(vistoria.ger3d != null){
		if(vistoria.ger3d == true){
			if(ger3Flag == true){
				textoGer3 = textoGer3 + ', Grupo III';
			} else {
				textoGer3 = 'Grupo III';
			}
			ger3Flag = true;
		}
	}
	
	if(vistoria.ger3e != null){
		if(vistoria.ger3e == true){
			if(ger3Flag == true){
				textoGer3 = textoGer3 + ', Grupo IV';
			} else {
				textoGer3 = 'Grupo IV';
			}
			ger3Flag = true;
		}
	}
	
	if(vistoria.ger3f != null){
		if(vistoria.ger3F == true){
			if(ger3Flag == true){
				textoGer3 = textoGer3 + ', Grupo V';
			} else {
				textoGer3 = 'Grupo V';
			}
			ger3Flag = true;
		}
	}
	
	if(textoGer3 != null){
		$("#qger3 .questao-info").html(textoGer3);
	} else {
		$("#qger3 .questao-info").html("Nenhuma");
	}
	
	if(vistoria.ger4 == false){
		$("#qger4 .questao-info").html("Não");
		$("#qger4 .questao-info").removeClass('red-mark');
	} else if(vistoria.ger4 == true){
		$("#qger4 .questao-info").html("Sim");
		$("#qger4 .questao-info").addClass('red-mark');
	} else {
		$("#qger4 .questao-info").html("Sem informação");
	}
	
	if(vistoria.ger4o != null && vistoria.ger4o != ""){
		$("#qger4o .questao-info").html(vistoria.ger4o);
		$("#qger4o").removeClass('hidden-question');
	} else {
		$("#qger4o").addClass('hidden-question');
	}

	if(vistoria.gerinf != null && vistoria.gerinf != ""){
		$("#qgerinf .questao-info").html(vistoria.gerinf);
		$("#qgerinf").removeClass('hidden-question');
	} else {
		$("#qgerinf").addClass('hidden-question');
	}
	
	if(vistoria.sal1 != null){
		$("#qsal1 .questao-info").html(vistoria.sal1);
	} else {
		$("#qsal1 .questao-info").html("Sem informação");
	}

	if(vistoria.sal2 != null){
		$("#qsal2 .questao-info").html(vistoria.sal2);
	} else {
		$("#qsal2 .questao-info").html("Sem informação");
	}

	if(vistoria.sal3 != null){
		$("#qsal3 .questao-info").html(vistoria.sal3);
	} else {
		$("#qsal3 .questao-info").html("Sem informação");
	}
	
	if(vistoria.sal4 == 1){
		$("#qsal4 .questao-info").html("Inexistente");
		$("#qsal4 .questao-info").addClass('red-mark');
	} else if(vistoria.sal4 == 2) {
		$("#qsal4 .questao-info").html("Péssima");
		$("#qsal4 .questao-info").addClass('red-mark');
	} else if(vistoria.sal4 == 3) {
		$("#qsal4 .questao-info").html("Ruim");
		$("#qsal4 .questao-info").addClass('red-mark');
	} else if(vistoria.sal4 == 4) {
		$("#qsal4 .questao-info").html("Regular");
		$("#qsal4 .questao-info").removeClass('red-mark');
	} else if(vistoria.sal4 == 5){
		$("#qsal4 .questao-info").html("Boa");
		$("#qsal4 .questao-info").removeClass('red-mark');
	} else if(vistoria.sal4 == 6){
		$("#qsal4 .questao-info").html("Ótima");
		$("#qsal4 .questao-info").removeClass('red-mark');
	} else {
		$("#qsal4 .questao-info").html("Sem informação");
		$("#qsal4 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.salinf != null && vistoria.salinf != ""){
		$("#qsalinf .questao-info").html(vistoria.salinf);
		$("#qsalinf").removeClass('hidden-question');
	} else {
		$("#qsalinf").addClass('hidden-question');
	}

	if(vistoria.ber1 == false){
		$("#qber1 .questao-info").html("Não");
		$("#qber1 .questao-info").addClass('red-mark');
	} else if(vistoria.ber1 == true){
		$("#qber1 .questao-info").html("Sim");
		$("#qber1 .questao-info").removeClass('red-mark');
	} else {
		$("#qber1 .questao-info").html("Sem informação");
		$("#qber1 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ber2 == false){
		$("#qber2 .questao-info").html("Não");
		$("#qber2 .questao-info").addClass('red-mark');
	} else if(vistoria.ber2 == true){
		$("#qber2 .questao-info").html("Sim");
		$("#qber2 .questao-info").removeClass('red-mark');
	} else {
		$("#qber2 .questao-info").html("Sem informação");
		$("#qber2 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ber3 == false){
		$("#qber3 .questao-info").html("Não");
		$("#qber3 .questao-info").addClass('red-mark');
	} else if(vistoria.ber3 == true){
		$("#qber3 .questao-info").html("Sim");
		$("#qber3 .questao-info").removeClass('red-mark');
	} else {
		$("#qber3 .questao-info").html("Sem informação");
		$("#qber3 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ber4 == false){
		$("#qber4 .questao-info").html("Não");
		$("#qber4 .questao-info").addClass('red-mark');
	} else if(vistoria.ber4 == true){
		$("#qber4 .questao-info").html("Sim");
		$("#qber4 .questao-info").removeClass('red-mark');
	} else {
		$("#qber4 .questao-info").html("Sem informação");
		$("#qber4 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ber5 == false){
		$("#qber5 .questao-info").html("Não");
		$("#qber5 .questao-info").addClass('red-mark');
	} else if(vistoria.ber5 == true){
		$("#qber5 .questao-info").html("Sim");
		$("#qber5 .questao-info").removeClass('red-mark');
	} else {
		$("#qber5 .questao-info").html("Sem informação");
		$("#qber5 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ber6 == false){
		$("#qber6 .questao-info").html("Não");
		$("#qber6 .questao-info").addClass('red-mark');
	} else if(vistoria.ber6 == true){
		$("#qber6 .questao-info").html("Sim");
		$("#qber6 .questao-info").removeClass('red-mark');
	} else {
		$("#qber6 .questao-info").html("Sem informação");
		$("#qber6 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ber7 == false){
		$("#qber7 .questao-info").html("Não");
		$("#qber7 .questao-info").removeClass('red-mark');
	} else if(vistoria.ber7 == true){
		$("#qber7 .questao-info").html("Sim");
		$("#qber7 .questao-info").addClass('red-mark');
	} else {
		$("#qber7 .questao-info").html("Sem informação");
		$("#qber7 .questao-info").addClass('red-mark');
	}
	
	if(vistoria.ber8 == false){
		$("#qber8 .questao-info").html("Não");
		$("#qber8 .questao-info").addClass('red-mark');
	} else if(vistoria.ber8 == true){
		$("#qber8 .questao-info").html("Sim");
		$("#qber8 .questao-info").removeClass('red-mark');
	} else {
		$("#qber8 .questao-info").html("Sem informação");
		$("#qber8 .questao-info").removeClass('red-mark');
	}

	if(vistoria.berinf != null  && vistoria.berinf != ""){
		$("#qberinf .questao-info").html(vistoria.berinf);
		$("#qberinf").removeClass('hidden-question');
	} else {
		$("#qberinf").addClass('hidden-question');
	}
	
	if(vistoria.ban1a == false){
		$("#qban1a .questao-info").html("Não");
		$("#qban1a .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1a == true){
		$("#qban1a .questao-info").html("Sim");
		$("#qban1a .questao-info").addClass('red-mark');
	} else {
		$("#qban1a .questao-info").html("Sem informação");
		$("#qban1a .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1b == false){
		$("#qban1b .questao-info").html("Não");
		$("#qban1b .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1b == true){
		$("#qban1b .questao-info").html("Sim");
		$("#qban1b .questao-info").addClass('red-mark');
	} else {
		$("#qban1b .questao-info").html("Sem informação");
		$("#qban1b .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1c == false){
		$("#qban1c .questao-info").html("Não");
		$("#qban1c .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1c == true){
		$("#qban1c .questao-info").html("Sim");
		$("#qban1c .questao-info").addClass('red-mark');
	} else {
		$("#qban1c .questao-info").html("Sem informação");
		$("#qban1c .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1d == false){
		$("#qban1d .questao-info").html("Não");
		$("#qban1d .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1d == true){
		$("#qban1d .questao-info").html("Sim");
		$("#qban1d .questao-info").addClass('red-mark');
	} else {
		$("#qban1d .questao-info").html("Sem informação");
		$("#qban1d .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1e == false){
		$("#qban1e .questao-info").html("Não");
		$("#qban1e .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1e == true){
		$("#qban1e .questao-info").html("Sim");
		$("#qban1e .questao-info").addClass('red-mark');
	} else {
		$("#qban1e .questao-info").html("Sem informação");
		$("#qban1e .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1f == false){
		$("#qban1f .questao-info").html("Não");
		$("#qban1f .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1f == true){
		$("#qban1f .questao-info").html("Sim");
		$("#qban1f .questao-info").addClass('red-mark');
	} else {
		$("#qban1f .questao-info").html("Sem informação");
		$("#qban1f .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1g == false){
		$("#qban1g .questao-info").html("Não");
		$("#qban1g .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1g == true){
		$("#qban1g .questao-info").html("Sim");
		$("#qban1g .questao-info").addClass('red-mark');
	} else {
		$("#qban1g .questao-info").html("Sem informação");
		$("#qban1g .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1h == false){
		$("#qban1h .questao-info").html("Não");
		$("#qban1h .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1h == true){
		$("#qban1h .questao-info").html("Sim");
		$("#qban1h .questao-info").addClass('red-mark');
	} else {
		$("#qban1h .questao-info").html("Sem informação");
		$("#qban1h .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1i == false){
		$("#qban1i .questao-info").html("Não");
		$("#qban1i .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1i == true){
		$("#qban1i .questao-info").html("Sim");
		$("#qban1i .questao-info").addClass('red-mark');
	} else {
		$("#qban1i .questao-info").html("Sem informação");
		$("#qban1i .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1j == false){
		$("#qban1j .questao-info").html("Não");
		$("#qban1j .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1j == true){
		$("#qban1j .questao-info").html("Sim");
		$("#qban1j .questao-info").addClass('red-mark');
	} else {
		$("#qban1j .questao-info").html("Sem informação");
		$("#qban1j .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1k == false){
		$("#qban1k .questao-info").html("Não");
		$("#qban1k .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1k == true){
		$("#qban1k .questao-info").html("Sim");
		$("#qban1k .questao-info").addClass('red-mark');
	} else {
		$("#qban1k .questao-info").html("Sem informação");
		$("#qban1k .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1l == false){
		$("#qban1l .questao-info").html("Não");
		$("#qban1l .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1l == true){
		$("#qban1l .questao-info").html("Sim");
		$("#qban1l .questao-info").addClass('red-mark');
	} else {
		$("#qban1l .questao-info").html("Sem informação");
		$("#qban1l .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1m == false){
		$("#qban1m .questao-info").html("Não");
		$("#qban1m .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1m == true){
		$("#qban1m .questao-info").html("Sim");
		$("#qban1m .questao-info").addClass('red-mark');
	} else {
		$("#qban1m .questao-info").html("Sem informação");
		$("#qban1m .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1n == false){
		$("#qban1n .questao-info").html("Não");
		$("#qban1n .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1n == true){
		$("#qban1n .questao-info").html("Sim");
		$("#qban1n .questao-info").addClass('red-mark');
	} else {
		$("#qban1n .questao-info").html("Sem informação");
		$("#qban1n .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1o == false){
		$("#qban1o .questao-info").html("Não");
		$("#qban1o .questao-info").removeClass('red-mark');
	} else if(vistoria.ban1o == true){
		$("#qban1o .questao-info").html("Sim");
		$("#qban1o .questao-info").addClass('red-mark');
	} else {
		$("#qban1o .questao-info").html("Sem informação");
		$("#qban1o .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ban1outros != null){
		$("#qban1outros .questao-info").html(vistoria.ban1outros);
		$("#qban1outros").removeClass('hidden-question');
	} else {
		$("#qban1outros").addClass('hidden-question');
	}
	
	if(vistoria.baninf != null  && vistoria.baninf != ""){
		$("#qbaninf .questao-info").html(vistoria.baninf);
		$("#qbaninf").removeClass('hidden-question');
	} else {
		$("#qbaninf").addClass('hidden-question');
	}
	
	if(vistoria.eaa1a == false){
		$("#qeaa1a .questao-info").html("Não");
		$("#qeaa1a .questao-info").addClass('red-mark');
	} else if(vistoria.eaa1a == true){
		$("#qeaa1a .questao-info").html("Sim");
		$("#qeaa1a .questao-info").removeClass('red-mark');
	} else {
		$("#qeaa1a .questao-info").html("Sem informação");
		$("#qeaa1a .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.eaa1b == false){
		$("#qeaa1b .questao-info").html("Não");
		$("#qeaa1b .questao-info").addClass('red-mark');
	} else if(vistoria.eaa1b == true){
		$("#qeaa1b .questao-info").html("Sim");
		$("#qeaa1b .questao-info").removeClass('red-mark');
	} else {
		$("#qeaa1b .questao-info").html("Sem informação");
		$("#qeaa1b .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.eaa1c == false){
		$("#qeaa1c .questao-info").html("Não");
		$("#qeaa1c .questao-info").addClass('red-mark');
	} else if(vistoria.eaa1c == true){
		$("#qeaa1c .questao-info").html("Sim");
		$("#qeaa1c .questao-info").removeClass('red-mark');
	} else {
		$("#qeaa1c .questao-info").html("Sem informação");
		$("#qeaa1c .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.eaa1d == false){
		$("#qeaa1d .questao-info").html("Não");
		$("#qeaa1d .questao-info").addClass('red-mark');
	} else if(vistoria.eaa1d == true){
		$("#qeaa1d .questao-info").html("Sim");
		$("#qeaa1d .questao-info").removeClass('red-mark');
	} else {
		$("#qeaa1d .questao-info").html("Sem informação");
		$("#qeaa1d .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.eaa1e == false){
		$("#qeaa1e .questao-info").html("Não");
		$("#qeaa1e .questao-info").addClass('red-mark');
	} else if(vistoria.eaa1e == true){
		$("#qeaa1e .questao-info").html("Sim");
		$("#qeaa1e .questao-info").removeClass('red-mark');
	} else {
		$("#qeaa1e .questao-info").html("Sem informação");
		$("#qeaa1e .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.eaa1f == false){
		$("#qeaa1f .questao-info").html("Não");
		$("#qeaa1f .questao-info").addClass('red-mark');
	} else if(vistoria.eaa1f == true){
		$("#qeaa1f .questao-info").html("Sim");
		$("#qeaa1f .questao-info").removeClass('red-mark');
	} else {
		$("#qeaa1f .questao-info").html("Sem informação");
		$("#qeaa1f .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.eaa1g == false){
		$("#qeaa1g .questao-info").html("Não");
		$("#qeaa1g .questao-info").addClass('red-mark');
	} else if(vistoria.eaa1g == true){
		$("#qeaa1g .questao-info").html("Sim");
		$("#qeaa1g .questao-info").removeClass('red-mark');
	} else {
		$("#qeaa1g .questao-info").html("Sem informação");
		$("#qeaa1g .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.eaa1h == false){
		$("#qeaa1h .questao-info").html("Não");
		$("#qeaa1h .questao-info").addClass('red-mark');
	} else if(vistoria.eaa1h == true){
		$("#qeaa1h .questao-info").html("Sim");
		$("#qeaa1h .questao-info").removeClass('red-mark');
	} else {
		$("#qeaa1h .questao-info").html("Sem informação");
		$("#qeaa1h .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.eaa1i == false){
		$("#qeaa1i .questao-info").html("Não");
		$("#qeaa1i .questao-info").addClass('red-mark');
	} else if(vistoria.eaa1i == true){
		$("#qeaa1i .questao-info").html("Sim");
		$("#qeaa1i .questao-info").removeClass('red-mark');
	} else {
		$("#qeaa1i .questao-info").html("Sem informação");
		$("#qeaa1i .questao-info").removeClass('red-mark');
	}

	if(vistoria.eaainf != null  && vistoria.eaainf != ""){
		$("#qeaainf .questao-info").html(vistoria.eaainf);
		$("#qeaainf").removeClass('hidden-question');
	} else {
		$("#qeaainf").addClass('hidden-question');
	}
	
	if(vistoria.aae1 == false){
		$("#qaae1 .questao-info").html("Não");
	} else if(vistoria.aae1 == true){
		$("#qaae1 .questao-info").html("Sim");
	} else {
		$("#qaae1 .questao-info").html("Sem informação");
	}
	
	if(vistoria.aae2 == false){
		$("#qaae2 .questao-info").html("Não");
		$("#qaae2 .questao-info").addClass('red-mark');
	} else if(vistoria.aae2 == true){
		$("#qaae2 .questao-info").html("Sim");
		$("#qaae2 .questao-info").removeClass('red-mark');
	} else {
		$("#qaae2 .questao-info").html("Sem informação");
		$("#qaae2 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.aae3 == false){
		$("#qaae3 .questao-info").html("Não");
		$("#qaae3 .questao-info").addClass('red-mark');
	} else if(vistoria.aae3 == true){
		$("#qaae3 .questao-info").html("Sim");
		$("#qaae3 .questao-info").removeClass('red-mark');
	} else {
		$("#qaae3 .questao-info").html("Sem informação");
		$("#qaae3 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.aae4a == false){
		$("#qaae4a .questao-info").html("Não");
	} else if(vistoria.aae4a == true){
		$("#qaae4a .questao-info").html("Sim");
	} else {
		$("#qaae4a .questao-info").html("Sem informação");
	}
	
	if(vistoria.aae4b == false){
		$("#qaae4b .questao-info").html("Não");
	} else if(vistoria.aae4b == true){
		$("#qaae4b .questao-info").html("Sim");
	} else {
		$("#qaae4b .questao-info").html("Sem informação");
	}
	
	if(vistoria.aae4c == false){
		$("#qaae4c .questao-info").html("Não");
	} else if(vistoria.aae4c == true){
		$("#qaae4c .questao-info").html("Sim");
	} else {
		$("#qaae4c .questao-info").html("Sem informação");
	}
	
	if(vistoria.aae4d == false){
		$("#qaae4d .questao-info").html("Não");
	} else if(vistoria.aae4d == true){
		$("#qaae4d .questao-info").html("Sim");
	} else {
		$("#qaae4d .questao-info").html("Sem informação");
	}
	
	if(vistoria.aae4e == false){
		$("#qaae4e .questao-info").html("Não");
	} else if(vistoria.aae4e == true){
		$("#qaae4e .questao-info").html("Sim");
	} else {
		$("#qaae4e .questao-info").html("Sem informação");
	}
	
	if(vistoria.aae4f == false){
		$("#qaae4f .questao-info").html("Não");
	} else if(vistoria.aae4f == true){
		$("#qaae4f .questao-info").html("Sim");
	} else {
		$("#qaae4f .questao-info").html("Sem informação");
	}
	
	if(vistoria.aae4g == false){
		$("#qaae4g .questao-info").html("Não");
	} else if(vistoria.aae4g == true){
		$("#qaae4g .questao-info").html("Sim");
	} else {
		$("#qaae4g .questao-info").html("Sem informação");
	}

	if(vistoria.aae4outros != null  && vistoria.aae4outros != ""){
		$("#qaae4outros .questao-info").html(vistoria.aae4outros);
		$("#qaae4outros").removeClass('hidden-question');
	} else {
		$("#qaae4outros").addClass('hidden-question');
	}
	
	if(vistoria.aae5 == false){
		$("#qaae5 .questao-info").html("Não");
		$("#qaae5 .questao-info").addClass('red-mark');
	} else if(vistoria.aae5 == true){
		$("#qaae5 .questao-info").html("Sim");
		$("#qaae5 .questao-info").removeClass('red-mark');
	} else {
		$("#qaae5 .questao-info").html("Sem informação");
		$("#qaae5 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.aae6 == false){
		$("#qaae6 .questao-info").html("Não");
		$("#qaae6 .questao-info").addClass('red-mark');
	} else if(vistoria.aae6 == true){
		$("#qaae6 .questao-info").html("Sim");
		$("#qaae6 .questao-info").removeClass('red-mark');
	} else {
		$("#qaae6 .questao-info").html("Sem informação");
		$("#qaae6 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.aae7 == false){
		$("#qaae7 .questao-info").html("Não");
		$("#qaae7 .questao-info").addClass('red-mark');
	} else if(vistoria.aae7 == true){
		$("#qaae7 .questao-info").html("Sim");
		$("#qaae7 .questao-info").removeClass('red-mark');
	} else {
		$("#qaae7 .questao-info").html("Sem informação");
		$("#qaae7 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.aae8 == false){
		$("#qaae8 .questao-info").html("Não");
		$("#qaae8 .questao-info").addClass('red-mark');
	} else if(vistoria.aae8 == true){
		$("#qaae8 .questao-info").html("Sim");
		$("#qaae8 .questao-info").removeClass('red-mark');
	} else {
		$("#qaae8 .questao-info").html("Sem informação");
		$("#qaae8 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.aae9 == false){
		$("#qaae9 .questao-info").addClass('red-mark');
		$("#qaae9 .questao-info").html("Não");
	} else if(vistoria.aae9 == true){
		$("#qaae9 .questao-info").html("Sim");
		$("#qaae9 .questao-info").removeClass('red-mark');
	} else {
		$("#qaae9 .questao-info").html("Sem informação");
		$("#qaae9 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.aae10 == false){
		$("#qaae10 .questao-info").addClass('red-mark');
		$("#qaae10 .questao-info").html("Não");
	} else if(vistoria.aae10 == true){
		$("#qaae10 .questao-info").html("Sim");
		$("#qaae10 .questao-info").removeClass('red-mark');
	} else {
		$("#qaae10 .questao-info").html("Sem informação");
		$("#qaae10 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.aaeinf != null  && vistoria.aaeinf != ""){
		$("#qaaeinf .questao-info").html(vistoria.aaeinf);
		$("#qaaeinf").removeClass('hidden-question');
	} else {
		$("#qaaeinf").addClass('hidden-question');
	}
	
	if(vistoria.see1 == false){
		$("#qsee1 .questao-info").html("Não");
		$("#qsee1 .questao-info").addClass('red-mark');
	} else if(vistoria.see1 == true){
		$("#qsee1 .questao-info").html("Sim");
		$("#qsee1 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee1 .questao-info").html("Sem informação");
		$("#qsee1 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see1o != null  && vistoria.see1o != ""){
		$("#qsee1o .questao-info").html(vistoria.see1o);
		$("#qsee1o").removeClass('hidden-question');
	} else {
		$("#qsee1o").addClass('hidden-question');
	}
	
	if(vistoria.see2 == false){
		$("#qsee2 .questao-info").html("Não");
		$("#qsee2 .questao-info").addClass('red-mark');
	} else if(vistoria.see2 == true){
		$("#qsee2 .questao-info").html("Sim");
		$("#qsee2 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee2 .questao-info").html("Sem informação");
		$("#qsee2 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see2o != null  && vistoria.see2o != ""){
		$("#qsee2o .questao-info").html(vistoria.see2o);
		$("#qsee2o").removeClass('hidden-question');
	} else {
		$("#qsee2o").addClass('hidden-question');
	}
	
	if(vistoria.see3 == false){
		$("#qsee3 .questao-info").html("Não");
		$("#qsee3 .questao-info").addClass('red-mark');
	} else if(vistoria.see3 == true){
		$("#qsee3 .questao-info").html("Sim");
		$("#qsee3 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee3 .questao-info").html("Sem informação");
		$("#qsee3 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see3o != null  && vistoria.see3o != ""){
		$("#qsee3o .questao-info").html(vistoria.see3o);
		$("#qsee3o").removeClass('hidden-question');
	} else {
		$("#qsee3o").addClass('hidden-question');
	}
	
	if(vistoria.see4 == false){
		$("#qsee4 .questao-info").html("Não");
		$("#qsee4 .questao-info").addClass('red-mark');
	} else if(vistoria.see4 == true){
		$("#qsee4 .questao-info").html("Sim");
		$("#qsee4 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee4 .questao-info").html("Sem informação");
		$("#qsee4 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see4o != null  && vistoria.see4o != ""){
		$("#qsee4o .questao-info").html(vistoria.see4o);
		$("#qsee4o").removeClass('hidden-question');
	} else {
		$("#qsee4o").addClass('hidden-question');
	}
	
	if(vistoria.see5 == false){
		$("#qsee5 .questao-info").html("Não");
		$("#qsee5 .questao-info").addClass('red-mark');
	} else if(vistoria.see5 == true){
		$("#qsee5 .questao-info").html("Sim");
		$("#qsee5 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee5 .questao-info").html("Sem informação");
		$("#qsee5 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see5o != null  && vistoria.see5o != ""){
		$("#qsee5o .questao-info").html(vistoria.see5o);
		$("#qsee5o").removeClass('hidden-question');
	} else {
		$("#qsee5o").addClass('hidden-question');
	}
	
	if(vistoria.see6 == false){
		$("#qsee6 .questao-info").html("Não");
		$("#qsee6 .questao-info").addClass('red-mark');
	} else if(vistoria.see6 == true){
		$("#qsee6 .questao-info").html("Sim");
		$("#qsee6 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee6 .questao-info").html("Sem informação");
		$("#qsee6 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see6o != null  && vistoria.see6o != ""){
		$("#qsee6o .questao-info").html(vistoria.see6o);
		$("#qsee6o").removeClass('hidden-question');
	} else {
		$("#qsee6o").addClass('hidden-question');
	}
	
	if(vistoria.see7 == false){
		$("#qsee7 .questao-info").html("Não");
		$("#qsee7 .questao-info").addClass('red-mark');
	} else if(vistoria.see7 == true){
		$("#qsee7 .questao-info").html("Sim");
		$("#qsee7 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee7 .questao-info").html("Sem informação");
		$("#qsee7 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see7o != null  && vistoria.see7o != ""){
		$("#qsee7o .questao-info").html(vistoria.see7o);
		$("#qsee7o").removeClass('hidden-question');
	} else {
		$("#qsee7o").addClass('hidden-question');
	}
	
	if(vistoria.see8 == false){
		$("#qsee8 .questao-info").html("Não");
		$("#qsee8 .questao-info").addClass('red-mark');
	} else if(vistoria.see8 == true){
		$("#qsee8 .questao-info").html("Sim");
		$("#qsee8 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee8 .questao-info").html("Sem informação");
		$("#qsee8 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see8o != null  && vistoria.see8o != ""){
		$("#qsee8o .questao-info").html(vistoria.see8o);
		$("#qsee8o").removeClass('hidden-question');
	} else {
		$("#qsee8o").addClass('hidden-question');
	}
	
	if(vistoria.see9 == false){
		$("#qsee9 .questao-info").html("Não");
		$("#qsee9 .questao-info").addClass('red-mark');
	} else if(vistoria.see9 == true){
		$("#qsee9 .questao-info").html("Sim");
		$("#qsee9 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee9 .questao-info").html("Sem informação");
		$("#qsee9 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see9o != null  && vistoria.see9o != ""){
		$("#qsee9o .questao-info").html(vistoria.see9o);
		$("#qsee9o").removeClass('hidden-question');
	} else {
		$("#qsee9o").addClass('hidden-question');
	}
	
	if(vistoria.see10 == false){
		$("#qsee10 .questao-info").html("Não");
		$("#qsee10 .questao-info").removeClass('red-mark');
	} else if(vistoria.see10 == true){
		$("#qsee10 .questao-info").html("Sim");
		$("#qsee10 .questao-info").addClass('red-mark');
	} else {
		$("#qsee10 .questao-info").html("Sem informação");
		$("#qsee10 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see10o != null  && vistoria.see10o != ""){
		$("#qsee10o .questao-info").html(vistoria.see10o);
		$("#qsee10o").removeClass('hidden-question');
	} else {
		$("#qsee10o").addClass('hidden-question');
	}
	
	if(vistoria.see11 == false){
		$("#qsee11 .questao-info").html("Não");
		$("#qsee11 .questao-info").addClass('red-mark');
	} else if(vistoria.see11 == true){
		$("#qsee11 .questao-info").html("Sim");
		$("#qsee11 .questao-info").removeClass('red-mark');
	} else {
		$("#qsee11 .questao-info").html("Sem informação");
		$("#qsee11 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see11o != null  && vistoria.see11o != ""){
		$("#qsee11o .questao-info").html(vistoria.see11o);
		$("#qsee11o").removeClass('hidden-question');
	} else {
		$("#qsee11o").addClass('hidden-question');
	}
	
	if(vistoria.see12 == false){
		$("#qsee12 .questao-info").html("Não");
		$("#qsee12 .questao-info").removeClass('red-mark');
	} else if(vistoria.see12 == true){
		$("#qsee12 .questao-info").html("Sim");
		$("#qsee12 .questao-info").addClass('red-mark');
	} else {
		$("#qsee12 .questao-info").html("Sem informação");
		$("#qsee12 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see12o != null  && vistoria.see12o != ""){
		$("#qsee12o .questao-info").html(vistoria.see12o);
		$("#qsee12o").removeClass('hidden-question');
	} else {
		$("#qsee12o").addClass('hidden-question');
	}
	
	if(vistoria.see13 == false){
		$("#qsee13 .questao-info").html("Não");
		$("#qsee13 .questao-info").removeClass('red-mark');
	} else if(vistoria.see13 == true){
		$("#qsee13 .questao-info").html("Sim");
		$("#qsee13 .questao-info").addClass('red-mark');
	} else {
		$("#qsee13 .questao-info").html("Sem informação");
		$("#qsee13 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see13o != null  && vistoria.see13o != ""){
		$("#qsee13o .questao-info").html(vistoria.see13o);
		$("#qsee13o").removeClass('hidden-question');
	} else {
		$("#qsee13o").addClass('hidden-question');
	}
	
	if(vistoria.see14 == false){
		$("#qsee14 .questao-info").html("Não");
		$("#qsee14 .questao-info").removeClass('red-mark');
	} else if(vistoria.see14 == true){
		$("#qsee14 .questao-info").html("Sim");
		$("#qsee14 .questao-info").addClass('red-mark');
	} else {
		$("#qsee14 .questao-info").html("Sem informação");
		$("#qsee14 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see14o != null  && vistoria.see14o != ""){
		$("#qsee14o .questao-info").html(vistoria.see14o);
		$("#qsee14o").removeClass('hidden-question');
	} else {
		$("#qsee14o").addClass('hidden-question');
	}
	
	if(vistoria.see15 == false){
		$("#qsee15 .questao-info").html("Não");
		$("#qsee15 .questao-info").removeClass('red-mark');
	} else if(vistoria.see15 == true){
		$("#qsee15 .questao-info").html("Sim");
		$("#qsee15 .questao-info").addClass('red-mark');
	} else {
		$("#qsee15 .questao-info").html("Sem informação");
		$("#qsee15 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.see15o != null  && vistoria.see15o != ""){
		$("#qsee15o .questao-info").html(vistoria.see15o);
		$("#qsee15o").removeClass('hidden-question');
	} else {
		$("#qsee15o").addClass('hidden-question');
	}
	
	if(vistoria.seeinf != null  && vistoria.seeinf != ""){
		$("#qseeinf .questao-info").html(vistoria.seeinf);
		$("#qseeinf").removeClass('hidden-question');
	} else {
		$("#qseeinf").addClass('hidden-question');
	}
	
	if(vistoria.mat1 == false){
		$("#qmat1 .questao-info").html("Não");
		$("#qmat1 .questao-info").addClass('red-mark');
	} else if(vistoria.mat1 == true){
		$("#qmat1 .questao-info").html("Sim");
		$("#qmat1 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat1 .questao-info").html("Sem informação");
		$("#qmat1 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat1o != null  && vistoria.mat1o != ""){
		$("#qmat1o .questao-info").html(vistoria.mat1o);
		$("#qmat1o").removeClass('hidden-question');
	} else {
		$("#qmat1o").addClass('hidden-question');
	}
	
	if(vistoria.mat2 == false){
		$("#qmat2 .questao-info").html("Não");
		$("#qmat2 .questao-info").addClass('red-mark');
	} else if(vistoria.mat2 == true){
		$("#qmat2 .questao-info").html("Sim");
		$("#qmat2 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat2 .questao-info").html("Sem informação");
		$("#qmat2 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat2o != null  && vistoria.mat2o != ""){
		$("#qmat2o .questao-info").html(vistoria.mat2o);
		$("#qmat2o").removeClass('hidden-question');
	} else {
		$("#qmat2o").addClass('hidden-question');
	}
	
	if(vistoria.mat3 == false){
		$("#qmat3 .questao-info").html("Não");
		$("#qmat3 .questao-info").addClass('red-mark');
	} else if(vistoria.mat3 == true){
		$("#qmat3 .questao-info").html("Sim");
		$("#qmat3 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat3 .questao-info").html("Sem informação");
		$("#qmat3 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat3o != null  && vistoria.mat3o != ""){
		$("#qmat3o .questao-info").html(vistoria.mat3o);
		$("#qmat3o").removeClass('hidden-question');
	} else {
		$("#qmat3o").addClass('hidden-question');
	}
	
	if(vistoria.mat4 == false){
		$("#qmat4 .questao-info").html("Não");
		$("#qmat4 .questao-info").addClass('red-mark');
	} else if(vistoria.mat4 == true){
		$("#qmat4 .questao-info").html("Sim");
		$("#qmat4 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat4 .questao-info").html("Sem informação");
		$("#qmat4 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat4o != null  && vistoria.mat4o != ""){
		$("#qmat4o .questao-info").html(vistoria.mat4o);
		$("#qmat4o").removeClass('hidden-question');
	} else {
		$("#qmat4o").addClass('hidden-question');
	}
	
	if(vistoria.mat5 == false){
		$("#qmat5 .questao-info").html("Não");
		$("#qmat5 .questao-info").addClass('red-mark');
	} else if(vistoria.mat5 == true){
		$("#qmat5 .questao-info").html("Sim");
		$("#qmat5 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat5 .questao-info").html("Sem informação");
		$("#qmat5 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat5o != null  && vistoria.mat5o != ""){
		$("#qmat5o .questao-info").html(vistoria.mat5o);
		$("#qmat5o").removeClass('hidden-question');
	} else {
		$("#qmat5o").addClass('hidden-question');
	}
	
	if(vistoria.mat6 == false){
		$("#qmat6 .questao-info").html("Não");
		$("#qmat6 .questao-info").addClass('red-mark');
	} else if(vistoria.mat6 == true){
		$("#qmat6 .questao-info").html("Sim");
		$("#qmat6 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat6 .questao-info").html("Sem informação");
		$("#qmat6 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat6o != null  && vistoria.mat6o != ""){
		$("#qmat6o .questao-info").html(vistoria.mat6o);
		$("#qmat6o").removeClass('hidden-question');
	} else {
		$("#qmat6o").addClass('hidden-question');
	}
	
	if(vistoria.mat7 == false){
		$("#qmat7 .questao-info").html("Não");
		$("#qmat7 .questao-info").addClass('red-mark');
	} else if(vistoria.mat7 == true){
		$("#qmat7 .questao-info").html("Sim");
		$("#qmat7 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat7 .questao-info").html("Sem informação");
		$("#qmat7 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat7o != null  && vistoria.mat7o != ""){
		$("#qmat7o .questao-info").html(vistoria.mat7o);
		$("#qmat7o").removeClass('hidden-question');
	} else {
		$("#qmat7o").addClass('hidden-question');
	}
	
	if(vistoria.mat8 == false){
		$("#qmat8 .questao-info").html("Não");
		$("#qmat8 .questao-info").addClass('red-mark');
	} else if(vistoria.mat8 == true){
		$("#qmat8 .questao-info").html("Sim");
		$("#qmat8 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat8 .questao-info").html("Sem informação");
		$("#qmat8 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat8o != null  && vistoria.mat8o != ""){
		$("#qmat8o .questao-info").html(vistoria.mat8o);
		$("#qmat8o").removeClass('hidden-question');
	} else {
		$("#qmat8o").addClass('hidden-question');
	}
	
	if(vistoria.mat9 == false){
		$("#qmat9 .questao-info").html("Não");
		$("#qmat9 .questao-info").addClass('red-mark');
	} else if(vistoria.mat9 == true){
		$("#qmat9 .questao-info").html("Sim");
		$("#qmat9 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat9 .questao-info").html("Sem informação");
		$("#qmat9 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat9o != null  && vistoria.mat9o != ""){
		$("#qmat9o .questao-info").html(vistoria.mat9o);
		$("#qmat9o").removeClass('hidden-question');
	} else {
		$("#qmat9o").addClass('hidden-question');
	}
	
	if(vistoria.mat10 == false){
		$("#qmat10 .questao-info").html("Não");
		$("#qmat10 .questao-info").addClass('red-mark');
	} else if(vistoria.mat10 == true){
		$("#qmat10 .questao-info").html("Sim");
		$("#qmat10 .questao-info").removeClass('red-mark');
	} else {
		$("#qmat10 .questao-info").html("Sem informação");
		$("#qmat10 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat10o != null  && vistoria.mat10o != ""){
		$("#qmat10o .questao-info").html(vistoria.mat10o);
		$("#qmat10o").removeClass('hidden-question');
	} else {
		$("#qmat10o").addClass('hidden-question');
	}
	
	if(vistoria.mat11a == false){
		$("#qmat11a .questao-info").html("Não");
		$("#qmat11a .questao-info").addClass('red-mark');
	} else if(vistoria.mat11a == true){
		$("#qmat11a .questao-info").html("Sim");
		$("#qmat11a .questao-info").removeClass('red-mark');
	} else {
		$("#qmat11a .questao-info").html("Sem informação");
		$("#qmat11a .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat11b == false){
		$("#qmat11b .questao-info").html("Não");
		$("#qmat11b .questao-info").addClass('red-mark');
	} else if(vistoria.mat11b == true){
		$("#qmat11b .questao-info").html("Sim");
		$("#qmat11b .questao-info").removeClass('red-mark');
	} else {
		$("#qmat11b .questao-info").html("Sem informação");
		$("#qmat11b .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat11c == false){
		$("#qmat11c .questao-info").html("Não");
		$("#qmat11c .questao-info").addClass('red-mark');
	} else if(vistoria.mat11c == true){
		$("#qmat11c .questao-info").html("Sim");
		$("#qmat11c .questao-info").removeClass('red-mark');
	} else {
		$("#qmat11c .questao-info").html("Sem informação");
		$("#qmat11c .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.mat11d == false){
		$("#qmat11d .questao-info").html("Não");
		$("#qmat11d .questao-info").addClass('red-mark');
	} else if(vistoria.mat11d == true){
		$("#qmat11d .questao-info").html("Sim");
		$("#qmat11d .questao-info").removeClass('red-mark');
	} else {
		$("#qmat11d .questao-info").html("Sem informação");
		$("#qmat11d .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.matinf != null  && vistoria.matinf != ""){
		$("#qmatinf .questao-info").html(vistoria.matinf);
		$("#qmatinf").removeClass('hidden-question');
	} else {
		$("#qmatinf").addClass('hidden-question');
	}

	if(vistoria.ali1 == 1){
		$("#qali1 .questao-info").html("Sala de aula");
		$("#qali1 .questao-info").addClass('red-mark');
	} else if(vistoria.ali1 == 2) {
		$("#qali1 .questao-info").html("Outros");
		$("#qali1 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali1 == 3) {
		$("#qali1 .questao-info").html("Refeitório");
		$("#qali1 .questao-info").removeClass('red-mark');
	} else {
		$("#qali1 .questao-info").html("Sem informação");
		$("#qali1 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ali2 == 1){
		$("#qali2 .questao-info").html("Entre 200 e 750 lux");
		$("#qali2 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali2 == 2) {
		$("#qali2 .questao-info").html("Menor que 200 lux ou maior que 750 lux");
		$("#qali2 .questao-info").addClass('red-mark');
	} else {
		$("#qali2 .questao-info").html("Sem informação");
		$("#qali2 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ali3 == 1){
		$("#qali3 .questao-info").html("Inexistente");
		$("#qali3 .questao-info").addClass('red-mark');
	} else if(vistoria.ali3 == 2) {
		$("#qali3 .questao-info").html("Péssima");
		$("#qali3 .questao-info").addClass('red-mark');
	} else if(vistoria.ali3 == 3) {
		$("#qali3 .questao-info").html("Ruim");
		$("#qali3 .questao-info").addClass('red-mark');
	} else if(vistoria.ali3 == 4) {
		$("#qali3 .questao-info").html("Regular");
		$("#qali3 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali3 == 5){
		$("#qali3 .questao-info").html("Boa");
		$("#qali3 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali3 == 6){
		$("#qali3 .questao-info").html("Ótima");
		$("#qali3 .questao-info").removeClass('red-mark');
	} else {
		$("#qali3 .questao-info").html("Sem informação");
		$("#qali3 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ali4 == 1){
		$("#qali4 .questao-info").html("Inexistente");
		$("#qali4 .questao-info").addClass('red-mark');
	} else if(vistoria.ali4 == 2) {
		$("#qali4 .questao-info").html("Péssima");
		$("#qali4 .questao-info").addClass('red-mark');
	} else if(vistoria.ali4 == 3) {
		$("#qali4 .questao-info").html("Ruim");
		$("#qali4 .questao-info").addClass('red-mark');
	} else if(vistoria.ali4 == 4) {
		$("#qali4 .questao-info").html("Regular");
		$("#qali4 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali4 == 5){
		$("#qali4 .questao-info").html("Boa");
		$("#qali4 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali4 == 6){
		$("#qali4 .questao-info").html("Ótima");
		$("#qali4 .questao-info").removeClass('red-mark');
	} else {
		$("#qali4 .questao-info").html("Sem informação");
		$("#qali4 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ali5 == 1){
		$("#qali5 .questao-info").html("Inexistente");
		$("#qali5 .questao-info").addClass('red-mark');
	} else if(vistoria.ali5 == 2) {
		$("#qali5 .questao-info").html("Péssima");
		$("#qali5 .questao-info").addClass('red-mark');
	} else if(vistoria.ali5 == 3) {
		$("#qali5 .questao-info").html("Ruim");
		$("#qali5 .questao-info").addClass('red-mark');
	} else if(vistoria.ali5 == 4) {
		$("#qali5 .questao-info").html("Regular");
		$("#qali5 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali5 == 5){
		$("#qali5 .questao-info").html("Boa");
		$("#qali5 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali5 == 6){
		$("#qali5 .questao-info").html("Ótima");
		$("#qali5 .questao-info").removeClass('red-mark');
	} else {
		$("#qali5 .questao-info").html("Sem informação");
		$("#qali5 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ali6 == 1){
		$("#qali6 .questao-info").html("Inexistente");
		$("#qali6 .questao-info").addClass('red-mark');
	} else if(vistoria.ali6 == 2) {
		$("#qali6 .questao-info").html("Péssima");
		$("#qali6 .questao-info").addClass('red-mark');
	} else if(vistoria.ali6 == 3) {
		$("#qali6 .questao-info").html("Ruim");
		$("#qali6 .questao-info").addClass('red-mark');
	} else if(vistoria.ali6 == 4) {
		$("#qali6 .questao-info").html("Regular");
		$("#qali6 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali6 == 5){
		$("#qali6 .questao-info").html("Boa");
		$("#qali6 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali6 == 6){
		$("#qali6 .questao-info").html("Ótima");
		$("#qali6 .questao-info").removeClass('red-mark');
	} else {
		$("#qali6 .questao-info").html("Sem informação");
		$("#qali6 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ali7 == 1){
		$("#qali7 .questao-info").html("Inexistente");
		$("#qali7 .questao-info").addClass('red-mark');
	} else if(vistoria.ali7 == 2) {
		$("#qali7 .questao-info").html("Péssima");
		$("#qali7 .questao-info").addClass('red-mark');
	} else if(vistoria.ali7 == 3) {
		$("#qali7 .questao-info").html("Ruim");
		$("#qali7 .questao-info").addClass('red-mark');
	} else if(vistoria.ali7 == 4) {
		$("#qali7 .questao-info").html("Regular");
		$("#qali7 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali7 == 5){
		$("#qali7 .questao-info").html("Boa");
		$("#qali7 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali7 == 6){
		$("#qali7 .questao-info").html("Ótima");
		$("#qali7 .questao-info").removeClass('red-mark');
	} else {
		$("#qali7 .questao-info").removeClass('red-mark');
		$("#qali7 .questao-info").html("Sem informação");
	}
	
	if(vistoria.ali8 == 1){
		$("#qali8 .questao-info").html("Inexistente");
		$("#qali8 .questao-info").addClass('red-mark');
	} else if(vistoria.ali8 == 2) {
		$("#qali8 .questao-info").html("Péssima");
		$("#qali8 .questao-info").addClass('red-mark');
	} else if(vistoria.ali8 == 3) {
		$("#qali8 .questao-info").html("Ruim");
		$("#qali8 .questao-info").addClass('red-mark');
	} else if(vistoria.ali8 == 4) {
		$("#qali8 .questao-info").html("Regular");
		$("#qali8 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali8 == 5){
		$("#qali8 .questao-info").html("Boa");
		$("#qali8 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali8 == 6){
		$("#qali8 .questao-info").html("Ótima");
		$("#qali8 .questao-info").removeClass('red-mark');
	} else {
		$("#qali8 .questao-info").html("Sem informação");
		$("#qali8 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ali9 == 1){
		$("#qali9 .questao-info").html("Inexistente");
		$("#qali9 .questao-info").addClass('red-mark');
	} else if(vistoria.ali9 == 2) {
		$("#qali9 .questao-info").html("Péssima");
		$("#qali9 .questao-info").addClass('red-mark');
	} else if(vistoria.ali9 == 3) {
		$("#qali9 .questao-info").html("Ruim");
		$("#qali9 .questao-info").addClass('red-mark');
	} else if(vistoria.ali9 == 4) {
		$("#qali9 .questao-info").html("Regular");
		$("#qali9 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali9 == 5){
		$("#qali9 .questao-info").html("Boa");
		$("#qali9 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali9 == 6){
		$("#qali9 .questao-info").html("Ótima");
		$("#qali9 .questao-info").removeClass('red-mark');
	} else {
		$("#qali9 .questao-info").html("Sem informação");
		$("#qali9 .questao-info").removeClass('red-mark');
	}

	if(vistoria.ali10 == 1){
		$("#qali10 .questao-info").html("Nunca");
		$("#qali10 .questao-info").addClass('red-mark');
	} else if(vistoria.ali10 == 2) {
		$("#qali10 .questao-info").html("Raramente");
		$("#qali10 .questao-info").addClass('red-mark');
	} else if(vistoria.ali10 == 3) {
		$("#qali10 .questao-info").html("Indiferente");
		$("#qali10 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali10 == 4) {
		$("#qali10 .questao-info").html("De vez em quando");
		$("#qali10 .questao-info").addClass('red-mark');
	} else if(vistoria.ali10 == 5){
		$("#qali10 .questao-info").html("Sempre");
		$("#qali10 .questao-info").removeClass('red-mark');
	} else {
		$("#qali10 .questao-info").html("Sem informação");
		$("#qali10 .questao-info").removeClass('red-mark');
	}

	if(vistoria.ali11 == 1){
		$("#qali11 .questao-info").html("Nunca");
		$("#qali11 .questao-info").addClass('red-mark');
	} else if(vistoria.ali11 == 2) {
		$("#qali11 .questao-info").html("Raramente");
		$("#qali11 .questao-info").addClass('red-mark');
	} else if(vistoria.ali11 == 3) {
		$("#qali11 .questao-info").html("Indiferente");
		$("#qali11 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali11 == 4) {
		$("#qali11 .questao-info").html("De vez em quando");
		$("#qali11 .questao-info").addClass('red-mark');
	} else if(vistoria.ali11 == 5){
		$("#qali11 .questao-info").html("Sempre");
		$("#qali11 .questao-info").removeClass('red-mark');
	} else {
		$("#qali11 .questao-info").html("Sem informação");
		$("#qali11 .questao-info").removeClass('red-mark');
	}

	if(vistoria.ali12 == 1){
		$("#qali12 .questao-info").html("Nunca");
		$("#qali12 .questao-info").addClass('red-mark');
	} else if(vistoria.ali12 == 2) {
		$("#qali12 .questao-info").html("Raramente");
		$("#qali12 .questao-info").addClass('red-mark');
	} else if(vistoria.ali12 == 3) {
		$("#qali12 .questao-info").html("Indiferente");
		$("#qali12 .questao-info").removeClass('red-mark');
	} else if(vistoria.ali12 == 4) {
		$("#qali12 .questao-info").html("De vez em quando");
		$("#qali12 .questao-info").addClass('red-mark');
	} else if(vistoria.ali12 == 5){
		$("#qali12 .questao-info").html("Sempre");
		$("#qali12 .questao-info").removeClass('red-mark');
	} else {
		$("#qali12 .questao-info").html("Sem informação");
		$("#qali12 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.ali13 == false){
		$("#qali13 .questao-info").html("Não");
		$("#qali13 .questao-info").addClass('red-mark');
	} else if(vistoria.ali13 == true){
		$("#qali13 .questao-info").html("Sim");
		$("#qali13 .questao-info").removeClass('red-mark');
	} else {
		$("#qali13 .questao-info").html("Sem informação");
		$("#qali13 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.aliinf != null  && vistoria.aliinf != ""){
		$("#qaliinf .questao-info").html(vistoria.aliinf);
		$("#qaliinf").removeClass('hidden-question');
	} else {
		$("#qaliinf").addClass('hidden-question');
	}

	if(vistoria.lav1 == false){
		$("#qlav1 .questao-info").html("Não");
		$("#qlav1 .questao-info").addClass('red-mark');
	} else if(vistoria.lav1 == true){
		$("#qlav1 .questao-info").html("Sim");
		$("#qlav1 .questao-info").removeClass('red-mark');
	} else {
		$("#qlav1 .questao-info").html("Sem informação");
		$("#qlav1 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.lav2 == false){
		$("#qlav2 .questao-info").html("Não");
		$("#qlav2 .questao-info").addClass('red-mark');
	} else if(vistoria.lav2 == true){
		$("#qlav2 .questao-info").html("Sim");
		$("#qlav2 .questao-info").removeClass('red-mark');
	} else {
		$("#qlav2 .questao-info").html("Sem informação");
		$("#qlav2 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.lav3 == false){
		$("#qlav3 .questao-info").html("Não");
		$("#qlav3 .questao-info").addClass('red-mark');
	} else if(vistoria.lav3 == true){
		$("#qlav3 .questao-info").html("Sim");
		$("#qlav3 .questao-info").removeClass('red-mark');
	} else {
		$("#qlav3 .questao-info").html("Sem informação");
		$("#qlav3 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.lav4 == false){
		$("#qlav4 .questao-info").html("Não");
		$("#qlav4 .questao-info").addClass('red-mark');
	} else if(vistoria.lav4 == true){
		$("#qlav4 .questao-info").html("Sim");
		$("#qlav4 .questao-info").removeClass('red-mark');
	} else {
		$("#qlav4 .questao-info").html("Sem informação");
		$("#qlav4 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.lav5 == false){
		$("#qlav5 .questao-info").html("Não");
		$("#qlav5 .questao-info").addClass('red-mark');
	} else if(vistoria.lav5 == true){
		$("#qlav5 .questao-info").html("Sim");
		$("#qlav5 .questao-info").removeClass('red-mark');
	} else {
		$("#qlav5 .questao-info").html("Sem informação");
		$("#qlav5 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.lavinf != null  && vistoria.lavinf != ""){
		$("#qlavinf .questao-info").html(vistoria.lavinf);
		$("#qlavinf").removeClass('hidden-question');
	} else {
		$("#qlavinf").addClass('hidden-question');
	}
	
	if(vistoria.sau1 == false){
		$("#qsau1 .questao-info").html("Não");
		$("#qsau1 .questao-info").addClass('red-mark');
	} else if(vistoria.sau1 == true){
		$("#qsau1 .questao-info").html("Sim");
		$("#qsau1 .questao-info").removeClass('red-mark');
	} else {
		$("#qsau1 .questao-info").html("Sem informação");
		$("#qsau1 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau2 == false){
		$("#qsau2 .questao-info").html("Não");
		$("#qsau2 .questao-info").addClass('red-mark');
	} else if(vistoria.sau2 == true){
		$("#qsau2 .questao-info").html("Sim");
		$("#qsau2 .questao-info").removeClass('red-mark');
	} else {
		$("#qsau2 .questao-info").html("Sem informação");
		$("#qsau2 .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau3a == false){
		$("#qsau3a .questao-info").html("Não");
		$("#qsau3a .questao-info").removeClass('red-mark');
	} else if(vistoria.sau3a == true){
		$("#qsau3a .questao-info").html("Sim");
		$("#qsau3a .questao-info").addClass('red-mark');
	} else {
		$("#qsau3a .questao-info").html("Sem informação");
		$("#qsau3a .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau3b == false){
		$("#qsau3b .questao-info").html("Não");
		$("#qsau3b .questao-info").removeClass('red-mark');
	} else if(vistoria.sau3b == true){
		$("#qsau3b .questao-info").html("Sim");
		$("#qsau3b .questao-info").addClass('red-mark');
	} else {
		$("#qsau3b .questao-info").html("Sem informação");
		$("#qsau3b .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau3c == false){
		$("#qsau3c .questao-info").html("Não");
		$("#qsau3c .questao-info").removeClass('red-mark');
	} else if(vistoria.sau3c == true){
		$("#qsau3c .questao-info").html("Sim");
		$("#qsau3c .questao-info").addClass('red-mark');
	} else {
		$("#qsau3c .questao-info").html("Sem informação");
		$("#qsau3c .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau3d == false){
		$("#qsau3d .questao-info").html("Não");
		$("#qsau3d .questao-info").removeClass('red-mark');
	} else if(vistoria.sau3d == true){
		$("#qsau3d .questao-info").html("Sim");
		$("#qsau3d .questao-info").addClass('red-mark');
	} else {
		$("#qsau3d .questao-info").html("Sem informação");
		$("#qsau3d .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau3e == false){
		$("#qsau3e .questao-info").html("Não");
		$("#qsau3e .questao-info").removeClass('red-mark');
	} else if(vistoria.sau3e == true){
		$("#qsau3e .questao-info").html("Sim");
		$("#qsau3e .questao-info").addClass('red-mark');
	} else {
		$("#qsau3e .questao-info").html("Sem informação");
		$("#qsau3e .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau3f == false){
		$("#qsau3f .questao-info").html("Não");
		$("#qsau3f .questao-info").removeClass('red-mark');
	} else if(vistoria.sau3f == true){
		$("#qsau3f .questao-info").html("Sim");
		$("#qsau3f .questao-info").addClass('red-mark');
	} else {
		$("#qsau3f .questao-info").html("Sem informação");
		$("#qsau3f .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau3g == false){
		$("#qsau3g .questao-info").html("Não");
		$("#qsau3g .questao-info").removeClass('red-mark');
	} else if(vistoria.sau3g == true){
		$("#qsau3g .questao-info").html("Sim");
		$("#qsau3g .questao-info").addClass('red-mark');
	} else {
		$("#qsau3g .questao-info").html("Sem informação");
		$("#qsau3g .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau3h == false){
		$("#qsau3h .questao-info").html("Não");
		$("#qsau3h .questao-info").removeClass('red-mark');
	} else if(vistoria.sau3h == true){
		$("#qsau3h .questao-info").html("Sim");
		$("#qsau3h .questao-info").addClass('red-mark');
	} else {
		$("#qsau3h .questao-info").html("Sem informação");
		$("#qsau3h .questao-info").removeClass('red-mark');
	}
	
	if(vistoria.sau3i == false){
		$("#qsau3i .questao-info").html("Não");
		$("#qsau3i .questao-info").removeClass('red-mark');
	} else if(vistoria.sau3i == true){
		$("#qsau3i .questao-info").html("Sim");
		$("#qsau3i .questao-info").addClass('red-mark');
	} else {
		$("#qsau3i .questao-info").html("Sem informação");
		$("#qsau3i .questao-info").removeClass('red-mark');
	}
}