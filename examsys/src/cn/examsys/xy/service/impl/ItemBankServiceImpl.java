package cn.examsys.xy.service.impl;

import java.io.Serializable;

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
	
	/*创建题目和选项*/
	/*@Override
	public boolean createItemBank(Question question, Option option,String userId) {
		// TODO Auto-generated method stub
		System.out.println("service的选项："+option.getContent());
		
		itemBankDao.saveQuestion(question);
		itemBankDao.saveOption(option);
		return true;
	}*/
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

}
