package cn.examsys.common;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import cn.examsys.adapters.IDaoAdapter;
import cn.examsys.bean.Option;
import cn.examsys.bean.Question;

public class QuestionListTool {
	public static List<Question> queryQuestionList(IDaoAdapter dao, int paperSid) {
		try {
			List<String> qlist = dao.findBySql("select questionRef from constitute_tb where paperRef=?", new Object[]{paperSid});
			
			String qRefs = Arrays.toString(qlist.toArray());
			
			List<Question> questionList = dao.findByHql("from Question where locate(sid, ?)>0"
					, new Object[]{qRefs});
			
			List<Option> optionList = dao.findByHql("from Option where locate(questionRef, ?)>0"
					, new Object[]{qRefs});
			
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
		}
		return null;
	}
	
	
	public static List<Question> fillOptionsFromQuestionList(IDaoAdapter dao, List<Question> questionList) {
		try {
			
			StringBuilder qRefs = new StringBuilder();
			
			for (int i = 0; i < questionList.size(); i++) {
				qRefs.append(questionList.get(i).getSid() + ",");
			}
			
			List<Option> optionList = dao.findByHql("from Option where locate(questionRef, ?)>0"
					, new Object[]{qRefs});
			
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
		}
		return null;
	}
}
