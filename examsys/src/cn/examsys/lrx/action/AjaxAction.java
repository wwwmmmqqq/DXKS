
package cn.examsys.lrx.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.common.CommonAction;
import cn.examsys.lrx.service.LrxService;

@Namespace("/")
@ParentPackage("json-default")//非json时，则为"struts-default"
@Controller("ajaxAction")
@Scope("prototype")
public class AjaxAction extends CommonAction {
	
	int page;
	public void setPage(int page) {
		this.page = page;
	}
	
	@Autowired
	LrxService service;
	
	List<?> list;
	public List<?> getList() {
		return list;
	}
	
	int sid;
	String text;
	public void setText(String text) {
		this.text = text;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	
	@Action(value="/delQuestion"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String delQuestion() {
		boolean bo = service.deleteQuestion(getSessionUser(), sid);
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	
	List<String> fields = new ArrayList<String>();
	List<String> values = new ArrayList<String>();
	public List<String> getFields() {
		return fields;
	}
	public List<String> getValues() {
		return values;
	}
	
	/*@Action(value="/editQuestion"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String editQuestion() {
		boolean bo = lrxService.editQuestion(getSessionUser(), sid, fields, values);
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}*/
	
	@Action(value="/loadSubjects"
		,results={@Result(type="json")}
		,params={"contentType", "text/html"})
	public String loadQuestionAddPage() {
		list = service.loadSubjects();
		return aa;
	}
	
	@Action(value="/delPaper"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String delPaper() {
		boolean bo = service.delPaper(getSessionUser(), sid);
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	
	@Action(value="/invite"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String invite() {
		boolean bo = service.invite(getSessionUser(), sid, text);
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	@Action(value="/delExam"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String delExam() {
		boolean bo = service.delExam(getSessionUser(), sid);
		if (!bo) {
			setResult("fail");
		}
		return aa;
	}
	
	@Action(value="/loadTeachers"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadTeachers() {
		list = service.loadUsers(getSessionUser());
		return aa;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
