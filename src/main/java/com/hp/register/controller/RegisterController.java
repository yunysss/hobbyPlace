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
import com.hp.register.model.vo.Register;

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
		String clNo = request.getParameter("clNo");
		String schNo = request.getParameter("session");
		String selectDate = request.getParameter("selectDate");
		String regCount = request.getParameter("regCount");
	
		Register r = new Register(clNo, schNo, regCount, selectDate);
		
		Register reg = new RegisterService().selectLessonRegister(r);
		Member m = new RegisterService().selectRegisterMem(memNo);
		
		request.setAttribute("reg", reg);
		request.setAttribute("m", m);
		request.setAttribute("selectSession", schNo);
		request.setAttribute("selectDate", selectDate);
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
