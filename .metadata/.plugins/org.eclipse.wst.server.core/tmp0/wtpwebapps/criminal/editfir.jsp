<%@ page import="java.sql.Connection" %>
<%@ page import="com.criminal_record_management.dao.FirDAO" %>
<%@ page import="com.criminal_record_management.helper.ConnectionProvider" %>
<%@ page import="com.criminal_record_management.entities.FIR" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit FIR Details</title>
    <!-- Add the link to fir.css here -->
    <link rel="stylesheet" href="fir.css">
    <!-- Add Bootstrap CDN link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        h2 {
            text-align: center; /* Center the title */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Change font family */
        }

        .form-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Adjust form input styles */
        input[type="date"],
        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<% int id = Integer.parseInt(request.getParameter("firid"));%>
<% FirDAO firDao = new FirDAO(ConnectionProvider.getConnection());
   FIR fir = firDao.getFIRById(id);%>         
    <section id="edit-fir-section">
        <h2>Edit FIR Details</h2>
        <div class="form-container">
            <form action="update_fir" method="post" >
            <input class="form-control" type="hidden" value="<%=fir.getId() %>" name="txtFirId">
                <div class="mb-3">
                    <label for="date" class="form-label">Date of FIR:</label>
                    <input type="date" id="date" name="date" class="form-control" value="<%=fir.getDate() %>">
                </div>
                
                <div class="mb-3">
                    <label for="complainant-name" class="form-label">Complainant Name:</label>
                    <input type="text" id="complainant-name" name="complainant-name" class="form-control" value="<%=fir.getComplainantName() %>">
                </div>
                
                <div class="mb-3">
                    <label for="police-name" class="form-label">FIR's Police Name:</label>
                    <input type="text" id="police-name" name="police-name" class="form-control" value="<%=fir.getPoliceName() %>">
                </div>
                
                <div class="mb-3">
                    <label for="incident-date" class="form-label">Incident Date:</label>
                    <input type="date" id="incident-date" name="incident-date" class="form-control" value="<%=fir.getIncidentDate() %>">
                </div>
                
                <div class="mb-3">
                    <label for="incident-time" class="form-label">Incident Time:</label>
                    <input type="text" id="incident-time" name="incident-time" class="form-control" value="<%=fir.getIncidentTime() %>">
                </div>
                
                <div class="mb-3">
                    <label for="location" class="form-label">Location:</label>
                    <input type="text" id="location" name="location" class="form-control" value="<%=fir.getLocation() %>">
                </div>
                
                <div class="mb-3">
                    <label for="incident-description" class="form-label">Incident Description:</label>
                    <input type="text" id="incident-description" name="incident-description" class="form-control" value="<%=fir.getDescription() %>">
                </div>
                
                <div class="mb-3">
                    <label for="accused-details" class="form-label">Accused Details:</label>
                    <input type="text" id="accused-details" name="accused-details" class="form-control" value="<%=fir.getAccusedDetails() %>">
                </div>

                <input type="submit" value="Submit" class="btn btn-primary">
            </form>
        </div>
    </section>

    <!-- Add any additional content or scripts here -->
</body>
</html>
