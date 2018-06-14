package cn.examsys.xy.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.xy.dao.ItemBankDao;
@Repository("itemBankDao")
public class ItemBankDaoImpl extends DaoAdapter implements ItemBankDao {
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
	
}
