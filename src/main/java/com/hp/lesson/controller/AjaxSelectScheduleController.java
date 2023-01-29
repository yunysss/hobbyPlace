package com.hp.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Schedule;

/**
 * Servlet implementation class AjaxSelectScheduleController
 */
@WebServlet("/getSchedule.cl")
public class AjaxSelectScheduleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectScheduleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int clNo = Integer.parseInt(request.getParameter("clNo"));
		String calYear = request.getParameter("calYear");
		String calMonth = request.getParameter("calMonth");
		String day = request.getParameter("day");
		
		ArrayList<Schedule> list = new LessonService().getSchedule(clNo, calYear, calMonth, day);
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
