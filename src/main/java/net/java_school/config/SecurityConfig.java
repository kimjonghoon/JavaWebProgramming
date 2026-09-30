package net.java_school.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;

import net.java_school.exception.MyAccessDeniedHandler;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {
	
	@Autowired
	private DataSource dataSource;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public UserDetailsService userDetailsService() {
		JdbcDaoImpl jdbcDao = new JdbcDaoImpl();
		jdbcDao.setDataSource(dataSource);
		jdbcDao.setUsersByUsernameQuery("SELECT email as username, passwd as password, 1 as enabled FROM member WHERE email = ?");
		jdbcDao.setAuthoritiesByUsernameQuery("SELECT email as username, authority FROM authorities WHERE email = ?");
		return jdbcDao;
	}

	@Bean
	public AccessDeniedHandler accessDeniedHandler() {
		return new MyAccessDeniedHandler();
	}
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
			.authorizeHttpRequests(authorize -> authorize
				.requestMatchers(HttpMethod.DELETE, "/bbs/admin/**").hasRole("ADMIN")
				.requestMatchers(HttpMethod.PATCH, "/bbs/admin/**").hasRole("ADMIN")
				.requestMatchers(HttpMethod.PUT, "/bbs/admin/**").hasRole("ADMIN")
				.requestMatchers(HttpMethod.POST, "/bbs/admin/**").hasRole("ADMIN")
				.requestMatchers(HttpMethod.GET, "/bbs/admin/**").hasRole("ADMIN")					
				.requestMatchers(HttpMethod.GET, "/users/bye_confirm").permitAll()
				.requestMatchers(HttpMethod.GET, "/users/login").permitAll()
				.requestMatchers(HttpMethod.GET, "/users/welcome").permitAll()
				.requestMatchers(HttpMethod.POST, "/users/signUp").permitAll()
				.requestMatchers(HttpMethod.GET, "/users/signUp").permitAll()
				.requestMatchers(HttpMethod.DELETE, "/admin/**").hasRole("ADMIN")
				.requestMatchers(HttpMethod.PATCH, "/admin/**").hasRole("ADMIN")
				.requestMatchers(HttpMethod.PUT, "/admin/**").hasRole("ADMIN")
				.requestMatchers(HttpMethod.POST, "/admin/**").hasRole("ADMIN")
				.requestMatchers(HttpMethod.GET, "/admin/**").hasRole("ADMIN")
				.requestMatchers(HttpMethod.DELETE, "/users/**").authenticated()
				.requestMatchers(HttpMethod.PATCH, "/users/**").authenticated()
				.requestMatchers(HttpMethod.PUT, "/users/**").authenticated()
				.requestMatchers(HttpMethod.POST, "/users/**").authenticated()
				.requestMatchers(HttpMethod.GET, "/users/**").authenticated()
				.requestMatchers(HttpMethod.DELETE, "/bbs/**").authenticated()
				.requestMatchers(HttpMethod.PATCH, "/bbs/**").authenticated()
				.requestMatchers(HttpMethod.PUT, "/bbs/**").authenticated()
				.requestMatchers(HttpMethod.POST, "/bbs/**").authenticated()
				.requestMatchers(HttpMethod.GET, "/bbs/**").authenticated()
				.anyRequest().permitAll()
			)
			
			.formLogin(form -> form
					.loginPage("/users/login")
					.loginProcessingUrl("/login")
					.defaultSuccessUrl("/bbs/chat?page=1")
					.failureUrl("/users/login?error=1")
			)
			
			.logout(logout -> logout
					.logoutSuccessUrl("/")
			)
			
			.exceptionHandling(exceptionHandling -> exceptionHandling
					.accessDeniedHandler(accessDeniedHandler())
			);
			
		return http.build();
	}
}