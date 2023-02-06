package com.hp.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.member.model.vo.Member;
import com.hp.qna.model.service.QnaService;
import com.hp.qna.model.vo.Qna;

/**
 * Servlet implementation class TutorQnaMainPageController
 */
@WebServlet("/qnaPage.tor")
public class TutorQnaMainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorQnaMainPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int MemNo = loginUser.getMemNo();
		ArrayList<Qna> list = new QnaService().selectTutorQnaMain(MemNo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/qna/tutorQnaMainPage.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
