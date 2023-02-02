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
import com.hp.review.model.vo.Register;

/**
 * Servlet implementation class ReviewWriteList
 */
@WebServlet("/wList.rev")
public class ReviewWriteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		                                                                        
		HttpSession session = request.getSession();
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int listCount = new ReviewService().selectWriteListCount(memNo);
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		int pageLimit =3;
		
		int boardLimit=5;
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		int startPage = (currentPage-1) / pageLimit * pageLimit +1;
		
		int endPage = startPage + pageLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;                                                                                                                         
		}
		
		PageInfo wpi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage, memNo);
		
		ArrayList<Register> list = new ReviewService().selectWriteList(wpi);
		
		request.setAttribute("wpi", wpi);
		request.setAttribute("list", list);
	
		request.getRequestDispatcher("views/review/reviewWriteList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
