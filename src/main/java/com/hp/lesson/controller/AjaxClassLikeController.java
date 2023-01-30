package com.hp.lesson.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Lesson;
import com.hp.member.model.vo.Member;

/**
 * Servlet implementation class AjaxClassLikeController
 */
@WebServlet("/classLike.cl")
public class AjaxClassLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxClassLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int clNo = Integer.parseInt(request.getParameter("clNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		int result = new LessonService().insertLikeClass(clNo, memNo);
		if(result > 0) {
			Lesson le = new LessonService().selectClassPage(clNo);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(le, response.getWriter());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
