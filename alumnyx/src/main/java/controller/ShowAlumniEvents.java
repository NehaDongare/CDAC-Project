package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.EventData;
import model.EventDao;
import model.EventDaoImpl;


public class ShowAlumniEvents extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EventDao dao = new EventDaoImpl();
		List<EventData> list1 = dao.getAllData();
		
		request.setAttribute("listevents", list1);
		RequestDispatcher rd = request.getRequestDispatcher("ManageEvents.jsp");
		rd.forward(request, response);
	}
}
