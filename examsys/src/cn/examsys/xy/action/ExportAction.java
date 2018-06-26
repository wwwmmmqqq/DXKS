package cn.examsys.xy.action;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.sl.draw.geom.Outline;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.hibernate.result.Output;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.bean.Exam;
import cn.examsys.bean.Grade;
import cn.examsys.bean.Paper;
import cn.examsys.bean.User;
import cn.examsys.common.Export;
import cn.examsys.xy.service.GradeService;
import cn.examsys.xy.service.UserService;
@Namespace("/")
@ParentPackage("json-default")
@Controller("exportAction")
@Scope("prototype")
public class ExportAction extends Export {
	@Autowired
	UserService userService;
	@Autowired
	GradeService gradeService;
	
	String title;
	Paper paper;
	
	@JSON(serialize=false)
	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	@JSON(serialize=false)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Action(value="/export",results={@Result(type="json")},params={"contentType","text/html"})
	public String ExportAction() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		try {
			OutputStream out = ServletActionContext.getResponse().getOutputStream();
			User user=(User) session.getAttribute("user");
			List<User> userList = userService.findAllUser(paper.getSid(),user.getCollegeName());
			title="成绩导出";
			ExportUserScore(title, userList,out);
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
}
