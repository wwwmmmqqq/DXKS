package cn.examsys.xy.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Role;
import cn.examsys.xy.dao.RoleDao;
@Repository(value="roleDao")
public class RoleDaoImpl extends DaoAdapter implements RoleDao {

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

	

}
