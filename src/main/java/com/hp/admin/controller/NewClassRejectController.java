package com.hp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.admin.model.service.AdminService;

/**
 * Servlet implementation class NewClassRejectController
 */
@WebServlet("/refuse.ad")
public class NewClassRejectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewClassRejectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int clNo = Integer.parseInt(request.getParameter("classNo"));
		String refuse = request.getParameter("causeOfReturn");
		
		int result = new AdminService().classRefuseUpdate(clNo,refuse);
		
		HttpSession session= request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "클래스가 반려되었습니다.");
			response.sendRedirect(request.getContextPath()+"/newcl.ad?cpage=1" );
		}else {
			session.setAttribute("alrerMsg", "클래스 반려 실패");
			response.sendRedirect(request.getContextPath()+"/newcl.ad?cpage=1" );
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
