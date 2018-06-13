package cn.examsys.xy.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.xy.service.UserService;

@Namespace("/")
@ParentPackage("json-default")
@Controller("testAction")
@Scope("prototype")
public class testAction extends CommonAction implements ModelDriven<User>{
	private User user=new User();
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Autowired
	UserService userService;
	/*创建用户*/
	@Action(value="/createUserssss"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String createUserssss(){
		if(user==null){
			setResult("输入");
		}
		boolean currentUser=userService.createUser(user);
		if(!currentUser){
			System.out.println("用户创建失败");
			setResult("用户创建失败！");
		}
		System.out.println("用户创建成功");
		setResult("用户创建成功");
		return aa;
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
