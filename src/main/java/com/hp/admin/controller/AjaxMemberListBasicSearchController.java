package com.hp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.admin.model.service.AdminService;
import com.hp.admin.model.vo.MemberList;
import com.hp.common.model.vo.PageInfo;
import com.hp.member.model.vo.Member;

/**
 * Servlet implementation class AjaxMemberListBasicSearchController
 */
@WebServlet("/memberBasicSearch.ad")
public class AjaxMemberListBasicSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberListBasicSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; 		 // 현재 게시글 총 갯수
		int currentPage;	 // 사용자가 요청한 페이지 (== 현재페이지)
		int pageLimit;		 // 페이지 하단에 보여질 페이징바의 페이지 최대갯수(몇개 단위씩)
		int boardLimit;		 // 한 페이지 내에 보여질 게시글 최대갯수(몇개 단위씩)

		int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
		int startPage;		// 사용자가 요청한 페이지 하단의 페이징바의 시작수
		int endPage;		// 사용자가 요청한 페이지 하단의 페이징바의 끝수

		listCount = new AdminService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int)Math.ceil( (double)listCount / boardLimit ); // Math.ceil이 double형으로 반환하기때문에 int로 강제형변환
		startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage); //PageInfo객체에 변수를 다 담음

		request.setAttribute("pi", pi);

		
		
		
		
		
		String sGroup = request.getParameter("sGroup");
		String fCategory = request.getParameter("fCategory");
		String lineup = request.getParameter("lineup");
		
		ArrayList<MemberList> list = new AdminService().selectMemberList(sGroup, fCategory, lineup);
		
		response.setContentType("application/json; charset=UTF-8");
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
