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
 * Servlet implementation class TutorDetailViewController
 */
@WebServlet("/ttDetail.ad")
public class TutorDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("no"));
		System.out.println(memNo);
		AdminService aService = new AdminService();
		
		//튜터기본정보조회1
		Tutor t1 = new TutorService().selectTutorInfo(memNo);
		
		//튜터기본정보조회2
		TutorList t2 = aService.selectTutorInfo(memNo);
		
		//클래스별누적후기
		ArrayList<Review> clRevList = aService.selectClReview(memNo);
		
		//클래스별찜
		ArrayList<Like> clLikeList = aService.selectclLike(memNo);
		
		//받은1:1문의
		ArrayList<Qna> aList = new QnaService().ttSelectAllQna2(memNo);
		
		//작성한1:1문의
		ArrayList<Qna> qList = new QnaService().ttSelectAllQna1(memNo);
		
		//진행중인클래스
		ArrayList<Lesson> cAList = new LessonService().selectActClass(memNo);
				
		//승인대기클래스
		ArrayList<Lesson> cWList = new LessonService().selectWaitingClass(memNo);
		//반려된클래스
		ArrayList<Lesson> cRList = new LessonService().selectRejectedClass(memNo);
		
		//받은후기
		ArrayList<Review> revList = new ReviewService().selectReviewList(memNo);
		
		
		System.out.println(cAList);
		
		request.setAttribute("t1", t1);
		request.setAttribute("t2", t2);
		request.setAttribute("clRevList", clRevList);
		request.setAttribute("clLikeList", clLikeList);
		request.setAttribute("aList", aList);
		request.setAttribute("qList", qList);
		request.setAttribute("cAList", cAList);
		request.setAttribute("cWList", cWList);
		request.setAttribute("cRList", cRList);
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
