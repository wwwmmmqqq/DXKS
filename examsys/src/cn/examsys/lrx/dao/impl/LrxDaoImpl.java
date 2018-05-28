package cn.examsys.lrx.dao.impl;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.lrx.dao.LrxDao;

@Repository("lrxDao")
public class LrxDaoImpl extends DaoAdapter implements LrxDao {
	
	@Override
	public void testDao() {
		System.out.println("Dao层被调用，hibernateTemplate = " + hibernateTemplate);
	}
	
}
