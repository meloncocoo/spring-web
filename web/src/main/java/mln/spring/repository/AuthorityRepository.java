/**
 * 
 */
package mln.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import mln.spring.domain.Authority;

/**
 * @author ZhouWenLong
 *
 */
public interface AuthorityRepository extends JpaRepository<Authority, String> {

}
