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
 * Servlet implementation class AjaxAdminSerchReviewController
 */
@WebServlet("/revSearch.ad")
public class AjaxAdminSerchReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAdminSerchReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memName = request.getParameter("memName");
		String ttName = request.getParameter("ttName");
		String reviewContent = request.getParameter("revContent");
		String clName = request.getParameter("clName");
		String[] reStarArr = request.getParameterValues("reStar");
		String reStar = "";
		if(reStarArr!=null) {
			reStar = String.join(",", reStarArr);
		}
		Review r = new Review(memName,ttName,reviewContent,clName,reStar);
		ArrayList<Review> revList = new ReviewService().selectAdminSearchReview(r);
		new Gson().toJson(revList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
