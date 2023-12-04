 
package com.airline.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.mapper.JoinMapper;
import com.airline.vo.KakaoUserVO;
import com.airline.vo.TermsVO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class JoinServiceImpl implements JoinService {

	@Autowired
	private JoinMapper join;

	@Override
	public String confirmEmail(String email) {
		return join.checkEmail(email);
	}

	@Override
	public KakaoUserVO showUserId(String email, String mail_key) {
		return join.getUserId(email, mail_key);
	}

	@Override
	public KakaoUserVO confirmMember(KakaoUserVO vo) {
		return join.checkMember(vo);
	}
	

	@Override
	public String confirmUserIdAndEmail(String userId, String email) {
		return join.checkUserIdAndEmail(userId, email);
	}

	@Override
	public void modifyPwdByMailKey(String userId, String mail_key) {
		join.updatePwdByMailKey(userId, mail_key);
	}
	

	@Override //토큰 받아오기
	public String getAccessToken(String authorize_code) throws Throwable {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=607caeca9f2a0089b46f99c667e0dee3"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri=http://localhost:8081/join/kakao"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			log.info("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			log.info("response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			log.info("access_token : " + access_Token);
			log.info("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;

	}
	
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
				HashMap<String, Object> userInfo = new HashMap<String, Object>();
				String reqURL = "https://kapi.kakao.com/v2/user/me";

				try {
					URL url = new URL(reqURL);
					HttpURLConnection conn = (HttpURLConnection) url.openConnection();
					conn.setRequestMethod("POST");

					// 요청에 필요한 Header에 포함될 내용
					conn.setRequestProperty("Authorization", "Bearer " + access_Token);

					int responseCode = conn.getResponseCode();
					log.info("responseCode >> " + responseCode);

					BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

					String line = "";
					String result = "";

					while ((line = br.readLine()) != null) {
						result += line;
					}
					log.info("response body >> " + result);
					log.info("result type >> " + result.getClass().getName()); // java.lang.String

					try {
						// jackson objectmapper 객체 생성
						ObjectMapper objectMapper = new ObjectMapper();
						// JSON String -> Map
						Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
						});

						log.info("jsonMap Data >> " +jsonMap.get("properties")); //null error처리해주기
						// kakao는 kakao_account에 유저정보가 있다.
						Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
						Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

						log.info(properties.get("nickname"));
						log.info(kakao_account.get("email"));
						log.info(kakao_account.get("name"));
						log.info(kakao_account.get("gender"));
						log.info(kakao_account.get("age_range_needs_agreement"));
						//log.info(kakao_account.get("age_range")); //=> error
						log.info(kakao_account.get("birthday")); //탄생연도는 따로 권한이 필요해서 불가능-> age_rage로 대체하여 성인인지만 판단할예정... 그러나 age_range에서 에러발생
						log.info(kakao_account.get("phone_number"));
//						log.info(kakao_account.get("shipping_address")); =>error

						String nickname = properties.get("nickname").toString();
						String email = kakao_account.get("email").toString();
						String name = kakao_account.get("name").toString();
						String gender = kakao_account.get("gender").toString();
						String age_range_needs_agreement = kakao_account.get("age_range_needs_agreement").toString();
						//String age_range = kakao_account.get("age_range").toString();
						String birthday = kakao_account.get("birthday").toString();
						String phone_number = kakao_account.get("phone_number").toString();
//						String shipping_address = kakao_account.get("shipping_address").toString();

						userInfo.put("nickname", nickname);
						userInfo.put("email", email);
						userInfo.put("name", name);
						userInfo.put("gender", gender);
						userInfo.put("age_range_needs_agreement", age_range_needs_agreement);
						//userInfo.put("age_range", age_range);
						userInfo.put("birthday", birthday);
						userInfo.put("phone_number", phone_number);
//						userInfo.put("shipping_address", shipping_address);

						log.info("nickname >> " + nickname);
						log.info("email >> " + email);
						log.info("name >> " + name);
						log.info("gender >> " + gender);
						log.info("age_range_needs_agreement >> " + age_range_needs_agreement);
						//log.info("age_range >> " + age_range);
						log.info("birthday >> " + birthday);
						log.info("phone_number >> " + phone_number);
//						log.info("shipping_address >> " +shipping_address);

//			            JsonParser parser = new JsonParser();
//			            JsonElement element = parser.parse(result);
//
//			            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//			            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//
//			            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//			            String email = kakao_account.getAsJsonObject().get("email").getAsString();
//			            
//			            userInfo.put("accessToken", access_Token);
//			            userInfo.put("nickname", nickname);
//			            userInfo.put("email", email);
						
						
					} catch (Exception e) {
						e.printStackTrace();
					}

				} catch (IOException e) {
					e.printStackTrace();
				}
				return userInfo;
			
	}
 
	@Override
	public TermsVO getTerms(int termsCode) {
		return join.getTerms(termsCode);
	}

	@Override
	public void registerMember(String userId, String userNick, String userNameK, String userNameE, String gender, String pwd,
			int userReginumFirst, int userReginumLast, int postCode, String phone, String mail, String address) {
		join.insertMember(userNameE, userNameK, gender, userReginumFirst, 
				userReginumLast, userId, userNick, pwd, 
				mail, phone, postCode, address);
	}

	@Override
	public int userIdDuplicateCheck(String userId) {
		return join.userIdDuplicateCheck(userId);
	}

	@Override
	public int userNickDuplicateCheck(String userNick) {
		return join.userNickDuplicateCheck(userNick);
	}



	
}
