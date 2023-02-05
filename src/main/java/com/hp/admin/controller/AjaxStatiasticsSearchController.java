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
import com.hp.admin.model.vo.Search;
import com.hp.lesson.model.vo.Lesson;

/**
 * Servlet implementation class StatiasticsSearchController
 */
@WebServlet("/search.stat")
public class AjaxStatiasticsSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxStatiasticsSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keywordType = request.getParameter("keywordType");
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		String dCategory = request.getParameter("dCategory");
		String location = request.getParameter("location");
		String district = request.getParameter("district");
		String filtering = request.getParameter("filtering");
		int order = Integer.parseInt(request.getParameter("order"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		Search s = new Search(keywordType, keyword, category, dCategory, location, district, filtering, order, startDate, endDate);
		ArrayList<Lesson> list = new AdminService().searchStat(s);
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
