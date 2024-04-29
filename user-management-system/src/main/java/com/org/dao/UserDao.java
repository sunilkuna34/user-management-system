package com.org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.org.dto.User;

public class UserDao {
	public void saveUser(User user) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
			PreparedStatement pst=con.prepareStatement("insert into user(name,age,email,password,mobile) values(?,?,?,?,?)");
			String name=user.getName();
			int age=user.getAge();
			long mobile=user.getMobile();
			String email=user.getEmail();
		String password=	user.getPassword();
		
		pst.setString(1, name);
		pst.setInt(2, age);
		pst.setString(3, email);
		pst.setString(4, password);
		pst.setLong(5, mobile);
		
		
			
			pst.executeUpdate();
			con.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


public User fetchUserByEmailAndPassword(String email,String password) {
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
		PreparedStatement pst=con.prepareStatement("select * from user where email=? and password=?");
		pst.setString(1, email);
		pst.setString(2, password);
		
		ResultSet rst=pst.executeQuery();
		if(rst.next()) {
			User user=new User();
			
						
			String name=rst.getString("name");
			int age=rst.getInt("age");
			String em=rst.getString("email");
			String pwd=rst.getString("password");
			long mobile=rst.getLong("mobile");
			int id=rst.getInt("id");
			
			user.setId(id);
			user.setName(name);
			user.setAge(age);
			user.setEmail(em);
			user.setPassword(pwd);
			user.setMobile(mobile);
			return user;
			
			
		}
		con.close();
	
}
 catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return null;
}
public User fetchUserById(int id) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
		PreparedStatement pst=con.prepareStatement("select * from user where id=?");
		pst.setInt(1, id);
		
		
		ResultSet rst=pst.executeQuery();
		if(rst.next()) {
			User user=new User();
			
						
			String name=rst.getString("name");
			int age=rst.getInt("age");
			String em=rst.getString("email");
			String pwd=rst.getString("password");
			long mobile=rst.getLong("mobile");
			int id1=rst.getInt("id");
			
			user.setId(id1);
			user.setName(name);
			user.setAge(age);
			user.setEmail(em);
			user.setPassword(pwd);
			user.setMobile(mobile);
			return user;
			
			
		}
		con.close();
	
}
 catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	return null;
	
	
}
public List<User> fetchAllUsers(){
	List<User> list=new ArrayList<User>();

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
		PreparedStatement pst=con.prepareStatement("select * from user ");
				
		ResultSet rst=pst.executeQuery();
		while(rst.next()) {
			User user=new User();
			
						
			String name=rst.getString("name");
			int age=rst.getInt("age");
			String em=rst.getString("email");
			String pwd=rst.getString("password");
			long mobile=rst.getLong("mobile");
			int id=rst.getInt("id");
			
			user.setId(id);
			user.setName(name);
			user.setAge(age);
			user.setEmail(em);
			user.setPassword(pwd);
			user.setMobile(mobile);
			
			
			list.add(user);
			
			
			
			
		}
		con.close();
	
}
 catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	return list;
	
	
}
public void updateUser(User user) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
		PreparedStatement pst=con.prepareStatement("update user set name=?,age=?,mobile=?,email=? where id=?");
	
	pst.setString(1, user.getName());
	pst.setInt(2, user.getAge());
	pst.setLong(3, user.getMobile());
	pst.setString(4, user.getEmail());
	pst.setInt(5, user.getId());
	
	
		
		pst.executeUpdate();
			
		
		con.close();
	
	
}
 catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

}

public void deleteUserById(int id) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
		PreparedStatement pst=con.prepareStatement("delete from user where id=?");
		pst.setInt(1,id );
		
		
			pst.executeUpdate();	
			
			
		
		con.close();
		
	
}
 catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	
	
	

}
public void changePwdById(int id,String pwd) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user_mgmt","root","root");
		PreparedStatement pst=con.prepareStatement("update user set password=? where id=?");
		
		pst.setString(1, pwd);
		pst.setInt(2, id);

		
		pst.executeUpdate();
		
		con.close();
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}





