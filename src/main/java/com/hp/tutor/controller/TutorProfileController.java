package com.hp.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.tutor.model.service.TutorService;

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

		//로그인전
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")== null) {
			session.setAttribute("alertMsg","로그인 후 이용한 가능한 서비스입니다.");
		}else
		
		
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
