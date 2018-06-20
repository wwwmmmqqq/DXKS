package cn.examsys.xy.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Paper;
import cn.examsys.common.CommonAction;
import cn.examsys.common.Tool;
import cn.examsys.xy.service.PaperService;
@Namespace("/")
@ParentPackage("json-default")
@Controller("paperAction")
@Scope("prototype")
public class PaperAction extends CommonAction {
	@Autowired
	PaperService paperService;
	
	Paper paper=new Paper();
	List<Paper> paperList=new ArrayList<>();
	int page;
	int totalPage;
	
	public List<Paper> getPaperList() {
		return paperList;
	}

	public void setPaperList(List<Paper> paperList) {
		this.paperList = paperList;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	@JSON(serialize=false)
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	@Action(value="/editPaper",
			results={@Result(type="json")},
			params={"contentType","text/html"})
	public String editPaper(){
		paper.setTime(Tool.time());
		System.out.println(paper.toString());
		boolean currentPaper=paperService.editPaper(paper);
		if(!currentPaper) {
			setResult("修改失败");
		}
		setResult("修改成功");
		return aa;
	}
	@Action(value="/deletePaper",
			results={@Result(type="json")},
			params={"contentType","text/html"})
	public String deletePaper() {
		boolean currentPaper = paperService.deletePaper(paper,paper.getSid());
		setResult("删除成功");
		return aa;
	}
	@Action(value="/showPaperList",
			results={@Result(type="json")},
			params={"contentType","text/html"})
	public String showPaperList() {
		paperList = paperService.selectPaperList(page);
/*		totalPage = paperService.selectPaperList();*/
		DaoAdapter.COUNT_PER_PAGE=10;
		totalPage=(int) Math.ceil((paperList.size()*1.0)/DaoAdapter.COUNT_PER_PAGE);
		if(paperList.isEmpty()){
			setResult("查询失败");
		}
		setResult("查询成功");
		return aa;
	}
	@Action(value="/ShowOnePaper",
			results={@Result(type="json")},
			params={"contentType","text/html"})
	public String ShowOnePaper() {
		paper=paperService.SelectOnePaper(paper.getSid());
		if(paper.getSid()<=0) {
			setResult("查询失败");
		}
		return aa;
	}
	@Override
	public String getResult() {
		// TODO Auto-generated method stub
		return result;
	}

}
