$(document).ready(function() {
	$('#lista').dataTable({
		"language": {
			"lengthMenu": "Exibir _MENU_ linhas por página",
			"zeroRecords": "Nenhum dado encontrado",
			"info": "Exibindo página _PAGE_ de _PAGES_",
			"infoEmpty": "Sem dados disponíveis",
			"infoFiltered": "(filtrados de um total de _MAX_)"
		}
	});
});