package com.kteam.lzpt.web.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

public class UploadAction extends BaseAction {

	// myFile属性用来封装上传的文件
	private File uploadFile;

	// myFileContentType属性用来封装上传文件的类型
	private String uploadFileContentType;

	// myFileFileName属性用来封装上传文件的文件名
	private String uploadFileFileName;
	
	private String fileId;
	
	private String fn;
	
	
	
	public String getFn() {
		return fn;
	}

	public void setFn(String fn) {
		this.fn = fn;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}
	
	
	
	public void uploadFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter pw = null;
		JSONArray ja=new JSONArray();
		JSONObject state=new JSONObject();
		JSONObject data=new JSONObject();
		try {
			pw = response.getWriter();
			String id = writeFile(uploadFile,uploadFileFileName);
			String fileSize ="";
			NumberFormat nf = NumberFormat.getNumberInstance();
			nf.setMaximumFractionDigits(2);
			if(uploadFile.length()>1024*1024){
				
				fileSize= nf.format(uploadFile.length()/(1024*1024*1.00))+"MB";
				
			}else{
				fileSize=nf.format(uploadFile.length()/1024*1.00)+"KB";
			}
			
			state.put("message", "success");
			data.put("filename", uploadFileFileName);
			data.put("id", id);
			data.put("size",fileSize);
			
			ja.add(state);
			ja.add(data);
			
			pw.print(ja.toString());
		} catch (Exception e) {
			if(pw!=null){
				state.put("message","error");
				pw.print(ja.toString());
			}
			log.error("文件上传错误",e);
		}
	}
	
	public void deleteUploadFile(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter pw = null;
		
		try{
			pw = response.getWriter();
			// 设置上传文件目录
			String uploadPath = System.getProperty("tomcat.dir") + "/upload";
			String filePath=uploadPath+"/"+fileId;
			File file=new File(filePath);
			System.out.println(filePath);
			
			if(file.exists()&&file.isFile()){
				file.delete();
				pw.print("success");
			}
			
		} catch (Exception e) {
			if(pw!=null){
				pw.print("error");
			}
			log.error("文件删除错误",e);
		}
	}
	
	
	public void download(){
		 try {
			 
			HttpServletResponse response = ServletActionContext.getResponse();
			
			HttpServletRequest request=ServletActionContext.getRequest();
	         
	     	String uploadPath = System.getProperty("tomcat.dir") + "/upload";
	            // path是指欲下载的文件的路径。
	         File file = new File(uploadPath+"/"+fileId);
	            
	         
	            // 取得文件名。
	            String filename =  URLDecoder.decode(fn, "UTF-8");
	            
	            // 取得文件的后缀名。
	            //String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();

	            // 以流的形式下载文件。
	            InputStream fis = new BufferedInputStream(new FileInputStream(file));
	            byte[] buffer = new byte[fis.available()];
	            fis.read(buffer);
	            fis.close();
	            // 清空response
	            response.reset();
	            // 设置response的Header
	           
	            if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0){
	            	filename = URLEncoder.encode(filename, "UTF-8");
	            }else{
	            	filename=new String(filename.getBytes("utf-8"),"ISO-8859-1");
	            }
	            	
	            
	            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
	            response.addHeader("Content-Disposition", "attachment;filename=" + filename);
	            response.addHeader("Content-Length", "" + file.length());
	            response.setContentType("application/octet-stream");
	            toClient.write(buffer);
	            toClient.flush();
	            toClient.close();
	        } catch (IOException ex) {
	        	log.error("文件下载错误",ex);
	        }
//	        return response;
	}
	
	
	
	private String writeFile(File file, String fileName)
			throws Exception {
		// 基于myFile创建一个文件输入流

		InputStream is = null;

		OutputStream os = null;
		
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			is = new FileInputStream(file);
			
			String fType = request.getParameter("addfile");

			// 设置上传文件目录
			String uploadPath = "";
			if (null == fType || "".equals(fType))
			{
				// 设置上传文件目录
				uploadPath = System.getProperty("tomcat.dir") + "/upload";
			}else if ("crade".equals(fType))
			{
				uploadPath = System.getProperty("uploadCadrePath") + "/uploadCadre";
			}

			int suffixIndex = fileName.lastIndexOf(".");

			String suffix = suffixIndex == -1 ? "" : fileName.substring(
					suffixIndex, fileName.length());

			fileName = UUID.randomUUID().toString() + suffix;

			// 设置目标文件
			File toFile = new File(uploadPath, fileName);

			// 创建一个输出流
			os = new FileOutputStream(toFile);

			// 设置缓存
			byte[] buffer = new byte[1024];

			int length = 0;

			// 读取myFile文件输出到toFile文件中
			while ((length = is.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
		}catch(Exception e){
			log.error("文件读写异常",e);
			throw e;
		} finally {
			if (is != null) {
				// 关闭输入流
				is.close();
			}

			if (os != null) {
				// 关闭输出流
				os.close();
			}
		}

		return fileName;
	}

}
