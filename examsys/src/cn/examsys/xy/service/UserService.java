package cn.examsys.xy.service;

import java.util.List;

import cn.examsys.bean.User;

public interface UserService {
	/*创建用户*/
	boolean createUser(User user);
	/*删除用户*/
	boolean deleteUser(String userId);
	/*根据用户类型获取用户列表*/
	List<User> SelectUserList(String type,int page);
	/*用户列表总页数*/
	int SelectUserListCount(String type);
	/*编辑用户信息*/
	boolean editUser(User user);
	/*显示一个用户信息*/
	User SelectOneUser(String userId);
}
