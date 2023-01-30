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
 * Servlet implementation class MyClassViewController
 */
@WebServlet("/myClassList.reg")
public class MyClassListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyClassListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		
		// 페이징 처리
		//현재 결제클래수 총 개수
		int listCount = new RegisterService().selectListCount(memNo); 
		
		// 사용자가 요청한 페이지 == 현재페이지 (cpage)
		int currentPage = Integer.parseInt(request.getParameter("cpage")); 
		
		// 페이지 하단에 보여질 페이징바의 페이지 최대(단위)개수
		int pageLimit = 3; 
		
		// 한페이지 내에 보여질 게시글 최대 개수
		int boardLimit = 4; 
		
		//--------------------------------------------------------
		//가장 마지막 페이지(총 페이지 수) --> 현재 게시글이 몇개냐에 따라 달라짐
		int maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		
		// 사용자가 요청한 페이지 하단의 페이징바의 시작수 
		int startPage = (currentPage-1) / pageLimit * pageLimit +1;
		
		// 사용자가 요청한 페이지 하단의 페이징바의 끝수
		int endPage = startPage + pageLimit -1;
		if(endPage>maxPage) {
			endPage = maxPage;                                                                                                                         
		}
		
		//com.hp.common.model.vo.pageInfo
		// 페이징바를 만들 떄 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//* 현재 사용자가 요청한 페이지(CURRENTpAGE)에 보여질 게시글 리스트 조회(boardLimit수만큼) 
		ArrayList<Register> list = new RegisterService().selectMyClassList(memNo);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("views/register/myClassList.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
