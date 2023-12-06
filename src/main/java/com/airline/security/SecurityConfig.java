package com.airline.security;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import lombok.RequiredArgsConstructor;

@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	private final CustomLoginSuccessHandler customLoginSuccessHandler;
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.formLogin()
		.successHandler(customLoginSuccessHandler);
		//super.configure(http);
	}
}
