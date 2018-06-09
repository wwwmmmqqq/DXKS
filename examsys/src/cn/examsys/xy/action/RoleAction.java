package cn.examsys.xy.action;

import java.util.List;

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

	private Role role=new Role();
	
	int page;    //当前页面
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	@Autowired
	RoleService roleService;
	/*创建角色*/
	@Action(value="/createRole",results={@Result(name="aa",location="/pages/xy/index.jsp")})
	public String createRole(){
		
		boolean currentRole=roleService.createRole(role.getType());
		if(!currentRole) {
			setResult("角色创建失败！");
		}
		setResult("角色创建成功");
		return "aa";
	}
	/*删除角色*/
	@Action(value="/deleteRole",results={@Result(name="aa",location="/roleList.jsp")})
	public String deleteRole(){
		boolean currentRole=roleService.deleteRole(role.getSid());
		if(!currentRole){
			setResult("删除角色失败");
		}
		setResult("删除角色成功");
		return "aa";
	}
	/*获取角色列表*/
	@Action(value="/selectRoleList",results={@Result(name="aa",location="/roleList.jsp")})
	public String selectRoleList(){
		List<Role> roleList=roleService.selectRoleList(role.getType(),page);
		if(roleList==null){
			setResult("无角色");
		}
		int totalPage=roleService.selectRoleCount(role.getType());
		System.out.println("总页面大小为："+totalPage);
		return "aa";
	}
	/*显示角色信息*/
	@Action(value="/showRole",results={@Result(name="aa",location="/rolelist.jsp")})
	public String showRole(){
		Role currentRole=roleService.SelectOneRole(role.getSid());
		return "aa";
	}
	/*编辑角色信息*/
	@Action(value="/editRole",results={@Result(name="aa",location="/rolelist.jsp")})
	public String editRole(){
		boolean currentRole=roleService.editRole(role);
		if(!currentRole){
			setResult("编辑角色失败！");
		}
		System.out.println("编辑角色成功");
		setResult("编辑角色成功");
		return "aa";
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
