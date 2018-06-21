package cn.examsys.lrx.service.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Grade;
import cn.examsys.bean.Option;
import cn.examsys.bean.Question;
import cn.examsys.bean.User;
import cn.examsys.common.Conf;
import cn.examsys.common.QuestionListTool;
import cn.examsys.lrx.dao.impl.PageDaoImpl;
import cn.examsys.lrx.service.ExamService;
import cn.examsys.lrx.service.PageService;

@Service("pageService")
@Transactional
public class PageServiceImpl implements PageService {
	
	@Autowired
	PageDaoImpl dao;
	
	@Override
	public List<Question> loadQuestionList(int sid) {
		return QuestionListTool.queryQuestionList(dao, sid);
	}

	@Override
	public List<Grade> loadGrades(User sessionUser, int page) {
		try {
			return dao.findByHql("from Grade where userId=? order by sid desc"
					, new Object[]{sessionUser.getUserId()}, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
