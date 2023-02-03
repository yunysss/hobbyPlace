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
 * Servlet implementation class MemberListBasicSearchController
 */
@WebServlet("/memberBasicSearch.ad")
public class MemberListBasicSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListBasicSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sGroup = request.getParameter("sGroup");
		String fCategory = request.getParameter("fCategory");
		String lineup = request.getParameter("lineup");	

		int listCount = new AdminService().selectMemberListCount1(sGroup, fCategory, lineup);
		request.setAttribute("listCount", listCount);
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit ); 
		int startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage); 

		ArrayList<MemberList> list = new AdminService().selectMemberList(sGroup, fCategory, lineup, pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		System.out.println(pi);
		System.out.println(list);
		response.sendRedirect(request.getContextPath() + "/viewMember.ad?cpage=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
