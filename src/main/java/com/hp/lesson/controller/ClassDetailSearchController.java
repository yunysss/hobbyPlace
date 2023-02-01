package com.hp.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.admin.model.vo.Search;
import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Lesson;

/**
 * Servlet implementation class ClassDetailSearchController
 */
@WebServlet("/detail.sc")
public class ClassDetailSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDetailSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String keyword = request.getParameter("keyword");
		 String category = request.getParameter("category");
		 String dcategory = request.getParameter("dcategory");
		 String sido = request.getParameter("sido");
		 String sigungu = request.getParameter("sigungu");
		 String[] dayArr = request.getParameterValues("day");
		 String day = String.join(",", dayArr);
		 
		 String price = request.getParameter("price");
		 
		 Search s = new Search(keyword,category,dcategory,sido,sigungu,day,price);
		 
		 ArrayList<Lesson> list = new LessonService().searchDetailClass(s);
				 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
