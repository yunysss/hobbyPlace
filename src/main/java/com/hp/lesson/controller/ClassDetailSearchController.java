package com.hp.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.admin.model.vo.Search;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Lesson;

/**
 * Servlet implementation class ClassDetailSearchController
 */
@WebServlet("/detail.sc")
public class ClassDetailSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDetailSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		
		
		 String keyword = request.getParameter("keyword");
		 String category = request.getParameter("category");
		 String dcategory = request.getParameter("dcategory");
		 String sido = request.getParameter("sido");
		 String sigungu = request.getParameter("sigungu");
		 String[] dayArr = request.getParameterValues("day");
		 String day ="";
		 if(dayArr != null) {
			 day = String.join(",", dayArr);
		 }
		 String price = request.getParameter("price");
		 //System.out.println("day:" + day);
	
		 
		 Search s = new Search(keyword,category,dcategory,sido,sigungu,day,price);
	
		    int count  = new LessonService().searchDetailCount(s);
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
		
			ArrayList<Lesson> list = new LessonService().searchDetailClass(s,pi);

		 
			 request.setAttribute("pi", pi);
			 request.setAttribute("list", list);
			 request.setAttribute("keyword", keyword);
			 request.setAttribute("category", category);
			 request.setAttribute("dcategory", dcategory);
			 request.setAttribute("sido", sido);
			 request.setAttribute("sigungu",sigungu);
			 request.setAttribute("price", price);
			 request.setAttribute("day", day);
			 request.setAttribute("count", count);
		 request.getRequestDispatcher("views/lesson/detailSelectView.jsp").forward(request, response);
				 
		 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
