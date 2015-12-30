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

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	String registerAccount() throws Exception {
		//Thread.currentThread();
		Thread.sleep(3000);
		return "account/register";
	}
	
}
