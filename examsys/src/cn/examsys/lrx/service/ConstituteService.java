package cn.examsys.lrx.service;

import cn.examsys.lrx.vo.ConstituteVO;

public interface ConstituteService {

	int createPaperAuto(int examSid, String title, String subject//考次id，标题，科目
			, String startTime, String endTime,//开始和结束时间
			ConstituteVO single, ConstituteVO trueOrFalse,
			ConstituteVO multiple, ConstituteVO fills, ConstituteVO subjective);
	
}
