package cn.examsys.lrx.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Answersheet;
import cn.examsys.bean.Option;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.common.BeanAutoFit;
import cn.examsys.common.CommonAction;
import cn.examsys.lrx.service.ExamService;
import cn.examsys.lrx.service.PageService;
import cn.examsys.lrx.service.impl.ExamServiceImpl;
import cn.examsys.lrx.vo.QuestionCheckVO;

@Namespace("/")
@ParentPackage("struts-default")//非json时，则为"struts-default"
@Controller("pageAction")
@Scope("prototype")
public class PageAction extends CommonAction {
	int page;
	@Autowired
	PageService service;
	
	List<Question> queList = new ArrayList<>();
	List<?> list = new ArrayList<>();
	Paper paper = new Paper();
	public Paper getPaper() {
		return paper;
	}
	public List<Question> getQueList() {
		return queList;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public List<?> getList() {
		return list;
	}
	@Action(value="/startExam", results={
			@Result(name="success", location="/pages/student/student-exam.jsp")
			,@Result(name="login", location="/pages/gy/login.jsp")})
	public String startExam() {
		if (!isLogin()) {
			return "login";
		}
		
		queList = service.loadQuestionList(paper.getSid());
		paper = service.loadPaper(paper.getSid());
		session.setAttribute("currentPaper", paper.getSid());
		
		
		return SUCCESS;
	}
	
	/**
	 * @return
	 */
	@Action(value="/loadMyGrades", results={
			@Result(name="success", location="/pages/gy/history_teacher.jsp")
			,@Result(name="login", location="/pages/gy/login.jsp")})
	public String loadMyGrades() {
		if (!isLogin()) {
			return "login";
		}
		
		list = service.loadGrades(getSessionUser(), page);
		return aa;
	}
	
	
	@Action(value="/loadResponsibleQuestions", results={
			@Result(name="success", location="/pages/gy/teacher_read.jsp")
			,@Result(name="login", location="/pages/gy/login.jsp")})
	public String loadResponsibleQuestions() {
		if (!isLogin()) {
			return "login";
		}
		list = service.loadResponsibleQuestions(getSessionUser()
				, paper.getSid(), page);
		return aa;
	}
	
	String type;
	String key;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	
	@Action(value="/searchQuestions", results={
			@Result(name="success", location="/pages/gy/jsshowpaper.jsp")
			,@Result(name="login", location="/pages/gy/login.jsp")})
	public String searchQuestions() {
		
		if (!isLogin()) {
			return "login";
		}
		
		if (page == 0) {
			page = 1;
		}
		System.out.println(key + ", " + type);
		list = service.searchQuestions(getSessionUser(), type, key, page);
		System.out.println(list.size());
		int totalPage = service.loadSearchQuestionsPage(getSessionUser(), type, key);
		request.setAttribute("totalPage", totalPage);
		return aa;
	}
	
	int examSid;
	public int getExamSid() {
		return examSid;
	}
	public void setExamSid(int examSid) {
		this.examSid = examSid;
	}
	@Action(value="/loadHandConstitutePage", results={
			@Result(name="success", location="/pages/lxh/affair_hand_volume.jsp")
			,@Result(name="login", location="/pages/gy/login.jsp")})
	public String loadHandConstitutePage() {
		if (!isLogin()) {
			return "login";
		}

		if (page == 0) {
			page = 1;
		}
		return aa;
	}
	

	//试卷管理
	@Action(value="/loadAPaper", results={
				@Result(name="success", location="/pages/lxh/apaper.jsp") })
	public String loadAPaper() {
		list = service.loadQuestionList(getSessionUser(), paper.getSid());
		System.out.println(list.size());
		return aa;
	}
	
	//试卷管理
	@Action(value="/loadAPaperStu", results={
				@Result(name="success", location="/pages/student/student-paper-detail.jsp") })
	public String loadAPaperStu() {
		list = service.loadQuestionList(getSessionUser(), paper.getSid());
		System.out.println(list.size());
		return aa;
	}
	
	Question question = new Question();
	List<Option> options = new ArrayList<>();
	public List<Option> getOptions() {
		return options;
	}
	public Question getQuestion() {
		return question;
	}
	
	@Action(value="/createNewQuestion", results={
			@Result(name="success", location="/pages/gy/jsentryquestions.jsp")
			,@Result(name="login", location="/pages/gy/login.jsp")})
	public String createNewQuestion() {
		if (!isLogin()) {
			return "login";
		}
		System.out.println(Arrays.toString(options.toArray()));
		boolean bo = service.saveQuestion(getSessionUser(), question, options);
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	
	QuestionCheckVO vo;
	public QuestionCheckVO getVo() {
		return vo;
	}
	@Action(value="/randomQuestionPage", results={
			@Result(name="success", location="/pages/student/student-self-exam.jsp")
			,@Result(name="login", location="/pages/gy/login.jsp")})
	public String randomQuestionPage() {
		vo = service.loadQuestionBy(question.getSubjectRef(), question.getType());
		return aa;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
