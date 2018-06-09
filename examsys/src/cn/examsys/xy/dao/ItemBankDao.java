package cn.examsys.xy.dao;

import java.io.Serializable;

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;

public interface ItemBankDao {
	/*创建题目*/
	Serializable saveEntity(Question question);
	/*创建选项*/
	void saveOption(Option option);
}
