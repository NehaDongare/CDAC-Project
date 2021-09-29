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
import entities.EventData;
import model.AlumniDao;
import model.AlumniDaoImpl;
import model.EventDao;
import model.EventDaoImpl;

@WebServlet("/deleteevent")
public class DeleteEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		EventData a = new EventData(id);
		EventDao dao = new EventDaoImpl();
		dao.deleteData(a);
		List<EventData> list = dao.getAllData();
		request.setAttribute("listevents", list);
		RequestDispatcher rd = request.getRequestDispatcher("ManageEvents.jsp");
		rd.forward(request, response);	
	}
	}

