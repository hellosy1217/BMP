package com.project.bmp.common;

import java.util.ArrayList;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.bmp.report.model.vo.Report;

public class SendMail {

	public String sendMails(JavaMailSender mailSender, ArrayList<String> emailArr, String title, String content) {
		MimeMessage mail = mailSender.createMimeMessage();
		try {
			mail.setSubject(title, "utf-8");
			mail.setText(content, "utf-8", "html");
			InternetAddress[] toAddr = new InternetAddress[emailArr.size()];

			for (int i = 0; i < emailArr.size(); i++) {
				String email = emailArr.get(i);
				email = email.replace("google: ", "");
				toAddr[i] = new InternetAddress(email);
			}
			mail.addRecipients(Message.RecipientType.TO, toAddr);
			mailSender.send(mail);

			return "success";
		} catch (MessagingException e) {
			return null;
		}
	}

	// 메일 전송하기
	public String sendMail(JavaMailSender mailSender, String email, String type, Report report) {
		String authKey = null;
		String mailContent = null;
		if (report == null) {
			authKey = getAuthCode();
			mailContent = "<h1>[이메일 인증]</h1><br><p>아래의 인증번호를 입력하시면 이메일 인증이 완료됩니다.</p>" + "<p>" + authKey + "</p>";
			type += " 이메일 인증 ";
		} else {
			mailContent = report.getContent();
		}
		MimeMessage mail = mailSender.createMimeMessage();
		try {
			mail.setSubject(type, "utf-8");
			mail.setText(mailContent, "utf-8", "html");

			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			mailSender.send(mail);
			if (report == null)
				return authKey;
			else
				return "success";
		} catch (MessagingException e) {
			return null;
		}
	}

	// 인증코드 생성하기
	public String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;

		while (buffer.length() < 6) {
			num = random.nextInt(10);
			buffer.append(num);
		}

		return buffer.toString();
	}

}
