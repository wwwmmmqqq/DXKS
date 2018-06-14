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

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.common.CommonAction;
import cn.examsys.xy.service.ItemBankService;
@Namespace("/")
@ParentPackage("struts-default")
@Controller("itemBankAction")
@Scope("prototype")
public class ItemBankAction extends CommonAction implements ModelDriven<Question>{
	@Autowired
	ItemBankService itemBankService;
	
	private Question question;    //题库题目
	/*private Option option;		//题库选项
*/	private User user;			//user.type=教师
	/*private List<Option> optionList;   //选项列表
*/	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	/*public Option getOption() {
		return option;
	}

	public void setOption(Option option) {
		this.option = option;
	}
	
	public List<Option> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<Option> optionList) {
		this.optionList = optionList;
	}*/

	/*创建题库*/
	@Action(value="/createItemBank",results={@Result(name="aa",location="/MyItemBank.jsp")})
	public String createItemBank(){
		System.out.println("Action显示Content："+question.getTitle()+question.getType());
		question.setUserId("123546");
		/*创建问题*/
		int sid=itemBankService.createQuestion(question);
		System.out.println("Action层question的sid："+sid);
		
		/*创建选项*/
		/*String optionContent=option.getContent();*/
		/*System.out.println("Action显示Content："+optionContent);*/
		/*option.setQuestionRef(sid);
		for(int i=0;i<question.getChoiceCount();i++){
			
			boolean currentAnswer=itemBankService.createOption(option);
		}*/
		/*
		if(currentQuestionBank==null){
			setResult("题库添加失败！");
			System.out.println("Action题库添加失败！");
		}*/
		
		System.out.println("Action题库添加成功！");
		setResult("题库添加成功！");
		return "aa";
	}
	@Override
	public Question getModel() {
		// TODO Auto-generated method stub
		return question;
	}

	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return null;
	}

}
