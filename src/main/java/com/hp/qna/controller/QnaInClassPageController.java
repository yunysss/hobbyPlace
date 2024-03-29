package com.hp.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.qna.model.service.QnaService;
import com.hp.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaInClassPageController
 */
@WebServlet("/classPage.qna")
public class QnaInClassPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInClassPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String qTitle = request.getParameter("title");
		String qContent = request.getParameter("content");
		int clNo = Integer.parseInt(request.getParameter("clNo"));
		int qMemNo = Integer.parseInt(request.getParameter("memNo"));
		int aMemNo = Integer.parseInt(request.getParameter("ttNo"));
		
		Qna q = new Qna(qTitle, qContent, clNo, qMemNo, aMemNo);
		
		int result = new QnaService().insertTuteeToTutorQna(q);
		
		if(result > 0) {
			request.getSession().setAttribute("qnaInsert", "success");
			response.sendRedirect(request.getContextPath() + "/page.cl?no=" + clNo);
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
