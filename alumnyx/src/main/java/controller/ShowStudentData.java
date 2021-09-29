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


public class ShowStudentData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowStudentData() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentDao dao1 = new StudentDaoImpl();
		List<StudentData> list1 = dao1.getAllData();
		request.setAttribute("liststudent", list1);
		RequestDispatcher rd = request.getRequestDispatcher("ManageStudentData.jsp");
		rd.forward(request, response);
	}

}
