package com.hp.lesson.controller;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.lesson.model.vo.Lesson;

/**
 * Servlet implementation class ClassEnrollForm2
 */
@WebServlet("/clenroll2.tt")
public class ClassEnrollForm2Controller extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassEnrollForm2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			int category = Integer.parseInt(request.getParameter("category"));
			int dCategory = Integer.parseInt(request.getParameter("dCategory"));
			String clName = request.getParameter("className");
			String sido = request.getParameter("sido");
			String sigungu = request.getParameter("sigungu");
			String address = request.getParameter("address");
			String dAddress = request.getParameter("dAddress");
			int clMax = Integer.parseInt(request.getParameter("clMax"));
			String level = request.getParameter("level");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			String schedule = request.getParameter("schedule");
			
			String[] days = request.getParameterValues("day");
			String day = "";
			if(days != null) {
				day = String.join(",", days);
			}
			
			String times = request.getParameter("times");
			String price = request.getParameter("price");
			
		
			//스케줄
			String[] sessionArr =request.getParameterValues("session");
			String[] starTimeArr = request.getParameterValues("startTime");
			String[] endTimeArr = request.getParameterValues("endTime");
			
			String session = ""; // ,로 연이어서 저장..
			if(sessionArr != null) {
				session = String.join(",", sessionArr);
			
			}
			
			
			
			
			request.getRequestDispatcher("views/lesson/classEnrollForm2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
