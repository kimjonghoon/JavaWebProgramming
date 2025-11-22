package net.java_school.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import static org.springframework.security.config.Customizer.withDefaults;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class SecurityConfig {
	@Autowired
	private DataSource dataSource;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public UserDetailsService userDetailsService() {
		JdbcUserDetailsManager manager = new JdbcUserDetailsManager(dataSource);
		manager.setUsersByUsernameQuery("SELECT email as username, passwd as password, 1 as enabled FROM member WHERE email = ?");
		manager.setAuthoritiesByUsernameQuery("SELECT email as username, authority FROM authorities WHERE email = ?");
		return manager;
	}

	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider(userDetailsService());
		provider.setPasswordEncoder(passwordEncoder());
		return provider;
	}

	/*
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.jdbcAuthentication().dataSource(dataSource).passwordEncoder(this.passwordEncoder());
	}
	*/
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
			.authorizeHttpRequests((authorize) -> authorize
				.requestMatchers(HttpMethod.GET, "/users/bye_confirm").permitAll()
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
			.formLogin(form -> form.loginPage("/users/login").permitAll().loginProcessingUrl("/login").defaultSuccessUrl("/bbs/chat?page=1").failureUrl("/users/login?error=1"))
			.logout((logout) -> logout.logoutSuccessUrl("/"))
			.httpBasic(withDefaults());
			
		return http.build();
	}
}
