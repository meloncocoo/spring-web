package mln.spring.web;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	String accessDenied(Model model, Principal user) {
		
		if (null != user) {
			model.addAttribute("msg", "Hi " + user.getName()
				+ ", you do not have permission to access this page!");
		} else {
			model.addAttribute("msg", "You do not have permission to access this page!");
		}
		
		return "403";
	}

}
