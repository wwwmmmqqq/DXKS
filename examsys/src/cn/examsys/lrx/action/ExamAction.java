package cn.examsys.lrx.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Answersheet;
import cn.examsys.bean.Exam;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.common.BeanAutoFit;
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
	public Answersheet getAnswer() {
		return answer;
	}
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
	 * 参数：page
	 * @return
	 */
	@Action(value="/loadMyExamList"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadMyExamList() {
		DaoAdapter.COUNT_PER_PAGE = 5;
		list = service.loadMyExamsList(getSessionUser(), page);
		DaoAdapter.COUNT_PER_PAGE = 10;
		//list = service.loadMyExamsList(getSessionUser(), page);
		try {
			//TODO 测试数据
			list = BeanAutoFit.fitBeanArray(Exam.class, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aa;
	}
	
	/**
	 * 加载试卷
	 * exam.sid 考试id
	 * @return
	 */
	@Action(value="/loadPapersByExam"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadPapersByExam() {
		DaoAdapter.COUNT_PER_PAGE = 5;
		list = service.loadPapersByExam(getSessionUser(), exam.getSid(), page);
		DaoAdapter.COUNT_PER_PAGE = 10;
		try {
			//TODO 测试数据
			list = BeanAutoFit.fitBeanArray(Paper.class, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aa;
	}
	
	/**
	 * 加载题目列表
	 * paper.sid 试卷id
	 * @return
	 */
	@Action(value="/loadQuestionList"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadQuestionList() {
		list = service.loadQuestionList(paper.getSid(), 0);
		try {
			//TODO 测试数据
			list = BeanAutoFit.fitBeanArray(Question.class, paper.getSid());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aa;
	}
	
	/**
	 * 做题
	 * questionRef,optionRef,fillsAnswer,subjectiveAnswer
	 * @return
	 */
	@Action(value="/todo"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String todo() {
		boolean bo = service.todo(getSessionUser()
				, answer.getQuestionRef()
				, answer.getOptionRef()
				, answer.getFillsAnswer(), answer.getSubjectiveAnswer());
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	
	/**
	 * 交卷
	 * paper.sid
	 * @return 返回总分
	 */
	@Action(value="/submitPaper"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String submitPaper() {
		int score = service.submitPaper(getSessionUser(), paper.getSid(), 0);
		
		if (score == -1) {
			setResult("fail");
		} else {
			setResult(score + "");
		}
		return aa;
	}
	
	/**
	 * 加载我的历史试卷
	 * page
	 * @return
	 */
	@Action(value="/loadMyHistoryPapers"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadMyHistoryPapers() {
		//list = service.loadMyHistoryPapers(getSessionUser(), page);
		try {
			list = BeanAutoFit.fitBeanArray(Paper.class, Math.random());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aa;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
