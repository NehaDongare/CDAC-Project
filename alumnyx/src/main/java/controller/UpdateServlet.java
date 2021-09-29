package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.AlumniData;
import model.AlumniDao;
import model.AlumniDaoImpl;



public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String uName=request.getParameter("uName");
		String email=request.getParameter("email");
		long phoneno=Long.parseLong(request.getParameter("phoneno"));
		int graduationYear= Integer.parseInt(request.getParameter("graduationYear"));
		String category=request.getParameter("category");
		long prn_no = Long.parseLong(request.getParameter("prn_no"));
		String password = request.getParameter("password");
		AlumniData a=new AlumniData(name,uName, email, phoneno, graduationYear, category, prn_no, password);
		// StudentData s = new StudentData(name,uName, email, phoneno, graduationYear, category, prn_no);
		AlumniDao dao=new AlumniDaoImpl();
		// StudentDao dao1 = new StudentDaoImpl();
		dao.updateData(a);
		// dao1.updateStudentData(s);
		List<AlumniData> list = dao.getAllData();
		// List<StudentData> list1 = dao1.getAllData();
		request.setAttribute("listalumni", list);
		// request.setAttribute("liststudent", list1);
		RequestDispatcher rd = request.getRequestDispatcher("ShowAlumniData");
		rd.forward(request, response);	
	}

}
