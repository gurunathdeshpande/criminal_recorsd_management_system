<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Crime Details</title>
    <!-- Add the link to crimes.css here -->
    <link rel="stylesheet" href="crimes.css">
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
    <section id="add-crime-section">
        <h2>Add Crime Details</h2>
        <div class="form-container">
            <form action="add_crime" method="post">
                <div class="mb-3">
                    <label for="date" class="form-label">Date of Crime:</label>
                    <input type="date" id="date" name="date" class="form-control" value="2023-10-15">
                </div>
                
                <div class="mb-3">
                    <label for="location" class="form-label">Location:</label>
                    <input type="text" id="location" name="location" class="form-control" value="Main Street">
                </div>
                
                <div class="mb-3">
                    <label for="crime-type" class="form-label">Type of Crime:</label>
                    <input type="text" id="crime-type" name="crime-type" class="form-control" value="Theft">
                </div>
                
                <div class="mb-3">
                    <label for="description" class="form-label">Description:</label>
                    <input type="text" id="description" name="description" class="form-control" value="Stolen vehicle">
                </div>
                
                <div class="mb-3">
                    <label for="people-involved" class="form-label">People Involved:</label>
                    <input type="text" id="people-involved" name="people-involved" class="form-control" value="John Doe, Jane Smith">
                </div>
                
                <div class="mb-3">
                    <label for="status" class="form-label">Status:</label>
                    <input type="text" id="status" name="status" class="form-control" value="Under investigation">
                </div>

                <input type="submit" value="Submit" class="btn btn-primary">
            </form>
        </div>
    </section>

    <!-- Add any additional content or scripts here -->
</body>
</html>
