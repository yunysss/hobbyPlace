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
import com.hp.admin.model.vo.SearchTutor;
import com.hp.admin.model.vo.TutorList;

/**
 * Servlet implementation class AjaxTutorListDetailSearchController1
 */
@WebServlet("/tutorDetailSearch1.ad")
public class AjaxTutorListDetailSearchController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTutorListDetailSearchController1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enrollStart = request.getParameter("enrollStart");
		String enrollEnd = request.getParameter("enrollEnd");
		String fCategory = request.getParameter("fCategory");
		String lineup = request.getParameter("lineup");
		
		String option1 = request.getParameter("option1");
		String searchKey = request.getParameter("searchKey");
		
		String option2 = request.getParameter("option2");
		int startNum;
		int endNum;
		String dayStart = request.getParameter("dayStart");
		String dayEnd = request.getParameter("dayEnd");
		
		if(request.getParameter("startNum")=="") {
			startNum=0;
		}else {
			startNum = Integer.parseInt(request.getParameter("startNum"));
		}
		
		if(request.getParameter("endNum")=="") {
			endNum=99999999;
		}else {
			endNum = Integer.parseInt(request.getParameter("endNum"));
		}
		
		SearchTutor st = new SearchTutor(enrollStart, enrollEnd, fCategory, lineup, option1, searchKey, option2, startNum, endNum, dayStart, dayEnd);
		System.out.println(st);
		ArrayList<TutorList> list = new AdminService().selectTutorList2(st);
		
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
