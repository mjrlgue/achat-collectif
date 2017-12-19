package com.ensa.front.utility;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

//p0505
public class FileUploaderUtility {
	
	private static final String ABS_PATH = "C:\\Users\\Ghassane\\Documents\\workspace-sts-3.9.1.RELEASE\\projetmvc\\front\\src\\main\\webapp\\assets\\images\\";
	private static String REAL_PATH = "";
	//get a logger
	private static final Logger logger=LoggerFactory.getLogger(FileUploaderUtility.class);
	
	public static void uploadFile(HttpServletRequest request, MultipartFile file, String code) {
		// TODO Auto-generated method stub
		//get real path
		REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/");
		logger.info(REAL_PATH);
		
		//check if all directories exist
		if(!new File(ABS_PATH).exists()) {
			//create directories
			new File(ABS_PATH).mkdirs();
		}
		//directories for real path
		if(!new File(REAL_PATH).exists()) {
			//create directories
			new File(REAL_PATH).mkdirs();
		}
		
		//transfer files
		try {
			
			//server upload
			file.transferTo(new File(REAL_PATH + code + ".jpg"));
			//project directory upload
			file.transferTo(new File(ABS_PATH + code + ".jpg"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}
