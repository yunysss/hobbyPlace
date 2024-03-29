package com.hp.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Lesson;

/**
 * Servlet implementation class AjaxClassCategoryListController
 */
@WebServlet("/ctselect.ajax")
public class AjaxClassCategoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxClassCategoryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ct = request.getParameter("ct");
		
		int count = new LessonService().ctSearchCount(ct);
		request.setAttribute("count", count);
		//페이징처리
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 16;
		
		int maxPage = (int)Math.ceil((double)count/boardLimit);
		int startPage = (currentPage-1)/pageLimit* pageLimit +1;
		int endPage = startPage + pageLimit-1;
		if(endPage>maxPage) {
			endPage= maxPage;
		}
		
		PageInfo pi = new PageInfo(count,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Lesson> list = new LessonService().searchCategoryList(ct,pi);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
