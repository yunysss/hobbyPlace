package com.hp.tutor.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.register.model.vo.Register;
import com.hp.tutor.model.service.TutorService;

/**
 * Servlet implementation class ReservationApprovalController
 */
@WebServlet("/approval.tt")
public class TutorApprovalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorApprovalController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		ArrayList<Register> rList = new TutorService().selectTutorRegister(memNo);
		ArrayList<Register> nList = new TutorService().selectTutorNewRegister(memNo, 0);
		ArrayList<Register> fList = new TutorService().selectTutorFinRegister(memNo);
		ArrayList<Register> rjList = new TutorService().selectTutorNewRegister(memNo, 4);
		
		request.setAttribute("rList", rList);
		request.setAttribute("nList", nList);
		request.setAttribute("fList", fList);
		request.setAttribute("rjList", rjList);
		request.getRequestDispatcher("views/tutor/reservationApproval.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
