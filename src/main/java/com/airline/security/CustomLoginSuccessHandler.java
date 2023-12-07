package com.airline.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.airline.mapper.UserMapper;
import com.airline.vo.KakaoUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	//매퍼 추가
	@Autowired
	private UserMapper mapper;
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		//세션에 선언하는 부분 추가
		KakaoUserVO vo = mapper.getUser(auth.getName());
		HttpSession session = request.getSession();	
		session.setAttribute("loginUser", vo); 
		//일반로그인이랑 카카오랑 구별해서 따로 선언해서 가져오기...
		//카카오로하면 세션값 못얻어와서 연결안되는중.. => controller에서 직접 시큐리티 핸들링....
		log.info("CUSTOM LOGIN SUCCESS ===============================");
		log.warn("login success");
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
	
		log.warn("role names : " + roleNames);
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin");
			return ;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/user");
			return;
		}
		clearAuthenticationAttributes(request);
		//resultRedirectStrategy(request, response, auth);
		response.sendRedirect("/");
	}

	//로그인 실패 에러세션 지우기
	private void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null) return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		
	}

	//로그인 성공 시 타겟url 으로 리다이렉트
	private void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException{
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		log.info("로그인 성공");
		if(savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, targetUrl);
		}else {
			redirectStrategy.sendRedirect(request, response, null);
		}
		
	}

}
