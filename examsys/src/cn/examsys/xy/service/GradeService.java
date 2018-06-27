package cn.examsys.xy.service;

import cn.examsys.bean.Grade;

public interface GradeService {
	/*根据userId查询grade*/
	Grade findGradeByUserId(String userId);
}
