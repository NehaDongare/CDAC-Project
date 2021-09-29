package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.EventData;
import model.EventDao;
import model.EventDaoImpl;

public class UpdateEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String event_title = request.getParameter("event_title");
		String event_details = request.getParameter("event_details");
		
			LocalDate date = LocalDate.parse(request.getParameter("event_date"));
			EventDao eventDao = new EventDaoImpl();
			EventData record = new EventData(id,event_title,event_details,date);
			eventDao.updateData(record);
			List<EventData> list = eventDao.getAllData();
			
			request.setAttribute("listevents", list);
			RequestDispatcher rd = request.getRequestDispatcher("ManageEvents.jsp");
			rd.forward(request, response);	
		
	}

}
