package com.hp.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.hp.member.model.service.MemberService;
import com.hp.member.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * Servlet implementation class AjaxPhoneCheckForCertification2Controller
 */
@WebServlet("/certifiPhone2.me")
public class AjaxPhoneCheckForCertification2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPhoneCheckForCertification2Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone = request.getParameter("phone");
		
		Member m1 = new MemberService().phoneCheckForCertifi(phone);
		
		if(m1!=null) {// 넘어온번호로 회원 이미 있음
			response.getWriter().print("NNNNN");
			
		}else {
			String api_key = "NCSPIQMUBEKHXCTW";      
		    String api_secret = "EP9ER8X5LQC7EPLRSXORESR00EBKEMYJ";        
		    Message coolsms = new Message(api_key, api_secret);

		    Random rd = new Random();
			int ranCode = rd.nextInt(899999)+100000;
			
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phone);
		    params.put("from", "01084162654");          
		    params.put("type", "SMS");
		    params.put("text", "[합플] 본인인증번호 : " + ranCode);     //메시지 내용
		    params.put("app_version", "test app 1.2");

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      //System.out.println(obj.toString());   //전송 결과 출력 
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		    
		    // 랜덤숫자리턴
		    JSONObject jObj = new JSONObject();
		    
		    jObj.put("key", ranCode);
            
            
            response.setContentType("application/json; charset=UTF-8");
    		response.getWriter().print(jObj);
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
