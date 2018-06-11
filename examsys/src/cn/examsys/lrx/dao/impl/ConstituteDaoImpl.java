package cn.examsys.lrx.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.lrx.dao.ConstituteDao;

@Repository("constituteDao")
public class ConstituteDaoImpl extends DaoAdapter implements ConstituteDao {
	
	public <T> List<T> findNByHql(String hql, Object[] vals, int count) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		org.hibernate.Transaction tx = session.beginTransaction(); 
		Query query = session.createQuery(hql);
		if(vals != null) {
			for(int i=0;i<vals.length;i++) {
				if(vals[i] instanceof Integer) {
					query.setInteger(i, (Integer)vals[i]);
				} else {
					query.setString(i, vals[i].toString());
				}
			}
		}
		if(count > 0) {
			query.setFirstResult(0);
			query.setMaxResults(count);
		}
		try {
			tx.commit();
			return query.list();
		} catch (Exception e) {
			tx.rollback();
			throw e;
		} finally {
			session.close(); 
		}
	}
	
}
