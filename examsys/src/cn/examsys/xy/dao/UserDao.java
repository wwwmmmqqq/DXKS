package cn.examsys.xy.dao;

import java.io.Serializable;
import java.util.List;

import cn.examsys.bean.User;

public interface UserDao {
	/*创建用户*/
	Serializable saveEntity(User user);
	/*删除用户*/
	void deleteEntity(User user);
	/*查询一个用户*/
	User findOneUser(String userId);
	/*查询用户列表总页面*/
<<<<<<< HEAD
	int selectUserListCount(User user, User administration);
	/*按类型查询用户列表*/
	List<User> selectUserList(User user,int page,User administration);
=======
	/*int selectUserListCount(String type);*/
	/*按类型查询用户列表*/
	/*List<User> selectUserList(String type,int page);*/
	
	/*查询用户列表总页面*/
	int selectUserListCount(User user, User administration);
	/*按类型查询用户列表*/
	List<User> selectUserList(User user,int page,User administration);

	
>>>>>>> origin/lrx-0626-2(合并lxh5)
	/*编辑用户信息*/
	void editUser(User user);
	/*找回密码*/
	int findUser(String userId, String psw);
	/*显示所有用户*/
	List<User> findAllUser(String collegeName, String type);
	/*根据成绩查询*/
	User findGradeUser(String userId, String collegeName);
}
