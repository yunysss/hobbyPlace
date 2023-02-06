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
import com.hp.review.model.service.ReviewService;
import com.hp.review.model.vo.Review;
import com.hp.tutor.model.service.TutorService;
import com.hp.tutor.model.vo.Tutor;

/**
 * Servlet implementation class TutorRevDetailViewController
 */
@WebServlet("/ttReview.ad")
public class TutorRevDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorRevDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("no"));
		
		Tutor t1 = new TutorService().selectTutorInfo(memNo);
		TutorList t2 = new AdminService().selectTutorInfo(memNo);
		ArrayList<Review> revList = new ReviewService().selectReviewList(memNo);
		
		request.setAttribute("t1", t1);
		request.setAttribute("t2", t2);
		
		request.setAttribute("revList", revList);
		request.getRequestDispatcher("views/admin/tutorRevDetailView.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
