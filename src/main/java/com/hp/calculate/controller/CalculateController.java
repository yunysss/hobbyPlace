package com.hp.calculate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.calculate.model.service.CalculateService;
import com.hp.register.model.vo.Register;
import com.hp.tutor.model.service.TutorService;

/**
 * Servlet implementation class CalculateController
 */
@WebServlet("/calculate.cal")
public class CalculateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		ArrayList<Register> rList = new TutorService().selectTutorNewRegister(memNo, 2);
		ArrayList<Register> nList = new CalculateService().selectTutorCalculate(memNo, "N");
		ArrayList<Register> wList = new CalculateService().selectTutorCalculate(memNo, "W");
		ArrayList<Register> cList = new CalculateService().selectTutorCalculate(memNo, "C");
		
		request.setAttribute("rList", rList);
		request.setAttribute("nList", nList);
		request.setAttribute("wList", wList);
		request.setAttribute("cList", cList);
		
		request.getRequestDispatcher("views/calculate/calculate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
