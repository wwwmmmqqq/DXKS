package cn.examsys.xy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Paper;
import cn.examsys.xy.dao.PaperDao;
import cn.examsys.xy.service.PaperService;
@Service("paperService")
@Transactional
public class PaperServiceImpl implements PaperService {
	@Autowired
	PaperDao paperDao;
	@Override
	public boolean editPaper(Paper paper) {
		// TODO Auto-generated method stub
		paperDao.updatePaper(paper);
		return true;
	}
	@Override
	public boolean deletePaper(Paper paper, int sid) {
		// TODO Auto-generated method stub
		paperDao.deletePaper(paper,sid);
		return true;
	}
	@Override
	public List<Paper> selectPaperList(int page) {
		// TODO Auto-generated method stub
		return paperDao.selectPaperList(page);
	}
	@Override
	public int selectPaperList() {
		// TODO Auto-generated method stub
		return paperDao.findPaperList();
	}
	@Override
	public Paper SelectOnePaper(int sid) {
		// TODO Auto-generated method stub
		return paperDao.findOnePaper(sid);
	}

}
