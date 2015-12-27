/**
 * 
 */
package mln.spring.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ZhouWenLong
 *
 */
@Controller
public class AccountController {
	
	@RequestMapping("/login")
	String login() {
		return "account/login";
	}

	@RequestMapping("/register")
	String registerAccount() {
		return "account/register";
	}
	
}
