package cn.examsys.lrx.service;

import cn.examsys.bean.User;
import cn.examsys.lrx.vo.ExamPageVO;

public interface ExamService {
	
	
	/**
	 * 开始考试
	 * @param user 登录的学生
	 * @param sid 试卷id
	 * @return 
	 */
	ExamPageVO startExam(User sessionUser, int sid);
}
