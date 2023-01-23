package com.hp.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.member.model.vo.Member;
import com.hp.tutor.model.service.TutorService;
import com.hp.tutor.model.vo.Tutor;

/**
 * Servlet implementation class TutorMainController
 */
@WebServlet("/tutorMain.tt")
public class TutorMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 로그인한 회원이 튜터일경우만 튜터페이지로 올수있음 
			HttpSession session = request.getSession();
			if(session.getAttribute("loginUser")== null) { //로그인 전상태
				
			response.sendRedirect(request.getContextPath()+"/login.me");
			
		}else { //로그인 후 
			
			Member loginUser = (Member)session.getAttribute("loginUser");
		    int memNo = loginUser.getMemNo();
			Tutor t = new TutorService().selectTutorInfo(memNo);
			
			session.setAttribute("tutorInfo", t);

			request.getRequestDispatcher("views/common/tutorMainPage.jsp").forward(request, response);
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
