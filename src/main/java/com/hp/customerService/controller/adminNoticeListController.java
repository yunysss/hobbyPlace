package com.hp.customerService.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.model.vo.PageInfo;
import com.hp.customerService.model.Service.NoticeService;
import com.hp.customerService.model.vo.Notice;

/**
 * Servlet implementation class adminNoticeListController
 */
@WebServlet("/noticeList.ad")
public class adminNoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminNoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount;		// 현재 게시글 총 갯수
		int currentPage;	// 사용자가 요청한 페이지 (== 현재 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 페이지 최대갯수(몇개 단위씩)
		int boardLimit;		// 한 페이지 내에 보여질 게시글 최대갯수(몇개 단위씩)
		
		int maxPage;		// 가장 마지막페이지 (총 페이지 수)
		int startPage;		// 사용자가 요청한 페이지 하단의 페이징바의 시작수
		int endPage;		// 사용자가 요청한 페이지 하단의 페이징바의 끝수 
		
		
		listCount = new NoticeService().selectAdminNoticeListCount();
			
		//사용자가 요청한 페이지 (현재 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
				
		pageLimit = 10;
		//페이지당 보여질 게시글 최대 갯수 
		boardLimit = 10;
		
		maxPage = (int)Math.ceil( (double)listCount / boardLimit );
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				
		
		ArrayList<Notice> list = new NoticeService().selectAdminNoticeList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/admin/adminNoticeList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
