package cn.examsys.xy.service;

import java.util.List;

import cn.examsys.bean.Role;
import cn.examsys.bean.User;

public interface RoleService {
	/*创建角色*/
	boolean createRole(String type);
	/*删除角色*/
	boolean deleteRole(Integer sid);
	/*角色列表*/
	List<Role> selectRoleList(String type,int page);
	/*角色总数*/
	int selectRoleCount(String type);
	/*编辑角色信息*/
	boolean editRole(Role role);
	/*显示一个角色信息*/
	Role SelectOneRole(Integer sid);
}
