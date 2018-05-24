package cn.examsys.lrx.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.lrx.dao.LrxDao;

@Repository("lrxDao")
public class LrxDaoImpl implements LrxDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	
	@Override
	public void testDao() {
		System.out.println("Dao层被调用，hibernateTemplate = " + hibernateTemplate);
	}
	
}
