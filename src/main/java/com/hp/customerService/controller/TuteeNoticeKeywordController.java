package com.hp.customerService.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.customerService.model.Service.NoticeService;
import com.hp.customerService.model.vo.Faq;
import com.hp.customerService.model.vo.Notice;

/**
 * Servlet implementation class TuteeNoticeKeywordController
 */
@WebServlet("/searchNotice.tee")
public class TuteeNoticeKeywordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TuteeNoticeKeywordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		
		ArrayList<Notice> list = new NoticeService().keywordNoticeTutee(keyword);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/customerService/tuteeNoticeKeywordList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
