package cn.examsys.lrx.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Paper;
import cn.examsys.common.CommonAction;
import cn.examsys.lrx.service.ExamService;
import cn.examsys.lrx.service.LrxService;
import cn.examsys.lrx.vo.ExamPageVO;

@Namespace("/")
@ParentPackage("json-default")//非json时，则为"struts-default"
@Controller("examAction")
@Scope("prototype")
public class ExamAction extends CommonAction {
	
	@Autowired
	ExamService service;
	
	ExamPageVO vo;
	public ExamPageVO getVo() {
		return vo;
	}
	
	Paper paper = new Paper();
	public Paper getPaper() {
		return paper;
	}
	
	/**
	 * 开始考试
	 * 
	 * @return
	 */
	public String startExam() {
		
		vo = service.startExam(getSessionUser(), paper.getSid());
		
		return aa;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
