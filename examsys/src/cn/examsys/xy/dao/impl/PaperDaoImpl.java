package cn.examsys.xy.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Paper;
import cn.examsys.xy.dao.PaperDao;
@Repository(value="paperDao")
public class PaperDaoImpl extends DaoAdapter implements PaperDao {

	@Override
	public void updatePaper(Paper paper) {
		// TODO Auto-generated method stub
		try {
			updateEntity(paper);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deletePaper(Paper paper, int sid) {
		// TODO Auto-generated method stub
		try {
			deleteEntity(paper.getClass(), sid);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Paper> selectPaperList(int page) {
		// TODO Auto-generated method stub
		String hql = "from Paper";
		try {
			return findByHql(hql, page);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public int findPaperList() {
		// TODO Auto-generated method stub
		String hql = "from Paper";
		try {
			int count=findByHql(hql).size();
			int totalPage = (int) Math.ceil((count*1.0)/COUNT_PER_PAGE);
			return totalPage;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public Paper findOnePaper(int sid) {
		// TODO Auto-generated method stub
		String hql = "from Paper where sid=?";
		Object[] vals=new Object[]{sid};
		try {
			return findOneByHql(hql, vals);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
