package com.socialmedia.doaobjects;

import java.util.List;

import com.socialmedia.datamodel.UserAccount;
import com.socialmedia.datamodel.UserInformation;

public interface UserDAO {
	boolean addUser(UserAccount user);
	boolean checkUserInDB(String username);
	boolean updateUserPassword(UserAccount user);
	UserAccount getUserByUsername(String username);
	UserInformation getUserInformationByUserId(int userid);
	List<UserAccount> getAllUsers();
	boolean userfollower(String username,String follower);
	boolean findFollowingRecord(int userid,int followerid);
	boolean saveOrEditUserInfo(UserInformation info);
}
