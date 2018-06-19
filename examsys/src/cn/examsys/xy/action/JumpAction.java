package cn.examsys.xy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.xy.service.ItemBankService;
@Namespace("/")
@ParentPackage("struts-default")
@Controller("jumpAction")
@Scope("prototype")
public class JumpAction extends CommonAction {
	@Autowired
	ItemBankService itemBankService;
	
	private Question question; //题库题目
	private List<Option> option;		//题库选项
	private List<Question> questionList;
	User user=new User();
	private int page;					//当前页
	private int totalPage;            //总页数
	Map<String,List<Option>> map=new HashMap<String,List<Option>>();

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public List<Option> getOption() {
		return option;
	}

	public void setOption(List<Option> option) {
		this.option = option;
	}
	
	@JSON(serialize=false)
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public List<Question> getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}
	
	@JSON(serialize=false)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Map<String, List<Option>> getMap() {
		return map;
	}

	public void setMap(Map<String, List<Option>> map) {
		this.map = map;
	}

	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Action(value="/showItemBankListByUserJump"
			,results={@Result(name="aa",location="/pages/gy/jsshowpaper.jsp")})
	public String showItemBankListByUser(){
		/**
		 * 数据测试
		 */
		/*user.setUserId("admin123546");*/
		if(user.getUserId().contains("admin")){      //教务查看所有题
			questionList=itemBankService.selectItemQuestionList(page);
			
			/*管理员题目列表总页数*/
			totalPage=itemBankService.selectItemQuestionListToalPage();
			System.out.println("Action question TotlePage："+totalPage);
			System.out.println("Action question Number："+questionList.size());
		}else{                                      //教师查看自己出的所有题
			System.out.println("Action层教师查看");
			questionList=itemBankService.selectItemQuestionListByUserId(getSessionUserId(),page);
			
			/*教师题目列表总页数*/
			totalPage=itemBankService.selectItemQuestionListToalPageByUserId(getSessionUserId());
			System.out.println("Action question Number："+questionList.size());
		}
		
		/*查看对应question的option*/
		for(int i=0;i<questionList.size();i++){
			option=itemBankService.selectItemOptionByQuestion(questionList.get(i).getSid());
			map.put("option["+i+"]", option);
		}
		
		if(map.isEmpty()||questionList.isEmpty()){
			System.out.println("题库查看失败！");
			setResult("题库查看失败！");
		}
		System.out.println("题库查看成功！");
		setResult("题库查看成功！");
		return aa;
	}
	

	/*@Action(value="/loginOutJump"
			,results={@Result(name="aa",location="/pages/gy/gy_login.jsp")})
	public String loginOut() {
		if(!isLogin()){
			setResult("请先登录");
		}
		session.removeAttribute("user");
		System.out.println("tuichula");
		setResult("成功退出");
		return "aa";
	}*/
}
