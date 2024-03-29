package com.hp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.member.model.service.MemberService;
import com.hp.member.model.vo.Like;
import com.hp.register.model.vo.Register;
import com.hp.review.model.vo.Review;

/**
 * Servlet implementation class MyPageMainController
 */
@WebServlet("/myPageMain.me")
public class MyPageMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();	
		
		if(session.getAttribute("loginUser") == null) { // 로그인 전
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath() + "/main.tee");
			
						
		}else { // 로그인 후
			int no = Integer.parseInt(request.getParameter("no"));
			
			int r = new MemberService().regCount(no);
			int l = new MemberService().likeCount(no);
			int w = new MemberService().revCount(no);
			
			request.setAttribute("r", r);
			request.setAttribute("l", l);
			request.setAttribute("w", w);
			request.getRequestDispatcher("views/member/myPageMain.jsp").forward(request, response);
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
