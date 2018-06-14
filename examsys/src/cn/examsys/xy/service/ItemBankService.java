package cn.examsys.xy.service;

import java.io.Serializable;
import java.util.List;

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;

public interface ItemBankService {
	/*添加题库*/
	Integer createQuestion(Question question);
	boolean createOption(Option option);
	
	/*查看题库*/
	/**
	 * 教师查看题库和总页数
	 * @param userId
	 * @param page
	 * @return
	 */
	List<Question> selectItemQuestionListByUserId(String userId, int page);
	/*教师题目列表总页数*/
	int selectItemQuestionListToalPageByUserId(String userId);
	/**
	 * 管理员查看题库和总页数
	 * @param userId
	 * @return
	 */
	List<Question> selectItemQuestionList(int page);
	/*管理员题目列表总页数*/
	int selectItemQuestionListToalPage();
	/*查看选项*/
	List<Option> selectItemOptionByQuestion(int sid);
	/**
	 * 按题目类型查看题库和总页数
	 * @param type
	 * @param page
	 * @return
	 */
	List<Question> selectItemQuestionListByType(String type, int page);
	int selectItemQuestionListToalPageByType(String type);
	/**
	 * 修改题库
	 * @param sid
	 * @return
	 */
	boolean editQuestion(Question question);
	boolean editOption(Option option);
	/**
	 * 根据sid显示一道题目
	 * @param sid
	 * @return
	 */
	Question selectItemQuestion(int sid);
	/**
	 * 根据题目id删除题库
	 * @param sid
	 * @return
	 */
	boolean deleteQuestion(Question question);
	boolean deleteOption(Option option);
	
	/**
	 * 老师查看自己的题目
	 * @param type
	 * @param userId
	 * @param page
	 * @return
	 */
	List<Question> selectTeacherItemQuestionListByType(String type, String userId, int page);
	int selectTeacherItemQuestionListToalPageByType(String type, String userId);
}
