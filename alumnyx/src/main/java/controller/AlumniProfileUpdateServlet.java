package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.AlumniData;
import model.AlumniDao;
import model.AlumniDaoImpl;

public class AlumniProfileUpdateServlet extends HttpServlet {
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
		
		AlumniData data = new AlumniData(name,uname,email,phoneno,graduationYear,category,prn_no,password);
		
		AlumniDao alumniDao = new AlumniDaoImpl();
		
		AlumniData rec = alumniDao.updateData(data);
		session.setAttribute("userObj", rec);
		RequestDispatcher rd = request.getRequestDispatcher("AlumniProfile.jsp");
		rd.forward(request, response);
		
	}

}
