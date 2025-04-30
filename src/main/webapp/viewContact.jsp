<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Contacts</title>
<%@include file="component/allCss.jsp"%>
</head>


<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "You have been logged out. Login to access your account.");
		response.sendRedirect("login.jsp");
	}
	%>
	<%
	String succMsg = (String)session.getAttribute("succMsg");
	String failMsg = (String)session.getAttribute("failMsg");
	if(succMsg!=null){
	%>	
	<div class="alert alert-success" role="alert"><%=succMsg%></div>
	<%
	session.removeAttribute("succMsg");
	}
	if(failMsg!=null){%>
        	<p class="text-danger text-center"><%=failMsg%></p>
        <%
        session.removeAttribute("failMsg");
        }
        %>
	
	

	<div class="container mt-5">
		<h2 class="text-center mb-4">Your Contacts</h2>
		<!-- Search Bar -->
		<div class="mb-3">
			<input type="text" id="searchInput" class="form-control"
				placeholder="Search contacts...">
		</div>
		<!-- Contacts Table -->
		<div class="table-responsive">
			<table class="table table-striped table-hover">
				<thead class="table-primary">
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Email</th>
						<th>About</th>
						<th>Actions</th>
					</tr>
				</thead>
				<%
				if(user!=null){
				ContactDAO cDao = new ContactDAO(DbConnect.getConn());
				List<Contact> contact = cDao.getAllContact(user.getId());
				for (Contact c : contact) {
				%>
				<tbody id="contactTable">
					<tr>
						<td><%=c.getId() %></td>
						<td><%=c.getName() %></td>
						<td><%=c.getPhone() %></td>
						<td><%=c.getEmail() %></td>
						<td><%=c.getAbout() %></td>
						<td>
							<a href="editContact.jsp?cid=<%=c.getId() %>" class="btn btn-sm btn-secondary">Edit</a>
							<a href="delete?cid=<%=c.getId()%>" class="btn btn-sm btn-danger">Delete</a>
						</td>
					</tr>
				</tbody>
				<%
				}
				%>
			</table>
		</div>

		<%
		}
		%>

	</div>


</body>
</html>