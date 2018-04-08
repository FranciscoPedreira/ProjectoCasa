<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="pt.francisco.hibernate.model.User" %>
<%@ page import="pt.francisco.hibernate.util.HibernateUtil" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.hibernate.Session" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome User</title>
	</head>

	<% 
		if (request.getMethod().equalsIgnoreCase("POST")) {
	        // The form has been submitted. Put code here.
	        String username = request.getParameter("userName");
   			String password = request.getParameter("passWord");
   			System.out.println(username + " - " + password);
   			application.setAttribute( "username", username);
   			application.setAttribute( "password", password);
   			
   			SessionFactory sf = HibernateUtil.getSessionFactory();
   	        Session sess = sf.openSession();
   	        sess.beginTransaction();
   	 
   	        /*fetching objects from the database in hibernate*/
   	 
   	        Query query = sess.createQuery("from User where username = :username");
   	        query.setParameter("username", username);
   	        ArrayList<User> list = (ArrayList<User>) query.list();
   	        for(User u : list) {
   	        	System.out.println(u.getUsername() + " - " + u.getPassword());
   	        }

		}
	%>
	
	<body>
	<c:if test='${passWord.equals("123")}'>
		<% System.out.println("Rendering message..."); %>
	</c:if>
	
		<h1>${message}</h1>
	
	</body>
	

</html>