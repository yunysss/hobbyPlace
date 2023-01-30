package com.hp.register.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.lesson.model.vo.Lesson;
import com.hp.member.model.vo.Member;
import com.hp.register.model.service.RegisterService;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register.reg")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int clNo = Integer.parseInt(request.getParameter("clNo"));
		String session = request.getParameter("session");
		String selectDate = request.getParameter("selectDate");
		int people = Integer.parseInt(request.getParameter("people"));
	
		Lesson l = new Lesson(clNo, session, selectDate, people);
		Lesson le = new RegisterService().selectLessonRegister(l);
		request.getRequestDispatcher("views/register/classRegister.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
