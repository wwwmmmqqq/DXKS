package cn.examsys.lrx.vo;

import java.util.List;

public class ListVO {
	int page;
	List<?> list;
	
	public void setPage(int page) {
		this.page = page;
	}
	public List<?> getList() {
		return list;
	}
	public int getPage() {
		return page;
	}
	public void setList(List<?> list) {
		this.list = list;
	}
	
}
