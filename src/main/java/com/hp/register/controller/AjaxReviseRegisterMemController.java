package com.hp.register.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.member.model.vo.Member;
import com.hp.register.model.service.RegisterService;

/**
 * Servlet implementation class AjaxReviseRegisterController
 */
@WebServlet("/revise.reg")
public class AjaxReviseRegisterMemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviseRegisterMemController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String memName = request.getParameter("memName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		int result = new RegisterService().reviseRegisterMem(memNo, memName, phone, email);
		if(result > 0) {
			Member m = new RegisterService().selectRegisterMem(memNo);
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(m, response.getWriter());
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
