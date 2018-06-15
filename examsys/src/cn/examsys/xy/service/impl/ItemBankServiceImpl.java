package cn.examsys.xy.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.xy.dao.ItemBankDao;
import cn.examsys.xy.service.ItemBankService;
@Service("itemBankService")
@Transactional
public class ItemBankServiceImpl implements ItemBankService {
	@Autowired
	ItemBankDao itemBankDao;
	
	/********************创建题目和选项**********************/
	@Override
	public Integer createQuestion(Question question) {
		// TODO Auto-generated method stub
		System.out.println("service层："+question.getTitle());
		return (Integer) itemBankDao.saveEntity(question);
	}
	@Override
	public boolean createOption(Option option) {
		// TODO Auto-generated method stub
		itemBankDao.saveOption(option);
		return true;
	}
	
	/**************************查看题库**********************/
	/*老师查看*/
	@Override
	public List<Question> selectItemQuestionListByUserId(String userId,int page) {
		// TODO Auto-generated method stub
		return itemBankDao.selectItemQuestListByUserId(userId,page);
	}
	/*查看选项*/
	@Override
	public List<Option> selectItemOptionByQuestion(int sid) {
		// TODO Auto-generated method stub
		System.out.println("serviceceng");
		return itemBankDao.selectItemOptionByQuestion(sid);
	}
	/*教师题目列表总页数*/
	@Override
	public int selectItemQuestionListToalPageByUserId(String userId) {
		// TODO Auto-generated method stub
		return itemBankDao.selectItemQuestListToalPageByUserId(userId);
	}
	/*教务查看题库*/
	@Override
	public List<Question> selectItemQuestionList(int page) {
		// TODO Auto-generated method stub
		return itemBankDao.selectItemQuestList(page);
	}
	/*教务题目列表总页数*/
	@Override
	public int selectItemQuestionListToalPage() {
		// TODO Auto-generated method stub
		return itemBankDao.selectItemQuestListToalPage();
	}
	/*按种类显示题目列表*/
	@Override
	public List<Question> selectItemQuestionListByType(String type, int page) {
		// TODO Auto-generated method stub
		return itemBankDao.selectItemQuestListByType(type,page);
	}
	/*按种类显示题目列表总页数*/
	@Override
	public int selectItemQuestionListToalPageByType(String type) {
		// TODO Auto-generated method stub
		return itemBankDao.selectItemQuestListToalPageByType(type);
	}
	/*按种类和userId显示题目列表*/
	@Override
	public List<Question> selectTeacherItemQuestionListByType(String type, String userId, int page) {
		// TODO Auto-generated method stub
		return itemBankDao.selectTeacherItemQuestListByType(type,userId,page);
	}
	/*按种类和userId显示题目列表总页数*/
	@Override
	public int selectTeacherItemQuestionListToalPageByType(String type, String userId) {
		// TODO Auto-generated method stub
		return itemBankDao.selectTeacherItemQuestListToalPageByType(type,userId);
	}
	/************************修改题库****************************/
	@Override
	public boolean editQuestion(Question question) {
		// TODO Auto-generated method stub
		itemBankDao.editQuestion(question);
		return true;
	}
	@Override
	public boolean editOption(Option option) {
		// TODO Auto-generated method stub
		itemBankDao.editOption(option);
		return true;
	}
	/************************显示一道题目**************************/
	@Override
	public Question selectItemQuestion(int sid) {
		// TODO Auto-generated method stub
		return itemBankDao.selectOneQuestionBySid(sid);
	}
	/**************************删除题库**************************/
	@Override
	public boolean deleteQuestion(Question question) {
		// TODO Auto-generated method stub
		itemBankDao.deleteQuestion(question);
		return false;
	}
	@Override
	public boolean deleteOption(Option option) {
		// TODO Auto-generated method stub
		itemBankDao.deleteOption(option);
		return false;
	}
	
	
}
