package com.hp.calculate.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.calculate.model.service.CalculateService;

/**
 * Servlet implementation class CalculateDetailController
 */
@WebServlet("/detail.cal")
public class CalculateDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculateDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] regNoList = request.getParameterValues("regNo");
		int sta = Integer.parseInt(request.getParameter("sta"));
		String regNo = String.join(",", regNoList);
		int calPrice = new CalculateService().selectCalculate(regNoList);
		request.setAttribute("regNo", regNo);
		request.setAttribute("calPrice", calPrice);
		request.setAttribute("sta", sta);
		request.getRequestDispatcher("views/calculate/calculateDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
