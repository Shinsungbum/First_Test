package common;

import java.security.MessageDigest;
import java.security.SecureRandom;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

@Service
public class CommonService {
	//임시 비밀번호를 이메일로 전송
	public boolean sendPassword(String email,String userid, String name, String pw) {
		HtmlEmail mail = new HtmlEmail();
		//메일서버지정
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);//Console을 통해 메일전송과정 확인

		//로그인하기
		mail.setAuthentication("ssb9701", "ssb97015364");
		//로그인버튼 클릭하기
		mail.setSSLOnConnect(true);
		boolean send = true;

		try {
			//메일 보내는이 지정
			mail.setFrom("ssb9701@naver.com", "IOT관리자");
			//메일 받는이 지정
			mail.addTo(email, name);
			
			mail.setSubject("지능형 IoT 로그인 임시비밀번호 발급");
			
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<h3>임시비밀번호 발급</h3>");
			msg.append("<p>아이디 : ").append(userid).append("</p>");			
			msg.append("<p>발급된 임시 비밀번호로 로그인 후 비밀번호를 변경하세요</p>");
			msg.append("<p><strong>").append(pw).append("</strong></p>");			
			msg.append("</body>");
			msg.append("</html>");
			
			mail.setHtmlMsg(msg.toString());
			
			//메일보내기버튼 클릭
			mail.send();
//			mail.setM
		} catch(Exception e) {
			System.out.println(e.getMessage());
			send = false;
		}
		return send;
	}
	
	
	
	
	//비밀번호를 암호화하는데 사용할 솔트생성
	public String generateSalt() {
		SecureRandom r = new SecureRandom();
		byte[] bytes = new byte[24];
		r.nextBytes(bytes);
		
		StringBuffer data = new StringBuffer();
		for( byte b : bytes) {
			data.append(String.format("%02x", b));
		}
		return data.toString();
		
		
	}
	
	//salt 문자열을 사용해 비밀번호를 암호화하는 처리
	public String getEncrypt(String salt, String pw) {
		pw += salt;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			digest.update(pw.getBytes());
			
			byte[] bytes = digest.digest();
			StringBuffer data = new StringBuffer();
			for(byte b : bytes) {
				data.append( String.format("%02x", b) ); //16진수로 변환 00~09
			}
			pw = data.toString();
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return pw;
	}
}
