package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContactServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId=Integer.parseInt(req.getParameter("userid"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String about=req.getParameter("about");
		Contact contact= new Contact(name,email,phone,about,userId);
		ContactDAO cDao=new ContactDAO(DbConnect.getConn());
		
		HttpSession session = req.getSession();
		boolean saved = cDao.saveContact(contact);
		if(saved) {
			session.setAttribute("succMsg", "Contact has been saved");
			resp.sendRedirect("addContact.jsp");
		}else {
			session.setAttribute("failMsg", "Something went wrong on server!");
			resp.sendRedirect("addContact.jsp");
		}
	}

}
