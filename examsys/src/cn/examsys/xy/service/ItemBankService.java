package cn.examsys.xy.service;

import java.io.Serializable;

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;

public interface ItemBankService {
	/*添加题库*/
	Integer createQuestion(Question question);
	boolean createOption(Option option);
}
