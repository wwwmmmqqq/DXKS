package cn.examsys.xy.action;

import java.util.ArrayList;
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
import cn.examsys.common.Conf;
import cn.examsys.common.Permission;
import cn.examsys.common.Permission2;
import cn.examsys.xy.service.RoleService;
@Namespace("/")
@ParentPackage("json-default")
@Controller("roleAction")
@Scope("prototype")
public class RoleAction extends CommonAction{

	Role role=new Role();
	User user = new User();
	int page;    //当前页面
	List<Role> roleList=new ArrayList<>();
	int totalPage;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

	@Autowired
	RoleService roleService;
	
	/*创建角色*/
	@Action(value="/createRole"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String createRole(){
		boolean currentRole=roleService.createRole(role.getType());
		if(!currentRole) {
			setResult("角色创建失败！");
		}
		setResult("角色创建成功");
		return aa;
	}
	
	/*删除角色*/
	@Action(value="/deleteRole"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String deleteRole(){
		System.out.println(role.getSid());
		boolean currentRole=roleService.deleteRole(role.getSid());
		if(!currentRole){
			setResult("删除角色失败");
		}
		setResult("删除角色成功");
		return aa;
	}
	
	/*获取角色列表*/
	@Action(value="/selectRoleList"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String selectRoleList(){
		roleList=roleService.selectRoleList(page);
		System.out.println(roleList.size());
		if(roleList==null){
			setResult("无角色");
		}
		totalPage=roleService.selectRoleCount();
		System.out.println("总页面大小为："+totalPage);
		return aa;
	}
	/*显示角色信息*/
	@Action(value="/showRole"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String showRole(){
		role=roleService.SelectOneRole(role.getSid());
		return aa;
	}
	/*编辑角色信息*/
	@Action(value="/editRole"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String editRole(){
		boolean currentRole=roleService.editRole(role);
		if(!currentRole){
			setResult("编辑角色失败！");
		}
		System.out.println("编辑角色成功");
		setResult("编辑角色成功");
		return aa;
	}
	
	/***********************************权限管理*****************************/
	
	public String hasPremission(){
		Permission2 permission=new Permission2();
		if(user.getType()=="老师") {
			/*boolean per=permission.hasPermission(user.getPermission());
			if(!per) {
				user.setPermission(Conf.permession_StudentManage);
				permission.addPermission(user.getPermission());
			}*/
		}
		return aa;
	}
	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}

}
