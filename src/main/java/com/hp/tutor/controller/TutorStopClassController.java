package com.hp.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.tutor.model.service.TutorService;

/**
 * Servlet implementation class TutorStopClassController
 */
@WebServlet("/stopcl.tt")
public class TutorStopClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorStopClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int clNo = Integer.parseInt(request.getParameter("classNo"));
		
		int result = new TutorService().stopClassUpdate(clNo);
		
		HttpSession session = request.getSession();
		if(result>0) {
			session.setAttribute("alertMsg", "판매중단 처리가 완료되었습니다.");
			response.sendRedirect(request.getContextPath()+"/ttclass.tt?cpage=1");
		}else {
			session.setAttribute("alerMsg", "판매중단 처리 실패");
			response.sendRedirect(request.getContextPath()+"/cldetail.tt");
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
