package com.criminal_record_management.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.criminal_record_management.dao.FirDAO;
import com.criminal_record_management.helper.ConnectionProvider;
import com.criminal_record_management.entities.FIR;
import com.criminal_record_management.entities.Message;

public class FIRServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests here if needed
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST requests here
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        // Retrieve FIR details from the form
        String date = request.getParameter("date");
        String complainantName = request.getParameter("complainant-name");
        String policeName = request.getParameter("police-name");
        String incidentDate = request.getParameter("incident-date");
        String incidentTime = request.getParameter("incident-time");
        String location = request.getParameter("location");
        String description = request.getParameter("incident-description");
        String accusedDetails = request.getParameter("accused-details");

        // Create a FIR object with the retrieved details
        FIR fir = new FIR(date, complainantName, policeName, incidentDate, incidentTime, location, description, accusedDetails);

        // Instantiate a FIRDao object
        FirDAO firDao = new FirDAO(ConnectionProvider.getConnection());

        // Insert the FIR details into the database
        firDao.addFIR(fir);

        // Set message in session
        HttpSession session = request.getSession();
        Message m = new Message("FIR Data Saved Successfully!", "success", "success");
        session.setAttribute("msg", m);

        // Redirect to the appropriate page (modify this as needed)
        response.sendRedirect("fir.jsp");
    }
}
