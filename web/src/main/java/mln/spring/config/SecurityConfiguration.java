package mln.spring.config;

import javax.inject.Inject;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import mln.spring.security.Http401UnauthorizedEntryPoint;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Inject
	private UserDetailsService userDetailsService;
	
	private Http401UnauthorizedEntryPoint authenticationEntryPoint;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Inject
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService)
			.passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		if (null == authenticationEntryPoint) {
			authenticationEntryPoint = new Http401UnauthorizedEntryPoint("/account");
		}
		
		http
			.exceptionHandling()
			.authenticationEntryPoint(authenticationEntryPoint)
		.and()
			.formLogin()
			.loginPage("/account")
			.loginProcessingUrl("/login")
			.failureUrl("/account?error")
			.permitAll()
		.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
		.and()
			.authorizeRequests()
			.antMatchers("/account/**").permitAll()
			.antMatchers("/api/language").permitAll()
			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
			.anyRequest().authenticated();
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring()
			.antMatchers("/console/**")
			.antMatchers("/webjars/**")
			.antMatchers("/css/**")
			.antMatchers("/scripts/**")
			.antMatchers("/images/**/*.{png}");
	}
	
}
