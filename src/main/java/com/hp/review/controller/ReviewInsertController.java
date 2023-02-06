package com.hp.review.controller;

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
import com.hp.member.model.vo.Member;
import com.hp.review.model.service.ReviewService;
import com.hp.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.rev")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/review_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// DB에 값 기록
			HttpSession session = request.getSession();
			int regNo = Integer.parseInt(multiRequest.getParameter("no"));
			int reviewStar = Integer.parseInt(multiRequest.getParameter("rating"));
			String reviewContent = multiRequest.getParameter("reviewContent");
			
			Review r = new Review();
			r.setReviewStar(reviewStar);
			r.setReviewContent(reviewContent);
			r.setRegNo(regNo);
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=3; i++) {
				String key = "file" + i;
				if(multiRequest.getOriginalFileName(key)!=null) {
					
					Attachment at  = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/review_upfiles/");
					
					list.add(at);
					
					
				}
			}
			
			int result = new ReviewService().insertReview(r, list);
			
			if(result>0) {
				session.setAttribute("alertMsg", "후기가 등록되었습니다.");
				response.sendRedirect(request.getContextPath()+"/list.rev");
			}else {
				request.setAttribute("errorMsg", "리뷰 등록 실패");
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
