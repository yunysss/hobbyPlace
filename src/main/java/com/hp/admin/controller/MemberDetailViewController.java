package com.hp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.admin.model.service.AdminService;
import com.hp.member.model.vo.Like;
import com.hp.member.model.vo.Member;
import com.hp.qna.model.vo.Qna;
import com.hp.register.model.vo.Register;
import com.hp.review.model.vo.Review;

/**
 * Servlet implementation class MemberDetailViewController
 */
@WebServlet("/memDetail.ad")
public class MemberDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("no"));
		
		AdminService aService = new AdminService();
		
		// 1) 회원기본정보조회
		Member m = aService.selectMemberByNo(memNo);
		
		// 2) qna 조회
		ArrayList<Qna> qnaList = aService.selectAllQna(memNo);
		
		// 3) 수강한클래스 조회
		ArrayList<Register> regList = aService.selectAllRegister(memNo);
		
		// 4) 작성한 후기 조회
		ArrayList<Review> revList = aService.selectAllReview(memNo);
		
		// 5) 찜한 클래스 조회
		ArrayList<Like> likeList = aService.selectAllLike(memNo);
		
		request.setAttribute("m", m);
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("regList", regList);
		request.setAttribute("revList", revList);
		request.setAttribute("likeList", likeList);
		
		request.getRequestDispatcher("views/admin/memberDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
