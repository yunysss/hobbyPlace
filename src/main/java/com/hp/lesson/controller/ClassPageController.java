package com.hp.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.model.vo.Attachment;
import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Lesson;
import com.hp.member.model.vo.Member;
import com.hp.review.model.vo.Review;

/**
 * Servlet implementation class ClassPageController
 */
@WebServlet("/page.cl")
public class ClassPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int clNo = Integer.parseInt(request.getParameter("no"));
		
		Lesson le = new LessonService().selectClassPage(clNo);
		ArrayList<Attachment> aList = new LessonService().selectClassAttachment(clNo);
		if((Member)request.getSession().getAttribute("loginUser") != null) {
			int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
			int likeStatus = new LessonService().selectLikeStatus(clNo, memNo);
			request.setAttribute("likeStatus", likeStatus);
		}
		ArrayList<Review> rList = new LessonService().selectClassReview(clNo);
		request.setAttribute("le", le);
		request.setAttribute("aList", aList);
		request.setAttribute("rList", rList);
		
		request.getRequestDispatcher("views/lesson/classPageView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
