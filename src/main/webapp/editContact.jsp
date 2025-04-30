<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Contacts</title>
<%@include file="component/allCss.jsp"%>
<style>
body {
    background-color: #f8f9fa;
}

.card {
    max-width: 500px;
    margin: auto;
    border-radius: 10px;
}

.btn {
    width: 48%;
}

textarea {
    resize: none;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "You have been logged out. Login to access your account.");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h3 class="text-center mb-4">Edit Contact</h3>
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
        <form action="update" method="post">
        <%
        	int cid=Integer.parseInt(request.getParameter("cid"));
        	ContactDAO cDao=new ContactDAO(DbConnect.getConn());
        	Contact c=cDao.getContactById(cid);
        %>
        <input name="cid" type="hidden" value="<%= c.getId()%>">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input name="name" value="<%=c.getName()%>" type="text" class="form-control" id="name" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input name="email" value="<%=c.getEmail()%>" type="email" class="form-control" id="email" required>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input name="phone" value="<%=c.getPhone()%>" type="tel" class="form-control" id="phone" required>
            </div>

            <div class="mb-3">
                <label for="about" class="form-label">About</label>
                <textarea name="about" class="form-control" id="address" rows="3" ><%=c.getAbout()%></textarea>
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Save Changes</button>
                <a href="index.jsp" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
	
</body>
</html>