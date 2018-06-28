package test.lrx;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.examsys.bean.*;
import cn.examsys.common.BeanAutoFit;
import cn.examsys.common.Conf;
import cn.examsys.common.Tool;
import cn.examsys.lrx.dao.impl.ConstituteDaoImpl;
import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.service.ConstituteService;
import cn.examsys.lrx.service.LrxService;
import cn.examsys.lrx.vo.AnswerVO;
import cn.examsys.lrx.vo.ConstituteVO;
import cn.examsys.lrx.vo.QuestionCheckVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"}) 
public class JunitTest extends AbstractJUnit4SpringContextTests {
	 
	@Autowired
	LrxService service;
	 
	@Autowired
	LrxDaoImpl daoAdapter;
	
	@Autowired
	ConstituteDaoImpl dao;
	
	@Autowired
	ConstituteService conService;
	public static void main(String[] args) {
		
		
		
	}
	
	@Test
	public void teste() {
		
		try {
			List li = daoAdapter.findByHql("select p from Grade g,Paper p where g.userId=? and g.paperRef=p.sid order by g.sid desc" 
					, new Object[]{"a0"}, 1);
					
			System.out.println(li.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*try {
			List<QuestionCheckVO> li = dao.findByHql("select new cn.examsys.lrx.vo.QuestionCheckVO(q, a, o)"
					+ " from Constitute c, Answersheet a, Question q, Option o "
					+ " where c.responsibleUser=? and (a.checker!=? or a.checker is NULL) and c.questionRef=q.sid and o.questionRef=q.sid and a.optionRef=o.sid"
					, new Object[]{"a2", "a2"});
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		/*try {
			List<Map<String, Object>> li = daoAdapter.findByHql("select new Map(userId as userId, psw as psw, name as name) from User");
			System.out.println(li.size());
			for (int i = 0; i < li.size(); i++) {
				System.out.println(li.get(i).get("userId"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		/*List<Question> li;
		try {
			li = dao.findByHql("select q from Question q, Constitute c where c.paperRef=? and c.questionRef=q.sid"
					, new Object[]{28});
			System.out.println(li.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		
	}
	
	
	@Test
	public void addQuestion() {
		for (int i = 0; i < 50; i++) {
			testCreateQuestion_option_type(i);
		}
	}
	
	
	public void testCreateQuestion_option_type(int index) {
		String qtype[] = new String[] {
				Conf.Question_Single
				, Conf.Question_Multiple
				, Conf.Question_TrueOrFalse
				/*, Conf.Question_Fills
				, Conf.Question_Subjective*/
		};
		
		String type = qtype[Tool.getIntRnd(qtype.length)];
		
		Question q = new Question();
		q.setDifficultyValue(Tool.getIntRnd(4));
		q.setKnowledge("知识点" + index % 4);
		q.setTitle("题目标题" + index);
		q.setType(type);
		q.setUserId("admin");
		q.setTime(Tool.time());
		try {
			q.setSid((Integer) daoAdapter.saveEntity(q));
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Option> li = new ArrayList<Option>();
		for (int i = 0; i < Tool.getIntRnd(5) + 2; i++) {
			Option o = new Option();
			int rnd1 = Tool.getIntRnd(10);
			int rnd2 = Tool.getIntRnd(10);
			int rst = Tool.getIntRnd(10)>7?(rnd1+rnd2):Tool.getIntRnd(90) + 10;
			o.setContent(rnd1 + "+" + rnd2 + "=" + rst + " 对吗?");
			o.setIsAnswer(rnd1+rnd2==rst?1:0);
			o.setQuestionRef(q.getSid());
			o.setType(q.getType());
			try {
				li.add(o);
				daoAdapter.saveEntity(o);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	@Test
	public void test() {
		try {
			List<AnswerVO> vo = daoAdapter.findByHql("select new cn.examsys.lrx.vo.AnswerVO(a, b, c.point) from Answersheet a, Option b, Constitute c"
					+ " where b.sid=a.optionRef and c.questionRef=b.questionRef");
			System.out.println(vo.size());
			System.out.println(Arrays.toString(vo.toArray()).replaceAll("] -", "] -\n"));
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		
		/*int n = conService.createPaperAuto(1, 1, "XXX试卷"
				, 120, "2018-06-10 21:00:00", "2018-06-10 22:20:00"
				, single, trueOrFalse, multiple
				, fills, subjective);*/
		
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
				/*, Constitute.class*/
				/*, Exam.class*/
				, Grade.class
				, Notice.class
				/*, Option.class*/
				/*, Paper.class*/
				, Paper.class
				, Profession.class
				/*, Question.class*/
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
