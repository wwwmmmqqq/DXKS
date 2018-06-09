package test.lrx;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.*;
import cn.examsys.common.BeanAutoFit;
import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.service.LrxService;
import cn.examsys.lrx.service.NoticeService;
import cn.examsys.lrx.service.impl.NoticeServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"}) 
public class JunitTest extends AbstractJUnit4SpringContextTests {
	
	@Autowired
	private LrxService service;
	
	@Autowired
	LrxDaoImpl daoAdapter;
	
	/**
	 * 向每一个表里面插入50条数据
	 */
	@Test
	public void test2() {
		Class<?> classes[] = new Class<?>[]{
				Answersheet.class
				, College.class
				, Exam.class
				, Grade.class
				, Notice.class
				, Option.class
				, Paper.class
				, Profession.class
				, Question.class
				, Role.class
				, Subject.class
				, User.class
		};
		for (int i = 0; i < classes.length; i++) {
			for (int j = 0; j < 50; j++) {
				try {
					Object target = classes[i].newInstance();
					BeanAutoFit.autoFit(target);
					daoAdapter.saveEntity(target);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	
	@Test
	public void test3() {
		try{
			Object gg = Grade.class.newInstance();
			BeanAutoFit.autoFit(gg);
			daoAdapter.saveEntity(gg);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 测试 
	 * 删除主键值为 'userId_15065' 的实体
	 */
	@Test
	public void test4() {
		try {
			daoAdapter.deleteEntity(User.class, "userId_15065");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 测试
	 * 更新一个实体类的某些字段（例如 collegeName 和 email）
	 */
	@Test
	public void test5() {
		try {
			daoAdapter.updateEntity(User.class, "userId_15165"//userId_15165为主键的值
					, new String[] {"collegeName","email"}//字段名
					, new Object[]{"666", "601740275@cc.com"});//对应的值
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 测试
	 * 找到一个实体
	 */
	@Test
	public void test6() {
		try {
			User user = daoAdapter.findEntity(User.class, "userId_15165");
			System.out.println(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
