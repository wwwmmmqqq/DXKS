package cn.examsys.xy.dao;

import java.io.Serializable;
import java.util.List;

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;

public interface ItemBankDao {
	/*创建题目*/
	Serializable saveEntity(Question question);
	/*创建选项*/
	void saveOption(Option option);
	/*查看题库*/
	/**
	 * 教师查看题库
	 * @param userId
	 * @param page
	 * @return
	 */
	List<Question> selectItemQuestListByUserId(String userId,int page);
	/*教师题目列表总页数*/
	int selectItemQuestListToalPageByUserId(String userId);
	/**
	 * 管理员查看题库
	 * @param page
	 * @return
	 */
	List<Question> selectItemQuestList(int page);
	/*管理员题目列表总页数*/
	int selectItemQuestListToalPage();
	/*查看选项*/
	List<Option> selectItemOptionByQuestion(int sid);
	/**
	 * 按种类查看题目和总页数
	 * @param type
	 * @param page
	 * @return
	 */
	List<Question> selectItemQuestListByType(String type, int page);
	int selectItemQuestListToalPageByType(String type);
	/**
	 * 修改题库
	 * @param sid
	 * @return
	 */
	void editQuestion(Question question);
	void editOption(Option option);
	/**
	 * 显示一道题目根据题目的sid
	 * @param sid
	 * @return
	 */
	Question selectOneQuestionBySid(int sid);
	/**
	 * 根据题目id删除题库
	 * @param sid
	 */
	void deleteQuestion(Question question);
	void deleteOption(Option option);
	
	
	
}
