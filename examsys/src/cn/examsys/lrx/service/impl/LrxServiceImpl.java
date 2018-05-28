package cn.examsys.lrx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.adapters.IDaoAdapter;
import cn.examsys.bean.Student;
import cn.examsys.lrx.dao.LrxDao;
import cn.examsys.lrx.service.LrxService;

@Service("lrxService")
@Transactional
public class LrxServiceImpl implements LrxService {
	
	@Autowired
	LrxDao dao;
	
	@Autowired
	IDaoAdapter daoAdapter;
	
	@Override
	public void testService() {
		
		System.out.println("Service层被调用, lrxDao = " + dao);
		
		dao.testDao();
		
		try {
			System.out.println("adapter >> " + daoAdapter);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void saveStudent(Student stu) {
		try {
			daoAdapter.saveEntity(stu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Student loadStudent(int sid) {
		return null;
	}

}
