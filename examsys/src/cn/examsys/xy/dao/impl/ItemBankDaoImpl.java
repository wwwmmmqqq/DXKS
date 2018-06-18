package cn.examsys.xy.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.bean.Role;
import cn.examsys.xy.dao.ItemBankDao;
@Repository("itemBankDao")
public class ItemBankDaoImpl extends DaoAdapter implements ItemBankDao {
	
	/**********************添加题库**********************/
	/*创建题目*/
	@Override
	public Serializable saveEntity(Question question){
		// TODO Auto-generated method stub
		try {
			return super.saveEntity(question);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*创建选项*/
	@Override
	public void saveOption(Option option) {
		// TODO Auto-generated method stub
		try {
			saveEntity(option);
			System.out.println(option.getContent());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*************************查看题库***********************/
	/*老师查看*/
	@Override
	public List<Question> selectItemQuestListByUserId(String userId, int page) {
		// TODO Auto-generated method stub
		String hql="from Question where userId=?";
		Object[] vals=new Object[]{userId};
		try {
			List<Question> questionList=findByHql(hql, vals, page);
			return questionList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*查看选项*/
	@Override
	public List<Option> selectItemOptionByQuestion(int sid) {
		// TODO Auto-generated method stub
		String hql="from Option where questionRef=?";
		Object[] vals=new Object[]{sid};
		try {
			return findByHql(hql, vals);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*查看一道选项*/
	@Override
	public Option selectOneOptionBySid(int sid) {
		// TODO Auto-generated method stub
		String hql="from Option where sid=?";
		Object[] vals=new Object[]{sid};
		try {
			return findOneByHql(hql, vals);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*教师题目列表总页数*/
	@Override
	public int selectItemQuestListToalPageByUserId(String userId) {
		// TODO Auto-generated method stub
		String hql="from Question where userId=?";
		Object[] vals=new Object[]{userId};
		try {
			List<Question> questionList=findByHql(hql, vals);
			int count=questionList.size();
			int totalPage=(int) Math.ceil((count*1.0)/COUNT_PER_PAGE);
			return totalPage;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	/*教务查看*/
	@Override
	public List<Question> selectItemQuestList(int page) {
		// TODO Auto-generated method stub
		String hql="from Question";
		try {
			List<Question> questionList=findByHql(hql , page);
			return questionList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/*教务题目列表总页数*/
	@Override
	public int selectItemQuestListToalPage() {
		// TODO Auto-generated method stub
		String hql="from Question";
		try {
			List<Question> questionList=findByHql(hql);
			int count=questionList.size();
			int totalPage=(int) Math.ceil((count*1.0)/COUNT_PER_PAGE);
			return totalPage;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	/*按种类查看题目和总页数*/
	@Override
	public List<Question> selectItemQuestListByType(String type, int page) {
		// TODO Auto-generated method stub
		String hql="from Question where type=?";
		Object[] vals=new Object[]{type};
		try {
			List<Question> questionList=findByHql(hql, vals, page);
			return questionList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public int selectItemQuestListToalPageByType(String type) {
		// TODO Auto-generated method stub
		String hql="from Question where type=?";
		Object[] vals=new Object[]{type};
		try {
			List<Question> questionList=findByHql(hql, vals);
			int count=questionList.size();
			int totalPage=(int) Math.ceil((count*1.0)/COUNT_PER_PAGE);
			return totalPage;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	/*按种类和UserID查看题目和总页数*/
	@Override
	public List<Question> selectTeacherItemQuestListByType(String type, String userId, int page) {
		// TODO Auto-generated method stub
		String hql="from Question where type=? and userId=?";
		Object[] vals=new Object[]{type,userId};
		try {
			List<Question> questionList=findByHql(hql, vals, page);
			return questionList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public int selectTeacherItemQuestListToalPageByType(String type, String userId) {
		// TODO Auto-generated method stub
		String hql="from Question where type=? and userId=?";
		Object[] vals=new Object[]{type,userId};
		try {
			List<Question> questionList=findByHql(hql, vals);
			int count=questionList.size();
			int totalPage=(int) Math.ceil((count*1.0)/COUNT_PER_PAGE);
			return totalPage;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	/*************************修改题库***********************/
	@Override
	public void editQuestion(Question question) {
		// TODO Auto-generated method stub
		try {
			updateEntity(question);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}/*updateEntity(question, sid, fieldNames, values);*/
	}
	@Override
	public void editOption(Option option) {
		// TODO Auto-generated method stub
		try {
			updateEntity(option);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*************************显示一道题目根据Id*********************/
	@Override
	public Question selectOneQuestionBySid(int sid) {
		// TODO Auto-generated method stub
		String hql="from Question where sid=?";
		Object[] vals=new Object[]{sid};
		try {
			return findOneByHql(hql, vals);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/**************************删除题库************************/
	@Override
	public void deleteQuestion(Question question) {
		// TODO Auto-generated method stub
		try {
			deleteEntity(question);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void deleteOption(Option option) {
		// TODO Auto-generated method stub
		try {
			deleteEntity(option);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
