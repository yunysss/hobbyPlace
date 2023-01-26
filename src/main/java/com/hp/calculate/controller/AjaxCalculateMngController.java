package com.hp.calculate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.calculate.model.service.CalculateService;
import com.hp.calculate.model.vo.Calculate;

/**
 * Servlet implementation class AjaxCalculateMngController
 */
@WebServlet("/manageAjax.cal")
public class AjaxCalculateMngController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCalculateMngController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String status = request.getParameter("status");
		
		response.setContentType("application/json; charset=UTF-8");
		if(startDate.equals("") && endDate.equals("")) {
			if(memId.equals("")) {
				ArrayList<Calculate> list = new CalculateService().selectAllSeasonCalMng(status);
				new Gson().toJson(list, response.getWriter());
			} else {
				ArrayList<Calculate> list = new CalculateService().selectMemSeasonCalMng(memId, status);
				new Gson().toJson(list, response.getWriter());
			}
		}else {
			if(memId.equals("")) {
				ArrayList<Calculate> list = new CalculateService().selectAllCalMng(startDate, endDate, status);
				new Gson().toJson(list, response.getWriter());
			} else {
				ArrayList<Calculate> list = new CalculateService().selectMemCalMng(memId, startDate, endDate, status);
				new Gson().toJson(list, response.getWriter());
			}
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
