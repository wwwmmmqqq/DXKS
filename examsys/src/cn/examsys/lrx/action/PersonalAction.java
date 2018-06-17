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
import cn.examsys.bean.User;
import cn.examsys.common.BeanAutoFit;
import cn.examsys.common.CommonAction;
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
	
	@Override
	public String getResult() {
		return result;
	}
}
