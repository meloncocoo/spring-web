package mln.spring.service;

import static org.junit.Assert.*;

import java.util.Optional;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import mln.spring.WebApplication;
import mln.spring.domain.User;
import mln.spring.repository.UserRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(WebApplication.class)
public class UserServiceTest {

	@Inject
	private UserService userService;
	
	@Inject
	private UserRepository userRepository;
	
	@Test
	public void testCreateUserInformation() {
		assertNotNull(userService);
		
		String login = "melon";
		Optional<User> userFromDatabase = userRepository.findOneByLogin(login);
		
		userFromDatabase.ifPresent((user) -> {
			userRepository.delete(user.getId());
		});
		
		User user = userService.createUserInformation("melon", "admin", "Melon", "Cocoo", "nimda_wen@hotmail.com");
		assertNotNull(user);
	}

}
