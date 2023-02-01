package com.hp.customerService.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.customerService.model.Service.NoticeService;
import com.hp.customerService.model.vo.Faq;

/**
 * Servlet implementation class AdminFaqUpdateController
 */
@WebServlet("/faqUpdate.ad")
public class AdminFaqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFaqUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Faq f = new Faq();
		f.setFaqNO(no);
		f.setQuestion(title);
		f.setAnswer(content);
		
		int result = new NoticeService().faqUpdate(f);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "수정이 완료되었습니다.");
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
