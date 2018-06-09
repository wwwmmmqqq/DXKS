package cn.examsys.adapters;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import cn.examsys.bean.User;

/**
 * 所有的DAO实现类都应该继承自DaoAdapter
 */

public class DaoAdapter implements IDaoAdapter {
	public static int COUNT_PER_PAGE = 10;
	
	@Autowired
	protected HibernateTemplate hibernateTemplate;
	
	public <T> List<T> findByHql(String hql, Object[] vals, int page) throws Exception {
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
		
		if(page>0) {
			query.setFirstResult((page-1)*COUNT_PER_PAGE);
			query.setMaxResults(COUNT_PER_PAGE);
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
	
	public <T> List<T> findBySql(String sql, Object[] vals, int page) throws Exception {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		org.hibernate.Transaction tx = session.beginTransaction(); 
		
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
		
		if(page>0) {
			query.setFirstResult((page-1)*COUNT_PER_PAGE);
			query.setMaxResults(COUNT_PER_PAGE);
		}
		
		try {
			tx.commit();
			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			throw e;
		} finally {
			session.close(); 
		}
		
	}
	public <T> List<T> findByHql(String hql, int page) throws Exception {
		return findByHql(hql, null, page);
	}
	public <T> List<T> findBySql(String sql, int page) throws Exception {
		return findBySql(sql, null, page);
	}
	public <T> List<T> findByHql(String hql, Object[] vals) throws Exception {
		return findByHql(hql, vals, 0);
	}
	public <T> List<T> findBySql(String sql, Object[] vals) throws Exception {
		return findBySql(sql, vals, 0);
	}
	public <T> List<T> findByHql(String hql) throws Exception {
		return findByHql(hql, null, 0);
	}
	public <T> List<T> findBySql(String sql) throws Exception {
		return findBySql(sql, null, 0);
	}
	
	
	public <T> T findOneByHql(String hql, Object[] vals) throws Exception {
		List<T> li = findByHql(hql, vals, 0);
		if(li.size()>0)
			return li.get(0);
		return null;
	}
	public <T> T findOneBySql(String sql, Object[] vals) throws Exception {
		List<T> li = findBySql(sql, vals, 0);
		if(li.size()>0)
			return li.get(0);
		return null;
	}
	public <T> T findOneByHql(String hql) throws Exception {
		List<T> li = findByHql(hql, null, 0);
		if(li.size()>0)
			return li.get(0);
		return null;
	}
	public <T> T findOneBySql(String sql) throws Exception {
		List<T> li = findBySql(sql, null, 0);
		if(li.size()>0)
			return li.get(0);
		return null;
	}
	
	public void updateByHql(String hql, Object[] vals) throws Exception {
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
		query.executeUpdate();
		try {
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}
	public void updateBySql(String sql, Object[] vals) throws Exception {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		org.hibernate.Transaction tx = session.beginTransaction();
		
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
		
		try {
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}
	public void updateByHql(String hql) throws Exception {
		updateByHql(hql, null);
	}
	public void updateBySql(String sql) throws Exception {
		updateBySql(sql, null);
	}
	public Serializable saveEntity(Object entity) throws Exception {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		org.hibernate.Transaction tx = session.beginTransaction();
		//Serializable seri = hibernateTemplate.save(entity);
		Serializable seri = session.save(entity);
		try {
			tx.commit();
			return seri;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}
	public void deleteEntity(Object entity) throws Exception {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		org.hibernate.Transaction tx = session.beginTransaction();
		session.delete(entity);
		try {
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}
	public void updateEntity(Object entity) throws Exception {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		org.hibernate.Transaction tx = session.beginTransaction();
		session.update(entity);
		try {
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T findEntity(Class<?> claz, Serializable id) {
		String primaryKey = getEntityPrimaryKey(claz);
		if (primaryKey == null) {
			System.out.println(claz.getName() + "无主键");
			return null;
		}
		try {
			return (T) findOneByHql("from " +claz.getName()+ " where " + primaryKey + "=?", new Object[]{id});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void deleteEntity(Class<?> claz, Serializable id) throws Exception {
		String primaryKey = getEntityPrimaryKey(claz);
		if (primaryKey == null) {
			System.out.println(claz.getName() + "无主键");
			return;
		}
		if ((id+"").contains("'")) {
			System.out.println("非法值");
			return;
		}
		System.out.println("delete from " + claz.getName() + " where " + primaryKey + "='" + id + "'");
		updateByHql("delete from " + claz.getName() + " where " + primaryKey + "=?", new Object[]{id});
	}

	@Override
	public void updateEntity(Class<?> claz, Serializable id, String[] fieldNames, Object[] values) throws Exception {
		if (fieldNames == null || fieldNames.length == 0) {
			return;
		}
		String primaryKey = getEntityPrimaryKey(claz);
		if (primaryKey == null) {
			System.out.println(claz.getName() + "无主键");
			return;
		}
		if ((id+"").contains("'")) {
			System.out.println("非法值");
			return;
		}
		
		StringBuilder hql = new StringBuilder("update " + claz.getName() + " set ");
		for (int i = 0; i < fieldNames.length-1; i++) {
			hql.append(fieldNames[i] + "=?,");
		}
		
		hql.append(fieldNames[fieldNames.length-1] + "=? where " + primaryKey + "='" + id + "'");
		
		updateByHql(hql.toString(), values);
		
	}
	
	@Override
	public void updateEntity(Class<?> claz, Serializable id
			, String fieldName, Object value) throws Exception {
		updateEntity(claz, id, new String[]{fieldName}, new Object[]{value});
	}
	
	/**
	 * 获取某个类的主键
	 * @param claz 类
	 * @return
	 */
	private static String getEntityPrimaryKey(Class<?> claz) {
		Field[] fs = claz.getDeclaredFields();
		for (int i = 0; i < fs.length; i++) {
			if (fs[i].getAnnotation(javax.persistence.Id.class) != null) {
				return fs[i].getName();
			}
		}
		return null;
	}
}
