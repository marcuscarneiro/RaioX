var dropFoto = new Dropzone("div#fotoEscola", {
	url: "salvaEscola",
	addRemoveLinks: true,
	paramName: "fileUpload",
	maxFilesize: 50, // MB
    maxFiles: 1,
    autoProcessQueue: false,
    uploadMultiple: "false",
    acceptedFiles: ".png, .jpg"
});

//var dropRelatorios = new Dropzone("div#relatorios", {
//	url : "salvaEscola"
//});

function arquivoAdicionado(file){
	var removeButton = Dropzone.createElement("<button>Remover foto</button>");

	// Capture the Dropzone instance as closure.
	var _this = this;
	
	// Listen to the click event
	removeButton.addEventListener("click", function(e) {
	// Make sure the button click doesn't submit the form:
	e.preventDefault();
	e.stopPropagation();
	
	// Remove the file preview.
	_this.removeFile(file);
	// If you want to the delete the file on the server as well,
	// you can do the AJAX request here.
	});
	
	// Add the button to the file preview element.
	file.previewElement.appendChild(removeButton);
}

// myDropzone is the configuration for the element that has an id attribute
// with the value my-dropzone (or myDropzone)
Dropzone.options.dropFoto = {
		maxFiles: 1,
		init : function() {
		this.on("addedfile", function(file) {
			arquivoAdicionado(file);			
		});
		
		this.on("drop", function (data) {
            alert("Lotou!");
        });
	}
};

function arquivoAdicionado(file){
	var removeButton = Dropzone.createElement("<button>Remover foto</button>");

	// Capture the Dropzone instance as closure.
	var _this = this;
	
	// Listen to the click event
	removeButton.addEventListener("click", function(e) {
	// Make sure the button click doesn't submit the form:
	e.preventDefault();
	e.stopPropagation();
	
	// Remove the file preview.
	_this.removeFile(file);
	// If you want to the delete the file on the server as well,
	// you can do the AJAX request here.
	});
	
	// Add the button to the file preview element.
	file.previewElement.appendChild(removeButton);
}

// myDropzone is the configuration for the element that has an id attribute
// with the value my-dropzone (or myDropzone)
Dropzone.options.dropRelatorios = {
		maxFiles: 1,
		init : function() {
		this.on("addedfile", function(file) {
			arquivoAdicionado(file);			
		});
		
		this.on("drop", function (data) {
            alert("Lotou!");
        });
	}
};
