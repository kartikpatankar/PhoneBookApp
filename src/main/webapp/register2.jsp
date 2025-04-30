<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <%@include file="component/allCss.jsp" %>
    <%-- <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .card {
            width: 400px;
            border-radius: 15px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            animation: slideUp 1s ease-in-out;
        }
        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .btn-custom {
            background-color: #ff7eb3;
            color: white;
            border-radius: 20px;
            transition: background-color 0.3s;
        }
        .btn-custom:hover {
            background-color: #ff4f88;
        }
        .form-control {
            transition: 0.3s;
        }
        .form-control:focus {
            box-shadow: 0px 0px 8px rgba(255, 126, 179, 0.5);
        }
    </style>
    --%>
    <style>
        body {
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .card {
            width: 380px;
            border-radius: 20px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            animation: slideUp 1s ease-in-out;
            background: white;
            padding: 25px;
        }
        @keyframes slideUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .btn-custom {
            background: linear-gradient(135deg, #ff758c, #ff7eb3);
            color: white;
            border-radius: 25px;
            font-weight: bold;
            transition: transform 0.2s;
        }
        .btn-custom:hover {
            transform: scale(1.05);
            background: linear-gradient(135deg, #ff5f6d, #ff7eb3);
        }
        .form-control {
            border-radius: 10px;
            transition: all 0.3s;
        }
        .form-control:focus {
            box-shadow: 0px 0px 10px rgba(255, 94, 140, 0.5);
        }
        .welcome-text {
            text-align: center;
            font-size: 1.4rem;
            font-weight: bold;
            color: #ff5f6d;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
	
    <div class="card p-4">
        <h2 class="text-center mb-3"><i class="fas fa-user-plus"></i> Register</h2>
        <%
        String successMsg = (String)session.getAttribute("successMsg");
        String errorMsg = (String)session.getAttribute("errorMsg");
        if(successMsg!=null){%>
        	<p class="text-success text-center"><%=successMsg%></p>
        <%
        session.removeAttribute("successMsg");
        }
        if(errorMsg!=null){%>
        	<p class="text-danger text-center"><%=errorMsg%></p>
        <%
        session.removeAttribute("errorMsg");
        }
        %>
        <form action="register" method="post">
            <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input name="name" type="text" class="form-control" id="fullName" placeholder="Enter your full name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input name="email" type="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input name="cpassword" type="password" class="form-control" id="confirmPassword" placeholder="Confirm your password" required>
           <%String pErrorMsg = (String)request.getParameter("pErrorMsg");
        if(pErrorMsg!=null){%>
        	<p class="text-danger text-center"><%=pErrorMsg%></p>
        <%}%>
            </div>
            <button type="submit" class="btn btn-custom w-100"><i class="fas fa-check"></i> Register</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="component/footer.jsp" %>
</body>
</html>