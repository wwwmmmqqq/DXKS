package cn.examsys.lrx.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

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
	protected LrxService lrxService;
	
	List<?> list;
	public List<?> getList() {
		return list;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
