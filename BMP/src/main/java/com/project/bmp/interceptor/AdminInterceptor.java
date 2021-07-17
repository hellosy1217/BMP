package com.project.bmp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.project.bmp.user.model.vo.User;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User accessor = (User) request.getSession().getAttribute("accessor");
		if (accessor != null && accessor.getAdmin() == 'Y') {
			response.sendRedirect("admin");

			return false;
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
