package net.java_school.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;

import net.java_school.commons.WebContants;
import net.java_school.board.BoardService;
import net.java_school.board.AttachFile;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class DownloadController {
	
	@Autowired
	private BoardService boardService;

	@GetMapping("data")
	public ResponseEntity<InputStreamResource> download(@RequestParam(name="fileno") Integer fileno, HttpServletRequest req) throws IOException {
		AttachFile attachFile = boardService.getAttachFile(fileno);
		String owner = attachFile.getEmail();
		String filename = attachFile.getFilename();

		//검증 코드 시작
		Path ownerPath = Paths.get(WebContants.UPLOAD_PATH + owner).toAbsolutePath().normalize();
		Path filePath = ownerPath.resolve(filename);
		Path normalizedFilePath = filePath.normalize();
		if (!normalizedFilePath.startsWith(ownerPath)) {
			throw new SecurityException("Path Traversal (" + filename + ")");
		}
		File file = normalizedFilePath.toFile();
		if (!file.exists() || !file.isFile()) {
			throw new FileNotFoundException("The file does not exist!");
		}
		//검증 코드 끝
		InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

		boolean ie = req.getHeader("User-Agent").indexOf("MSIE") != -1;
		if (ie) {
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
		} else {
			filename = new String(filename.getBytes("UTF-8"), "8859_1");
		}

		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + filename + "\"")
				.contentType(MediaType.APPLICATION_OCTET_STREAM).contentLength(file.length())
				.body(resource);
	}

	@PostMapping("data")
	public void boardDataDownload(@RequestParam(name="fileno") Integer fileno, HttpServletRequest req, HttpServletResponse resp) {
		OutputStream outputStream = null;

		AttachFile attachFile = boardService.getAttachFile(fileno);
		String owner = attachFile.getEmail();
		String filename = attachFile.getFilename();

		try {
			//검증 코드 시작
			Path ownerPath = Paths.get(WebContants.UPLOAD_PATH + owner).toAbsolutePath().normalize();
			Path filePath = ownerPath.resolve(filename);
			Path normalizedFilePath = filePath.normalize();
			if (!normalizedFilePath.startsWith(ownerPath)) {
				throw new SecurityException("Path Traversal (" + filename + ")");
			}
			File file = normalizedFilePath.toFile();
			if (!file.exists() || !file.isFile()) {
				throw new FileNotFoundException("The file does not exist!");
			}
			//검증 코드 끝
			
			String filetype = filename.substring(filename.indexOf(".") + 1, filename.length());

			if (filetype.trim().equalsIgnoreCase("txt")) {
				resp.setContentType("text/plain");
			} else {
				resp.setContentType("application/octet-stream");
			}

			resp.setContentLength((int) file.length());

			boolean ie = req.getHeader("User-Agent").indexOf("MSIE") != -1;
			if (ie) {
				filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", " ");
			} else {
				filename = new String(filename.getBytes("UTF-8"), "8859_1");
			}

			resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

			outputStream = resp.getOutputStream();
			FileInputStream fis = null;

			try {
				fis = new FileInputStream(file);
				FileCopyUtils.copy(fis, outputStream);
			} finally {
				if (fis != null) {
					fis.close();
				}
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				outputStream.close();
				resp.flushBuffer();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
