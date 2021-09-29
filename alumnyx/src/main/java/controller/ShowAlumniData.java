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


public class ShowAlumniData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowAlumniData() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AlumniDao dao = new AlumniDaoImpl();
		List<AlumniData> list = dao.getAllData();
		request.setAttribute("listalumni", list);
		RequestDispatcher rd = request.getRequestDispatcher("ManageUsers.jsp");
		rd.forward(request, response);
	}

}
