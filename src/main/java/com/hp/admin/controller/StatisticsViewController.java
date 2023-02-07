package com.hp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.admin.model.service.AdminService;
import com.hp.lesson.model.vo.Category;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.District;
import com.hp.lesson.model.vo.Lesson;

/**
 * Servlet implementation class StatisticsViewController
 */
@WebServlet("/statistics.ad")
public class StatisticsViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticsViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<District> lList = new AdminService().selectLocalList();
		ArrayList<District> disList = new AdminService().selectDistrictList();
		ArrayList<Category> cList = new AdminService().selectCategoryList();
		ArrayList<Dcategory> dList = new AdminService().selectDcategoryList();
		ArrayList<Lesson> ch1List= new AdminService().selectStatCount();
		ArrayList<Lesson> ch2List = new AdminService().selectStatLocation();
		ArrayList<Lesson> ch3List = new AdminService().selectCatSales();
		
		request.setAttribute("catList", cList);
		request.setAttribute("dcList", dList);
		request.setAttribute("lList", lList);
		request.setAttribute("disList", disList);
		request.setAttribute("ch1List", ch1List);
		request.setAttribute("ch2List", ch2List);
		request.setAttribute("ch3List", ch3List);
		request.getRequestDispatcher("views/admin/statisticsView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
