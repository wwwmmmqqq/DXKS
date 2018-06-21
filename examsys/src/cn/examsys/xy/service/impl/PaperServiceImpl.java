package cn.examsys.xy.service.impl;

import java.lang.reflect.Field;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Paper;
import cn.examsys.bean.Role;
import cn.examsys.bean.User;
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
		try {
			Paper currentPaper=paperDao.findOnePaper(paper.getSid());   
			Field[] field = currentPaper.getClass().getDeclaredFields(); 
			Field[] f = paper.getClass().getDeclaredFields();  
			for(int i=0;i<field.length;i++) {
				field[i].setAccessible(true);     
				f[i].setAccessible(true);		
				Object vals = f[i].get(paper);
				Object val = field[i].get(currentPaper);
				String type = f[i].getType().toString();
				if(vals==null) {
					vals=val;
					f[i].set(paper, vals);
				}if(type.endsWith("int")) {
					int va = f[i].getInt(paper);
					int v = f[i].getInt(currentPaper);
					if(va==0) {
						f[i].set(paper, v);
					}
				}
			}
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
