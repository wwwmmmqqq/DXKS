package cn.examsys.xy.service.impl;

import java.lang.reflect.Field;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.User;
import cn.examsys.xy.dao.UserDao;
import cn.examsys.xy.service.UserService;
@Service(value="userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;
	
	/*创建用户*/
	@Override
	public boolean createUser(User user) {
		// TODO Auto-generated method stub
		userDao.saveEntity(user);
		return true;
	}
	/*删除用户*/
	@Override
	public boolean deleteUser(String userId) {
		// TODO Auto-generated method stub
		User user=userDao.findOneUser(userId);
		
		userDao.deleteEntity(user);
		return true;
	}
	/*查询用户列表*/
	/*public List<User> SelectUserList(String type,int page) {
		// TODO Auto-generated method stub
		List<User> userList=userDao.selectUserList(type,page);*/
		/*Iterator<User> iter = userList.iterator();
		while (iter.hasNext()) {
		   User it = iter.next();
		   if("封禁".equals(it.getStatus())) {
		    	iter.remove();
		    	System.out.println("封禁");
		   }
		}*/
	/*	return userList;
	}*/
	/*查询用户列表总页数*/
	/*@Override
	public int SelectUserListCount(String type) {
		// TODO Auto-generated method stub
		return userDao.selectUserListCount(type);
	}*/
	
	/*查询用户列表*/
	public List<User> SelectUserList(User user,int page,User administration) {
		// TODO Auto-generated method stub
		List<User> userList=userDao.selectUserList(user ,page,administration);
		return userList;
	}
	/*查询用户列表总页数*/
	@Override
	public int SelectUserListCount(User user, User administration) {
		// TODO Auto-generated method stub
		return userDao.selectUserListCount(user , administration);
	}

	
	
	
	/*编辑用户信息*/
	@Override
	public boolean editUser(User user) {
		// TODO Auto-generated method stub
		User currentUser=userDao.findOneUser(user.getUserId());  
		Field[] field = currentUser.getClass().getDeclaredFields(); 
		Field[] f = user.getClass().getDeclaredFields();	
		try {
				for(int i=0;i<field.length;i++) {
					field[i].setAccessible(true);     
					f[i].setAccessible(true);		
					Object vals = f[i].get(user);
					Object val = field[i].get(currentUser);
					String type = f[i].getType().toString();
					if(vals==null || "".equals(vals)) {
						vals=val;
						f[i].set(user, vals);
					}else if(type.endsWith("int")) {
							int va = f[i].getInt(user);
							int v = f[i].getInt(currentUser);
							if(va==0) {
							f[i].set(user, v);
						}
					}
				}
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		userDao.editUser(user);
		return true;
	}
	/*显示一个用户信息*/
	@Override
	public User SelectOneUser(String userId) {
		// TODO Auto-generated method stub
		User user=userDao.findOneUser(userId);
		return user;
	}
	
	/*找到该用户--修改密码*/
	@Override
	public int findUser(String userId, String psw) {
		// TODO Auto-generated method stub
		return userDao.findUser(userId,psw);
	}
	@Override
	public List<User> findAllUser(String collegeName, String type) {
		// TODO Auto-generated method stub
		return userDao.findAllUser(collegeName,type);
	}

}
