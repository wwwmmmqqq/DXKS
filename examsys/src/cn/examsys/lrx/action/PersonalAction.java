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

import cn.examsys.bean.Grade;
import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.common.BeanAutoFit;
import cn.examsys.common.CommonAction;
import cn.examsys.common.Tool;
import cn.examsys.lrx.service.PersonalService;
import cn.examsys.lrx.vo.PersonalHomePageVO;

@Namespace("/")
@ParentPackage("json-default")//非json时，则为"struts-default"
@Controller("personalAction")
@Scope("prototype")
public class PersonalAction extends CommonAction {
	
	int page;
	public void setPage(int page) {
		this.page = page;
	}
	List<?> list;
	public List<?> getList() {
		return list;
	}
	
	@Autowired
	PersonalService serivce;
	
	public String loadStuIndexDatas() {
		serivce.loadStuIndexDatas(getSessionUser());
		return aa;
	}
	
	List<String> fields = new ArrayList<>();
	List<String> values = new ArrayList<>();
	public List<String> getFields() {
		return fields;
	}
	public void setFields(List<String> fields) {
		this.fields = fields;
	}
	public List<String> getValues() {
		return values;
	}
	public void setValues(List<String> values) {
		this.values = values;
	}
	
	@Action(value="/updateStuInfos"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String updateStuInfos() {
		serivce.updateStuInfos(getSessionUser(), fields.toArray(), values.toArray());
		return aa;
	}
	
	String filed;
	String words;
	public void setWords(String words) {
		this.words = words;
	}
	public void setFiled(String filed) {
		this.filed = filed;
	}
	
	public String searchExams() {
		serivce.searchExamsBy(getSessionUser(), filed, words);
		return aa;
	}
	
	@Action(value="/loadMyGrades"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadMyGrades() {
		//list = serivce.loadGradeList(getSessionUser(), page);
		try {
			list = BeanAutoFit.fitBeanArray(Grade.class, Math.random());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aa;
	}
	
	String oldPsw, newPsw;
	public void setOldPsw(String oldPsw) {
		this.oldPsw = oldPsw;
	}
	public void setNewPsw(String newPsw) {
		this.newPsw = newPsw;
	}
	@Action(value="/updatePsw"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String updatePsw() {
		
		boolean bo = serivce.updatePsw(getSessionUser(), oldPsw, newPsw);
		if (!bo) {
			setResult("旧密码错误");
		}
		return aa;
	}
	
	@Action(value="/loadResponsibleQuestions"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadResponsibleQuestions() {
		list = serivce.loadResponsibleQuestions(getSessionUser(), page);
		
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
