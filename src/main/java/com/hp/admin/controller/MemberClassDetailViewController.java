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
import com.hp.register.model.vo.Register;

/**
 * Servlet implementation class MemberClassDetailViewController
 */
@WebServlet("/memClass.ad")
public class MemberClassDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberClassDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("no"));
		Member m = new AdminService().selectMemberByNo(memNo);
		ArrayList<Register> regList = new AdminService().selectAllRegister2(memNo);
		
		request.setAttribute("m", m);
		request.setAttribute("r", regList);
		
		request.getRequestDispatcher("views/admin/memberClassDetailView.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
