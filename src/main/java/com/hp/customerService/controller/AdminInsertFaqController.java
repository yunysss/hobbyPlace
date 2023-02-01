package com.hp.customerService.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.customerService.model.Service.NoticeService;

/**
 * Servlet implementation class AdminInsertFaqController
 */
@WebServlet("/insertFaq.ad")
public class AdminInsertFaqController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertFaqController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("UTF-8");
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		int result = new NoticeService().insertFaqTutor(title, content);
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "등록이 완료되었습니다.");
			response.sendRedirect(request.getContextPath()+"/faqListTutor.ad?cpage=1");
		}else {
			session.setAttribute("alertMsg", "등록에 실패했습니다.");
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
