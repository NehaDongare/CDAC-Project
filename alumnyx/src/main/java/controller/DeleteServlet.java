package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.AlumniData;
import model.AlumniDao;
import model.AlumniDaoImpl;


@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		AlumniData a = new AlumniData(email);
		AlumniDao dao = new AlumniDaoImpl();
		dao.deleteData(a);
		List<AlumniData> list = dao.getAllData();
		request.setAttribute("listalumni", list);
		RequestDispatcher rd = request.getRequestDispatcher("ManageUsers.jsp");
		rd.forward(request, response);	
	}

}
