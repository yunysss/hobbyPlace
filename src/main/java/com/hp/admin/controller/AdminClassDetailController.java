package com.hp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.admin.model.service.AdminService;
import com.hp.common.model.vo.Attachment;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.tutor.model.service.TutorService;
import com.hp.tutor.model.vo.Tutor;

/**
 * Servlet implementation class AdminClassDetailController
 */
@WebServlet("/cldetail.ad")
public class AdminClassDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminClassDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int clNo = Integer.parseInt(request.getParameter("no"));
		
		AdminService aService = new AdminService();
		Tutor t = aService.selectTutor(clNo);
		Lesson l = aService.selectClass(clNo);
		ArrayList<Schedule> sList = aService.selectSchedule(clNo);
		

		//상세페이지 사진 조회해오기 (Attachment)
		ArrayList<Attachment> list = aService.selectAttachmentList(clNo);
	
		request.setAttribute("l", l);
		request.setAttribute("sList", sList);
		request.setAttribute("list", list);
		request.setAttribute("tutor",t);
		
		request.getRequestDispatcher("views/admin/adminClassDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
