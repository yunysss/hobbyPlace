package com.hp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.member.model.service.MemberService;
import com.hp.member.model.vo.Member;

/**
 * Servlet implementation class AjaxNickCheck2Controller
 */
@WebServlet("/nickCheck2.me")
public class AjaxNickCheck2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxNickCheck2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkNick = request.getParameter("checkNick");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		int count1 = new MemberService().nickCheck(checkNick);
		
		if(count1 > 0) { //중복되는 닉네임이 있을때
			
			Member m = new MemberService().nickCheck2(memNo, checkNick);
			
			if(m == null ) { //중복되는 닉네임이 해당 회원이 아닐경우
				response.getWriter().print("NNNNN");
			}else {
				response.getWriter().print("NNNNY");
			}
			
		}else { //중복되는 닉네임이 없을때
			response.getWriter().print("NNNNY");
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
