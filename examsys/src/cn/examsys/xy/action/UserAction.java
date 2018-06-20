package cn.examsys.xy.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.adapters.IDaoAdapter;
import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.xy.service.UserService;

@Namespace("/")
@ParentPackage("json-default")
@Controller("userAction")
@Scope("prototype")
public class UserAction extends CommonAction{

	private User user=new User();
	List<User> userList=new ArrayList<>();
	private int page;   //当前页面
	private int totalPage;   //总页数
	private String rePsw;
	
	@JSON(serialize=false)
	public String getRePsw() {
		return rePsw;
	}

	public void setRePsw(String rePsw) {
		this.rePsw = rePsw;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	@Autowired
	UserService userService;
	/*创建用户*/
	@Action(value="/createUser"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String createUser(){
		if(user.getUserId()==null){
			setResult("请填写用户信息");
		}
		else{
				User loginUser=userService.SelectOneUser(user.getUserId());		//查询用户是否存在
				if(loginUser!=null){
					setResult("该用户名已存在");
				}else{
					if(getSessionUserId().contains("admin")){
						user.setType("教务");
					}
					user.setPsw("000000");
					boolean currentUser=userService.createUser(user);
					if(!currentUser){
						System.out.println("用户创建失败");
						setResult("用户创建失败");
						return aa;
					}
					System.out.println("用户创建成功");
					setResult("用户创建成功");
				}
		}
		return aa;
	}
	
	/*显示用户信息*/
	@Action(value="/showUser"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String showUser(){
		user=userService.SelectOneUser(user.getUserId());
		return aa;
	}
	
	/*编辑用户信息*/
	@Action(value="/editUser"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String editUser(){
		boolean currentUser=userService.editUser(user);
		if(!currentUser){
			setResult("编辑用户失败！");
		}
		System.out.println("编辑用户成功");
		setResult("编辑用户成功");
		return aa;
	}
	
	/*删除用户*/
	@Action(value="/deleteUser"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String deleteUser(){
		user.setStatus("封禁");
		boolean currentUser=userService.editUser(user);
		if(!currentUser){
			setResult("删除失败！");
		}
		setResult("删除成功");
		return aa;
	}
	
	/*查询用户列表*/
	@Action(value="/selectUserList"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String SelectUserList(){
		User administration=getSessionUser();
		userList=userService.SelectUserList(user.getType(),page,administration);
		System.out.println("Action页面获取当前用户个数："+userList.size());
		if(userList==null){
			setResult("无用户");
		}
		DaoAdapter.COUNT_PER_PAGE=10;
		totalPage=(int) Math.ceil((userList.size()*1.0)/DaoAdapter.COUNT_PER_PAGE);
		System.out.println("Action页面获取总页面大小："+totalPage);
		return aa;
	}
	
	/*修改密码*/
	@Action(value="/changePsw"
			,results={@Result(type="json")}
			,params={"contentType","text/html"})
	public String changePsw() {
			int u=userService.findUser(getSessionUserId(),user.getPsw());
			if(u>0) {
				if(user.getPsw().equals(rePsw)) {
					setResult("新密码不能与旧密码一致");
				}else {
					user.setPsw(rePsw);
					user.setUserId(getSessionUserId());
					userService.editUser(user);
					setResult("密码修改成功");
				}
			}else {
				setResult("旧密码输入错误");
			}
		
		return aa;
	}
	
	
	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}
	
}
