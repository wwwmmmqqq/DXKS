package cn.examsys.lrx.action;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.common.CommonAction;
import cn.examsys.lrx.service.PersonalService;
import cn.examsys.lrx.vo.PersonalHomePageVO;

@Namespace("/")
@ParentPackage("json-default")//非json时，则为"struts-default"
@Controller("personalAction")
@Scope("prototype")
public class PersonalAction extends CommonAction {
	@Autowired
	PersonalService serivce;
	
	PersonalHomePageVO vo;
	public PersonalHomePageVO getVo() {
		return vo;
	}
	
	public String loadHomePageDatas() {
		vo = serivce.loadHomePageDatas(getSessionUser());
		return aa;
	}
	
	
	
	@Override
	public String getResult() {
		return result;
	}
}
