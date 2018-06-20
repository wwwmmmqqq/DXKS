package cn.examsys.xy.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.User;
import cn.examsys.xy.dao.UserDao;
@Repository("userDao")
public class UserDaoImpl extends DaoAdapter implements UserDao{
	
	/*创建用户*/
	@Override
	public Serializable saveEntity(User user){
		// TODO Auto-generated method stub
		try {
			return super.saveEntity(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*删除用户*/
	@Override
	public void deleteEntity(User user) {
		// TODO Auto-generated method stub
		try {
			super.deleteEntity(user);
			System.out.println("该用户删除成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*查询一个用户信息*/
	@Override
	public User findOneUser(String userId){
		// TODO Auto-generated method stub
		String hql="from User where userId=?";
		Object[] vals=new Object[]{userId};
		try {
			User user=findOneByHql(hql, vals);
			return user;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*用户总页面*/
	@Override
	public int selectUserListCount(String type,String collegeName) {
		// TODO Auto-generated method stub
		String hql;
		Object[] vals;
		if(collegeName==null || collegeName.equals("")) {
			System.out.println("123");
			hql="from User where (status !='封禁' or status is null) and type=? ";
			vals=new Object[]{type};
		}else {
			System.out.println("1358888888");
			hql="from User where (status !='封禁' or status is null) and type=? and collegeName=?";
			vals=new Object[]{type,collegeName};
		}
		try {
			List<User> userList = findByHql(hql,vals);
			int size =userList.size();
			int totalPage=(int) Math.ceil((size*1.0)/COUNT_PER_PAGE);		
			System.out.println("总用户数："+size);
			System.out.println("总页面："+totalPage);
			return totalPage;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	/*查询用户列表*/
	@Override
	public List<User> selectUserList(String type, int page,User administration) {
		// TODO Auto-generated method stub
		String hql;
		Object[] vals;
		String collegeName = administration.getCollegeName();
		if(collegeName==null || "".equals(collegeName)) {
			hql="from User where (status !='封禁' or status is null) and type=?";
			vals=new Object[]{type};
		}else {
			hql="from User where (status !='封禁' or status is null) and type=? and collegeName=?";
			vals=new Object[]{type,collegeName};
		}
		try {
			List<User> userList = findByHql(hql, vals, page);
			return userList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*编辑用户信息*/
	@Override
	public void editUser(User user) {
		// TODO Auto-generated method stub
		try {
			updateEntity(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*修改密码*/
	@Override
	public int findUser(String userId, String psw) {
		// TODO Auto-generated method stub
		String hql = "from User where userId=? and psw=?";
		Object[] vals=new Object[]{userId,psw};
		try {
			User user=findOneByHql(hql, vals);
			if(user!=null) {
				return 1;
			}
			return 0;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
}
