package com.hp.register.controller;

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
import com.hp.register.model.service.RegisterService;
import com.hp.register.model.vo.Register;

/**
 * Servlet implementation class MyRefundClassListController
 */
@WebServlet("/refundList.reg")
public class MyRefundClassListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRefundClassListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		//페이징 처리
		//현재 결제클래스 총 개수
		int listCount = new RegisterService().selectRefundListCount(memNo);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 3;
		int boardLimit = 4;
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		int startPage = (currentPage-1) / pageLimit * pageLimit +1;
		int endPage = startPage + pageLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;                                                                                                                         
		}
		
		//com.hp.common.model.vo.pageInfo
				// 페이징바를 만들 떄 필요한 객체
				PageInfo refPi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage, memNo);
				
				//* 현재 사용자가 요청한 페이지(CURRENTPAGE)에 보여질 게시글 리스트 조회(boardLimit수만큼) 
				ArrayList<Register> refList = new RegisterService().selectMyRefundClassList(refPi);
				
				request.setAttribute("refPi",refPi);
				request.setAttribute("refList", refList);
				System.out.println(refList);
				request.getRequestDispatcher("views/register/myRefundClassList.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
