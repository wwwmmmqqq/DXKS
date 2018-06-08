package cn.examsys.xy.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Role;
import cn.examsys.xy.dao.RoleDao;
import cn.examsys.xy.service.RoleService;
@Service(value="roleService")
@Transactional
public class RoleServiceImpl implements RoleService {
	
	@Resource(name="roleDao")
	RoleDao roleDao;

	@Override
	public boolean createRole(String type) {
		// TODO Auto-generated method stub
		Role role=new Role();
		role.setType(type);
		roleDao.saveEntity(role);
		return true;
	}

}
