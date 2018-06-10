package cn.examsys.lrx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Exam;
import cn.examsys.bean.Paper;
import cn.examsys.lrx.dao.impl.ConstituteDaoImpl;
import cn.examsys.lrx.service.ConstituteService;
import cn.examsys.lrx.vo.ConstituteVO;

@Service("constituteService")
@Transactional
public class ConstituteServiceImpl implements ConstituteService {
	
	@Autowired
	ConstituteDaoImpl dao;

	@Override
	public int createPaperAuto(int examSid, String title, String subject,
			String startTime, String endTime, ConstituteVO single,
			ConstituteVO trueOrFalse, ConstituteVO multiple,
			ConstituteVO fills, ConstituteVO subjective) {
		
		//拿到考次
		Exam exam = dao.findEntity(Exam.class, examSid);
		
		//创建试卷
		Paper paper = new Paper();
		paper.setExamRef(examSid);
		paper.setName(title);
		return 0;
	}
	
}
