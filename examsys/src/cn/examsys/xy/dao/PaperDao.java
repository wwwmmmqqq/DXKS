package cn.examsys.xy.dao;

import java.util.List;

import cn.examsys.bean.Paper;

public interface PaperDao {
	/*编辑试卷*/
	void updatePaper(Paper paper);
	/*删除试卷*/
	void deletePaper(Paper paper, int sid);
	/*显示试卷列表*/
	List<Paper> selectPaperList(int page);
	/*获取总条数totalPage*/
	int findPaperList();
	/*显示一份试卷列表*/
	Paper findOnePaper(int sid);

}
