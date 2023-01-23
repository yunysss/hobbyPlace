package com.hp.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.tutor.model.service.TutorService;

/**
 * Servlet implementation class AjaxTutorNameCheckController
 */
@WebServlet("/checknick.tt")
public class AjaxTutorNameCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTutorNameCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkNick = request.getParameter("checkNick");
		int count = new TutorService().nickCheck(checkNick);
		

		if(count>0) {
			// 아이디가 이미 존재함 == 사용불가
			response.getWriter().print("0");
		}else {
			//존재하느 아이디가 없을 경우 == 사용가능
			response.getWriter().print("1");
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
