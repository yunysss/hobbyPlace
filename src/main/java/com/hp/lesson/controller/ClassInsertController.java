package com.hp.lesson.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hp.common.MyFileRenamePolicy;
import com.hp.lesson.model.vo.Lesson;
import com.hp.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ClassInsertController
 */
@WebServlet("/clinsert.tt")
public class ClassInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/attachment_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
		
			
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			
				String ctNo = multiRequest.getParameter("category");
		         String ctDno = multiRequest.getParameter("dCategory");
		         String clName = multiRequest.getParameter("className");
		         String localCode = multiRequest.getParameter("sido");
		         String distrCode = multiRequest.getParameter("sigungu");
		         String address1 = multiRequest.getParameter("address");
		         String address2 = multiRequest.getParameter("dAddress");
		         String clAddress = address1 + address2;
		         int clMax = Integer.parseInt(multiRequest.getParameter("clMax"));
		         String clLevel = multiRequest.getParameter("level");
		         String clSchedule = multiRequest.getParameter("schedule");
		         
		         String[] days = multiRequest.getParameterValues("day");
		         String clDay = "";
		         if(days != null) {
		            clDay = String.join(",", days);
		         }
		       
		         int clTimes =Integer.parseInt(multiRequest.getParameter("times"));
		         String clPrice = multiRequest.getParameter("price");
		         String clThumb = multiRequest.getParameter("file1");
		         String clDetail = multiRequest.getParameter("editordata");
		         String curriculum = multiRequest.getParameter("curriculum");
		         String refundPolicy = multiRequest.getParameter("refundPolicy");
		         String clSupplies = multiRequest.getParameter("supplies");
		         String keyword = multiRequest.getParameter("keyword");
		         
		         Lesson l = new Lesson(ctNo, ctDno,String.valueOf(memNo),localCode,distrCode,clName,clAddress,clMax,clLevel,clTimes,clSchedule,clDay,clPrice,clDetail,curriculum,refundPolicy,clSupplies,keyword,clThumb);
		      
		         //스케줄
		         String[] sessionArr =multiRequest.getParameterValues("session");
		         String[] starTimeArr = multiRequest.getParameterValues("startTime");
		         String[] endTimeArr = multiRequest.getParameterValues("endTime");
		         
		         String sec = ""; // ,로 연이어서 저장..
		         if(sessionArr != null) {
		            sec = String.join(",", sessionArr);
		         
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
