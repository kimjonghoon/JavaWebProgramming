package net.java_school.exception;

import java.io.IOException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyAccessDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		//System.out.println("Access Denied for user: " + request.getUserPrincipal().getName());
		
		response.sendRedirect(request.getContextPath() + "/error-403");
		// Or send a custom error response
		// response.setStatus(HttpServletResponse.SC_FORBIDDEN);
		// response.getWriter().write("Access Denied: You do not have permission to access this resource.");		
	}

}
