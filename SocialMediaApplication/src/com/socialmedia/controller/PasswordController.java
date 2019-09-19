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
 * Servlet implementation class PasswordController
 */
@WebServlet("/PasswordController")
public class PasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDAO userdao = new UserDaoImplement();
		
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		String conpassword = request.getParameter("confermpassword");
		
		UserAccount username    = (UserAccount)request.getSession().getAttribute("username");
		username.setPassword(newpassword);
		
		System.out.println("Old Pass == "+oldpassword);
		System.out.println("New Pass == "+newpassword);
		System.out.println("Conferm Pass == "+conpassword);
		System.out.println("Username == "+username.getUsername());
		
		if(userdao.updateUserPassword(username)){
			request.setAttribute("msg", "Seccusfully Updated");
		}else{
			request.setAttribute("msg", "Failed To Update Password");
		}
		
		request.getRequestDispatcher("profilepage.jsp").forward(request, response);
	}

}
