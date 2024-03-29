<%@ page import="com.criminal_record_management.entities.Message" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Floating Login Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('https://www.uti.eu.com/wp-content/uploads/law-enforcement-record-management-00.jpg') center/cover no-repeat;
        }

        .login-container {
            background: rgba(10, 28, 49, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 300px;
            text-align: center;
            color: #fff;
            animation: float 2s ease-in-out infinite alternate;
        }

        @keyframes float {
            from {
                transform: translateY(5px);
            }
            to {
                transform: translateY(-5px);
            }
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #3498db;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
            outline: none;
        }

        .login-container input:focus {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .login-container .password-toggle {
            position: relative;
            display: inline-block;
        }

        .login-container .password-toggle input {
            padding-right: 30px;
        }

        .login-container .password-toggle .toggle-icon {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-container button:hover {
            background-color: #297fb8;
        }

        .login-container a {
            color: #bbb;
            text-decoration: none;
            margin-top: 10px;
            display: inline-block;
        }

        .login-container a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <%
        Message m1 = (Message) session.getAttribute("msg");
        if (m1 != null) {
        %>
        <div class="alert alert-<%= m1.getCssClass() %>" role="alert">
            <%= m1.getContent() %>
        </div>
        <% } %>
        <% session.removeAttribute("msg"); %>
        <form action="login" method="post">
            <input type="text" name="txtemail" placeholder="User Email" required>
            <div class="password-toggle">
                <input type="password" name="txtpassword" placeholder="Password" required>
                <span class="toggle-icon">&#x1f441;</span>
            </div>
            <button type="submit">Login</button>
        </form>
        <a href="#">Forgot Password?</a>
    </div>

    <script>
        const passwordInput = document.querySelector('input[type="password"]');
        const toggleIcon = document.querySelector('.toggle-icon');

        toggleIcon.addEventListener('click', () => {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            toggleIcon.textContent = type === 'password' ? '\uD83D\uDD41' : '\uD83D\uDD13';
        });
    </script>
</body>
</html>
