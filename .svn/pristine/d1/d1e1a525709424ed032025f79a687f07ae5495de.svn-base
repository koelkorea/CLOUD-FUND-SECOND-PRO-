package controller;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import vo.FileVO;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet(description = "이미지 파일 업로드", urlPatterns = { "/upload/upload.do" })
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Logger LOG = Logger.getLogger(UploadServlet.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug("----------------------------------");
	    LOG.debug("- doPost() -");
	    LOG.debug("----------------------------------");
	    
	    // 파일 저장 경로
	    String savePath = "C:\\20201123_eClass\\02_ORACLE\\workspace_web\\HAO\\WebContent\\img"; 
	    // 파일 용량
	    int maxSize = 1024 * 1024 * 50; // 50MB
	    // Encoding Type
	    String encType = "UTF-8";
	    // 현재 시간
	    //String sysDate = StringUtil.formatDate("yyyyMMddHH24mmss");
	    
	    // 파일 업로드
	    MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
	
	    // 파일 Read
	    Enumeration<String> files = multi.getFileNames();
	    List<FileVO> fileList = new ArrayList<FileVO>();
	    
	    while (files.hasMoreElements()) {
	    	FileVO fileVO = new FileVO();
	    	String file = files.nextElement();
	    	LOG.debug("file : " + file);
	    	
	    	// 원본 파일명
		    String orgFileName = multi.getOriginalFileName(file);
		    LOG.debug("orgFileName : " + orgFileName);
	    	
		    // 저장 파일명
		    String saveFileName = multi.getFilesystemName(file);
		    LOG.debug("saveFileName : " + saveFileName);
		    
		    // 저장 경로
		    fileVO.setFilePath(savePath);
		    LOG.debug("저장 경로 : " + fileVO.getFilePath());
		    // 원본 파일명
		    fileVO.setOrgFileName(orgFileName);
		    // 저장 파일명
		    fileVO.setSaveFileName(saveFileName);
		    // 파일 사이즈
		    String fileFullPath = savePath + File.separator + saveFileName;
		    File tmpFile = new File(fileFullPath);
		    long fileSize = tmpFile.length();
		    fileVO.setFileSize(fileSize);
		    // 확장자
		    String fileExt = "";
		    if (orgFileName.lastIndexOf(".") > 0) {
		    	int dotIndex = orgFileName.lastIndexOf(".");
		    	fileExt = orgFileName.substring(dotIndex + 1); 
		    }
		    fileVO.setFileExt(fileExt);
		    
		    // p_thumb
		    String p_thumb = "HAO/img/" + saveFileName;
		    LOG.debug("p_thumb : " + p_thumb);
		    fileVO.setP_thumb(p_thumb);
		    
		    fileList.add(fileVO);
	    }
	    
	    for (FileVO vo : fileList) {
	    	LOG.debug("vo : " + vo);
	    }
	    
	    // List -> JSON
	    Gson gson = new Gson();
		String jsonString = gson.toJson(fileList);
		LOG.debug("jsonString : " + jsonString);
		
		// 화면으로 데이터 전달
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonString);
	}

} // --- class
