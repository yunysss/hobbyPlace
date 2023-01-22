package com.hp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/enrollMember.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩처리
		request.setCharacterEncoding("UTF-8");
		
		// enctype이 multipart/form-data로 잘 전송되었을경우 전반적인 내용들 수행
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 파일용량제한
			int maxSize = 10*1024*1024;
			
			// 전달된 파일을 저장시킬 폴더의 물리적인 경로 알아내기
			String savePath = request.getSession().getServletContext().getRealPath("/resources/memberProfile_upfiles/");
			
			
			
		}
		
		
		String memId = request.getParameter("userId");
		String memPwd = request.getParameter("userPwd");
		String memName = request.getParameter("userName");
		String memNick = request.getParameter("userNickName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int postcode = Integer.parseInt(request.getParameter("postcode"));
		String memAddr = request.getParameter("address");
		String gender = request.getParameter("gender");
		String[] memBirthArr = request.getParameterValues("memBirth");
		String[] interestArr = request.getParameterValues("interest");
		
		String memBirth = "";
		if(memBirthArr != null) {
			memBirth = String.join("-", memBirthArr);
		}
		String interest = "";
		if(interestArr != null) {
			interest = String.join(",", interestArr);
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
