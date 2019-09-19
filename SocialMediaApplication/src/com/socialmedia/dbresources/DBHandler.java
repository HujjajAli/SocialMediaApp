package com.socialmedia.dbresources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.socialmedia.datamodel.UserInformation;

public class DBHandler {
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Loaded");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static Connection getConnection(){
		
		try {
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/socialmedia","root","");
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		UserInformation info = new UserInformation();
		info.setCity("Hyderabad");
		info.setCountry("Pakistan");
		info.setProvince("Sindh");
		
		info.setFname("Amjad");
		info.setLname("Mirjat");
		info.setMname("Ali");
		
		info.setDay(4);
		info.setMonth(9);
		info.setYear(1999);
		
		System.out.println("Your Name :"+info.getFullname());
		System.out.println("Your Address :"+info.getCreatedAddress());
		System.out.println("Your DOB :"+info.getSdate());
	}

}
