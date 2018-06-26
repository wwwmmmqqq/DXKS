package cn.examsys.lrx.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Constitute;
import cn.examsys.bean.Option;
import cn.examsys.bean.Paper;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.common.Conf;
import cn.examsys.common.QuestionListTool;
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
	public int createPaperAuto(int examRef, int subjectRef, String name
			, String examStart, String examEnd, String responser,
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
		
		try {
			paper.setTotalTime(Tool.secondsOf(examStart, examEnd));
		} catch (ParseException e) {
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
		
		//计算总分
		float totalScore = 0f;
		for (int i = 0; i < vos.length; i++) {
			totalScore += vos[i].getDiff1Percent() * vos[i].getDiff1Point() * vos[i].getCount();
			totalScore += vos[i].getDiff2Percent() * vos[i].getDiff2Point() * vos[i].getCount();
			totalScore += vos[i].getDiff3Percent() * vos[i].getDiff3Point() * vos[i].getCount();
			totalScore += vos[i].getDiff4Percent() * vos[i].getDiff4Point() * vos[i].getCount();
		}
		paper.setTotalScore((int) totalScore / 100);
		
		
		int paperSid = -1;
		try {
			paperSid = (Integer) dao.saveEntity(paper);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		//难度
		int difficulty_arr[] = new int[] {
				 Conf.Difficulty_1
				, Conf.Difficulty_2
				, Conf.Difficulty_3
				, Conf.Difficulty_4
		};
		
		
		for (int i = 0; i < vos.length; i++) {
			//四个难度对应的题目数量
			int diff_n_count_arr[] = {
					  Math.round(vos[i].getCount() * vos[i].getDiff1Percent()) / 100 
					, Math.round(vos[i].getCount() * vos[i].getDiff2Percent()) / 100 
					, Math.round(vos[i].getCount() * vos[i].getDiff3Percent()) / 100 
					, Math.round(vos[i].getCount() * vos[i].getDiff4Percent()) / 100 
			};
			System.out.println(type_arr[i] + "难度数量： " + Arrays.toString(diff_n_count_arr));
			
			//四个难度对应的题目分值
			int diff_n_point_arr[] = {
					 vos[i].getDiff1Point()
					,vos[i].getDiff2Point()
					,vos[i].getDiff3Point()
					,vos[i].getDiff4Point()
			};
			
			/**
			 * TODO
			 * 组卷 还需要一个条件
			 * 即 题目所属的科目
			 */
			int no = 0;//题目序号
			//遍历四个难度
			for (int j = 0; j < difficulty_arr.length; j++) {
				if (diff_n_count_arr[j] == 0) {
					continue;
				}
				List<Question> tmp = dao.findNByHql("from Question where type=? and difficultyValue=? ORDER BY RAND()"
						, new Object[]{type_arr[i], difficulty_arr[j]}
						, diff_n_count_arr[j]);
				
				Iterator<Question> it = tmp.iterator();
				while(it.hasNext()) {
					
					Question q = it.next();
					
					Constitute con = new Constitute();
					con.setNo(++no);//题目序号
					System.out.println(no);
					con.setPaperRef(paperSid);//试卷ID
					con.setQuestionRef(q.getSid());//指向题目
					con.setType(q.getType());//题目类型
					
					if (Conf.Question_Subjective.equals(q.getType())) {
						//解答题
						con.setResponsibleUser(responser);//负责批改此题目的教师
					}
					
					con.setPoint(diff_n_point_arr[j]);
					try {
						dao.saveEntity(con);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
			}
			
			
		}
		
		return paperSid;
	}

	private void Constitution(List<Question> list, int paperSid, int difficult, int point) throws Exception {
		for (int i = 0; i < list.size(); i++) {
			Question q = list.get(i);
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
	
	
	@Override
	public int createPaperHand(User sessionUser, List<Integer> qids, 
			List<Integer> points, List<String> userIds, String examStart,
			String examEnd, String name, int examRef, int subjectRef) {
		if (qids.size() != points.size()) {
			return -1;
		}
		Paper paper = new Paper();
		paper.setExamRef(examRef);
		paper.setName(name);
		paper.setSubjectRef(subjectRef);
		paper.setExamStart(examStart);
		paper.setExamEnd(examEnd);
		paper.setTime(Tool.time());//试卷创建时间
		
		try {
			paper.setSid((Integer) dao.saveEntity(paper));
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		for (int i = 0; i < qids.size(); i++) {
			Constitute con = new Constitute();
			con.setNo(i);
			con.setPaperRef(paper.getSid());
			con.setPoint(points.get(i));
			con.setQuestionRef(qids.get(i));
			con.setResponsibleUser(userIds.get(i));
			try {
				dao.saveEntity(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		try {
			return (Integer) dao.saveEntity(paper);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public List<Map<String, Integer>> loadQuestionCountByType(int subjectRef) {
		try {
			return dao.findByHql("select new Map(type as type, count(*) as count) from Question where subjectRef=? group by type"
					, new Object[]{subjectRef});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Question> searchQuestion(User sessionUser, List<String> keys, List<String> vals) {
		try {
			StringBuilder hql = new StringBuilder("from Question ");
			
			if (keys != null && keys.size() != 0) {
				hql.append(" where ");
			}
			for (int i = 0; vals!=null && i < vals.size(); i++) {
				vals.set(i, "%"+vals.get(i)+"%");
			}
			for (int i = 0; i < keys.size()-1; i++) {
				hql.append(keys.get(i) + "=?");
			}
			if (keys != null && keys.size() != 0) {
				hql.append(keys.get(keys.size()-1) + " like ?");
			}
			
			List<Question> questionList = dao.findByHql(hql.toString(), vals.toArray());
			
			String questionIds = "";
			for (int i = 0; i < questionList.size(); i++) {
				questionIds += questionList.get(i).getSid() + ",";
			}
			List<Option> optionList = dao.findByHql("from Option where locate(?, questionRef)>0"
					, new Object[]{questionIds});
			HashMap<Integer, List<Option>> mp = new HashMap<>();
			for (int i = 0; i < optionList.size(); i++) {
				if (mp.containsKey(optionList.get(i).getQuestionRef())) {
					mp.get(optionList.get(i).getQuestionRef()).add(optionList.get(i));
				} else {
					List<Option> li = new ArrayList<Option>();
					li.add(optionList.get(i));
					mp.put(optionList.get(i).getQuestionRef(), li);
				}
			}
			
			//将选项列表存入到Question对象中
			for (int i = 0; i < questionList.size(); i++) {
				questionList.get(i).setOptions(mp.get(questionList.get(i).getSid()));
			}
			
			//题目类型排序
			Collections.sort(questionList, new Comparator<Question>() {
				String type_arr[] = new String[] {
						 Conf.Question_Single
						,Conf.Question_Multiple
						,Conf.Question_TrueOrFalse
						,Conf.Question_Fills
						,Conf.Question_Subjective
				};
				int getTypeIndex(Question q) {
					for (int i = 0; i < type_arr.length; i++)
						if (type_arr[i].equals(q.getType()))
							return i;
					return 0;
				}
				@Override
				public int compare(Question o1, Question o2) {
					return -(getTypeIndex(o2) - getTypeIndex(o1));
				}
			});
			return questionList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
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

