package com.airline.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Description;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.airline.mail.MailHandler;
import com.airline.mail.TempKey;
import com.airline.service.JoinService;
import com.airline.service.MailSendService;
import com.airline.vo.KakaoUserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/join/*")
public class JoinController {
	@Autowired
	private JoinService join;

	@Autowired
	private MailSendService mailSendService;

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/joinTerms")
	public void joinTemrs() {
		log.info("JoinController >> joinTerms [get]");
	}

	@PostMapping("/joinTerms")
	public String joinTemrs(Model model) {
		model.addAttribute("agree", "동의여부 담는중~~~(jointerms_post에서)");
		log.info("JoinController >> joinTerms [post]");
		return "/join/checkMember";
	}

	@GetMapping("/findId")
	public void findId() {
		log.info("JoinController >> findId");
	}

	@PostMapping("/findId") // 여유가 있다면.. 랜덤키생성/메일보내는 메서드를 따로 뺄까 생각중...
	public String findId(String email, Model model, RedirectAttributes attr) {
		String result = join.confirmEmail(email);
		model.addAttribute("email", result); // 필요한가

		log.info("email >> " + email);
		log.info("result >> " + result);

		try {
			String mail_key = new TempKey().getKey(); // 랜덤키 생성

			Map<String, String> params = new HashMap<String, String>();
			params.put("email", email);
			params.put("mail_key", mail_key);

			mailSendService.updateMailKey(params); // email을 기준으로 컬럼에 랜덤키 저장
			log.info("입력받은 이메일 >> " + email + "생성된 key >> " + mail_key);

			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("카카오 항공 인증 메일입니다.");
			sendMail.setText("<h3>카카오 항공을 찾아주셔서 감사합니다.</h3>" + "<br>아래 확인 버튼을 눌러서 인증을 완료해 주시기 바랍니다."
					+ "<br><br><a href='http://localhost:8081/join/getUserId" + "/" + email + "/" + mail_key
					+ "' target='_blank'>이메일 인증 확인</a>");
			sendMail.setFrom("systemlocal99@gmail.com", "카카오 항공");
			sendMail.setTo(email);
			sendMail.send();

			log.info("controller에서 메일 보냄 완료");

			if (result != null) {
				return "redirect:/join/mailSended";
			} else {
				model.addAttribute("message", "입력하신 정보를 다시 확인해주시기 바랍니다.");
				return "redirect:/join/findId";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error/accessError";
		}

	}

	@GetMapping("/mailSended")
	public void mailSended() {
		log.info("JoinController >> mailSended");
	}

	@GetMapping("/getUserId/{email}/{mail_key}")
	public String getUserId(@PathVariable("email") String email, @PathVariable("mail_key") String mail_key,
			Model model) {
		log.info("JoinController >> getUserId");
		KakaoUserVO vo = join.showUserId(email, mail_key);
		model.addAttribute("user", vo);
		// 근데 get이라서 전부 url에 노출됨..
		// 창을 누르는 순간 mail_key가 초기화되도록...? => 위험한가... =>에러페이지가서 msg에 다시 시도해달라고
		// 할까....생각해보기..!

		return "/join/getUserId";
	}

	@GetMapping("/findPwd")
	public void findPwd() {
		log.info("JoinController >> findPwd");
	}

	@GetMapping("/checkMember") // 약관동의 후 기존멤버 체크(아직 약관동의 저장, 유효성 구현하지 않음)
	public void checkMember(Model model) {
		log.info("JoinController >> checkMember [get]");
	}

	@PostMapping("/checkMember") // 약관동의 후 기존멤버 체크(아직 약관동의 저장, 유효성 구현하지 않음)
	public String checkMember(Model model, String userNameE, String userNameK, String gender, int userReginumFirst,
			int userReginumLast) {
		log.info("JoinController >> checkMember [post]");
		log.info(userNameE);
		log.info(userNameK);
		log.info(gender);
		log.info(userReginumFirst);
		log.info(userReginumLast);

		KakaoUserVO vo = join.confirmMember(userNameE, userNameK, gender, userReginumFirst, userReginumLast);
		log.info(vo);

		if (vo != null) {
			return "/join/memberInfo"; // 가질못함.... 왜못가는걸까...
		} else {
			model.addAttribute("message", "이미 가입된 회원입니다.");
			return "/login";
		}

	}
	
	
	//카카오 로그인 구현
		// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
			// 2번 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
			// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음
//			@RequestMapping(value = "/kakao", method = RequestMethod.GET)
			@GetMapping("/kakao")
			@CrossOrigin(origins = "http://localhost:8081/join/kakao")
			public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {
System.out.println("kakao controller타는중~~~(join에서 get)");
				// 1번
				log.info("code:" + code);
				
				// 2번
				String access_Token = join.getAccessToken(code);
				log.info("###access_Token#### : " + access_Token);
				// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
				
				// 3번
				HashMap<String, Object> userInfo = join.getUserInfo(access_Token);
				log.info("###nickname#### : " + userInfo.get("nickname"));
				//log.info("###email#### : " + userInfo.get("email"));
				
				ModelAndView mv = new ModelAndView();
				//mv.addObject("userInfo", join.)
				mv.setViewName("/join/checkMember");
				return mv;	
				// 닉네임밖에 못받아오기때문에... 기존회원여부 페이지로 이동시킴...ㅜㅜ
			}
					
}
