package common;

import java.security.MessageDigest;

import org.springframework.stereotype.Service;

@Service
public class CommonService {
	
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
