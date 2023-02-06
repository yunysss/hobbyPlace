package com.hp.lesson.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hp.common.MyFileRenamePolicy;
import com.hp.common.model.vo.Attachment;
import com.hp.lesson.model.vo.Lesson;
import com.hp.lesson.model.vo.Schedule;
import com.hp.tutor.model.service.TutorService;
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
				String savePath = request.getSession().getServletContext().getRealPath("/resources/classThumbnail_upfiles/");
				MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
		
			
			int memNo = Integer.parseInt(multiRequest.getParameter("no"));
			
				String ctNo = multiRequest.getParameter("category");
		         String ctDno = multiRequest.getParameter("dCategory");
		         String clName = multiRequest.getParameter("className");
		         String localCode = multiRequest.getParameter("sido");
		         String distrCode = multiRequest.getParameter("sigungu");
		         
		         String[] distr = distrCode.split(" ");
		         distrCode = distr[0];
		         
		    
		         
		         String address1 = multiRequest.getParameter("address");
		         String address2 = multiRequest.getParameter("dAddress");
		         String clAddress = address1 +" "+ address2;
		         int clMax = Integer.parseInt(multiRequest.getParameter("clMax"));
		         String clLevel = multiRequest.getParameter("level");
		         String endDate = multiRequest.getParameter("endDate");
		         String clSchedule = multiRequest.getParameter("schedule");
		         
		         String[] days = multiRequest.getParameterValues("day");
		         String clDay = "";
		         if(days != null) {
		            clDay = String.join(",", days);
		         }
		       
		         int clTimes =Integer.parseInt(multiRequest.getParameter("times"));
		         String clPrice = multiRequest.getParameter("price");
		         
		         String clThumb = "";
		         if(multiRequest.getOriginalFileName("file1")!=null) {
		        	 String filePath = "resources/classThumbnail_upfiles/";
		        	 String changeName = multiRequest.getFilesystemName("file1");
		        	 clThumb = filePath+changeName;
		         }
		         

		         String clDetail = multiRequest.getParameter("editordata");
		         String curriculum = multiRequest.getParameter("curriculum");
		         String refundPolicy = multiRequest.getParameter("refundPolicy");
		         String clSupplies = multiRequest.getParameter("supplies");
		         String keyword = multiRequest.getParameter("keyword");
		         
		         Lesson l = new Lesson(ctNo, ctDno,String.valueOf(memNo),localCode,distrCode,clName,clAddress,clMax,clLevel,endDate,clTimes,clSchedule,clDay,clPrice,clDetail,curriculum,refundPolicy,clSupplies,keyword,clThumb);
		      
		         //attachment
		        ArrayList<Attachment> list = new ArrayList<>();
		         
		         for(int i=2; i<=4; i++) {
		        	 String key = "file" +i;
		         
		        	 if(multiRequest.getOriginalFileName(key) != null) {
		        		 Attachment at = new Attachment();
		        		 at.setOriginName(multiRequest.getOriginalFileName(key));
		        		 at.setChangeName(multiRequest.getFilesystemName(key));
		        		 at.setFilePath("resources/classThumbnail_upfiles/");
		        		 at.setRefType("1");
		        		
		        		 list.add(at);
		        	 }
		 
		         }
		         
		         ArrayList<Schedule> sList = new ArrayList<>();
		         //스케줄
		         String[] sessionArr =multiRequest.getParameterValues("session");
		         String[] startTimeArr = multiRequest.getParameterValues("startTime");
		         String[] endTimeArr = multiRequest.getParameterValues("endTime");
		         
		         int[] newsession = new int[sessionArr.length];
		         for(int j=0;j<sessionArr.length; j++) {
		        	 newsession[j] =Integer.parseInt(sessionArr[j]);
		         }
		         
		         for(int i = 0; i<newsession.length; i++) {
		        	 Schedule sc = new Schedule();
		        	 sc.setSessionNo(newsession[i]);
		        	 sc.setStartTime(startTimeArr[i]);
		        	 sc.setEndTime(endTimeArr[i]);
		        	 
		        	 sList.add(sc);
		        	 
		         }
		         System.out.println(sList);
		         
		 
		         int result = new TutorService().insertClass(l,list,sList); 
		        
		         if(result>0) {
		        	 //성공 => 클래스 목록 페이지로
		        	 session.setAttribute("alertMsg", "클래스가 성공적으로 등록되었습니다.");
		        	 response.sendRedirect(request.getContextPath()+"/ttclass.tt?cpage=1");
		        	 
		         }else {
		        	 
		        	 if(! list.isEmpty()) {
		        		 for(Attachment at : list) {
		        		new File(savePath + at.getChangeName()).delete();
		        		}
		        	 }
		        	//실패 
		        	 session.setAttribute("alertMsg", "클래스 등록에 실패했습니다.");
		        	 response.sendRedirect(request.getContextPath()+"/clenroll.tt");
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
