function chamaNaGrande(){
	$.ajax({
		url: 'carregaEscolas',
		type: "GET",
		success: function(data) {
//			//$(".escola-title h2").html(data);
//			var lista;
//			$.each(data, function(i, obj) {
//
//                lista += "Escola:"+obj.nome+"\n";                                
//            });
//			alert(data);
			geojson = data;
			alert(data);
		}
	});
}

chamaNaGrande();