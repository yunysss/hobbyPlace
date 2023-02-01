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
 * Servlet implementation class tutorNoticeDetailController
 */
@WebServlet("/noticedetail.tor")
public class tutorNoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tutorNoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ntNo = Integer.parseInt(request.getParameter("ntNo"));
		
		Notice n = new NoticeService().selectTutorNoticeDetail(ntNo);
		Attachment at = new NoticeService().selectAdminNoticeAttachment(ntNo);
		
		if(n!=null) {
			request.setAttribute("n", n);
			request.setAttribute("at", at);
			request.getRequestDispatcher("views/customerService/tutorNoticeDetail.jsp").forward(request, response);
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
