package com.hp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.member.model.service.MemberService;
import com.hp.member.model.vo.Member;

/**
 * Servlet implementation class AjaxPwdUpdateController
 */
@WebServlet("/pwdUpdate.me")
public class AjaxPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPwdUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String newPwd = request.getParameter("newPwd");
		Member updatePwdMem = new MemberService().updatePwd(memId, memPwd, newPwd);
		
		if(updatePwdMem != null) { // 비밀번호 수정 성공
			HttpSession session = request.getSession();
			
			response.getWriter().print("NNNNY");
			session.setAttribute("loginUser", updatePwdMem);
			
		}else { // 실패
			
			response.getWriter().print("NNNNN");
						
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
