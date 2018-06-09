package cn.examsys.xy.dao;

import java.io.Serializable;
import java.util.List;

import cn.examsys.bean.Role;
import cn.examsys.bean.User;

public interface RoleDao {
	/*创建角色*/
	Serializable saveEntity(Role role);
	/*查询一个角色*/
	Role findOneRole(Integer sid);
	/*删除角色*/
	void deleteEntity(Role role);
	/*查询角色列表*/
	List<Role> findListByHql(String type, int page);
	/*查询角色总数*/
	int selectRoleCount(String type);
	/*编辑角色信息*/
	void editRole(Role role);
}
