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
 * Servlet implementation class NewClassApprovalController
 */
@WebServlet("/approval.ad")
public class NewClassApprovalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewClassApprovalController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int clNo = Integer.parseInt(request.getParameter("no"));
		int result = new AdminService().classApprovalUpdate(clNo);
		
		HttpSession session = request.getSession();
		if(result>0) {	
			session.setAttribute("alertMsg", "승인이 완료되었습니다.");
			response.sendRedirect(request.getContextPath()+"/newcl.ad?capge=1"); 
		}else {
			session.setAttribute("alertMsg","승인 완료에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/newde.ad?no="+clNo);
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
