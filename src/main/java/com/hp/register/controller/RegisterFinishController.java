package com.hp.register.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.member.model.vo.Member;
import com.hp.register.model.service.RegisterService;
import com.hp.register.model.vo.Register;

/**
 * Servlet implementation class RegisterFinishController
 */
@WebServlet("/fin.reg")
public class RegisterFinishController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterFinishController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memNo = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getMemNo());
		String clNo = request.getParameter("clNo");
		String teachDate = request.getParameter("teachDate");
		String schNo = request.getParameter("schNo");
		String regPay = request.getParameter("regPay");
		String regPrice = request.getParameter("regPrice");
		String regCount = request.getParameter("regCount");
		
		Register r = new Register(memNo, clNo, teachDate, schNo, regPay, regPrice, regCount);
		Register re = new Register(clNo, schNo, regCount, teachDate);
		int result = new RegisterService().insertRegister(r);
		if(result > 0) {
			int regNo = new RegisterService().selectRegisterNo(); // 주문번호, 신청일
			Register reg = new RegisterService().selectLessonRegister(re);
			request.setAttribute("reg", reg);
			request.setAttribute("regNo", regNo);
			request.setAttribute("regPay", regPay);
			request.getRequestDispatcher("views/register/classRegisterFin.jsp").forward(request, response);
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
