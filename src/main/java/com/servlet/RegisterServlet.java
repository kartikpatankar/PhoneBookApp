package com.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDAO;
//import org.apache.catalina.User;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
		public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String cpassword = req.getParameter("cpassword");
			
			User u = new User(name,email,password);
			UserDAO dao = new UserDAO(DbConnect.getConn());
			boolean isRegister = dao.userRegister(u);
			
			HttpSession session = req.getSession();
			if(isRegister) {
				session.setAttribute("successMsg", "User Register Successfully...");
				resp.sendRedirect("register.jsp");
				//System.out.println("User Register Successfully...");
			}else {
				session.setAttribute("errorMsg", "[ERROR]! User Registration failed!");
				resp.sendRedirect("register.jsp");
				//System.out.println("[ERROR]! User Registration failed!");
			}
			
		
		}
}
