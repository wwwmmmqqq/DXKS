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

import cn.examsys.bean.Exam;
import cn.examsys.bean.Option;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.common.Conf;
import cn.examsys.common.Tool;
import cn.examsys.lrx.dao.impl.LrxDaoImpl;
import cn.examsys.lrx.service.ConstituteService;
import cn.examsys.lrx.vo.ConstituteVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"/applicationContext.xml"})
public class Exam_Paper_DataInsert extends AbstractJUnit4SpringContextTests {
	
	@Autowired
	LrxDaoImpl daoAdapter;
	
	@Autowired
	ConstituteService constitute;
	
	@Test
	public void addExams() {
		for (int i = 0; i < 6; i++) {
			Exam e = new Exam();
			e.setInvitee("萍乡学院");
			e.setTitle("XXX考试" + (i+1));
			e.setUserId("admin");
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
	public void createQuestions() {
		for (int i = 0; i < 50; i++) {
			addQeustion(i);
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
	public void constitutePaper() {
		try {
			List<Exam> li = daoAdapter.findByHql("from Exam");
			for (int i = 0; i < li.size(); i++) {
				constutePaper(li.get(i).getSid());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//题库
	private void addQeustion(int index) {
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
	private void constutePaper(int examRef) {
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
		
		constitute.createPaperAuto(examRef, 1, "XXX试卷", Tool.time(), Tool.time()
				, voSingle, voTrueOrFalse, voMultiple, voFills, voSubjective);
		
	}

	private void fillPaper(int sid) {
		int paperCount = Tool.getIntRnd(13) + 1;//随机数量
		for (int i = 0; i < paperCount; i++) {
			
			/*constitute.createPaperAuto(sid, 1, "XX试卷" + i, 120, Tool.time(), Tool.time()
					, single, trueOrFalse, multiple, fills, subjective);*/
			/*Paper paper = new Paper();
			paper.setExamRef(sid);
			paper.setExamStart(Tool.time());
			paper.setExamEnd(Tool.time());
			paper.setName("模拟考试" + i);
			paper.setTotalScore(120);
			paper.setTotalTime(120 * 60);
			paper.setTime(Tool.time());
			try {
				paper.setSid((Integer) daoAdapter.saveEntity(paper));
			} catch (Exception e1) {
				e1.printStackTrace();
			}*/
		}
	}
	
}
