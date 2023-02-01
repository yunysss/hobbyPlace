package com.hp.refund.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.refund.model.service.RefundService;
import com.hp.refund.model.vo.Refund;
import com.hp.register.model.vo.Register;

/**
 * Servlet implementation class RefundRequestFinish
 */
@WebServlet("/refundReqFin.ref")
public class RefundRequestFinishController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundRequestFinishController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int regNo = Integer.parseInt(request.getParameter("no"));
		
		Register r =new RefundService().selectRefundClass(regNo);
		Refund ref = new RefundService().selectRefundInfo(regNo);
		request.setAttribute("r", r);
		request.setAttribute("ref", ref);
		request.getRequestDispatcher("views/refund/refundRequestFinish.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
