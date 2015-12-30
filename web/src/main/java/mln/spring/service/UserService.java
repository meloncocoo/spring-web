/**
 * 
 */
package mln.spring.service;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mln.spring.domain.Authority;
import mln.spring.domain.User;
import mln.spring.repository.AuthorityRepository;
import mln.spring.repository.UserRepository;

/**
 * @author ZhouWenLong
 *
 */
@Service
@Transactional
public class UserService {
	
	private final Logger log = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private AuthorityRepository authorityRepository;

	@Autowired
	private UserRepository userRepository;
	
    public User createUserInformation(String login, String password, String firstName, String lastName, String email) {

        User newUser = new User();
        Authority authority = authorityRepository.findOne("ROLE_USER");
        Set<Authority> authorities = new HashSet<>();
        String encryptedPassword = passwordEncoder.encode(password);
        
        if (null == authority) {
        	authority = new Authority();
        	authority.setName("ROLE_USER");
        	authorityRepository.save(authority);
        }
        
        newUser.setLogin(login);
        // new user gets initially a generated password
        newUser.setPassword(encryptedPassword);
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setEmail(email);
//        newUser.setLangKey(langKey);
        // new user is not active
        newUser.setActivated(false);
        newUser.setCreateBy("test");
        // new user gets registration key
//        newUser.setActivationKey(RandomUtil.generateActivationKey());
        authorities.add(authority);
        newUser.setAuthorities(authorities);
        userRepository.save(newUser);
        log.debug("Created Information for User: {}", newUser);
        return newUser;
    }

}
