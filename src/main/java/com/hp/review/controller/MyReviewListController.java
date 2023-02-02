package com.hp.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.common.model.vo.PageInfo;
import com.hp.member.model.vo.Member;
import com.hp.review.model.service.ReviewService;
import com.hp.review.model.vo.Review;

/**
 * Servlet implementation class MyReviewListController
 */
@WebServlet("/list.rev")
public class MyReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo(); 
		
		int listCount = new ReviewService().selectMyReviewListCount(memNo);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 3;
		int boardLimit = 4; 
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage-1) / pageLimit * pageLimit +1;
		int endPage = startPage + pageLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;                                                                                                                         
		}
		
		PageInfo rePi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage, memNo);
		
	
		ArrayList<Review> list = new ReviewService().selectMyReviewList(rePi);
		
		request.setAttribute("rePi",rePi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/review/myReviewList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
