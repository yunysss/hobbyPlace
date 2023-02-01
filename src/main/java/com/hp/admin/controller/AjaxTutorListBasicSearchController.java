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
 * Servlet implementation class AjaxTutorListBasicSearchController
 */
@WebServlet("/tutorBasicSearch.ad")
public class AjaxTutorListBasicSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTutorListBasicSearchController() {
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
		
		SearchTutor st = new SearchTutor(enrollStart, enrollEnd, fCategory, lineup);
		System.out.println(st.getEnrollStart());
		ArrayList<TutorList> list = new AdminService().selectTutorList1(st);
		
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
