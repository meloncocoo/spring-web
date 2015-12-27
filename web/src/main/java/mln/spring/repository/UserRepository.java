package mln.spring.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import mln.spring.domain.User;

public interface UserRepository extends JpaRepository<User, Long> {

	Optional<User> findOneByLogin(String lowercaseLogin);

}
