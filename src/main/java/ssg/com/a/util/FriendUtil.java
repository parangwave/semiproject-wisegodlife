package ssg.com.a.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;

import ssg.com.a.dto.FriendDto;

public class FriendUtil {
	
	//
	public static int canRestore(FriendDto dto) {
		// 숫자가 0 탈퇴 복구가능 / 1 탈퇴 복구 불가
		// 탈퇴한 시점의 날짜
		String delMonthstr = dto.getDeldate().substring(5, 7);
		int delMonth = Integer.parseInt(delMonthstr);
		String deldaystr = dto.getDeldate().substring(8, 10);
		int delday = Integer.parseInt(deldaystr);
		// 로그인 시점의 날짜
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) +1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		if (delMonth - month > 2) {
			return 1;
		} else if (delMonth - month > 1) {
			if (day > delday) {
				return 1;
			}
			return 0;
		}
		return 0;	
	}
	
	// 단방향 암호화 방식을 좀더 어렵게 만들기 위한방법
	public static String saltMake() throws NoSuchAlgorithmException {
		String salt = null;
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
		byte bytes[] = new byte[16];
		sr.nextBytes(bytes);
		salt = new String(Base64.getEncoder().encode(bytes));
		
		return salt;
	}
	
	// 단방향 암호화 함수
	public static String sha256(String pw, String salt) throws NoSuchAlgorithmException {
		StringBuffer sb = new StringBuffer();
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(pw.getBytes());
		md.update(salt.getBytes());
		byte data[] = md.digest();
		for (byte b : data) {
			sb.append(String.format("%02x", b));
		}
		
		return sb.toString();
	}
	
	// 회원가입시 암호화한 pw 생성과정
	public static void pwInsert(FriendDto dto) throws NoSuchAlgorithmException {
		String salt = saltMake();
		String secretpw = sha256(dto.getPw(), salt);
		dto.setPw(secretpw);
		// salt 는 random과 암호화를 사용한 난수이기 때문에 저장하지않으면 pw를 찾을 수 없다
		dto.setSalt(salt);
	}
	
	// 로그인시 암호화한 pw 변환과정
	public static void encryptionPw(FriendDto dto) throws NoSuchAlgorithmException {
		String secretpw = sha256(dto.getPw(), dto.getSalt());
		dto.setPw(secretpw);
	}	
	

	


}
