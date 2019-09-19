package com.socialmedia.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socialmedia.daoimplements.UserDaoImplement;
import com.socialmedia.datamodel.UserAccount;
import com.socialmedia.datamodel.UserInformation;
import com.socialmedia.doaobjects.UserDAO;
import com.socialmedia.staticresources.UtilRes;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO  userdao = new UserDaoImplement();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String path = "";
		
		if(userdao.checkUserInDB(username)){
			UserAccount user;
			user  = userdao.getUserByUsername(username);
			if(user != null){
				
				if(user.getPassword().equals(password)){
					request.setAttribute("msg", "Logged In");
					HttpSession session = request.getSession();
					if(user.getUserinfo() == null){
						UserInformation info = new UserInformation();
						
						info.setId(0);
						info.setFname("na");
						info.setMname("na");
						info.setLname("na");
						info.setProfession("na");
						info.setGender("na");
						info.setCountry("na");
						info.setCity("na");
						info.setProvince("na");
						info.setDay(0);
						info.setMonth(0);
						info.setYear(0);
						info.setUserid(user.getId());
						user.setUserinfo(info);
					}
					System.out.println("Session Saved");
					session.setAttribute("username", user);
					request.setAttribute("user", user);
					path = "profilepage";
				}else{
					request.setAttribute("msg", "Login Failed Pasword Not Match");
					path = "login";
				}
			}
			
			
		}else{
			request.setAttribute("msg", "User Not In Database <a href='#'>Register Your Self</a>");
			path = "login";
		}
		System.out.println("Going For "+path);
		request.getRequestDispatcher(path+".jsp").forward(request, response);
	}

}
