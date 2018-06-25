package cn.examsys.xy.dao;

import cn.examsys.bean.Grade;

public interface GradeDao {
	/*根据userId查询grade*/
	Grade findGradeByUserId(String userId);
}
