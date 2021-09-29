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

public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		if (role.equals("Alumini")) {

			AlumniDao aluminiDao = new AlumniDaoImpl();

			AlumniData aluminiRecord = new AlumniData(email, password);
			AlumniData data = aluminiDao.changePassword(aluminiRecord);

			if(data!=null) {
				session.setAttribute("SuccessMsg", "Password has Changed");
				response.sendRedirect("login.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Password Updation is failed!!! Try Again");
				response.sendRedirect("ForgetPassword.jsp");
			}	

		} else if (role.equals("Student")) {
			StudentDao studentDao = new StudentDaoImpl();

			StudentData studentRecord = new StudentData(email, password);
			StudentData data = studentDao.changePassword(studentRecord);
			if(data!=null) {
				session.setAttribute("SuccessMsg", "Password has Changed");
				response.sendRedirect("login.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Password Updation is failed!!! Try Again");
				response.sendRedirect("ForgetPassword.jsp");
			}	
		}
	}
}
