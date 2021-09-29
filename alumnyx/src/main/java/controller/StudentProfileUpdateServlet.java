package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import entities.StudentData;
import model.StudentDao;
import model.StudentDaoImpl;


public class StudentProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String name=request.getParameter("name");
		String uname=request.getParameter("uName");
		long phoneno=Long.parseLong(request.getParameter("phoneno"));
		String category=request.getParameter("category");
		String email=request.getParameter("email");
		int graduationYear= Integer.parseInt(request.getParameter("graduationYear"));
		long prn_no = Long.parseLong(request.getParameter("prn_no"));
		String password=request.getParameter("password");
		
		StudentData data = new StudentData(name,uname,email,phoneno,graduationYear,category,prn_no,password);
		
		StudentDao studentDao = new StudentDaoImpl();
		
		StudentData rec = studentDao.updateData(data);
		session.setAttribute("userObj", rec);
		RequestDispatcher rd = request.getRequestDispatcher("StudentProfile.jsp");
		rd.forward(request, response);
		
	}
}
