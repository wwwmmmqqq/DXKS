package cn.examsys.xy.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Role;
import cn.examsys.bean.User;
import cn.examsys.xy.dao.RoleDao;
import cn.examsys.xy.service.RoleService;
@Service(value="roleService")
@Transactional
public class RoleServiceImpl implements RoleService {
	
	@Resource(name="roleDao")
	RoleDao roleDao;
	/*创建角色*/
	@Override
	public boolean createRole(String type) {
		// TODO Auto-generated method stub
		Role role=new Role();
		role.setType(type);
		roleDao.saveEntity(role);
		return true;
	}
	/*删除角色*/
	@Override
	public boolean deleteRole(int sid) {
		// TODO Auto-generated method stub
		Role role=roleDao.findOneRole(sid);
		roleDao.deleteEntity(role);
		return true;
	}
	/*角色列表*/
	@Override
	public List<Role> selectRoleList(int page) {
		// TODO Auto-generated method stub
		return roleDao.findListByHql(page);
	}
	/*角色总页面*/
	@Override
	public int selectRoleCount() {
		// TODO Auto-generated method stub
		int totalPage=roleDao.selectRoleCount();
		return totalPage;
	}
	/*编辑角色信息*/
	@Override
	public boolean editRole(Role role) {
		// TODO Auto-generated method stub
		roleDao.editRole(role);
		return true;
	}
	/*显示一个角色信息*/
	@Override
	public Role SelectOneRole(int sid) {
		// TODO Auto-generated method stub
		Role role=roleDao.findOneRole(sid);
		System.out.println("serrvice查询该角色的类型"+role.getType());
		return role;
	}

}
