package com.hp.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hp.common.MyFileRenamePolicy;
import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Lesson;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class TutorClassUpdateController
 */
@WebServlet("/update.cl")
public class TutorClassUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorClassUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize =10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/classThumbnail_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			int clNo = Integer.parseInt(multiRequest.getParameter("no"));
			
			
			
			Lesson l = new LessonService().updateClass(clNo);
			
			
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
