package cn.examsys.lrx.service;

import cn.examsys.lrx.vo.ConstituteVO;

public interface ConstituteService {

	int createPaperAuto(int examRef, int subjectRef, String name, 
			String examStart, String examEnd,
			ConstituteVO single, ConstituteVO trueOrFalse,
			ConstituteVO multiple, ConstituteVO fills, ConstituteVO subjective);
	
}
