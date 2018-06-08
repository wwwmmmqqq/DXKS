package cn.examsys.lrx.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.service.LrxService;

@Service("lrxService")
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
	
}
