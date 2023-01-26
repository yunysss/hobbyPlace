package com.hp.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Lesson;
import com.hp.review.model.vo.Review;
import com.hp.tutor.model.vo.Tutor;

/**
 * Servlet implementation class TutorDetailPageController
 */
@WebServlet("/ttdetail.cl")
public class TutorDetailPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorDetailPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int clNo = Integer.parseInt(request.getParameter("no"));
		
		int cCount = new LessonService().selectTtClassCount(clNo);
		int rCount = new LessonService().selectTtReviewCount(clNo);
		
		Tutor t = new LessonService().selectTutorInfo(clNo);
		ArrayList<Review> rList = new LessonService().selectTutorReview(clNo);
		ArrayList<Lesson> cList =  new LessonService().selectTutorClass(clNo);
	
		request.setAttribute("cCount",cCount);
		request.setAttribute("rCount", rCount);
		
		request.setAttribute("t", t);
		request.setAttribute("rList", rList);
		request.setAttribute("cList", cList);
		
		request.getRequestDispatcher("views/lesson/tutorDetailPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
