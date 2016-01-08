package mln.spring.web.api;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.LocaleResolver;

@RestController
@RequestMapping("/api")
public class CommonController {
	
	@Autowired
	LocaleResolver resolver;

	@RequestMapping("/language")
	public ResponseEntity<?> changeLanguage(Locale locale, HttpServletRequest request, HttpServletResponse response) throws Exception {
		resolver.setLocale(request, response, locale);
		Thread.sleep(1000);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}
