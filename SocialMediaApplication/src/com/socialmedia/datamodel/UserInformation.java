package com.socialmedia.datamodel;

import com.socialmedia.staticresources.UtilRes;

public class UserInformation {
	
	private int id;
	private String fname;
	private String mname;
	private String lname;
	private String profession;
	private String city;
	private String province;
	private String country;
	private String gender;
	private String profileimage;
	private int userid;
	private int day;
	private int month;
	private int year;
	
	private String fullname;
	private String address;
	private String sdate;
	
	
	public String getProfileimage() {
		return profileimage;
	}
	public void setProfileimage(String profileimage) {
		this.profileimage = profileimage;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public String getAddress(){
		return address;
	}
	
	public String getFullname(){
		return getFname()+" "+getMname()+" "+getLname();
	}

	public String getCreatedAddress(){
		return getCity()+", "+getProvince()+", "+getCountry();
	}
	
	public String getSdate(){
		
		return UtilRes.getStringMonth(getMonth())+" "+getDay()+", "+getYear();
	}
}
