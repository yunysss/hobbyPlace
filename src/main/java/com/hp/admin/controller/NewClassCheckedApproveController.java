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
 * Servlet implementation class NewClassCheckedApproveController
 */
@WebServlet("/ckapprove.cl")
public class NewClassCheckedApproveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewClassCheckedApproveController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String classNo = request.getParameter("approvecl");

		System.out.println("classNo: "+ classNo);
		int result = new AdminService().checkedClassApprove(classNo);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg","성공적으로 승인되었습니다.");
			response.sendRedirect(request.getContextPath()+"/newcl.ad?capge=1"); 
			
		}else {
			
			session.setAttribute("alertMsg", "승인처리에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/newcl.ad?cpage=1");
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
