var dropFotos = new Dropzone("div#fotosVisita",
{
	url: "list"
});

// myDropzone is the configuration for the element that has an id attribute
// with the value my-dropzone (or myDropzone)
Dropzone.options.dropFotos = {
	init: function(){
		this.on("addedfile", function(file){

			// Create the remove button
			var removeButton = Dropzone.createElement("<button>Remover foto</button>");

			// Capture the Dropzone instance as closure.
			var _this = this;

			// Listen to the click event
			removeButton.addEventListener("click", function(e){
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
		});
	}
};