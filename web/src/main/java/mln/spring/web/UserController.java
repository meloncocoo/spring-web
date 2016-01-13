/**
 * 
 */
package mln.spring.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mln.spring.repository.UserRepository;

/**
 * @author ZhouWenLong
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

	private final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired UserRepository userRepository;
	
	@RequestMapping(method = {RequestMethod.GET, RequestMethod.HEAD}, headers = "x-requested-with=XMLHttpRequest")
	String index(Model model, 
			Pageable pageable, @RequestParam MultiValueMap<String, String> parameters) throws Exception {
		
		log.info("Find all users: page -> {}, size -> {}, sort: {}", pageable.getPageNumber(), pageable.getPageSize(), pageable.getSort());
		model.addAttribute("users", userRepository.findAll(pageable));
		Thread.sleep(500);
		
		return "user/index";
	}
	
}
