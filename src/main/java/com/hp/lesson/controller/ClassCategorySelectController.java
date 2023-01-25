package com.hp.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;

/**
 * Servlet implementation class ClassCategorySelectController
 */
@WebServlet("/ctselect.cl")
public class ClassCategorySelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassCategorySelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ct = request.getParameter("ct");
		String dct = request.getParameter("dct");
	
		ArrayList<Lesson> list = new LessonService().searchCategoryList(ct);
		ArrayList<Lesson> dList = new LessonService().searchDcategoryList(dct);
		ArrayList<Dcategory> dctList = new LessonService().selectDcategory(ct);
		
		 
		request.setAttribute("list", list);
		request.setAttribute("dList", dList);
		request.setAttribute("dctList", dctList);
		request.getRequestDispatcher("views/lesson/categorySelectView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
