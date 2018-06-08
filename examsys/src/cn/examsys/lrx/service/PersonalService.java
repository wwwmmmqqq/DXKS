package cn.examsys.lrx.service;

import cn.examsys.bean.User;
import cn.examsys.lrx.vo.PersonalHomePageVO;

public interface PersonalService {
	
	PersonalHomePageVO loadHomePageDatas(User sessionUser);
	
	
}
