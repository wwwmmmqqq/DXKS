package cn.examsys.xy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.xy.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONString;
@Namespace("/")
@ParentPackage("struts-default")
@Controller("userAction")
@Scope("prototype")
public class UserAction extends CommonAction implements ModelDriven<User> {
	
	private User user=new User();
	private int page;  //页面当前页
	String end;
	
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	@Autowired
	UserService userService;
	/*创建用户*/
	@Action(value="/createUser")
	public String createUser(){
		
		boolean currentUser=userService.createUser(user);
		JSONObject json=new JSONObject();
		if(!currentUser){
			System.out.println("用户创建失败");
			json.put("result", "用户创建失败");
			setEnd(json.toString());
		}
		System.out.println("用户创建成功");
		json.put("result", "用户创建成功");
		setEnd(json.toString());
		System.out.println("action:result="+end);
		return null;
	}
	/*显示用户信息*/
	@Action(value="/showUser",results={@Result(name="aa",location="/userlist.jsp")})
	public String showUser(){
		User currentUser=userService.SelectOneUser(user.getUserId());
		return "aa";
	}
	/*编辑用户信息*/
	@Action(value="/editUser",results={@Result(name="aa",location="/userlist.jsp")})
	public String editUser(){
		boolean currentUser=userService.editUser(user);
		if(!currentUser){
			setResult("编辑用户失败！");
		}
		System.out.println("编辑用户成功");
		setResult("编辑用户成功");
		return "aa";
	}
	/*删除用户*/
	@Action(value="/deleteUser",results={@Result(name="aa",location="/userlist.jsp")})
	public String deleteUser(){
		boolean currentUser=userService.deleteUser(user.getUserId());
		if(!currentUser){
			setResult("删除失败！");
		}
		setResult("删除成功！");
		return "aa";
	}
	/*查询用户列表*/
	@Action(value="/selectUserList",results={@Result(name="aa",location="userList.jsp")})
	public String SelectUserList(){
		List<User> userList=userService.SelectUserList(user.getType(),page);
		if(userList==null){
			setResult("无用户");
		}
		int totalPage=userService.SelectUserListCount(user.getType());
		System.out.println("Action页面获取总页面大小："+totalPage);
		return "aa";
	}
	
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}

}
