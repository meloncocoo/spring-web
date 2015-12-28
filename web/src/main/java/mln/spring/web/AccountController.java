/**
 * 
 */
package mln.spring.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author ZhouWenLong
 *
 */
@Controller
public class AccountController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	String login() {
		return "account/login";
	}

	@RequestMapping("/register")
	String registerAccount() {
		return "account/register";
	}
	
}
