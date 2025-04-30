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

@WebServlet("/update")
public class EditContactServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cId=Integer.parseInt(req.getParameter("cid"));
		
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String about=req.getParameter("about");
		
		Contact contact= new Contact();
		contact.setId(cId);
		contact.setName(name);
		contact.setEmail(email);
		contact.setPhone(phone);
		contact.setAbout(about);
		ContactDAO cDao=new ContactDAO(DbConnect.getConn());
		
		HttpSession session = req.getSession();
		boolean isUpdate = cDao.updateContact(contact);
		if(isUpdate){
			session.setAttribute("succMsg", "Contact has been updated");
			resp.sendRedirect("viewContact.jsp");
		}else {
			session.setAttribute("failMsg", "Something went wrong on server!");
			resp.sendRedirect("editContact.jsp?cid="+cId);
		}
	}
		
}
