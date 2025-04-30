package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//import org.apache.catalina.User;
import com.entity.User;
import com.mysql.cj.protocol.Resultset;
public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean userRegister(User u) {
		boolean isRegister = false;
		try {
			String sql = "insert into user(name,email,password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int count = ps.executeUpdate();
			if(count==1) {
				isRegister = true;
				}
			} catch (Exception e) {
			e.printStackTrace();
			}
	
		return isRegister;
	}
	public User userLogin(String email,String pwd) {
		User user = null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pwd);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
			user = new User();
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setPassword(rs.getString(4));
			}		
		} catch (Exception ex) {
			ex.printStackTrace();
			}
		
		return user;
	}
	
}
