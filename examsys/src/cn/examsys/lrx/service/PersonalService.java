package cn.examsys.lrx.service;

import cn.examsys.bean.User;
import cn.examsys.lrx.vo.PersonalHomePageVO;

public interface PersonalService {
	
	PersonalHomePageVO searchExamsBy(User sessionUser, String filed, String words);

	PersonalHomePageVO loadStuIndexDatas(User sessionUser);

	void updateStuInfos(User sessionUser, Object[] objects, Object[] objects2);
	
}
