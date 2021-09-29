package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.StudentData;
import model.StudentDao;
import model.StudentDaoImpl;

@WebServlet("/deletestudent")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteStudentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		StudentData a = new StudentData(email);
		StudentDao dao = new StudentDaoImpl();
		dao.deleteData(a);
		List<StudentData> list = dao.getAllData();
		request.setAttribute("liststudent", list);
		RequestDispatcher rd = request.getRequestDispatcher("ManageStudentData.jsp");
		rd.forward(request, response);	
	}

}
