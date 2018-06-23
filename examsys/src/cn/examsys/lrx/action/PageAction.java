package cn.examsys.lrx.action;

import java.util.ArrayList;
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
			@Result(name="success", location="/pages/student/student-exam.jsp")})
	public String startExam() {
		
		queList = service.loadQuestionList(paper.getSid());
		
		return SUCCESS;
	}
	
	/**
	 * @return
	 */
	@Action(value="/loadMyGrades", results={
			@Result(name="success", location="/pages/gy/history_teacher.jsp")})
	public String loadMyGrades() {
		list = service.loadGrades(getSessionUser(), page);
		return aa;
	}
	
	
	@Action(value="/loadResponsibleQuestions1", results={
			@Result(name="success", location="/pages/gy/teacher_read.jsp")})
	public String loadResponsibleQuestions() {
		//list = serivce.loadResponsibleQuestions(getSessionUser(), page);
		List<QuestionCheckVO> li = new ArrayList<QuestionCheckVO>();
		for (int i = 0; i < 10; i++) {
			Question q = new Question();
			Answersheet a = new Answersheet();
			try {
				BeanAutoFit.autoFit(q);
				BeanAutoFit.autoFit(a);
				System.out.println(a);
			} catch (Exception e) {
				e.printStackTrace();
			}
			QuestionCheckVO vo = new QuestionCheckVO(q, a);
			li.add(vo);
		}
		list = li;
		/*List<Question> list = new ArrayList<>();
		for (int i = 0; i < 10; i++) {
			Question q = new Question();
			try {
				BeanAutoFit.autoFit(q);
				List<Option> options = new ArrayList<>();
				for (int j = 0; j < Tool.getIntRnd(5)+1; j++) {
					Option o = new Option();
					BeanAutoFit.autoFit(o);
					options.add(o);
				}
				q.setOptions(options);
				list.add(q);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/
		return aa;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
