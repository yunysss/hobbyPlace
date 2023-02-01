package com.hp.tutor.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.admin.model.vo.Search;
import com.hp.lesson.model.vo.Lesson;
import com.hp.tutor.model.service.TutorService;

/**
 * Servlet implementation class AjaxTutorSearchClassController
 */
@WebServlet("/search.tt")
public class AjaxTutorSearchClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTutorSearchClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String keyword = request.getParameter("keyword");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String[] statusArr = request.getParameterValues("status");
		String status = "";
		if(statusArr!=null) {
			status = String.join(",", statusArr);
		}
		
		int memNo = Integer.parseInt(request.getParameter("no"));
		Search s = new Search(keyword,startDate,endDate,status);
		ArrayList<Lesson> list = new TutorService().searchClass(s,memNo);
		

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
