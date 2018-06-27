package test.lrx;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.examsys.bean.College;
import cn.examsys.bean.Exam;
import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.bean.Subject;
import cn.examsys.bean.User;
import cn.examsys.common.Conf;
import cn.examsys.common.Tool;
import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.service.ConstituteService;
import cn.examsys.lrx.vo.ConstituteVO;
import cn.examsys.lrx.vo.QuestionCheckVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"})
public class Exam_Paper_DataInsert extends AbstractJUnit4SpringContextTests {
	
	@Autowired
	LrxDaoImpl daoAdapter;
	
	@Autowired
	ConstituteService constitute;
	
	@Test
	public void addSubjectAndColleges() {
		String colleges[] = new String[]{
				 "萍乡学院"
				,"宜春学院"
				,"新余学院"
				,"南昌大学"
				,"江西师大"
		};
		
		String subjects[] = new String[]{
				 "数学"
				,"英语"
				,"C语言"
				,"Java语言"
				,"HTML/CSS"
		};
		
		for (int i = 0; i < subjects.length; i++) {
			Subject sub = new Subject();
			sub.setName(subjects[i]);
			try {
				daoAdapter.saveEntity(sub);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		for (int i = 0; i < colleges.length; i++) {
			College c = new College();
			c.setName(colleges[i]);
			try {
				daoAdapter.saveEntity(c);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@Test
	public void addUsers() {
		List<College> co = null;
		try {
			co = daoAdapter.findByHql("from College");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		//10个学生
		for (int i = 0; i < 10; i++) {
			User u = new User();
			u.setUserId("a" + i);
			u.setPsw("123");
			int cref = Tool.getIntRnd(co.size());
			u.setCollegeName(co.get(cref).getName());
			u.setCollegeRef(cref);
			u.setName("name" + i);
			try {
				daoAdapter.saveEntity(u);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@Test
	public void createQuestions() {
		List<Subject> sub = null;
		try {
			sub = daoAdapter.findByHql("from Subject");
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int i = 0; i < 200; i++) {
			addQeustion(i, sub);
		}
	}
	
	@Test
	public void createOptions() {
		List<Question> questionList;
		try {
			questionList = daoAdapter.findByHql("from Question");
			for (int i = 0; i < questionList.size(); i++) {
				addOptions(questionList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void addExams() {
		List<User> userLi = null;
		List<College> co = null;
		try {
			userLi = daoAdapter.findByHql("from User");
			co = daoAdapter.findByHql("from College");
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		for (int i = 0; i < 6; i++) {
			Exam e = new Exam();
			
			for (int j = 0; j < Tool.getIntRnd(co.size())+1; j++) {
				e.setInvitee(e.getInvitee()==null?"萍乡学院 ":e.getInvitee() + " "
						+ co.get(Tool.getIntRnd(co.size())).getName());
			}
			
			e.setTitle("考试名称" + (i+1));
			e.setState(0);
			e.setUserId(userLi.get(Tool.getIntRnd(userLi.size())).getUserId());
			e.setExplication("考试说明" + i);
			e.setTime(Tool.time());
			e.setPeriodStart(Tool.time());
			e.setPeriodEnd(Tool.time());
			try {
				e.setSid((Integer) daoAdapter.saveEntity(e));
				//fillPapers(e.getSid());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}
	
	@Test
	public void constitutePaper() {
		try {
			List<Exam> li = daoAdapter.findByHql("from Exam");
			
			List<Subject> sub = daoAdapter.findByHql("from Subject");
			
			for (int i = 0; i < li.size(); i++) {
				constutePaper(li.get(i).getSid(), sub.get(Tool.getIntRnd(sub.size())).getSid()
						, "试卷名称" + i, "admin");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void userDoQuestions() {
		
	}
	
	//题库
	private void addQeustion(int index, List<Subject> sub) {
		
		String qtype[] = new String[] {
				  Conf.Question_Single
				, Conf.Question_Multiple
				, Conf.Question_TrueOrFalse
				, Conf.Question_Fills
				, Conf.Question_Subjective
		};
		
		String rndType = qtype[Tool.getIntRnd(qtype.length)];
		Question q = new Question();
		q.setDifficultyValue(Tool.getIntRnd(4) + 1);
		q.setKnowledge("知识点" + index % 4);
		q.setTitle("题目标题" + index);
		q.setType(rndType);
		q.setUserId("admin");
		q.setSubjectRef(Tool.getIntRnd(sub.size()));
		q.setTime(Tool.time());
		try {
			q.setSid((Integer) daoAdapter.saveEntity(q));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private List<Option> addOptions(Question q) {
		List<Option> li = new ArrayList<Option>();
		int n = Tool.getIntRnd(5) + 2;
		System.out.println(n);
		for (int i = 0; i < n; i++) {
			Option o = new Option();
			int rnd1 = Tool.getIntRnd(10);
			int rnd2 = Tool.getIntRnd(10);
			int rst = Tool.getIntRnd(10)>7?(rnd1+rnd2):Tool.getIntRnd(90) + 10;
			
			if (Conf.Question_TrueOrFalse.equals(q.getType())) {
				o.setContent(rnd1 + "+" + rnd2 + "=" + rst + " 对吗?");
				o.setIsAnswer(rnd1+rnd2==rst?1:0);
			} else if (Conf.Question_Fills.equals(q.getType())) {
				o.setContent(rnd1 + "+" + rnd2 + "=" + "___");
				o.setFillsText(rst+"");
			} else if (Conf.Question_Subjective.equals(q.getType())) {
				o.setContent(rnd1 + "+" + rnd2 + "=" + rst + "成立吗？请说出理由");
				o.setSubjectiveText(rnd1 + "+" + rnd2 + "=" + rst + "，因为显而易见");
			} else {
				o.setContent(rnd1 + "+" + rnd2 + "=" + rst);
				o.setIsAnswer(rnd1+rnd2==rst?1:0);
			}
			
			o.setQuestionRef(q.getSid());
			o.setType(q.getType());
			li.add(o);
			try {
				daoAdapter.saveEntity(o);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return li;
	}
	
	//组卷
	private void constutePaper(int examRef, int subjectRef, String paperName, String responser) {
		ConstituteVO voSingle = new ConstituteVO();
		voSingle.setCount(15);
		voSingle.setDiff1Percent(50);
		voSingle.setDiff2Percent(40);
		voSingle.setDiff3Percent(5);
		voSingle.setDiff4Percent(5);
		voSingle.setDiff1Point(2);
		voSingle.setDiff2Point(2);
		voSingle.setDiff3Point(2);
		voSingle.setDiff4Point(2);
		
		ConstituteVO voMultiple = new ConstituteVO();
		voMultiple.setCount(5);
		voMultiple.setDiff1Percent(50);
		voMultiple.setDiff2Percent(30);
		voMultiple.setDiff3Percent(10);
		voMultiple.setDiff4Percent(10);
		voMultiple.setDiff1Point(4);
		voMultiple.setDiff2Point(4);
		voMultiple.setDiff3Point(4);
		voMultiple.setDiff4Point(4);
		
		ConstituteVO voTrueOrFalse = new ConstituteVO();
		voTrueOrFalse.setCount(10);
		voTrueOrFalse.setDiff1Percent(50);
		voTrueOrFalse.setDiff2Percent(30);
		voTrueOrFalse.setDiff3Percent(10);
		voTrueOrFalse.setDiff4Percent(10);
		voTrueOrFalse.setDiff1Point(4);
		voTrueOrFalse.setDiff2Point(4);
		voTrueOrFalse.setDiff3Point(4);
		voTrueOrFalse.setDiff4Point(4);
		
		ConstituteVO voFills = new ConstituteVO();
		voFills.setCount(5);
		voFills.setDiff1Percent(50);
		voFills.setDiff2Percent(30);
		voFills.setDiff3Percent(10);
		voFills.setDiff4Percent(10);
		voFills.setDiff1Point(4);
		voFills.setDiff2Point(4);
		voFills.setDiff3Point(4);
		voFills.setDiff4Point(4);
		
		ConstituteVO voSubjective = new ConstituteVO();
		voSubjective.setCount(4);
		voSubjective.setDiff1Percent(25);
		voSubjective.setDiff2Percent(25);
		voSubjective.setDiff3Percent(25);
		voSubjective.setDiff4Percent(25);
		voSubjective.setDiff1Point(8);
		voSubjective.setDiff2Point(12);
		voSubjective.setDiff3Point(13);
		voSubjective.setDiff4Point(15);
		
		constitute.createPaperAuto(examRef, subjectRef, paperName, Tool.time(), Tool.time()
				, responser, voSingle, voTrueOrFalse, voMultiple, voFills, voSubjective);
		
	}
	
}
