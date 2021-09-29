package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.AlumniData;
import entities.StudentData;
import model.AlumniDao;
import model.AlumniDaoImpl;
import model.StudentDao;
import model.StudentDaoImpl;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String role = request.getParameter("role");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (role.equals("Admin")) {

			if (email.equals("admin@gmail.com") && password.equals("admin")) {
				AlumniData us = new AlumniData();
				us.setName("Admin");
				session.setAttribute("userObj", us);
				response.sendRedirect("AdminHome.jsp");
			} else {
				session.setAttribute("failedMsg", "Email Or Password Invalid");
				response.sendRedirect("login.jsp");
			}
		} else if (role.equals("Alumini")) {
			AlumniDao aluminiDao = new AlumniDaoImpl();

			AlumniData aluminiRecord = new AlumniData(email, password);
			AlumniData data = aluminiDao.aluminiLogin(aluminiRecord);
			if (data != null) {
				AlumniData us = new AlumniData();
				session.setAttribute("userObj", data);
				response.sendRedirect("AlumniHome.jsp");
			} else {
				session.setAttribute("failedMsg", "Email Or Password Invalid");
				response.sendRedirect("login.jsp");
			}
		} else if (role.equals("Student")) {
			StudentDao studentDao = new StudentDaoImpl();

			StudentData studentRecord = new StudentData(email, password);
			StudentData data = studentDao.studentLogin(studentRecord);
			if (data != null) {
				session.setAttribute("userObj", data);
				response.sendRedirect("StudentHome.jsp");
			} else {
				session.setAttribute("failedMsg", "Email Or Password Invalid");
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	}
}
