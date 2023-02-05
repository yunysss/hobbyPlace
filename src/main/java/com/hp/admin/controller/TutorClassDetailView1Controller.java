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
import com.hp.member.model.vo.Like;
import com.hp.qna.model.service.QnaService;
import com.hp.qna.model.vo.Qna;
import com.hp.review.model.service.ReviewService;
import com.hp.review.model.vo.Review;
import com.hp.tutor.model.service.TutorService;
import com.hp.tutor.model.vo.Tutor;

/**
 * Servlet implementation class TutorClassDetailView1Controller
 */
@WebServlet("/ttClass1.ad")
public class TutorClassDetailView1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorClassDetailView1Controller() {
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
		ArrayList<Review> clRevList = aService.selectClReview(memNo);
		ArrayList<Like> clLikeList = aService.selectclLike(memNo);
		ArrayList<Qna> aList = new QnaService().ttSelectAllQna2(memNo);
		ArrayList<Qna> qList = new QnaService().ttSelectAllQna1(memNo);
		ArrayList<Lesson> cAList = new LessonService().selectActClass(memNo);
		ArrayList<Review> revList = new ReviewService().selectReviewList(memNo);

		request.setAttribute("t1", t1);
		request.setAttribute("t2", t2);
		request.setAttribute("clRevList", clRevList);
		request.setAttribute("clLikeList", clLikeList);
		request.setAttribute("aList", aList);
		request.setAttribute("qList", qList);
		request.setAttribute("cAList", cAList);
		request.setAttribute("revList", revList);
		request.getRequestDispatcher("views/admin/tutorDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
