package cn.examsys.lrx.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.adapters.IDaoAdapter;
import cn.examsys.bean.Student;
import cn.examsys.common.BeanAutoFit;
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
		
		try {
			List<String> li1 = daoAdapter.findBySql("select name from stu_tb", 1);
			System.out.println(Arrays.toString(li1.toArray()));
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

	@Override
	public List<Student> loadStuList(int page) {
		try {
			return daoAdapter.findByHql("from Student", page);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public int loadStuListPage() {
		try {
			BigInteger bi = daoAdapter.findOneBySql("select count(*) from stu_tb");
			return (bi.intValue() / DaoAdapter.COUNT_PER_PAGE) + 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
}
