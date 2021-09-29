package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.StudentData;
import model.StudentDao;
import model.StudentDaoImpl;


public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String uName=request.getParameter("uName");
		String email=request.getParameter("email");
		long phoneno=Long.parseLong(request.getParameter("phoneno"));
		int graduationYear= Integer.parseInt(request.getParameter("graduationYear"));
		String category=request.getParameter("category");
		long prn_no = Long.parseLong(request.getParameter("prn_no"));
		String password = request.getParameter("password");
		StudentData s = new StudentData(name,uName, email, phoneno, graduationYear, category, prn_no, password);
		StudentDao dao1 = new StudentDaoImpl();
		dao1.updateStudentData(s);
		List<StudentData> list1 = dao1.getAllData();
		request.setAttribute("liststudent", list1);
		RequestDispatcher rd = request.getRequestDispatcher("ShowStudentData");
		rd.forward(request, response);	
	}

}
