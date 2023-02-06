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
 * Servlet implementation class TutorQnaInsertAnswerController
 */
@WebServlet("/insertAnswer.tor")
public class TutorQnaInsertAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorQnaInsertAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("atitle");
		String content = request.getParameter("acontent");
		
		Qna q = new Qna();
		q.setqNo(no);
		q.setaTitle(title);
		q.setaContent(content);
		
		int result = new QnaService().updateAnswer(q);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/qnaPage.tor");
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
