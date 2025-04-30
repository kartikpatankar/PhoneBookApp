<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <%@include file="component/allCss.jsp" %>
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

    <div class="card">
        <div class="welcome-text">Welcome Back!</div>
        <h3 class="text-center mb-3"><i class="fas fa-user-circle"></i> Login</h3>
        <%
        String invalidMsg= (String)session.getAttribute("invalidMsg");
        if(invalidMsg!=null){
        %>
        <p class="text-danger text-center"><%=invalidMsg%></p>	
        <%
        session.removeAttribute("invalidMsg");
        }
        %>
        
        <%
        String logMsg= (String)session.getAttribute("logMsg");
        if(logMsg!=null){
        %>
        <p class="text-danger text-center"><%=logMsg%></p>	
        <%
        session.removeAttribute("logMsg");
        }
        %>
        
        <form action="login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input name="email" type="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-custom w-100">Login</button>
        </form>
        <p class="text-center mt-3"><a href="#" class="text-decoration-none text-danger">Forgot Password?</a></p>
        <p class="text-center"><a href="#" class="text-decoration-none text-danger">Create an Account</a></p>
    
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<div class="container"><%@include file="component/footer.jsp" %></div>
</body>
</html>