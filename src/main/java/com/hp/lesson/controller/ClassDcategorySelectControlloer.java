package com.hp.lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.service.LessonService;
import com.hp.lesson.model.vo.Dcategory;
import com.hp.lesson.model.vo.Lesson;

/**
 * Servlet implementation class ClassDcategorySelectControlloer
 */
@WebServlet("/dctselect.cl")
public class ClassDcategorySelectControlloer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassDcategorySelectControlloer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String dct = request.getParameter("dct");
		//검색된 갯수 조회 
		int count = new LessonService().dctSearchCount(dct);
		request.setAttribute("count", count);
		
		// 페이징처리..
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
		
		request.setAttribute("pi", pi);
		
		//전달받은 소분류 카테고리 조회 리스트 조회
		ArrayList<Lesson> classList = new LessonService().searchDcategoryList(dct,pi);
		ArrayList<Dcategory> cList = new LessonService().selectCategory(dct);
	
		request.setAttribute("classList", classList);
		request.setAttribute("cList", cList);
		request.setAttribute("dct",dct);
		request.getRequestDispatcher("views/lesson/dcategorySelectView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
