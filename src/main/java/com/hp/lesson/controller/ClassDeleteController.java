package com.hp.lesson.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.lesson.model.service.LessonService;

/**
 * Servlet implementation class ClassDeleteController
 */
@WebServlet("/delete.cl")
public class ClassDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int clNo = Integer.parseInt(request.getParameter("no"));
		
		int result = new LessonService().deleteClass(clNo);
		
		HttpSession session = request.getSession();
		if(result>0) {	
			session.setAttribute("alertMsg", "클래스가 삭제처리 되었습니다. ");
			response.sendRedirect(request.getContextPath()+"/ttclass.tt?cpage=1");
		}else {
			session.setAttribute("alertMsg", "클래스 삭제에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/cldetail.tt?no=" + clNo);
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
