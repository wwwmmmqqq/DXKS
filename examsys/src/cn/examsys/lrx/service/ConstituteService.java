package cn.examsys.lrx.service;

import java.util.List;
import java.util.Map;

import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.lrx.vo.ConstituteVO;

public interface ConstituteService {

	int createPaperAuto(int examRef, int subjectRef, String name, 
			String examStart, String examEnd, String responser,
			ConstituteVO single, ConstituteVO trueOrFalse,
			ConstituteVO multiple, ConstituteVO fills, ConstituteVO subjective);

	int createPaperHand(User sessionUser, List<Integer> qids, int sid,
			List<Integer> points, String examStart, String examEnd,
			String name, int examRef, int subjectRef);

	List<Map<String, Integer>> loadQuestionCountByType(int subjectRef);

	List<Question> searchQuestion(User sessionUser, List<String> keys, List<String> values);

}
