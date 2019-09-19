package com.socialmedia.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.socialmedia.daoimplements.UserDaoImplement;
import com.socialmedia.datamodel.UserAccount;
import com.socialmedia.doaobjects.UserDAO;

/**
 * Servlet implementation class CreateAccountController
 */
@WebServlet("/CreateAccountController")
public class CreateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userdao;
       
    
    public CreateAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		userdao = new UserDaoImplement();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email    = request.getParameter("email");
		
	
		
		UserAccount user = new UserAccount();
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		
		if(userdao.addUser(user)){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			request.setAttribute("msg", "User Already Registered");
			request.getRequestDispatcher("create_account.jsp").forward(request, response);;
		}
	}

}
