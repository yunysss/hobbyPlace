package com.hp.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.review.model.service.ReviewService;

/**
 * Servlet implementation class TutorReviewDeleteController
 */
@WebServlet("/deleteReview.tt")
public class TutorReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int reNo = Integer.parseInt(request.getParameter("reNo"));
		
		int result = new ReviewService().deleteReview(reNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 후기 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/ttAdList.rev");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
