package com.hp.register.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.member.model.vo.Member;
import com.hp.register.model.service.RegisterService;

/**
 * Servlet implementation class TutorUpdateRegister
 */
@WebServlet("/updateReg.tt")
public class TutorUpdateRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorUpdateRegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int regSta = Integer.parseInt(request.getParameter("regSta"));
		int regNo = Integer.parseInt(request.getParameter("regNo"));
		
		int result = new RegisterService().updateRegister(regSta, regNo);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/approval.tt?");
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
