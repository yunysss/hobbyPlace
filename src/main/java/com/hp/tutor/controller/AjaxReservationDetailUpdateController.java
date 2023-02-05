package com.hp.tutor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.register.model.vo.Register;
import com.hp.tutor.model.service.TutorService;

/**
 * Servlet implementation class AjaxReservationDetailUpdateController
 */
@WebServlet("/resUpdate.tt")
public class AjaxReservationDetailUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReservationDetailUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int regNo = Integer.parseInt(request.getParameter("no"));
		String regSta = request.getParameter("regSta");
		String memo = request.getParameter("memo");
		
		Register r = new Register();
		r.setRegNo(regNo);
		r.setRegSta(regSta);
		r.setMemo(memo);
		
		int result = new TutorService().updateReservation(r);
		
		response.getWriter().print(result);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
