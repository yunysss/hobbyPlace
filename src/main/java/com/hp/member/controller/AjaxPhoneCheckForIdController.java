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
 * Servlet implementation class AjaxPhoneCheckForIdController
 */
@WebServlet("/IdByPhone.me")
public class AjaxPhoneCheckForIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPhoneCheckForIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memName = request.getParameter("memName");
		String phone = request.getParameter("phone");
		
		Member m = new MemberService().phoneCheckForId(memName, phone);
		
		if(m==null || !m.getPhone().equals(phone)) {
			response.getWriter().print("NNNNN");
		}else {
			String api_key = "NCSPIQMUBEKHXCTW";      //사이트에서 발급 받은 API KEY
		    String api_secret = "EP9ER8X5LQC7EPLRSXORESR00EBKEMYJ";        //사이트에서 발급 받은 API SECRET KEY
		    Message coolsms = new Message(api_key, api_secret);

		    Random rd = new Random();
			int ranCode = rd.nextInt(899999)+100000;
			
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", m.getPhone());
		    params.put("from", "01084162654");          //사전에 사이트에서 번호를 인증하고 등록하여야 함
		    params.put("type", "SMS");
		    params.put("text", "[합플] 인증번호 : " + ranCode);     //메시지 내용
		    params.put("app_version", "test app 1.2");

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());   //전송 결과 출력 
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
		    
		    // 랜덤숫자와 아이디리턴
		    JSONObject jObj = new JSONObject();
		    
		    jObj.put("key", ranCode);
            jObj.put("memId", m.getMemId());
            
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
