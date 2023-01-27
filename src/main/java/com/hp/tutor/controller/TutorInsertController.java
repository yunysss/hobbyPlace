package com.hp.tutor.controller;

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
import com.hp.member.model.vo.Member;
import com.hp.tutor.model.service.TutorService;
import com.hp.tutor.model.vo.Tutor;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class TutorEnrollController
 */
@WebServlet("/enrolltt.tt")
public class TutorInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 요청
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/tutorProfile_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize, "UTF-8",new MyFileRenamePolicy());
			
			HttpSession session = request.getSession();
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			String grade = ((Member)session.getAttribute("loginUser")).getGrade();
			
			String ttName = multiRequest.getParameter("ttName");
			String ttPhone = multiRequest.getParameter("ttPhone");
			String ttEmail = multiRequest.getParameter("ttEmail");
			String introduce = multiRequest.getParameter("introduce");
			String pubPhone = multiRequest.getParameter("pubPhone");
			
			Tutor t = new Tutor();
			t.setMemNo(memNo);
			t.setTtName(ttName);
			t.setTtPhone(ttPhone);
			t.setTtEmail(ttEmail);
			t.setIntroduce(introduce);
			t.setPubPhone(pubPhone);
			
			
			//프로필 사진 등록 부분
			if(multiRequest.getOriginalFileName("tutorInfo") != null) {
				t.setTtProfile("/resources/tutorProfile_upfiles/"+ multiRequest.getFilesystemName("ttProfile"));
			}
			int result = new TutorService().insertTutor(t,grade,memNo);
			
			// 결과
			if(result>0) { //성공
				session.setAttribute("tutorInfo", t);
				//session.setAttibute("loginUser", );
				session.setAttribute("alertMsg", "튜터 등록에 성공했습니다. 클래스를 개설해 재능을 펼쳐보세요!");
				response.sendRedirect(request.getContextPath()+"/tutorMain.tt");
				
			}else { //튜터 등록 실패시
				if(t.getTtProfile() != null) {
					new File (savePath + multiRequest.getFilesystemName("ttProfile")).delete();
				}
				session.setAttribute("alertMsg", "튜터 등록에 실패했습니다.");
				response.sendRedirect(request.getContextPath() + "//enrollForm.tt");
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
