package com.socialmedia.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
 * Servlet implementation class ProfileController
 */
@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		String path = "";
		UserDAO userdao = new UserDaoImplement();
		if(action.equals("findfreind")){	
			
			List<UserAccount> users = userdao.getAllUsers();
			request.setAttribute("users", users);
			path = "findfriends";
		}else if(action.equals("userfollow")){
			String user = request.getParameter("username");
			String friend = request.getParameter("friend");
			System.out.println(user+"...And... "+friend);
			
			if(userdao.userfollower(user, friend))
				out.print("Unfollow");
			else
				out.print("Follow");
			
			return;
		}else if(action.equals("sortaddress")){
			System.out.println("Sorting Address");
			String find = request.getParameter("find");
			if(find.equals("province")){
				String country = request.getParameter("country");
				List<String> list = UtilRes.getProvinces(country);
				out.print("<option value=''>Select Your Province/State</option>");
				for(String s:list){
					out.print("<option value='"+s+"'>"+s+"</option>");
				}
			}else if(find.equals("city")){
				String province = request.getParameter("province");
				List<String> list = UtilRes.getCities(province);
				out.print("<option value=''>Select Your City</option>");
				for(String s:list){
					out.print("<option value='"+s+"'>"+s+"</option>");
				}
			}
			
			return;
		}else if(action.equals("Save Information")){
			String fname = request.getParameter("fname");
			String mname = request.getParameter("mname");
			String lname = request.getParameter("lname");
			
			String profession = request.getParameter("profession");
			String gender = request.getParameter("gender");
			String country = request.getParameter("country");
			String province = request.getParameter("province");
			String city = request.getParameter("city");
			
			String day = request.getParameter("day");
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			
			String userid = request.getParameter("userid");
			
			UserInformation info = new UserInformation();
			
			info.setFname(fname);
			info.setMname(mname);
			info.setLname(lname);
			info.setProfession(profession);
			info.setGender(gender);
			info.setCountry(country);
			info.setCity(city);
			info.setProvince(province);
			info.setDay(Integer.parseInt(day));
			info.setMonth(UtilRes.getIntMonth(month));
			info.setYear(Integer.parseInt(year));
			info.setUserid(Integer.parseInt(userid));
			
			userdao.saveOrEditUserInfo(info);
			
			HttpSession session = request.getSession();
			UserAccount temp = (UserAccount)session.getAttribute("username");
			UserAccount user = userdao.getUserByUsername(temp.getUsername());
			session.setAttribute("username",user);
			
			path = "profilepage";
		}
		request.getRequestDispatcher(path+".jsp").forward(request, response);
	}

}
