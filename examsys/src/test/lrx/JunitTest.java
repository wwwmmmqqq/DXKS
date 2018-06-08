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
import cn.examsys.lrx.service.LrxService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"}) 
public class JunitTest extends AbstractJUnit4SpringContextTests {
	
	@Autowired
	private LrxService service;
	
	@Autowired
	DaoAdapter daoAdapter;
	
	/**
	 * 数据库 随机添加一个学生数据
	 */
	@Test
	public void test1() {
		//service.testService();
	}
	
	/**
	 * 向每一个表里面插入50条数据
	 */
	@Test
	public void test2() {
		Class<?> classes[] = new Class<?>[] {
				Answersheet.class
				,College.class
				,Exam.class
				,Grade.class
				,Option.class
				,Paper.class
				,Profession.class
				,Question.class
				,Subject.class
				,User.class
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
	
	
	/*@Test
	public void test3() {
		try{
			Object gg = Grade.class.newInstance();
			BeanAutoFit.autoFit(gg);
			daoAdapter.saveEntity(gg);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}*/
	
}
