package com.hp.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.common.model.vo.PageInfo;
import com.hp.customerService.model.Service.NoticeService;
import com.hp.customerService.model.vo.Faq;
import com.hp.member.model.vo.Member;
import com.hp.qna.model.service.QnaService;
import com.hp.qna.model.vo.Qna;
import com.hp.tutor.model.vo.Tutor;

/**
 * Servlet implementation class tutorQnaListController
 */
@WebServlet("/qnalist.tor")
public class tutorQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tutorQnaListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int MemNo = Integer.parseInt(request.getParameter("MemNo"));
		ArrayList<Qna> list = new QnaService().selectTutorQnaList(MemNo);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/qna/tutorQnaList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
