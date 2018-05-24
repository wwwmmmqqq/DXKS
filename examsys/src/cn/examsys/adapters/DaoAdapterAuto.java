package cn.examsys.adapters;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

public class DaoAdapterAuto implements IDaoAdapter {
	
	@Autowired
	protected HibernateTemplate hibernateTemplate;
	
	@Override
	public IDaoAdapter getDaoAdapter() {
		return this;
	}

	Session session;
	org.hibernate.Transaction tx;
	
	public <T> List<T> findByHql(String hql, Object[] vals, int from_id, int len) throws Exception {
		session = hibernateTemplate.getSessionFactory().openSession();
		tx = session.beginTransaction(); 
		
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
		
		if(len>0) {
			query.setFirstResult(from_id);
			query.setMaxResults(len);
		}
		return query.list();
	}
	public <T> List<T> findBySql(String sql, Object[] vals, int from_id, int len) throws Exception {
		session = hibernateTemplate.getSessionFactory().openSession();
		tx = session.beginTransaction(); 
		
		SQLQuery query = session.createSQLQuery(sql);
		if(vals != null) {
			for(int i=0;i<vals.length;i++) {
				if(vals[i] instanceof Integer) {
					query.setInteger(i, (Integer) vals[i]);
				} else {
					query.setString(i, vals[i].toString());
				}
			}
		}
		
		if(len>0) {
			query.setFirstResult(from_id);
			query.setMaxResults(len-1);
		}
		return query.list();
	}
	public <T> List<T> findByHql(String hql, int from_id, int len) throws Exception {
		return findByHql(hql, null, from_id, len);
	}
	public <T> List<T> findBySql(String sql, int from_id, int len) throws Exception {
		return findBySql(sql, null, from_id, len);
	}
	public <T> List<T> findByHql(String hql, Object[] vals) throws Exception {
		return findByHql(hql, vals, 0, 0);
	}
	public <T> List<T> findBySql(String sql, Object[] vals) throws Exception {
		return findBySql(sql, vals, 0, 0);
	}
	public <T> List<T> findByHql(String hql) throws Exception {
		return findByHql(hql, null, 0, 0);
	}
	public <T> List<T> findBySql(String sql) throws Exception {
		return findBySql(sql, null, 0, 0);
	}
	
	
	public <T> T findOneByHql(String hql, Object[] vals) throws Exception {
		List<T> li = findByHql(hql, vals, 0, 1);
		if(li.size()>0)
			return li.get(0);
		return null;
	}
	public <T> T findOneBySql(String sql, Object[] vals) throws Exception {
		List<T> li = findBySql(sql, vals, 0, 1);
		if(li.size()>0)
			return li.get(0);
		return null;
	}
	public <T> T findOneByHql(String hql) throws Exception {
		List<T> li = findByHql(hql, null, 0, 1);
		if(li.size()>0)
			return li.get(0);
		return null;
	}
	public <T> T findOneBySql(String sql) throws Exception {
		List<T> li = findBySql(sql, null, 0, 1);
		if(li.size()>0)
			return li.get(0);
		return null;
	}
	
	public void updateByHql(String hql, Object[] vals) throws Exception {
		session = hibernateTemplate.getSessionFactory().openSession();
		
		tx = session.beginTransaction(); 
		
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
		query.executeUpdate();
	}
	public void updateBySql(String sql, Object[] vals) throws Exception {
		session = hibernateTemplate.getSessionFactory().openSession();
		tx = session.beginTransaction();
		
		SQLQuery query = session.createSQLQuery(sql);
		if(vals != null) {
			for(int i=0;i<vals.length;i++) {
				if(vals[i] instanceof Integer) {
					query.setInteger(i, (Integer)vals[i]);
				} else {
					query.setString(i, vals[i].toString());
				}
			}
		}
		query.executeUpdate();
	}
	public void updateByHql(String hql) throws Exception {
		updateByHql(hql, null);
	}
	public void updateBySql(String sql) throws Exception {
		updateBySql(sql, null);
	}
	public Serializable saveEntity(Object entity) throws Exception {
		session = hibernateTemplate.getSessionFactory().openSession();
		tx = session.beginTransaction();
		//Serializable seri = hibernateTemplate.save(entity);
		Serializable seri = session.save(entity);
		return seri;
	}
	public void deleteEntity(Object entity) throws Exception {
		session = hibernateTemplate.getSessionFactory().openSession();
		tx = session.beginTransaction();
		session.delete(entity);
	}
	public void updateEntity(Object entity) throws Exception {
		session = hibernateTemplate.getSessionFactory().openSession();
		tx = session.beginTransaction();
		session.update(entity);
	}
	
	public void invalidate() throws Exception {
		
		if (tx == null) {
			throw new Exception("tx is null exception");
		} else if (session == null) {
			throw new Exception("session is null exception");
		}
		
		try {
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			throw e;
		} finally {
			session.close();
			tx = null;
			session = null;
		}
	}
	
	@Override
	public void updateFields(Class<?> claz, String fields[], Object values[]) throws Exception {
		
	}
	
}
