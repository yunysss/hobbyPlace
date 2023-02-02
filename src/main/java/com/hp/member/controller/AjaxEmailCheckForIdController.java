package com.hp.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.hp.member.model.service.MemberService;
import com.hp.member.model.vo.Member;

/**
 * Servlet implementation class AjaxEmailCheckForIdController
 */
@WebServlet("/mailForId.me")
public class AjaxEmailCheckForIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxEmailCheckForIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memName = request.getParameter("memName");
		String email = request.getParameter("email");
		
		Member m = new MemberService().emailCheckForId(memName, email);
		
		
		
		if(m==null || !m.getEmail().equals(email)) {//일치하는 회원번호 찾기 실패

			response.getWriter().print("NNNNN");
			
		}else {//일치하는 회원번호 찾기 성공
			
			//mail server 설정
            String host = "smtp.naver.com";
            String user = "devaccsy@naver.com"; 
            String password = "semiproject100";
            
            //메일 받을 주소
            String to_email = m.getEmail();
            
            //SMTP 서버 정보를 설정한다.
            Properties props = new Properties();
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", 465);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.enable", "true");
            
            //인증 번호 생성기
            StringBuffer temp =new StringBuffer();
            Random rnd = new Random();
            for(int i=0;i<10;i++)
            {
                int rIndex = rnd.nextInt(3);
                switch (rIndex) {
                case 0:
                    // a-z
                    temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                    break;
                case 1:
                    // A-Z
                    temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                    break;
                case 2:
                    // 0-9
                    temp.append((rnd.nextInt(10)));
                    break;
                }
            }
            String AuthenticationKey = temp.toString();
            
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user,password);
                }
            });
            
            //email 전송
            try {
                MimeMessage msg = new MimeMessage(session);
                msg.setFrom(new InternetAddress(user, "합플"));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
                
                //메일 제목
                msg.setSubject("안녕하세요 HobbyPlace 인증 메일입니다.");
                //메일 내용
                msg.setText(memName + "님이 요청한 인증 번호 : " + temp);
                
                Transport.send(msg);
                //System.out.println("이메일 전송 완료");
                
            }catch (Exception e) {
                e.printStackTrace();// TODO: handle exception
            }
            
            JSONObject jObj = new JSONObject();
            jObj.put("key", AuthenticationKey);
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
