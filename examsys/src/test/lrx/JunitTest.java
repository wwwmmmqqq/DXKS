package test.lrx;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.examsys.bean.Student;
import cn.examsys.common.BeanAutoFit;
import cn.examsys.lrx.service.LrxService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"}) 
public class JunitTest extends AbstractJUnit4SpringContextTests {
	@Autowired
	private LrxService service;
	
	/**
	 * 数据库 随机添加一个学生数据
	 */
	
	@Test
	public void test1() {
		System.out.println(service);
		List<Student> li = service.loadStuList(4);
		System.out.println(Arrays.toString(li.toArray()).replaceAll("]", "]\n"));
	}
	
	@Test
	public void test2() {
		service.testService();
	}
	
}
