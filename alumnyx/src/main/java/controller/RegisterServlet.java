package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.AlumniData;
import entities.StudentData;
import model.AlumniDao;
import model.AlumniDaoImpl;
import model.StudentDao;
import model.StudentDaoImpl;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String uName = request.getParameter("uName");
		String email = request.getParameter("email");
		long phoneno = Long.parseLong(request.getParameter("phoneno"));
		int graduationYear = Integer.parseInt(request.getParameter("graduation_yr"));
		String role = request.getParameter("role");
		String category = request.getParameter("branch");
		long prn_no = Long.parseLong(request.getParameter("prn_no"));
		String password = request.getParameter("password");
		
		if(role.equals("Alumini")) {
			AlumniData record = new AlumniData(name, uName, email, phoneno, graduationYear, category, prn_no, password);

			AlumniDao add = new AlumniDaoImpl();
			AlumniData inserted_data = add.insertData(record);
			
			response.sendRedirect("login.jsp?message=Alumini successfully added");
		}
		else if(role.equals("Student"))
		{
			StudentData record = new StudentData(name, uName, email, phoneno, graduationYear, category, prn_no, password);

			StudentDao add = new StudentDaoImpl();
			StudentData inserted_data = add.insertData(record);
			
			response.sendRedirect("login.jsp?message=Student successfully added");
		}
	}

}
