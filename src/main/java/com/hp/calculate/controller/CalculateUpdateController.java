package com.hp.calculate.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.calculate.model.service.CalculateService;

/**
 * Servlet implementation class CalculateUpdateController
 */
@WebServlet("/update.cal")
public class CalculateUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculateUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int calNo = Integer.parseInt(request.getParameter("calNo"));
		String calSt = request.getParameter("calSt");
		
		String str = new CalculateService().selectCalculateSta(calNo);
		String[] calRegList = str.split(",");
		int result = new CalculateService().updateCalculate(calNo, calSt, calRegList);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/manage.cal");
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
