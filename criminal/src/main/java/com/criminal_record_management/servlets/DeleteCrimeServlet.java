package com.criminal_record_management.servlets;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.criminal_record_management.dao.CrimeDAO;
import com.criminal_record_management.entities.Message;
import com.criminal_record_management.helper.ConnectionProvider;

public class DeleteCrimeServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		PrintWriter out = res.getWriter();
	    res.setContentType("text/html");
	    
	    int delId = Integer.parseInt(req.getParameter("crimeid"));
	    CrimeDAO ed = new CrimeDAO(ConnectionProvider.getConnection());
	    String crimeId = String.valueOf(delId);
	    
	    //out.println(crimeId);
	    ed.deleteCrime(crimeId);
	    
	    HttpSession session = req.getSession();
        Message m = new Message("Delete Successfull ", "success", "danger");
        session.setAttribute("msg", m);
        res.sendRedirect("crimes.jsp");

	    
	}
}