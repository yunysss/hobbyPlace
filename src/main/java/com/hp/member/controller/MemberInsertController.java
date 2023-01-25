package com.hp.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hp.common.MyFileRenamePolicy;
import com.hp.member.model.service.MemberService;
import com.hp.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

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

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/memberProfile_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String memId = multiRequest.getParameter("userId");
			String memPwd = multiRequest.getParameter("userPwd");
			String memName = multiRequest.getParameter("userName");
			String memNick = multiRequest.getParameter("userNick");
			String email = multiRequest.getParameter("email");
			String phone = multiRequest.getParameter("phone");
			String[] memAddrArr = multiRequest.getParameterValues("address");
			String gender = multiRequest.getParameter("gender");
			String[] memBirthArr = multiRequest.getParameterValues("memBirth");
			String[] interestArr = multiRequest.getParameterValues("interest");
			
			String memAddr = "";
			if(memAddrArr != null) {
				memAddr = String.join("///", memAddrArr);
			}
			
			String memBirth = "";
			if(memBirthArr != null) {
				memBirth = String.join("-", memBirthArr);
			}
			String interest = "";
			if(interestArr != null) {
				interest = String.join(",", interestArr);
			}
			Member m = new Member();
			m.setMemId(memId);
			m.setMemPwd(memPwd);
			m.setMemName(memName);
			m.setMemNick(memNick);
			m.setEmail(email);
			m.setPhone(phone);
			m.setMemAddr(memAddr);
			m.setGender(gender);
			m.setMemBirth(memBirth);
			m.setInterest(interest);
			
			if(multiRequest.getOriginalFileName("upProfile") != null) {
				m.setMemProfile("/resources/memberProfile_upfiles/"+ multiRequest.getFilesystemName("upProfile"));
			}
			
			int result = new MemberService().insertMember(m);
			
			HttpSession session = request.getSession();
			
			//결과
			if(result > 0) {
				
				session.setAttribute("enrollMember", m);
				
				request.getRequestDispatcher("views/member/enrollMemberResult.jsp").forward(request, response);
				
			}else {
				
				if(m.getMemProfile() != null) {
					new File(savePath + multiRequest.getFilesystemName("upProfile")).delete();
				}
				
				session.setAttribute("alertMsg", "회원가입에 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/enrollForm.me");
				
			}
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
