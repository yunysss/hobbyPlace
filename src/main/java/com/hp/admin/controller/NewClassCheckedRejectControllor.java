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
 * Servlet implementation class AjaxNewClassRejectControllor
 */
@WebServlet("/ckreject.cl")
public class NewClassCheckedRejectControllor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewClassCheckedRejectControllor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String classNo = request.getParameter("classNo");
		String cause = request.getParameter("causeOfReturn");
		
		System.out.println("classNo: "+ classNo);
		int result = new AdminService().checkedClassReject(classNo, cause);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg","성공적으로 반려처리 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/newcl.ad?cpage=1"); 
			
		}else {
			
			session.setAttribute("alertMsg", "반려처리에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/newcl.ad=cpage=1");
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
