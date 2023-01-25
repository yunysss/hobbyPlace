package com.hp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.member.model.service.MemberService;
import com.hp.member.model.vo.Member;

/**
 * Servlet implementation class LoginMemberFormController
 */
@WebServlet("/loginUser.me")
public class LoginMemberFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMemberFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		HttpSession session = request.getSession();
		
		if(loginUser == null) {

			session.setAttribute("loginFail", "아이디 또는 비밀번호를 잘못 입력했습니다.");
			request.getRequestDispatcher("views/member/loginMember.jsp").forward(request, response);
			
		}else {

			session.setAttribute("loginUser", loginUser);
			
			response.sendRedirect(request.getContextPath()+"/main.tee");
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
