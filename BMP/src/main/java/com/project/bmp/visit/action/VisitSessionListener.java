package com.project.bmp.visit.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.project.bmp.visit.model.service.VisitService;

public class VisitSessionListener implements HttpSessionListener {

	@Autowired
	private VisitService vService;

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		int result = vService.addVisit(req.getRemoteAddr());
		session.setAttribute("visit", req.getRemoteAddr());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
	}

}
