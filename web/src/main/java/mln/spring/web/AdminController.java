package mln.spring.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import mln.spring.repository.AuthorityRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired AuthorityRepository authorityRepository;
	
	@Autowired RequestMappingHandlerMapping requestMappingHandlerMapping;

	@RequestMapping("")
	String index() {
		return "admin/index";
	}
	
	@RequestMapping(value = "/role", method = {RequestMethod.GET, RequestMethod.HEAD}, headers = "x-requested-with=XMLHttpRequest")
	String roles(Model model, Pageable pageable) throws Exception {
		log.info("Find all roles: page -> {}, size -> {}, sort: {}", pageable.getPageNumber(), pageable.getPageSize(), pageable.getSort());
		model.addAttribute("roles", authorityRepository.findAll(pageable));
		Thread.sleep(500);
		return "admin/role";
	}
	
	@RequestMapping(value = "/endPoints", method = {RequestMethod.GET, RequestMethod.HEAD}, headers = "x-requested-with=XMLHttpRequest")
	String getEndPointsInView(Model model) {
		model.addAttribute("endPoints", requestMappingHandlerMapping.getHandlerMethods().keySet());
		return "admin/endPoints";
	}
	
}
