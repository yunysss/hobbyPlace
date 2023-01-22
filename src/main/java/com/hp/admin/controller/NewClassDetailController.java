package com.hp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.admin.model.service.AdminService;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;

/**
 * Servlet implementation class NewClassDetailController
 */
@WebServlet("/newde.ad")
public class NewClassDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewClassDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int clNo = Integer.parseInt(request.getParameter("no"));
		
		AdminService aService = new AdminService();
		
		Lesson l = aService.selectClass(clNo);
		ArrayList<Schedule> sList = aService.selectSchedule(clNo);
		
		
		//상세페이지 사진 조회해오기 (Attachment)
		
	
		request.setAttribute("l", l);
		request.setAttribute("sList", sList);
	

		request.getRequestDispatcher("views/admin/newClassDetailView.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
