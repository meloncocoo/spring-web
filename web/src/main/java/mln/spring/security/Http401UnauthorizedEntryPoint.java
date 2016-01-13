package mln.spring.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.SpringSecurityMessageSource;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;

public class Http401UnauthorizedEntryPoint extends LoginUrlAuthenticationEntryPoint {
	
	private final Logger log = LoggerFactory.getLogger(Http401UnauthorizedEntryPoint.class);
	
	protected final MessageSourceAccessor messages = SpringSecurityMessageSource
			.getAccessor();

	public Http401UnauthorizedEntryPoint(String loginFormUrl) {
		super(loginFormUrl);
	}

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authException) throws IOException, ServletException {
		String xhrHeader = request.getHeader("X-Requested-With");
		boolean isAjaxRequest = xhrHeader != null && "XMLHttpRequest".contentEquals(request.getHeader("X-Requested-With"));
		
		if (isAjaxRequest) {
			log.debug("Ajax request, unauthorized.");
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, messages.getMessage("AbstractUserDetailsAuthenticationProvider.credentialsExpired"));
		} else {
			super.commence(request, response, authException);
		}
	}
}
