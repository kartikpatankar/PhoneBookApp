<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
	<div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
        <div class="sm:mx-auto sm:w-full sm:max-w-sm">
            <img class="mx-auto h-16 w-auto" src="img/register.png" alt="puzzle">

        <h2 class="mt-10 text-center text-2xl/9 font-bold tracking-tight text-gray-900">Register to manage your contacts</h2>
        </div>
      <%
        String successMsg = (String)session.getAttribute("successMsg");
        String errorMsg = (String)session.getAttribute("errorMsg");
        if(successMsg!=null){%>
        	<p class="text-green-500 text-center"><%=successMsg%></p>
        <%
        session.removeAttribute("successMsg");
        }
        if(errorMsg!=null){%>
        	<p class="text-red-500 text-center"><%=errorMsg%></p>
        <%
        session.removeAttribute("errorMsg");
        }
        %>
        <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
          <form class="space-y-6" action="register" method="POST">

            <div>
                <label for="name" class="block text-sm/6 font-medium text-gray-900">Full Name</label>
                <div class="mt-2">
                  <input type="text" name="name" id="name" autocomplete="email" required class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-black sm:text-sm/6">
                </div>
              </div>
            <div>
              <label for="email" class="block text-sm/6 font-medium text-gray-900">Email address</label>
              <div class="mt-2">
                <input type="email" name="email" id="email" autocomplete="email" required class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-black sm:text-sm/6">
              </div>
            </div>
      
            <div>
              <div class="flex items-center justify-between">
                <label for="password" class="block text-sm/6 font-medium text-gray-900">Password</label>
                
              </div>
              <div class="mt-2">
                <input type="password" name="password" id="password" autocomplete="current-password" required class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-black sm:text-sm/6">
              </div>
            </div>
      
            <div>
              <button type="submit" class="flex w-full justify-center rounded-md bg-black px-3 py-1.5 text-sm/6 font-semibold text-white shadow-xs hover:bg-gray-700 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-black">Log in</button>
            </div>
          </form>
      
          <p class="mt-10 text-center text-sm/6 text-gray-500">
            Have an account already? 
            <a href="login.jsp" class="font-semibold text-[#00acee] hover:text-black hover:underline">Login</a>
          </p>
        </div>
      </div>
</body>
</html>