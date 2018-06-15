package cn.examsys.xy.service.impl;

import java.lang.reflect.Field;
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
		try {
			Role currentRole=roleDao.findOneRole(role.getSid());
			Field[] field = currentRole.getClass().getDeclaredFields();  
			Field[] f = role.getClass().getDeclaredFields();  
			System.out.println("before:"+role.toString());
			for(int i=0;i<field.length;i++) {
				field[i].setAccessible(true);
				f[i].setAccessible(true);
				Object vals = f[i].get(role);
				Object val = field[i].get(currentRole);
				if(vals==null) {
					vals=val.toString();
					f[i].set(role, vals);
				}
			}
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
