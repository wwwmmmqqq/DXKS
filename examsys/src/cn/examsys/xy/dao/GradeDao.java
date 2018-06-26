package cn.examsys.xy.dao;

import java.util.List;

import cn.examsys.bean.Grade;

public interface GradeDao {
	/*根据userId查询grade*/
	Grade findGradeByUserId(String userId);
	
	List<Grade> findAllgrade(int paperRef);
}
