package com.example.demo.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entities.JSONFileUpload;
import com.example.demo.helpers.UploadFileHelper;

@Controller
@RequestMapping("/product")
public class ProductController implements ServletContextAware {
	
	private ServletContext servletContext;

	@RequestMapping(method=RequestMethod.GET)
	public String index() {
		return "product/index";
	}
	
	@RequestMapping(value="/filebrowse", method=RequestMethod.GET)
	public String fileBrowse(ModelMap modelMap) {
		File folder = new File(servletContext.getRealPath("/WEB-INF/uploads"));
		modelMap.put("files", folder.listFiles());
		return "product/filebrowse";
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	@RequestMapping(value="/upload_ckeditor", method = RequestMethod.POST, produces = {MimeTypeUtils.APPLICATION_JSON_VALUE})
	public ResponseEntity<JSONFileUpload> uploadCKEditor(@RequestParam("upload") MultipartFile upload) {
		try {
			String fileName = UploadFileHelper.upload(servletContext, upload);
			return new ResponseEntity<JSONFileUpload>(new JSONFileUpload("/WEB-INF/uploads/" + fileName), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<JSONFileUpload>(HttpStatus.BAD_REQUEST);
		}
	}
	
}
