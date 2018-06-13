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

import cn.examsys.bean.Notice;
import cn.examsys.common.CommonAction;
import cn.examsys.lrx.service.NoticeService;

@Namespace("/")
@ParentPackage("json-default")//非json时，则为"struts-default"
@Controller("noticeAction")
@Scope("prototype")
public class NoticeAction extends CommonAction {
	
	int page;
	public void setPage(int page) {
		this.page = page;
	}
	
	@Autowired
	NoticeService service;
	
	List<Notice> list;
	public List<Notice> getList() {
		return list;
	}
	String type;
	public void setType(String type) {
		this.type = type;
	}
	
	/**
	 * 加载推送数量
	 * @return
	 * result 数量
	 */
	@Action(value="/loadNoticeCount"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadNoticeCount() {
		
		int count = service.loadNoticeCount(getSessionUserId());
		
		setResult(count + "");
		
		return aa;
	}
	
	int sid;
	public void setSid(int sid) {
		this.sid = sid;
	}
	
	@Action(value="/readNotice"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String readNotice() {
		service.readNotice(getSessionUser(), sid);
		return aa;
	}
	
	/**
	 * 加载推送列表
	 * @return
	 * 推送列表
	 */
	@Action(value="/loadNoticeList"
			,results={@Result(type="json")}
			,params={"contentType", "text/html"})
	public String loadNoticeList() {
		System.out.println(page);
		if (page == 1) {
			//加载未读的
			list = service.loadNoticeList(getSessionUserId(), false, page);
			List<Notice> li = service.loadNoticeList(getSessionUserId(), true, page);
			if (list == null) {
				list = new ArrayList<Notice>();
				if (li != null) list.addAll(li);
			} else {
				list.addAll(li);
			}
		} else {
			list = service.loadNoticeList(getSessionUserId(), true, page);
		}
		return aa;
	}
	
	@Override
	public String getResult() {
		return result;
	}
	
}
