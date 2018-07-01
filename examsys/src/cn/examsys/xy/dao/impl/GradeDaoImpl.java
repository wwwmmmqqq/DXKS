package cn.examsys.xy.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Grade;
import cn.examsys.xy.dao.GradeDao;
@Repository(value="gradeDao")
public class GradeDaoImpl extends DaoAdapter implements GradeDao {

	@Override
	public Grade findGradeByUserId(String userId) {
		// TODO Auto-generated method stub
		String hql= "from Grade where userId=?";
		try {
			return findOneByHql(hql, new Object[]{userId});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Grade> findAllgrade(int paperRef) {
		// TODO Auto-generated method stub
		String hql="from Grade where paperRef=? order by point desc";
		try {
			return findByHql(hql, new Object[]{paperRef});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
