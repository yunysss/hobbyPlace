package com.hp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.admin.model.service.AdminService;
import com.hp.admin.model.vo.TutorList;
import com.hp.qna.model.service.QnaService;
import com.hp.qna.model.vo.Qna;
import com.hp.tutor.model.service.TutorService;
import com.hp.tutor.model.vo.Tutor;

/**
 * Servlet implementation class TutorQnaDetailView2Controller
 */
@WebServlet("/ttQna2.ad")
public class TutorQnaDetailView2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorQnaDetailView2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("no"));
		Tutor t1 = new TutorService().selectTutorInfo(memNo);
		TutorList t2 = new AdminService().selectTutorInfo(memNo);
		ArrayList<Qna> qList = new QnaService().ttSelectAllQna1(memNo);
		request.setAttribute("t1", t1);
		request.setAttribute("t2", t2);
		request.setAttribute("q", qList);
		request.getRequestDispatcher("views/admin/tutorQnaDetailView2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
