<%@ page import="com.criminal_record_management.entities.Message" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% session.getAttribute("currentUser"); 
   session.removeAttribute("currentUser");
   Message m2 = new Message("Logout Successfully !!" , "success" , "success");
   session.setAttribute("msg",m2);
   response.sendRedirect("login.jsp");
%>
</body>
</html>