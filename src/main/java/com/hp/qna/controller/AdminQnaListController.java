package com.hp.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.qna.model.service.QnaService;
import com.hp.qna.model.vo.Qna;

/**
 * Servlet implementation class AdminQnaListController
 */
@WebServlet("/qnaList.ad")
public class AdminQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<Qna>list1 = new QnaService().selectQnaListTutor();
		ArrayList<Qna>list2 = new QnaService().selectQnaListTutee();
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		
		
		request.getRequestDispatcher("views/qna/adminQnaList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
