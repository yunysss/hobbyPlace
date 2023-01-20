package com.hp.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TutorProfileController
 */
@WebServlet("/profile.tt")
public class TutorProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	 
		//로그인한 회원만 들어올수있게 해야됨
		HttpSession session = request.getSession();
		//if(session.getAttribute("loginUser")==null) {//로그인전 
		//	session.setAttribute("alertMsg", "로그인 후 이용가능한 페이지입니다.");
		//} else {
			// 프로필 정보 불러오기
			
			
			
			
			
			
			request.getRequestDispatcher("views/tutor/tutorProfileView.jsp").forward(request, response);
		
		//}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
