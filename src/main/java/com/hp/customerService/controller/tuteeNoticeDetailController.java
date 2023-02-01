package com.hp.customerService.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.model.vo.Attachment;
import com.hp.customerService.model.Service.NoticeService;
import com.hp.customerService.model.vo.Notice;

/**
 * Servlet implementation class tuteeNoticeDetailController
 */
@WebServlet("/ntDetail.no")
public class tuteeNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tuteeNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int ntNo = Integer.parseInt(request.getParameter("ntNo"));
		
		Notice n = new NoticeService().selectNoticeDetail(ntNo);
		Attachment at = new NoticeService().selectAdminNoticeAttachment(ntNo);
	
		
		if(n!=null) {
			request.setAttribute("n", n);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/customerService/tuteeNoticeDetail.jsp").forward(request, response);
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
