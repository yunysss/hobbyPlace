package com.hp.tutor.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.model.vo.Attachment;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.tutor.model.service.TutorService;

/**
 * Servlet implementation class TutorUpdateFormController
 */
@WebServlet("/updateForm.cl")
public class TutorClassUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorClassUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int clNo = Integer.parseInt(request.getParameter("no"));
		
		TutorService tService = new TutorService();
		ArrayList<Category> cList = tService.selectCategoryList();
		Lesson l = tService.selectClass(clNo);
		ArrayList<Attachment> atList = tService.selectAttachmentList(clNo);
		ArrayList<Schedule> sList = tService.selectSchedule(clNo);
		
		
		
		request.setAttribute("cList", cList);
		request.setAttribute("l", l);
		request.setAttribute("atList", atList);
		request.setAttribute("sList", sList);
		System.out.println(sList);
		request.getRequestDispatcher("views/lesson/classUpdateForm.jsp").forward(request, response);		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
