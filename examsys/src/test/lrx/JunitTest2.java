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
import cn.examsys.adapters.IDaoAdapter;
import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.vo.QuestionCheckVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"}) 
public class JunitTest2 extends AbstractJUnit4SpringContextTests {
	 
	
	@Autowired
	LrxDaoImpl dao;
	
	@Test
	public void test() {
		try {
			/*List<QuestionCheckVO> li = dao.findByHql("select new cn.examsys.lrx.vo.QuestionCheckVO(q, a, o) "
					+ " from Question q, Answersheet a, Constitute c, Option o"
					+ " where a.questionRef=q.sid"
					+ " and (a.checker!=? and c.responsibleUser=?) and c.questionRef=q.sid and a.optionRef=o.sid"
					, new Object[]{"admin", "admin"});
			System.out.println(li.size());
			System.out.println(Arrays.toString(li.toArray()));*/
			List<QuestionCheckVO> li = dao.findByHql("select new cn.examsys.lrx.vo.QuestionCheckVO(q, a, o) "
					+ " from Constitute c, Answersheet a, Question q, Option o "
					+ " where c.paperRef=? and c.questionRef=q.sid and o.questionRef=q.sid and a.optionRef=o.sid"
					, new Object[]{1});
			//c.questionRef=q.sid
			System.out.println(li.size());
			System.out.println(Arrays.toString(li.toArray()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
