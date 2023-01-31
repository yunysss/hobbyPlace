package com.hp.refund.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hp.member.model.vo.Member;
import com.hp.refund.model.service.RefundService;
import com.hp.refund.model.vo.Refund;

/**
 * Servlet implementation class RefundInsertController
 */
@WebServlet("/insert.ref")
public class RefundInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int orderNo = Integer.parseInt(request.getParameter("no"));
		
		HttpSession session = request.getSession();
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int refPrice = Integer.parseInt(request.getParameter("regPrice"));
		
		String refBank = request.getParameter("refBank");
		String refAcc = request.getParameter("refAcc");
		String refNm = request.getParameter("refNm"); 
		String refRea = request.getParameter("refRea");
		
		Refund r = new Refund();
		r.setOrderNo(orderNo);
		r.setMemNo(String.valueOf(memNo));
		r.setRefPrice(String.valueOf(refPrice));
		r.setRefBank(refBank);
		r.setRefAcc(refAcc);
		r.setRefName(refNm);
		r.setRefRea(refRea);
		
		
		int result = new RefundService().insertRefund(r);
		
		if(result>0) {
			
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
