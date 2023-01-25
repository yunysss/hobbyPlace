package com.hp.calculate.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.calculate.model.service.CalculateService;
import com.hp.calculate.model.vo.Calculate;

/**
 * Servlet implementation class CalculateInsertController
 */
@WebServlet("/insert.cal")
public class CalculateInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculateInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regNo = request.getParameter("regNo");
		String calPrice = request.getParameter("calPrice");
		String bank = request.getParameter("bank");
		String account = request.getParameter("account");
		String acHolder = request.getParameter("acHolder");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		Calculate cal = new Calculate(calPrice, bank, account, acHolder, regNo);
		int result = new CalculateService().insertCalculate(cal);
		
		if(result > 0) {
			String[] regNoList = regNo.split(",");
			for(int i=0; i<regNoList.length; i++) {
				regNoList[i] = "regNo=" + regNoList[i];
			}
			String no = String.join("&", regNoList);
			response.sendRedirect(request.getContextPath() + "/detail.cal?sta=1&" + no);
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
