package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;
import com.mysql.cj.protocol.Resultset;

import oracle.net.aso.p;

public class ContactDAO {
	private Connection conn;

	public ContactDAO(Connection conn) {
		super();
		this.conn=conn;
	}
	public boolean saveContact(Contact c){
		boolean saved=false;
		try {
			String sql = "insert into contacts(name,email,phone,about,userid) values(?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhone());
			ps.setString(4, c.getAbout());
			ps.setInt(5, c.getUserId());
			
			int count=ps.executeUpdate();
			if(count==1) {
				saved=true;		
				}		
			} catch (Exception ex) {
			ex.printStackTrace();
		}
		return saved;
	}
	public List<Contact> getAllContact(int userId){
		List<Contact> list = new ArrayList<>();
		Contact contact = null;
		try {
			String sql ="select * from contacts where userId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				contact=new Contact();
				contact.setId(rs.getInt(1));
				contact.setName(rs.getString(2));
				contact.setEmail(rs.getString(3));
				contact.setPhone(rs.getString(4));
				contact.setAbout(rs.getString(5));
				list.add(contact);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("Exception when adding contacts"+ex.getMessage());
		}
		return list;
	}
	public Contact getContactById(int cid) {
		Contact contact=new Contact();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from contacts where id=?");
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				contact.setId(rs.getInt(1));
				contact.setName(rs.getString(2));
				contact.setEmail(rs.getString(3));
				contact.setPhone(rs.getString(4));
				contact.setAbout(rs.getString(5));				
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return contact;
	}
	public boolean updateContact(Contact c){
		boolean isUpdate=false;
		try {
			String sql = "UPDATE contacts SET name=?,email=?,phone=?,about=? WHERE id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhone());
			ps.setString(4, c.getAbout());
			ps.setInt(5, c.getId());
			
			int count=ps.executeUpdate();
			if(count==1) {
				isUpdate=true;		
				}		
			} catch (Exception ex) {
			ex.printStackTrace();
		}
		return isUpdate;
	}
	public boolean deleteContactByID(int id){
		boolean deleted=false;
		try {
			String sql ="delete from contacts where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int count=ps.executeUpdate();
			if(count==1) {
				deleted=true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return deleted;
		}
}
