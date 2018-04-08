<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="pt.francisco.hibernate.model.User" %>
<%@ page import="pt.francisco.hibernate.model.Employee" %>
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
   	 
   	        Query queryUser = sess.createQuery("from User where username = :username");
   	        queryUser.setParameter("username", username);
   	        ArrayList<User> listUser = (ArrayList<User>) queryUser.list();
   	        for(User u : listUser) {
   	        	System.out.println(u.getUsername() + " - " + u.getPassword());
   	        }
   	        application.setAttribute("listUser", listUser);
   	        
   	     	System.out.println("########## EMPLOYEES ##########");
   	        
	   	    Query queryEmployee = sess.createQuery("from Employee");
	        ArrayList<Employee> listEmployee = (ArrayList<Employee>) queryEmployee.list();
	        for(Employee e : listEmployee) {
	        	System.out.println(e.getId().getFirstName() + " - " + e.getId().getLastName() + " - "
	        	+ e.getCountry() + " - " + e.getAddress() + " - " + e.getRole());
	        }

	        application.setAttribute("listEmployee", listEmployee);
		}
	%>
	
	<body>
	<c:if test="${param.userName.equals(listUser.get(0).getUsername()) && param.passWord.equals(listUser.get(0).getPassword())}">
	
		<% System.out.println("Rendering message..."); %>
		
		<h1>${message}</h1>
		
		<c:forEach items="${listEmployee}" var="e"> 
		  <tr>
		    <td>${e.getId().getFirstName()}</td>
		    <td>${e.getId().getLastName()}</td>
		    <td>${e.getCountry()}</td>
		    <td>${e.getAddress()}</td>
		    <td>${e.getRole()}</td>
		  </tr>
		  <br />
		</c:forEach>
	
	</c:if>
	
		
	
	</body>
	

</html>