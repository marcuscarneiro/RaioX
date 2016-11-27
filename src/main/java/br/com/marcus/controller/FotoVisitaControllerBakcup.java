package br.com.marcus.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import br.com.marcus.modelo.FotoVisita;
import br.com.marcus.service.FileUploadService;

import org.apache.commons.io.FileUtils;

import org.springframework.util.FileCopyUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FotoVisitaControllerBakcup {

	@Autowired
	private FileUploadService uploadService;

	@RequestMapping("/6")
	public String home() {

		// will be resolved to /views/fileUploader.jsp      
		return "fotoUploader";
	}

	@RequestMapping(value = "/7", method = RequestMethod.POST)
	public @ResponseBody void upload(MultipartHttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();

		// Maintain a list to send back the files info. to the client side
		List<FotoVisita> fotos = new ArrayList<FotoVisita>();

		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {

			// Save the file to local disk
			saveFileToLocalDisk(multipartFile);

			FotoVisita fotoInfo = getUploadedFileInfo(multipartFile);

			// Save the file info to database
			saveFileToDatabase(fotoInfo);

			// adding the file info to the list
			fotos.add(fotoInfo);
		}

		return;
	}

	@RequestMapping(value = { "/8" })
	public String listBooks(Map<String, Object> map) {

		map.put("fileList", uploadService.listFotos());

		// will be resolved to /views/listFiles.jsp
		return "/listFotos";
	}

	@RequestMapping(value = "/get/9", method = RequestMethod.GET)
	public void getFile(HttpServletResponse response, @PathVariable Long fileId) {

		FotoVisita dataFile = uploadService.getFoto(fileId);

		File file = new File(dataFile.getLocalizacao(), dataFile.getNome());

		try {
			response.setContentType(dataFile.getTipo());
			response.setHeader("Content-disposition", "attachment; filename=\""
					+ dataFile.getNome() + "\"");

			FileCopyUtils.copy(FileUtils.readFileToByteArray(file),
					response.getOutputStream());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void saveFileToLocalDisk(MultipartFile multipartFile)
			throws IOException, FileNotFoundException {

		String outputFileName = getOutputFilename(multipartFile);

		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(
				outputFileName));
	}

	private void saveFileToDatabase(FotoVisita foto) {
		uploadService.saveFoto(foto);
		return;

	}

	private String getOutputFilename(MultipartFile multipartFile) {

		return getDestinationLocation() + multipartFile.getOriginalFilename();
	}

	private FotoVisita getUploadedFileInfo(MultipartFile multipartFile)
			throws IOException {

		FotoVisita fileInfo = new FotoVisita();
		fileInfo.setNome(multipartFile.getOriginalFilename());
		fileInfo.setTamanho(multipartFile.getSize());
		fileInfo.setTipo(multipartFile.getContentType());
		fileInfo.setLocalizacao(getDestinationLocation());

		return fileInfo;
	}

	private String getDestinationLocation() {
		return "C:/Trabalho/uploaded-files/";
	}
}

