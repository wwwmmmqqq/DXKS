package cn.examsys.lrx.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Question;
import cn.examsys.bean.Subject;
import cn.examsys.bean.User;
import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.service.LrxService;

@Service("lrxService")
@Transactional
public class LrxServiceImpl implements LrxService {
	@Autowired
	LrxDaoImpl dao;
	
	@Override
	public void testService() {
		
		System.out.println("Service层被调用, lrxDao = " + dao);
		
		dao.testDao();
		
		try {
			System.out.println("adapter >> " + dao);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			List<String> li1 = dao.findBySql("select name from stu_tb", 1);
			System.out.println(Arrays.toString(li1.toArray()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean deleteQuestion(User sessionUser, int sid) {
		try {
			dao.deleteEntity(Question.class, sid);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public boolean editQuestion(User sessionUser, int sid, List<String> fields, List<String> vals) {
		try {
			dao.updateEntity(Question.class, sid, fields.toArray(), vals.toArray());
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Subject> loadSubjects() {
		try {
			return dao.findByHql("from Subject");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
}
