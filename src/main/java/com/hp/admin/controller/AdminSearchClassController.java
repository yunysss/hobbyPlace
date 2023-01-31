package com.hp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.admin.model.service.AdminService;
import com.hp.admin.model.vo.Search;
import com.hp.lesson.model.vo.Lesson;

/**
 * Servlet implementation class AdminSearchClassController
 */
@WebServlet("/search.ad")
public class AdminSearchClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		String dcategory  = request.getParameter("dCategory");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String[] statusArr = request.getParameterValues("status");
		String status = "";
		if(statusArr!=null) {
			status = String.join(",", statusArr);
		}
		System.out.println(keyword);
		System.out.println("s:"+status);
		System.out.println("t:"+startDate);
		
		Search s = new Search(keyword,category,dcategory,startDate,endDate,status);
		ArrayList<Lesson> list = new AdminService().searchClass(s);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
