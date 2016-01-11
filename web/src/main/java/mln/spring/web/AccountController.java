/**
 * 
 */
package mln.spring.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author ZhouWenLong
 *
 */
@Controller
@RequestMapping("/account")
public class AccountController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	String index(Model model, @RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			HttpServletRequest request) {
		
		if (null != error) {
			Exception exception = Exception.class.cast(request.getSession().getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION));
			
			if (null != exception) {
				model.addAttribute("error", true);
				model.addAttribute("msg", exception.getMessage());
			}
		}
		
		if (null != logout) {
			model.addAttribute("msg", "You've been logged out successfully.");
		}
		
		return "account/index";
	}
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.HEAD}, headers = "x-requested-with=XMLHttpRequest")
	ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) throws Exception {
		Thread.sleep(1000);
		
		ModelAndView model = new ModelAndView();
		
		if (null != error) {
			model.addObject("error", true);
			model.addObject("msg", "Invalid username and password!");
		}
		
		if (null != logout) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		
		model.setViewName("account/login");
		
		return model;
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	String registerAccount() throws Exception {
		Thread.sleep(1000);
		return "account/register";
	}
	
	@RequestMapping(value = "/forgot", method = {RequestMethod.GET, RequestMethod.HEAD}, headers = "x-requested-with=XMLHttpRequest")
	String forgotAccount() throws Exception {
		Thread.sleep(1000);
		return "account/forgot";
	}
	
}
