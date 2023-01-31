package com.hp.customerService.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hp.common.MyFileRenamePolicy;
import com.hp.common.model.vo.Attachment;
import com.hp.customerService.model.Service.NoticeService;
import com.hp.customerService.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeEnrollController
 */
@WebServlet("/insert.nt")
public class NoticeEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/attachment_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			String Qcategory = multiRequest.getParameter("Qcategory");
			String grade ="";
			if(Qcategory.equals("tutee")) {
				grade="1";
			}else {
				grade="2";
			}
			String content = multiRequest.getParameter("content");
			
			Notice n = new Notice();
			n.setNtTitle(title);
			n.setGrade(grade);
			n.setNtContent(content);
			
			Attachment at = null;
			if(multiRequest.getOriginalFileName("upfile") != null) { 
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/attachment_upfiles/");
			}
			
			int result = new NoticeService().insertNotice(n,at);
			HttpSession session = request.getSession();
			if(result>0) {
				
				session.setAttribute("alertMsg", "공지사항 등록이 완료되었습니다.");
				response.sendRedirect(request.getContextPath()+"/noticeList.ad?cpage=1");
			}else {
				
			}
			
			
			
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
