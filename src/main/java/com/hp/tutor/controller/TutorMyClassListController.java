package com.hp.tutor.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.admin.model.service.AdminService;
import com.hp.common.model.vo.PageInfo;
import com.hp.lesson.model.vo.Lesson;
import com.hp.tutor.model.service.TutorService;
import com.hp.tutor.model.vo.Tutor;

/**
 * Servlet implementation class TutorMyClassController
 */
@WebServlet("/ttclass.tt")
public class TutorMyClassListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorMyClassListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Tutor tutorInfo = (Tutor)session.getAttribute("tutorInfo");
		int memNo = tutorInfo.getMemNo();
		
		int listCount = new TutorService().selectClassCount(memNo) ;
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 5;
		int boardLimit = 10;
		
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage-1)/pageLimit* pageLimit +1;
		int endPage = startPage + pageLimit-1;
		if(endPage>maxPage) {
			endPage= maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Lesson> list = new TutorService().selectClassList(pi,memNo);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);

		request.getRequestDispatcher("views/tutor/classListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
