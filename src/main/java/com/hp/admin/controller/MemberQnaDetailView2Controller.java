package com.hp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.admin.model.service.AdminService;
import com.hp.member.model.vo.Member;
import com.hp.qna.model.vo.Qna;

/**
 * Servlet implementation class MemberQnaDetailView2Controller
 */
@WebServlet("/memQna2.ad")
public class MemberQnaDetailView2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQnaDetailView2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("no"));
		
		Member m = new AdminService().selectMemberByNo(memNo);
		ArrayList<Qna> qnaList = new AdminService().selectAllQna2(memNo);
		
		request.setAttribute("m", m);
		request.setAttribute("q", qnaList);
		
		request.getRequestDispatcher("views/admin/memberQnaDetailView2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
