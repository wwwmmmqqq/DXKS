package cn.examsys.lrx.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Answersheet;
import cn.examsys.bean.Exam;
import cn.examsys.bean.Option;
import cn.examsys.bean.Paper;
import cn.examsys.common.CommonAction;
import cn.examsys.lrx.service.ExamService;

@Namespace("/")
@ParentPackage("json-default")//非json时，则为"struts-default"
@Controller("examAction")
@Scope("prototype")
public class ExamAction extends CommonAction {
	
	@Autowired
	ExamService service;
	
	int page;
	
	List<?> list = new ArrayList<>();
	Exam exam = new Exam();
	Paper paper = new Paper();
	Answersheet answer = new Answersheet();
	public Exam getExam() {
		return exam;
	}
	public Paper getPaper() {
		return paper;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public List<?> getList() {
		return list;
	}
	
	/**
	 * 获取考试列表 
	 * page
	 * @return
	 */
	public String loadMyExamList() {
		list = service.loadMyExamsList(getSessionUser(), page);
		return aa;
	}
	
	/**
	 * 加载试卷
	 * exam.sid 考试id
	 * @return
	 */
	public String loadPapersByExam() {
		list = service.loadPapersByExam(getSessionUser(), exam.getSid(), page);
		return aa;
	}
	
	
	/**
	 * 加载题目列表
	 * paper.sid 试卷id
	 * @return
	 */
	public String loadQuestionList() {
		list = service.loadQuestionList(paper.getSid(), page);
		return aa;
	}
	
	/**
	 * 做题
	 * 填空题：
	 * @return
	 */
	public String todo() {
		boolean bo = service.todo(getSessionUser()
				, answer.getQuestionRef()/*, answer.getType()*/
				, answer.getIsSelected(), answer.getFillsAnswer(), answer.getSubjectiveAnswer());
		return aa;
	}
	
	/**
	 * 交卷
	 * 总分
	 * paper.sid
	 * @return
	 */
	public String submitPaper() {
		int score = service.submitPaper(getSessionUser(), paper.getSid(), 0);
		setResult(score + "");
		return aa;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
