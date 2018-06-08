package cn.examsys.xy.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import cn.examsys.bean.Role;
import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.xy.service.RoleService;
@Namespace("/")
@ParentPackage("struts-default")
@Controller("roleAction")
@Scope("prototype")
public class RoleAction extends CommonAction implements ModelDriven<Role>{

	Role role=new Role();
	
	@Autowired
	RoleService roleService;
	
	@Action(value="/createRole",results={@Result(name="aa",location="/pages/xy/index.jsp")})
	public String createRole(){
		
		boolean currentRole=roleService.createRole(role.getType());
		if(!currentRole) {
			setResult("创建失败");
		}
		return aa;
	}
	
	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public Role getModel() {
		// TODO Auto-generated method stub
		return role;
	}

}
