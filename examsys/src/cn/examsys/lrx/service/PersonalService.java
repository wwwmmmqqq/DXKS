package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.Grade;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.lrx.vo.PersonalHomePageVO;

public interface PersonalService {
	
	PersonalHomePageVO searchExamsBy(User sessionUser, String filed, String words);

	PersonalHomePageVO loadStuIndexDatas(User sessionUser);

	void updateStuInfos(User sessionUser, Object[] objects, Object[] objects2);

	List<Grade> loadGradeList(User sessionUser, int page);

	boolean updatePsw(User sessionUser, String oldPsw, String newPsw);

	List<Question> loadResponsibleQuestions(User sessionUser, int page);

}
