/**
 * 
 */
package mln.spring.security;

import org.springframework.security.core.AuthenticationException;

/**
 * @author ZhouWenLong
 *
 */
public class UserNotActivatedException extends AuthenticationException {

    /**
	 * 
	 */
	private static final long serialVersionUID = -2119542670911085505L;

	public UserNotActivatedException(String message) {
        super(message);
    }

    public UserNotActivatedException(String message, Throwable t) {
        super(message, t);
    }
    
}
