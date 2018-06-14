package cn.examsys.xy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
import cn.examsys.common.Tool;
import cn.examsys.xy.service.ItemBankService;
@Namespace("/")
@ParentPackage("json-default")
@Controller("itemBankAction")
@Scope("prototype")
public class ItemBankAction extends CommonAction{
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

	/******************************创建题库*******************************/
	
	@Action(value="/createItemBank"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String createItemBank(){
		
		question.setUserId(user.getUserId());     //老师的UserId
		/*创建问题*/
		question.setTime(Tool.time());
		int sid=itemBankService.createQuestion(question);
		System.out.println("Action层question的sid："+sid);
		if(sid<=0){
			System.out.println("Action题库添加失败！");
			setResult("题库添加失败！");
		}
		/*创建选项*/
		int count=question.getChoiceCount();   //判断题型决定option对象的个数
		System.out.println("Action显示count："+count);

		for(int i=0;i<question.getChoiceCount();i++){
			option.get(i).setQuestionRef(sid);                  //set对应题目的ID，即指向题目
			option.get(i).setTime(Tool.time());
			boolean currentAnswer=itemBankService.createOption(option.get(i));      //添加获取到第[i]个option对象
			if(!currentAnswer){
				setResult("题库的选项添加失败！");
				System.out.println("Action题库的选项添加失败！");
			}
		}
		System.out.println("Action题库添加成功！");
		setResult("题库添加成功！");
		return aa;
	}
	
	
	/***********************显示题库列表byteacher_userId,byquestiontype,All**********************/
	
	@Action(value="/showItemBankListByUser"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
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
			questionList=itemBankService.selectItemQuestionListByUserId(user.getUserId(),page);
			
			/*教师题目列表总页数*/
			totalPage=itemBankService.selectItemQuestionListToalPageByUserId(user.getUserId());
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
	
	/*byType*/
	@Action(value="/showItemBankListByType"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String showItemBankListByType(){
		
		if(user.getUserId().contains("admin")) {              //管理员查看类型所有
			System.out.println("Action按类型查看"+question.getType());
			questionList=itemBankService.selectItemQuestionListByType(question.getType(),page);
			/*题目类型列表总页数*/
			totalPage=itemBankService.selectItemQuestionListToalPageByType(question.getType());
			System.out.println("Action question Number"+questionList.size());
			
		}else { 
			System.out.println("Action层教师查看");           //教师查看自己的
			questionList=itemBankService.selectTeacherItemQuestionListByType(question.getType(),user.getUserId(),page);
                                                                           		
			/*教师题目列表总页数*/
			totalPage=itemBankService.selectTeacherItemQuestionListToalPageByType(question.getType(),user.getUserId());
			System.out.println("Action question Number"+questionList.size());
		}
		
		
		/*查看对应question的option*/
		for(int i=0;i<questionList.size();i++){
			option=itemBankService.selectItemOptionByQuestion(questionList.get(i).getSid());
			System.out.println(option.size());
			map.put("option["+i+"]", option);
		}
		System.out.println("Action option Number"+map.size());
		
		if(map.isEmpty()||questionList.isEmpty()){
			System.out.println("题库查看失败！");
			setResult("题库查看失败！");
		}
		System.out.println("题库查看成功！");
		setResult("题库查看成功！");
		return aa;
	}
	
	/******************************显示一道题和相应选项*********************/
	
	@Action(value="/showItem"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String showItem(){
		/*查看对应question*/
		question=itemBankService.selectItemQuestion(question.getSid());
		/*查看对应question的option*/
		option=itemBankService.selectItemOptionByQuestion(question.getSid());
		map.put("option[0]", option);
			
		System.out.println("Action option Number"+map.size());
		
		if(map.isEmpty()||question.getSid()<=0){
			System.out.println("查看题目失败！");
			setResult("查看题目失败！");
		}
		System.out.println("查看题目成功！");
		setResult("查看题目成功！");
		return aa;
	}
	
	
	/******************************修改题库******************************/
	
	@Action(value="/editItemBankByUser"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String editItemBankByUser(){
		
		question.setTime(Tool.time());
		boolean currentQuestion=itemBankService.editQuestion(question);
		if(!currentQuestion){
			System.out.println("Action题库的选项更新失败！");
			setResult("题库的选项更新失败！");
		}
		for(int i=0;i<question.getChoiceCount();i++){
			option.get(i).setTime(Tool.time());
			boolean currentOption=itemBankService.editOption(option.get(i));      //修改获取到第[i]个option对象
			if(!currentOption){
				System.out.println("Action题库的选项更新失败！");
				setResult("题库的选项更新失败！");
			}
		}
		System.out.println("Action题库的选项更新成功！");
		setResult("题库的选项更新成功！");
		return aa;
	}
	
	/***************************删除题库**************************/
	
	@Action(value="/deleteItemBank"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String deleteItemBank(){
		
		boolean currentQuestion=itemBankService.deleteQuestion(question);
		if(!currentQuestion) {
			setResult("题目删除失败");
		}
		for(int i=0;i<question.getChoiceCount();i++){
			boolean currentOption=itemBankService.deleteOption(option.get(i));
			if(!currentOption) {
				setResult("选项删除失败");
			}
		}
		System.out.println("Action题目删除成功！");
		setResult("题目删除成功！");
		return aa;
	}
	
	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}

	
}
