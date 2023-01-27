package com.hp.tutor.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.model.vo.Attachment;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.tutor.model.service.TutorService;

/**
 * Servlet implementation class TutorClassDetailController
 */
@WebServlet("/cldetail.tt")
public class TutorClassDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorClassDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int clNo = Integer.parseInt(request.getParameter("no"));
		
		
		Lesson l = new TutorService().selectClass(clNo);
		ArrayList<Schedule> sList = new TutorService().selectSchedule(clNo);
		
		//첨부파일 조회 =>
		ArrayList<Attachment> list = new TutorService().selectAttachmentList(clNo);
		
	
		request.setAttribute("list", list);
		request.setAttribute("l", l);
		request.setAttribute("sList", sList);
		
		
		request.getRequestDispatcher("views/tutor/tutorClassDetailView.jsp").forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
