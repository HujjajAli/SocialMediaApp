package com.socialmedia.daoimplements;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.socialmedia.datamodel.UserAccount;
import com.socialmedia.datamodel.UserInformation;
import com.socialmedia.dbresources.DBHandler;
import com.socialmedia.doaobjects.UserDAO;
import com.socialmedia.staticresources.UtilRes;

public class UserDaoImplement implements UserDAO{

	private Connection con;
	//private Statement stm;
	public UserDaoImplement(){
		con = DBHandler.getConnection(); 
	}
	
	@Override
	public boolean addUser(UserAccount user) {
		boolean exe = false;
		
		if(!checkUserInDB(user.getUsername()))
		{
			String columns ="INSERT INTO users(username,password,email)";
			String values ="VALUES('"+user.getUsername()+"','"+user.getPassword()+"','"+user.getEmail()+"') "; 
			String query = columns+values;
			System.out.println(query);
			
			try(Statement stm = con.createStatement()){
				int row = stm.executeUpdate(query);
				if(row>0){
					exe = true;
				}
			}catch(SQLException e){
				e.printStackTrace();
				
			}
		}
		return exe;
	}

	
	public boolean checkUserInDB(String username) {
		boolean exe = false;
		String query = "SELECT * FROM users where username='"+username+"'";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				exe = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return exe;
	}

	@Override
	public UserAccount getUserByUsername(String username) {
		UserAccount user = null;
		String query = "SELECT * FROM users where username='"+username+"'";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				user = new UserAccount();
				user.setId(rs.getInt("id"));
				user.setUserinfo(getUserInformationByUserId(user.getId()));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean updateUserPassword(UserAccount user) {
		boolean exe = false;
		String query = "update users set password = '"+user.getPassword()+"' where username = '"+user.getUsername()+"' ";
		System.out.println(query);
		try(Statement stm = con.createStatement()){
			int row = stm.executeUpdate(query);
			if(row>0){
				exe = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		
		return exe;
	}

	@Override
	public List<UserAccount> getAllUsers() {
		
		List<UserAccount> list = new ArrayList<UserAccount>();
		String query = "SELECT * FROM users";
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				UserAccount user = new UserAccount();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				list.add(user);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean userfollower(String username, String follower) {
		UserAccount user = null;
		boolean exe = false;
		int userid,followerid;
		user = getUserByUsername(username);
		userid = user.getId();
		user = getUserByUsername(follower);
		followerid = user.getId();
		
		
		if(findFollowingRecord(userid,followerid)){
		}else{
			
			String query = "INSERT INTO followers(user_id,follower_id)values("+userid+","+followerid+")";
			
			try(Statement stm = con.createStatement()){
				int row = stm.executeUpdate(query);
				if(row>0){
					exe = true;
				}
			}catch(SQLException e){
				e.printStackTrace();
				
			}
			
			
		}
		
		return exe;
	}

	@Override
	public boolean findFollowingRecord(int userid,int followerid) {
		boolean exe = false;
		String query = "SELECT * FROM followers where user_id = "+userid+" and follower_id ="+followerid;
		System.out.println("Query is = "+query);
		try(Statement stm = con.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				exe = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return exe;
	}
	
	public static boolean isfollowed(int uid,int fid){
		Connection connection =  DBHandler.getConnection();
		
		boolean exe = false;
		String query = "SELECT * FROM followers where user_id = "+uid+" and follower_id ="+fid;
		System.out.println("Query is = "+query);
		try(Statement stm = connection.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				exe = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return exe;
	}

	@Override
	public boolean saveOrEditUserInfo(UserInformation info) {
		Connection connection =  DBHandler.getConnection();
		String checkQuery = "select * from userinformation where userid="+info.getUserid();
		try(Statement stm = connection.createStatement()){
			String query = "";
			ResultSet rs = stm.executeQuery(checkQuery);
			if(rs.next()){
				query = "UPDATE userinformation SET firstname='"+info.getFname()+"', middlename='"+info.getMname()+"', lastname='"+
				info.getLname()+"',profession='"+info.getProfession()+"',address='"+info.getCreatedAddress()+"',day="+info.getDay()+
				",month="+info.getMonth()+",year="+info.getYear()+",gender='"+info.getGender()+"' where userid="+info.getUserid();
				System.out.println("Update Query : ");
				System.out.println(query);
				int row = stm.executeUpdate(query);
				if(row>0){
					System.out.println("User Updated");
				}else{
					System.out.println("Failed To  Updated");
				}
			}else{
				String columns="INSERT INTO userinformation(firstname,middlename,lastname,profession,address,day,month,year,gender,userid)VALUES";
				String values ="('"+info.getFname()+"','"+info.getMname()+"','"+info.getLname()+"','"+info.getProfession()+"','"+info.getCreatedAddress()+
							   "',"+info.getDay()+","+info.getMonth()+","+info.getYear()+",'"+info.getGender()+"',"+info.getUserid()+")"; 
				query = columns+values;
				System.out.println("INSERT Query : ");
				System.out.println(query);
				int row = stm.executeUpdate(query);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public UserInformation getUserInformationByUserId(int userid) {
		Connection connection =  DBHandler.getConnection();
		UserInformation info = null;
		String checkQuery = "select * from userinformation where userid="+userid;
		try(Statement stm = connection.createStatement()){
			ResultSet rs = stm.executeQuery(checkQuery);
			if(rs.next()){
				info = new UserInformation();

				info.setId(rs.getInt("id"));
				info.setFname(rs.getString("firstname"));
				info.setMname(rs.getString("middlename"));
				info.setLname(rs.getString("lastname"));
				info.setProfession(rs.getString("profession"));
				info.setGender(rs.getString("gender"));
				info.setAddress(rs.getString("address"));
				info.setDay(rs.getInt("day"));
				info.setMonth(rs.getInt("month"));
				info.setYear(rs.getInt("year"));
				info.setUserid(rs.getInt("userid"));
				info.setProfileimage(rs.getString("profileimage"));
			}
		}
		catch(Exception e){}
		return info;
	}

	
	public static boolean haveprofileimage(int id) {
		Connection connection =  DBHandler.getConnection();
		boolean exe = false;
		String query = "select * from userinformation where userid ="+id;
		System.out.println("Query is = "+query);
		try(Statement stm = connection.createStatement()){
			ResultSet rs = stm.executeQuery(query);
			if(rs.next()){
				exe = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return exe;
	}
	
	
	/*public static void main(String[] args){
		UserAccount user = new UserAccount();
		user.setUsername("chanda");
		user.setEmail("chanda@gmail.com");
		user.setPassword("chanda333");
		UserDAO d = new UserDaoImplement();
		if(d.addUser(user)){
			System.out.println("User Saved");
		}else{
			System.out.println("Not Saved In Database");
		}
	}*/

}
