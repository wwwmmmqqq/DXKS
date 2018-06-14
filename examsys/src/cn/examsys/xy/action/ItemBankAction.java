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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.opensymphony.xwork2.ModelDriven;

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.xy.service.ItemBankService;
@Namespace("/")
@ParentPackage("struts-default")
@Controller("itemBankAction")
@Scope("prototype")
public class ItemBankAction extends CommonAction{
	@Autowired
	ItemBankService itemBankService;
	
	private Question question; //题库题目
	private List<Option> option;		//题库选项
	private List<Question> questionList;
	private int page;
	
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
	
	/******************************创建题库*******************************/
	
	@Action(value="/createItemBank",results={@Result(name="aa",location="/MyItemBank.jsp")})
	public String createItemBank(){
		question.setUserId("123546");     //老师的UserId
		/*创建问题*/
		int sid=itemBankService.createQuestion(question);
		String stringSid=sid+"";
		System.out.println("Action层question的sid："+sid);
		if(stringSid==null){
			System.out.println("Action题库添加失败！");
			setResult("题库添加失败！");
		}
		/*创建选项*/
		int count=question.getChoiceCount();   //判断题型决定option对象的个数
		System.out.println("Action显示count："+count);
		
		for(int i=0;i<question.getChoiceCount();i++){
			option.get(i).setQuestionRef(sid);                  //set对应题目的ID，即指向题目
			boolean currentAnswer=itemBankService.createOption(option.get(i));      //添加获取到第[i]个option对象
			if(!currentAnswer){
				setResult("题库的选项添加失败！");
				System.out.println("Action题库的选项添加失败！");
			}
		}
		System.out.println("Action题库添加成功！");
		setResult("题库添加成功！");
		return "aa";
	}
	
	
	/***********************显示题库列表byteacher_userId,byquestiontype,All**********************/
	
	@Action(value="/showItemBankListByUser",results={@Result(name="aa",location="/pages/xy/list.jsp")})
	public String showItemBankListByUser(){
		User user=new User();
		/**
		 * 数据测试
		 */
		user.setUserId("admin123546");
		setPage(2);
		
		
		List<Option> optionList=new ArrayList<>();
		if(user.getUserId().contains("admin")){
			questionList=itemBankService.selectItemQuestionList(page);
			
			/*管理员题目列表总页数*/
			int totalPage=itemBankService.selectItemQuestionListToalPage();
			System.out.println("Action question TotlePage："+totalPage);
			System.out.println("Action question Number："+questionList.size());
		}else{
			System.out.println("Action层教师查看");
			questionList=itemBankService.selectItemQuestionListByUserId(user.getUserId(),page);
			
			/*教师题目列表总页数*/
			int totalPage=itemBankService.selectItemQuestionListToalPageByUserId(user.getUserId());
			System.out.println("Action question Number："+questionList.size());
		}
		
		/*查看对应question的option*/
		for(int i=0;i<questionList.size();i++){
			List<Option> opti=itemBankService.selectItemOptionByQuestion(questionList.get(i).getSid());
			for(int j=0;j<opti.size();j++){
				Option op=opti.get(j);
				optionList.add(op);
			}
		}
		System.out.println("Action option Number"+optionList.size());
		
		if(optionList.isEmpty()||questionList.isEmpty()){
			System.out.println("题库查看失败！");
			setResult("题库查看失败！");
		}
		System.out.println("题库查看成功！");
		setResult("题库查看成功！");
		return "aa";
	}
	
	@Action(value="/showItemBankListByType",results={@Result(name="aa",location="/pages/xy/list.jsp")})
	public String showItemBankListByType(){
		User user=new User();
		user.setUserId("123546");
		setPage(1);
		
		List<Option> optionList=new ArrayList<>();
		
		System.out.println("Action层教师查看");
		questionList=itemBankService.selectItemQuestionListByType(question.getType(),page);
			
		/*题目类型列表总页数*/
		int totalPage=itemBankService.selectItemQuestionListToalPageByType(question.getType());
		System.out.println("Action question Number"+questionList.size());
		
		/*查看对应question的option*/
		for(int i=0;i<questionList.size();i++){
			List<Option> opti=itemBankService.selectItemOptionByQuestion(questionList.get(i).getSid());
			System.out.println(opti.size());
			for(int j=0;j<opti.size();j++){
				Option op=opti.get(j);
				System.out.println("第"+i+"道题的第"+j+"个选项的内容:"+op.getContent());
				optionList.add(op);
			}
		}
		System.out.println("Action option Number"+optionList.size());
		
		if(optionList.isEmpty()||questionList.isEmpty()){
			System.out.println("题库查看失败！");
			setResult("题库查看失败！");
		}
		System.out.println("题库查看成功！");
		setResult("题库查看成功！");
		return "aa";
	}
	
	/******************************显示一道题和相应选项*********************/
	
	@Action(value="/showItemAction",results={@Result(name="aa",location="/pages/xy/list.jsp")})
	public String showItemAction(){
		List<Option> optionList=new ArrayList<>();
		
		/*查看对应question*/
		question=itemBankService.selectItemQuestion(question.getSid());
		
		/*查看对应question的option*/
			List<Option> opti=itemBankService.selectItemOptionByQuestion(question.getSid());
			for(int j=0;j<opti.size();j++){
				Option op=opti.get(j);
				System.out.println("第"+question.getSid()+"道题的第"+j+"个选项的内容:"+op.getContent());
				optionList.add(op);
		}
		System.out.println("Action option Number"+optionList.size());
		
		if(optionList.isEmpty()||questionList.isEmpty()){
			System.out.println("查看题目失败！");
			setResult("查看题目失败！");
		}else{
			System.out.println("查看题目成功！");
			setResult("查看题目成功！");
		}
		return "aa";
	}
	
	
	/******************************修改题库******************************/
	
	@Action(value="/editItemBankByUser",results={@Result(name="aa",location="/pages/xy/list.jsp")})
	public String editItemBankByUser(){
		question.setUserId("123546"); 
		boolean currentQuestion=itemBankService.editQuestion(question);
		if(!currentQuestion){
			System.out.println("Action题库的选项更新失败！");
			setResult("题库的选项更新失败！");
		}
		for(int i=0;i<question.getChoiceCount();i++){
			boolean currentOption=itemBankService.editOption(option.get(i));      //修改获取到第[i]个option对象
			if(!currentOption){
				System.out.println("Action题库的选项更新失败！");
				setResult("题库的选项更新失败！");
			}
		}
		System.out.println("Action题库的选项更新成功！");
		setResult("题库的选项更新成功！");
		return "aa";
	}
	
	/***************************删除题库**************************/
	
	@Action(value="/deleteItemBank",results={@Result(name="aa",location="/pages/xy/list.jsp")})
	public String deleteItemBank(){
		
		boolean currentQuestion=itemBankService.deleteQuestion(question);
		if(currentQuestion){
			System.out.println("Action题库的题目删除成功！");
			setResult("题目删除成功！");
		}
		for(int i=0;i<question.getChoiceCount();i++){
			boolean currentOption=itemBankService.deleteOption(option.get(i));
			if(currentOption){
				System.out.println("Action题库的选项删除成功！");
				setResult("选项删除成功！");
			}
		}
		return "aa";
	}
	
	
	
	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}

	
}
