package org.saeen.java.training.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/topicCRUD")
public class TopicCRUDServlet extends HttpServlet{
	
	@Inject
	private Logger logger;

	/**
	 * 
	 */
	private static final long serialVersionUID = -1112089948529142653L;
	
//	@Inject
//	private DB dbConnection;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("Inside doGet method");
		PrintWriter out = resp.getWriter();
		out.println("<h1>HAllo</h1>");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		logger.info("Inside doPost method");
		switch(req.getParameter("action")){
			case "submit_topic":
				logger.info(req.getParameter("topicDocument"));
//				BasicDBObject obj;
//				new Basicd
//				
//				dbConnection.getCollection(req.getParameter("category")).save(null);
				break;
		}
	}
}