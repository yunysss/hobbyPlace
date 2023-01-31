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
		
		String refPrice = request.getParameter("regPrice");
		
		String refBank = request.getParameter("refBank");
		String refAcc = request.getParameter("refAcc");
		String refName = request.getParameter("refName"); 
		String refRea = request.getParameter("refRea");
		String regSta = request.getParameter("regSta");
		
		Refund ref = new Refund();
		ref.setOrderNo(orderNo);
		ref.setMemNo(String.valueOf(memNo));
		ref.setRefPrice(refPrice);
		ref.setRefBank(refBank);
		ref.setRefAcc(refAcc);
		ref.setRefName(refName);
		ref.setRefRea(refRea);
		
		
		
		
		int result = new RefundService().insertRefund(ref, orderNo, regSta);
		
		if(result>0) {
			session.setAttribute("refundFormInfo", ref);
			session.setAttribute("alertMsg", "환불신청이 완료되었습니다." );
			response.sendRedirect(request.getContextPath()+"/refundReqFin.ref?no="+orderNo);
		}else {
			session.setAttribute("alertMsg", "환불 요청에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/myClassList.reg?cpage=1");
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
