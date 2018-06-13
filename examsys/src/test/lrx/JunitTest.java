package test.lrx;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.*;
import cn.examsys.common.BeanAutoFit;
import cn.examsys.lrx.dao.impl.ConstituteDaoImpl;
import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.service.ConstituteService;
import cn.examsys.lrx.service.LrxService;
import cn.examsys.lrx.service.NoticeService;
import cn.examsys.lrx.service.impl.ConstituteServiceImpl;
import cn.examsys.lrx.service.impl.NoticeServiceImpl;
import cn.examsys.lrx.vo.ConstituteVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"}) 
public class JunitTest extends AbstractJUnit4SpringContextTests {
	
	@Autowired
	private LrxService service;
	
	@Autowired
	LrxDaoImpl daoAdapter;
	
	@Autowired
	ConstituteDaoImpl dao;
	
	@Autowired
	ConstituteService conService;
	
	@Autowired
	NoticeServiceImpl noticeServiceImpl;
	
	@Test
	public void testNotice() {
		List<Notice> li = noticeServiceImpl.loadNoticeList("admin", true, 1);
		System.out.println(li.size());
		System.out.println(Arrays.toString(li.toArray()));
	}
	
	@Test
	public void testContitution() {
		
		ConstituteVO single = new ConstituteVO();
		ConstituteVO trueOrFalse = new ConstituteVO();
		ConstituteVO multiple = new ConstituteVO();
		ConstituteVO fills = new ConstituteVO();
		ConstituteVO subjective = new ConstituteVO();
		
		single.setCount(20);
		trueOrFalse.setCount(5);
		multiple.setCount(5);
		fills.setCount(5);
		subjective.setCount(5);
		
		int n = conService.createPaperAuto(1, 1, "XXX试卷"
				, 120, "2018-06-10 21:00:00", "2018-06-10 22:20:00"
				, single, trueOrFalse, multiple
				, fills, subjective);
		System.out.println(n);
		
	}
	
	@Test
	public void testHqlRnd() {
		try {
			List<Question> qs = dao.findNByHql("from Question ORDER BY RAND()", null, 5);
			System.out.println(Arrays.toString(qs.toArray()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 向每一个表里面插入50条数据
	 */
	@Test
	public void test2() {
		Class<?> classes[] = new Class<?>[]{
				  Answersheet.class
				, College.class
				, Constitute.class
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
			daoAdapter.updateEntity(User.class, "userId_15165"//主键值为userId_15165的实体
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
