package com.socialmedia.datamodel;
//Project Starting Date 8/19/2018 Time 1:00 PM
public class UserAccount {
	
	private int id;
	private String username;
	private String password;
	private String email;
	private UserInformation userinfo;
	
	
	
	public UserInformation getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(UserInformation userinfo) {
		this.userinfo = userinfo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
