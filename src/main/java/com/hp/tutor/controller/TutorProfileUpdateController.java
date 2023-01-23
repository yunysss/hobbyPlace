package com.hp.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hp.common.MyFileRenamePolicy;
import com.hp.tutor.model.service.TutorService;
import com.hp.tutor.model.vo.Tutor;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class TutorProfileUpdateController
 */
@WebServlet("/update.tt")
public class TutorProfileUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorProfileUpdateController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/tutorProfile_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			String ttProfile = "";
			if(multiRequest.getOriginalFileName("upfile") != null) {//첨부파일이 있을경우
				String filePath = "resources/tutorProfile_upfiles/";
				String changeName = multiRequest.getFilesystemName("upfile");
				
				ttProfile = filePath + changeName;
				
					// 새로운 첨부파일이 있고 기존 첨부파일 있던 없던-->update

			}else {
				  ttProfile = multiRequest.getParameter("originFile");
			}
			
			int memNo = Integer.parseInt(multiRequest.getParameter("no"));
			String ttPhone = multiRequest.getParameter("phone");
			String ttName = multiRequest.getParameter("nickName");
			String email = multiRequest.getParameter("email");
			String pubPhone = multiRequest.getParameter("phone2");
			String introduce = multiRequest.getParameter("introduce");
			
		
			
			Tutor t = new Tutor(memNo,ttName,ttPhone,email,introduce,pubPhone,ttProfile);
			
			Tutor updateTutor = new TutorService().updateTutorProfile(t);
			
			if(updateTutor == null) {
				request.getSession().setAttribute("alertMsg","회원정보변경에 실패했습니다.");
				response.sendRedirect(request.getContextPath()+"/profile.tt");
				
				
			}else {
				request.getSession().setAttribute("alertMsg","성공적으로 수정되었습니다.");
				request.getSession().setAttribute("tutorInfo",updateTutor);
				response.sendRedirect(request.getContextPath()+"/profile.tt");
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
