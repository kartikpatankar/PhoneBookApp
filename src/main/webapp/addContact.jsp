<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Contact</title>
<%@include file="component/allCss.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
	<%
	if(user==null){
		session.setAttribute("invalidMsg", "You have been logged out. Login to access your account.");
		response.sendRedirect("login.jsp");
	}
	%>

    <div class="container mt-5">
        <div class="card shadow p-4">
            <h2 class="text-center mb-4">Add New Contact</h2>
            <%
        String savedMsg = (String)session.getAttribute("succMsg");
        String unSavedMsg = (String)session.getAttribute("failMsg");
        if(savedMsg!=null){%>
        	<p class="text-success text-center"><%=savedMsg%></p>
        <%
        session.removeAttribute("succMsg");
        }
        if(unSavedMsg!=null){%>
        	<p class="text-danger text-center"><%=unSavedMsg%></p>
        <%
        session.removeAttribute("failMsg");
        }
        %>
            <form action="addContact" method="post">
            <%
            if(user!=null){
            %>
            <input name="userid" type="hidden" value="<%= user.getId()%>">	
            <%
            }
            %>
                <div class="mb-3">
                    <label for="name" class="form-label">Full Name</label>
                    <input name="name" type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input name="phone" type="tel" class="form-control" id="phone" name="phone" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input name="email" type="email" class="form-control" id="email" name="email">
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <textarea name="about" class="form-control" id="address" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary w-100">Save Contact</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>