package cn.examsys.lrx.service.impl;

import java.text.ParseException;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Constitute;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.common.Conf;
import cn.examsys.common.Tool;
import cn.examsys.lrx.dao.impl.ConstituteDaoImpl;
import cn.examsys.lrx.service.ConstituteService;
import cn.examsys.lrx.vo.ConstituteVO;

@Service("constituteService")
@Transactional
public class ConstituteServiceImpl implements ConstituteService {
	
	@Autowired
	ConstituteDaoImpl dao;
	
	@Override
	public int createPaperAuto(int examRef, int subjectRef, String name,
			int totalScore, String examStart, String examEnd,
			ConstituteVO single, ConstituteVO trueOrFalse,
			ConstituteVO multiple, ConstituteVO fills, ConstituteVO subjective) {
		
		//创建试卷
		Paper paper = new Paper();
		paper.setExamRef(examRef);
		paper.setName(name);
		paper.setSubjectRef(subjectRef);
		paper.setExamStart(examStart);
		paper.setExamEnd(examEnd);
		paper.setTime(Tool.time());//试卷创建时间
		paper.setTotalScore(totalScore);
		try {
			System.out.println("TotalTime：" + Tool.secondsOf(examStart, examEnd));
			paper.setTotalTime(Tool.secondsOf(examStart, examEnd));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int paperSid = -1;
		try {
			paperSid = (Integer) dao.saveEntity(paper);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//开始组卷
		//List<Question> list = new ArrayList<>();
		//题目类型
		String type_arr[] = new String[] {
				 Conf.Question_Single
				,Conf.Question_Multiple
				,Conf.Question_TrueOrFalse
				,Conf.Question_Fills
				,Conf.Question_Subjective
		};
		
		ConstituteVO vos[] = new ConstituteVO[] {
				single, multiple, trueOrFalse, fills, subjective
		};
		
		//难度
		int difficulty_arr[] = new int[] {
				 Conf.Difficulty_1
				,Conf.Difficulty_2
				,Conf.Difficulty_3
				,Conf.Difficulty_4
		};
		
		for (int i = 0; i < vos.length; i++) {
			
			//四个难度对应的题目数量
			int diff_n_count_arr[] = {
					 vos[i].getCount() * vos[i].getDiff1Percent()
					,vos[i].getCount() * vos[i].getDiff2Percent()
					,vos[i].getCount() * vos[i].getDiff3Percent()
					,vos[i].getCount() * vos[i].getDiff4Percent()
			};
			
			//四个难度对应的题目分值
			int diff_n_point_arr[] = {
					 vos[i].getDiff1Point()
					,vos[i].getDiff2Point()
					,vos[i].getDiff3Point()
					,vos[i].getDiff4Point()
			};
			
			//遍历四个难度
			for (int j = 0; j < difficulty_arr.length; j++) {
				
				//List<Question> tmp = dao.findNByHql("from Question where subjectRef=? and type=? and difficultyValue=? ORDER BY RAND()"
				List<Question> tmp = dao.findNByHql("from Question where type=? and difficultyValue=? ORDER BY RAND()"
						, new Object[] {
								/*subjectRef 
								,*/ type_arr[i] //题目类型
								, difficulty_arr[j] //难度
						} , diff_n_count_arr[j]);//数量
				//设置   题目序号，某题目类型某难度的分值  
				//并且插入到数据库
				try {
					Constitution(tmp, paperSid, difficulty_arr[j], diff_n_point_arr[j]);
				} catch (Exception e) {
					e.printStackTrace();
					return -1;
				}
				
			}
		}
		
		return paperSid;
	}

	private void Constitution(List<Question> list, int paperSid, int difficult, int point) throws Exception {
		for (int i = 0; i < list.size(); i++) {
			Question q = list.get(i);
			System.out.print("==>" + q.getSid() + " " + q.getType() + " " + difficult + " " + point + ",");
			//插入一条组卷数据
			Constitute con = new Constitute();
			con.setNo(i+1);//题目序号
			con.setPaperRef(paperSid);//试卷ID
			con.setQuestionRef(q.getSid());//指向题目
			con.setType(q.getType());//题目类型
			//con.setResponsibleUser(null);//负责批改此题目的教师
			con.setPoint(point);
			
			dao.saveEntity(con);
		}
		System.out.println();
	}
	
	
	/*try {
	int single_d1_count = single.getCount() * single.getDiff1();
	if (single_d1_count > 0) {
		tmp = dao.findNByHql("from Question where subjectRef=? and type=? and difficulty=? ORDER BY RAND()"
				, new Object[] {subjectRef, Conf.Question_Single, Conf.Difficulty_1}, single_d1_count);
		list.addAll(tmp);
		tmp = null;
	}
	
	int single_d2_count = single.getCount() * single.getDiff2();
	if (single_d2_count > 0) {
		tmp = dao.findNByHql("from Question where subjectRef=? and difficulty=? ORDER BY RAND()"
				, new Object[] {subjectRef, Conf.Difficulty_1}, single_d2_count);
		list.addAll(tmp);
		tmp = null;
	}
	
	int single_d3_count = single.getCount() * single.getDiff3();
	tmp = dao.findNByHql("from Question where subjectRef=? and difficulty=? ORDER BY RAND()"
			, new Object[] {subjectRef, Conf.Difficulty_1}, single_d3_count);
	list.addAll(tmp);
	tmp = null;
	
	int single_d4_count = single.getCount() * single.getDiff4();
	tmp = dao.findNByHql("from Question where subjectRef=? and difficulty=? ORDER BY RAND()"
			, new Object[] {subjectRef, Conf.Difficulty_1}, single_d4_count);
	list.addAll(tmp);
	tmp = null;
	
} catch (Exception e) {
	e.printStackTrace();
}*/

}
