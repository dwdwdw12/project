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
	public KakaoUserVO confirmMember(String userNameE, String userNameK, String gender, int userReginumFirst,
			int userReginumLast) {
		return join.checkMember(userNameE, userNameK, gender, userReginumFirst, userReginumLast);
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

			sb.append("&client_id=a490df18ce9a725d8744f401c597d9eb"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri=https://localhost:8443/kakao"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

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
					conn.setRequestMethod("GET");

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

						Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
						Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

						log.info(properties.get("nickname"));
						// log.info(kakao_account.get("email"));

						String nickname = properties.get("nickname").toString();
						//String email = kakao_account.get("email").toString();

						userInfo.put("nickname", nickname);
						//userInfo.put("email", email);

						log.info("nickname >> " + nickname);
						//log.info("email >> " + email);

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

}
