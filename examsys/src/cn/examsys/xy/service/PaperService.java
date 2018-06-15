package cn.examsys.xy.service;

import java.util.List;

import cn.examsys.bean.Paper;

public interface PaperService {
	/*编辑试卷*/
	boolean editPaper(Paper paper);
	/*删除试卷*/
	boolean deletePaper(Paper paper, int sid);
	/*显示试卷列表*/
	List<Paper> selectPaperList(int page);
	/*获取总条数totalPage*/
	int selectPaperList();
	/*显示一份信息试卷列表---用于修改*/
	Paper SelectOnePaper(int sid);

}
