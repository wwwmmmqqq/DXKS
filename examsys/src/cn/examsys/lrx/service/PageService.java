package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.Question;
import cn.examsys.bean.User;

public interface PageService {

	List<Question> loadQuestionList(int sid);

}
