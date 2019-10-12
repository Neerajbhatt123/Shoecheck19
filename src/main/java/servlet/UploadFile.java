package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cloudinary.Cloudinary;
import com.cloudinary.strategies.*;
import com.cloudinary.utils.ObjectUtils;

import imagebank.ImageBank;
import imagebank.ImageBankHandler;

@SuppressWarnings("serial")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024 , maxRequestSize = 25 * 1024 * 1024)
@WebServlet(urlPatterns = "/UploadFile")

public class UploadFile extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Upload File");

	//int id = Integer.parseInt(req.getParameter("id"));
		//String url = req.getParameter("url");
		Part p = req.getPart("myFile");

		System.out.println(p);
		System.out.println(p.getSize());
		System.out.println(p.getSubmittedFileName());
		
		System.out.println(req.getRealPath("/"));

		String currPath = req.getRealPath("/");

		FileOutputStream fos = new FileOutputStream(currPath + "/" + p.getSubmittedFileName());

		byte[] b = new byte[(int) p.getSize()];
		p.getInputStream().read(b);
		fos.write(b);

		fos.close();
		
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", "neerajbhatt9871", "api_key",
				"486245372855893", "api_secret", "GWmnnuWEpAUCz-8EGDh_f1JdB8s"));

		File file = new File(currPath + "/" + p.getSubmittedFileName());

		Map uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());

		System.out.println(uploadResult.get("secure_url"));

			
		ImageBank ib = new ImageBank();
		  ImageBankHandler ibh = new ImageBankHandler();
		  
		  ibh.insert(new ImageBank(uploadResult.get("secure_url").toString()));
//		  
//		  ibh.fetchAllImagesInBank(ib);
		  
		  resp.sendRedirect("ViewImageBank.jsp");
		 }
}
