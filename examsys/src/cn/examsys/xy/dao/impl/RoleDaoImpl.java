package cn.examsys.xy.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Role;
import cn.examsys.bean.User;
import cn.examsys.xy.dao.RoleDao;
@Repository(value="roleDao")
public class RoleDaoImpl extends DaoAdapter implements RoleDao {
	/*创建角色*/
	public Serializable saveEntity(Role role) {
		// TODO Auto-generated method stub
		try {
			System.out.println("create a Role");
			return super.saveEntity(role);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*查询角色*/
	@Override
	public Role findOneRole(int sid) {
		// TODO Auto-generated method stub
		try {
			return findOneByHql("from Role where sid=?", new Object[]{sid});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*删除角色*/
	@Override
	public void deleteEntity(Role role) {
		// TODO Auto-generated method stub
		try {
			super.deleteEntity(role);
			System.out.println("角色删除成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*查询角色列表*/
	@Override
	public List<Role> findListByHql(int page) {
		// TODO Auto-generated method stub
		String hql="from Role";
		try {
			List<Role> roleList=findByHql(hql,page);
			System.out.println("第"+page+"页第2条角色Id是："+roleList.get(1).getSid());
			return roleList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*角色列表总页面totalPage*/
	@Override
	public int selectRoleCount(){
		// TODO Auto-generated catch block
		String hql="from Role";
		try {
			List<Role> roleList=findByHql(hql);
			int count=(int)Math.ceil((roleList.size()*1.0)/COUNT_PER_PAGE);
			return count;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	/*编辑角色信息*/
	@Override
	public void editRole(Role role) {
		// TODO Auto-generated method stub
		try {
			updateEntity(role);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
