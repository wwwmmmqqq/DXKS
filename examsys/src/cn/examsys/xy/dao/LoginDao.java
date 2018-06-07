package cn.examsys.xy.dao;

import java.io.Serializable;

import cn.examsys.bean.User;

public interface LoginDao {

	Serializable saveEntity(User user) throws Exception;

	/*User add(User user);*/
}
