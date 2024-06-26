package com.criminal_record_management.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.criminal_record_management.entities.Users;
import com.criminal_record_management.helper.ConnectionProvider;
import com.criminal_record_management.dao.userDao;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String name = request.getParameter("txtname");
        String email = request.getParameter("txtemail");
        String password = request.getParameter("txtpassword");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("txtdate");

        // Sending this data to the database
        Users user = new Users(name, email, password, gender, dob);
        userDao userDao = new userDao(ConnectionProvider.getConnection());

        Connection connection = null;
        try {
            connection = ConnectionProvider.getConnection();
            connection.setAutoCommit(false); // Disable auto-commit

            userDao.saveUser(user); // Insert user into the database

            connection.commit(); // Commit the transaction

            // Set success message attribute
            request.getSession().setAttribute("successMessage", "Registration Successful!");
            // Redirect to register.jsp to avoid duplicate form submissions on refresh
            response.sendRedirect("register.jsp");
        } catch (SQLException e) {
            // Rollback the transaction in case of any exception
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            out.println("<div style=\"color: red; text-align: center; margin-top: 20px;\">Error: Failed to register. Please try again.</div>");
            e.printStackTrace();
        } finally {
            // Close the database connection
            if (connection != null) {
                try {
                    connection.setAutoCommit(true); // Enable auto-commit
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
