package com.hp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.admin.model.service.AdminService;
import com.hp.admin.model.vo.TutorList;
import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Lesson;
import com.hp.tutor.model.service.TutorService;
import com.hp.tutor.model.vo.Tutor;

/**
 * Servlet implementation class TutorClassDetailView2Controller
 */
@WebServlet("/ttClass2.ad")
public class TutorClassDetailView2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorClassDetailView2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("no"));
		
		AdminService aService = new AdminService();
		Tutor t1 = new TutorService().selectTutorInfo(memNo);
		TutorList t2 = aService.selectTutorInfo(memNo);
		ArrayList<Lesson> cRList = new LessonService().selectRejectedClass(memNo);
		
		request.setAttribute("t1", t1);
		request.setAttribute("t2", t2);
		request.setAttribute("cRList", cRList);
		request.getRequestDispatcher("views/admin/tutorInactiveClassDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
