package com.hp.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.review.model.service.ReviewService;
import com.hp.review.model.vo.Review;

/**
 * Servlet implementation class AjaxSelectAdminReview
 */
@WebServlet("/selectReview.ad")
public class AjaxSelectAdminReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectAdminReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ttName = request.getParameter("ttNo");
		String clName = request.getParameter("clName");
		String reContent = request.getParameter("reContent");
		String reMem = request.getParameter("reMem");
		String reStar = request.getParameter("reStar");
		
		Review r = new Review(reMem, ttName, reContent, clName, reStar);
		response.setContentType("application/json; charset=UTF-8");
		ArrayList<Review> list = new ReviewService().selectAdminSearchReview(r);
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
