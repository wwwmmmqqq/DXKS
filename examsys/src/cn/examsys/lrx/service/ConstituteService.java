package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.User;
import cn.examsys.lrx.vo.ConstituteVO;

public interface ConstituteService {

	int createPaperAuto(int examRef, int subjectRef, String name, 
			String examStart, String examEnd,
			ConstituteVO single, ConstituteVO trueOrFalse,
			ConstituteVO multiple, ConstituteVO fills, ConstituteVO subjective);

	int createPaperHand(User sessionUser, List<Integer> qids, int sid,
			List<Integer> points, String examStart, String examEnd,
			String name, int examRef, int subjectRef);
	
	
	
}
