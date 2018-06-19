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
	int selectUserListCount(String type);
	/*按类型查询用户列表*/
	List<User> selectUserList(String type,int page);
	/*编辑用户信息*/
	void editUser(User user);
}
