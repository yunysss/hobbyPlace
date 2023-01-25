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
 * Servlet implementation class ClassDcategorySelectControlloer
 */
@WebServlet("/dctselect.cl")
public class ClassDcategorySelectControlloer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDcategorySelectControlloer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String dct = request.getParameter("dct");
	
		ArrayList<Lesson> classList = new LessonService().searchDcategoryList(dct);
		ArrayList<Dcategory> cList = new LessonService().selectCategory(dct);
	
		request.setAttribute("classList", classList);
		request.setAttribute("cList", cList);
		request.getRequestDispatcher("views/lesson/dcategorySelectView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
