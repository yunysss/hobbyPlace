package com.hp.common;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Sms {

	public static void Main(String[] args) {
		String api_key = "NCSPIQMUBEKHXCTW";
		String api_secret = "EP9ER8X5LQC7EPLRSXORESR00EBKEMYJ";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01084162654");
		params.put("from", "01084262654");
		params.put("type", "SMS");
		params.put("text", "메세지 전송 테스트");
		params.put("app_version", "test app 1.2");
		
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString()); // 전송결과 출력
			
		} catch (CoolsmsException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
	}

}
