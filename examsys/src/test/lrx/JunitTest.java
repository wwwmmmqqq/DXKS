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
	
	//插入组织信息
	@Test
	public void test0() {
		String orgNames[] = new String[]{
				"怀化市委政法委机关"
				,"怀化市县市区政委法委"
				,"怀化市综治维成员单位"
				,"委领导及处级干部"
				,"办公室"
				,"研究室"
				,"政法舆情应对科"
				,"政治部"
				,"机关党委、工会"
		};
		int parentIds[] = new int[]{
				0,0,0,1,1,1,1,1,1
		};
		
		for (int i = 0; i < parentIds.length; i++) {
			Tableorg org = new Tableorg();
			org.setOrgName(orgNames[i]);
			org.setParentId(parentIds[i]);
			try {
				daoAdapter.saveEntity(org);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	//插入用户信息
	@Test
	public void test4() {
		Tableuser u1 = new Tableuser();
		Tableuser u2 = new Tableuser();
		Tableuser u3 = new Tableuser();
		
		u1.setPassword("888888");
		u1.setRealname("张小斌");
		u1.setPhonenumber("13034867830");
		u1.setOrgID(27);
		u1.setVerion(5);
		u1.setState(1);
		u1.setShortnumber1("12345");
		

		u2.setPassword("888888");
		u2.setRealname("段高柯");
		u2.setPhonenumber("130348866666");
		u2.setOrgID(12);
		u2.setVerion(5);
		u2.setState(1);
		
		u3.setPassword("888888");
		u3.setRealname("向晔林");
		u3.setPhonenumber("13100219189");
		u3.setOrgID(19);
		u3.setVerion(5);
		u3.setState(1);
		try {
			daoAdapter.saveEntity(u1);
			daoAdapter.saveEntity(u2);
			daoAdapter.saveEntity(u3);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//在table_user插入一条新记录
	@Test
	public void asd() {
		try {
			Tableorg o = daoAdapter.findOneByHql("from Tableorg order by RAND() ");
			Tableuser u = new Tableuser();
			u.setOrgID(o.getOrgID());
			u.setRealname("啦啦啦");
			u.setPassword("8888");
			dao.saveEntity(u);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * (2)	在table_user中插入记录时
	 * ，phonenumber1、phonenumber2不能和已有的记录
	 * phonenumber1和phonenumber2冲突。shortnumber1和shortnumber2也有同样要求。
	 */
	@Test
	public void test_() {
		Tableuser u = new Tableuser();
		u.setRealname("asdfasdffas");
		u.setShortnumber1("231321321");
		u.setShortnumber2("23423234");
		u.setPhonenumber("234");
		u.setPhonenumber2("234234");
		try {
			Object tmp = daoAdapter.findOneByHql("from Tableuser where phonenumber=? or phonenumber2=? or shortnumber1=? or shortnumber2=?"
					, new Object[]{u.getPhonenumber(), u.getPhonenumber2(), u.getShortnumber1(),u.getShortnumber2()});
			if (tmp == null) {
				System.out.println("没有冲突");
				daoAdapter.saveEntity(u);
				System.out.println("保存成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void teste() {
		/*
		 * "keys[0]":"type",
   			"keys[1]":"difficultyValue",
   			"keys[2]":"subjectRef",
   			"keys[3]":"title",
   			"keys[4]":"knowledge",
		 */
		List<String> keys = new ArrayList<String>();
		keys.add("type");
		keys.add("difficultyValue");
		keys.add("subjectRef");
		keys.add("title");
		keys.add("knowledge");
		List<String> vals = new ArrayList<String>();
		vals.add("Single");
		vals.add("");
		vals.add("2");
		vals.add("");
		vals.add("");
		User u = new User();
		u.setUserId("a5");
		List<Question> li = service.searchQuestionsHandConstitute(u, keys, vals, 1);
		System.out.println(Arrays.toString(li.toArray()));
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
