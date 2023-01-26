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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		boolean check = ServletFileUpload.isMultipartContent(request);
		System.out.println(check);
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/memberProfile_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String memId = multiRequest.getParameter("memId");
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
			
			System.out.println("확인");	
			Member m = new Member();
			m.setMemId(memId);
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
			
			
			Member updateMem = new MemberService().updateMember(m);

			
			HttpSession session = request.getSession();
			if(updateMem == null) { // 실패
				
				if(m.getMemProfile() != null) {
					new File(savePath + multiRequest.getFilesystemName("upProfile")).delete();
				}
				session.setAttribute("alertMsg", "회원정보수정에 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "/memberInfo.me");
				
			}else { // 성공
				session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
				session.setAttribute("loginUser", updateMem);
				response.sendRedirect(request.getContextPath() + "/memberInfo.me");
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
