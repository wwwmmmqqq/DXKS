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

import cn.examsys.bean.Paper;
import cn.examsys.common.CommonAction;
import cn.examsys.lrx.service.ConstituteService;
import cn.examsys.lrx.vo.ConstituteVO;

/**
 * 组卷相关Action
 * @author lrx
 * 2018年6月10日
 */
@Namespace("/")
@ParentPackage("json-default")//非json时，则为"struts-default"
@Controller("constituteAction")
@Scope("prototype")
public class ConstituteAction extends CommonAction {
	
	@Autowired
	ConstituteService service;
	Paper paper = new Paper();
	ConstituteVO single = new ConstituteVO();
	ConstituteVO trueOrFalse = new ConstituteVO();
	ConstituteVO multiple = new ConstituteVO();
	ConstituteVO fills = new ConstituteVO();
	ConstituteVO subjective = new ConstituteVO();
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	public void setSingle(ConstituteVO single) {
		this.single = single;
	}
	public void setTrueOrFalse(ConstituteVO trueOrFalse) {
		this.trueOrFalse = trueOrFalse;
	}
	public void setMultiple(ConstituteVO multiple) {
		this.multiple = multiple;
	}
	public void setFills(ConstituteVO fills) {
		this.fills = fills;
	}
	public void setSubjective(ConstituteVO subjective) {
		this.subjective = subjective;
	}
	/**
	 * <div style='background-color: blue'>自动组卷<br>
	 * 5个类型 ：Single TrueOrFalse Multiple Fills Subjective<br>
	 * 分别是    ：单选题 判断题 多选题 填空题 解答题<br>
	 * 例（单选题）：<br></div>
	 * <div>single.count //数量</div>
	 * <div>single.diff1 //难度1百分比</div>
	 * <div>single.diff2 //难度2百分比</div>
	 * <div>single.diff3 //难度3百分比</div>
	 * <div>single.diff4 //难度4百分比</div>
	 * <div>single.diff1Point //难度1的每题分值</div>
	 * <div>single.diff2Point //难度2的每题分值</div>
	 * <div>single.diff3Point //难度3的每题分值</div>
	 * <div>single.diff4Point //难度4的每题分值</div>
	 * <style>div{border:1px solid;background-color:green;width:300px;color:white}</style>
	 *    
	 *    paper.examRef //考次ID
	    , paper.getSubjectRef()//科目ID
		, paper.getName()//试卷标题名
		, paper.getTotalScore()//总分
		, paper.getExamStart()//考试开始时间
		, paper.getExamEnd()//考试结束时间
	 * 
	 * @return 
	 * 返回试卷ID
	 */
	
	public String createPaperAuto() {
		
		int sid = service.createPaperAuto(paper.getExamRef()
				, paper.getSubjectRef()//科目id
				, paper.getName()//试卷标题名
				, paper.getExamStart()//考试开始时间
				, paper.getExamEnd()//考试结束时间
				, single, trueOrFalse, multiple, fills, subjective);
		
		if (sid == -1) {
			setResult("fail");
			return aa;
		}
		
		setResult(sid + "");
		return aa;
	}
	
	List<Integer> qids = new ArrayList<>();
	List<Integer> points = new ArrayList<>();
	public List<Integer> getQids() {
		return qids;
	}
	public List<Integer> getPoints() {
		return points;
	}
	
	@Action(value="/createPaperHand"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String createPaperHand() {
		int sid = service.createPaperHand(getSessionUser(), qids, paper.getSid(), points
				, paper.getExamStart(), paper.getExamEnd(), paper.getName(), paper.getExamRef(), 
				paper.getSubjectRef());
		if (sid == -1) {
			setResult("fail");
		}
		return aa;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
