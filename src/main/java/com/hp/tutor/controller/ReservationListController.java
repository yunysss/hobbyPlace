package com.hp.tutor.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.member.model.vo.Member;
import com.hp.register.model.vo.Register;
import com.hp.tutor.model.service.TutorService;

/**
 * Servlet implementation class ReservationListController
 */
@WebServlet("/reservationList.tt")
public class ReservationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
	    int memNo = loginUser.getMemNo();
	    
	    
	    //System.out.println("memNo: " + memNo);
		ArrayList<Register> bfList = new TutorService().selectBFClassList(memNo);
		//System.out.println("===bfList====: " + bfList.toString());
		
		request.setAttribute("bfList", bfList);
		
		//ArrayList<Register> atList = new TutorService().selectATClassList(memNo);
		//request.setAttribute("atList", atList);
		
		
		request.getRequestDispatcher("views/tutor/reservationList.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
