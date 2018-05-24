package test.lrx;

import java.lang.reflect.Field;

import junit.framework.TestCase;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.service.impl.LrxServiceImpl;

public class TestSpring extends TestCase {
	BeanFactory bf;
	HibernateTemplate hibernateTemplate;
	LrxServiceImpl service;
	LrxDaoImpl dao;
	
	public TestSpring() throws Exception {
		bf = new ClassPathXmlApplicationContext("applicationContext.xml");
		hibernateTemplate =  (HibernateTemplate) bf.getBean("hibernateTemplate");
		
		dao = new LrxDaoImpl();
		//dao.setHibernateTemplate(hibernateTemplate);
		Field f = dao.getClass().getDeclaredField("hibernateTemplate");
		f.setAccessible(true);
		f.set(dao, hibernateTemplate);
		
		System.out.println("======");
		service = new LrxServiceImpl();
		f = service.getClass().getDeclaredField("lrxDao");
		f.set(service, dao);
	}
	
	public void test1() {
		System.out.println("1");
	}
	
}
