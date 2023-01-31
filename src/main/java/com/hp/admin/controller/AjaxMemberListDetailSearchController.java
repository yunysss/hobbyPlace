package com.hp.admin.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.admin.model.service.AdminService;
import com.hp.admin.model.vo.MemberList;
import com.hp.admin.model.vo.SearchMember;

/**
 * Servlet implementation class AjaxMemberListDetailSearchController
 */
@WebServlet("/memberDetailSearch.ad")
public class AjaxMemberListDetailSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberListDetailSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		String sGroup = request.getParameter("sGroup");
		String fCategory = request.getParameter("fCategory");
		String lineup = request.getParameter("lineup");
		String sCategory = request.getParameter("sCategory");
		String searchKey = request.getParameter("searchKey");
		String selectValue = request.getParameter("selectValue");
		
		Date enrollStart = null;
		Date enrollEnd = null;
		try {
			enrollStart = df.parse(request.getParameter("enrollStart"));
			enrollEnd = df.parse(request.getParameter("enrollEnd"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		SearchMember sm = new SearchMember(sGroup, fCategory, lineup, enrollStart, enrollEnd, sCategory, searchKey, selectValue);
		ArrayList<MemberList> list = new AdminService().selectMemberList2(sm);
		
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
