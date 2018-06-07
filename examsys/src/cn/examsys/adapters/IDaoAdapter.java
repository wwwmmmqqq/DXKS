package cn.examsys.adapters;

import java.io.Serializable;
import java.util.List;

import cn.examsys.bean.User;

public interface IDaoAdapter {
	
	/**
	 * 通过HQL和SQL查询
	 * @param hql sql 语句
	 * @param from_id 查询范围的开始
	 * @param len 查询范围的长度
	 * @return 返回一个泛型List
	 */
	public <T> List<T> findByHql(String hql,Object vals[],int page) throws Exception;
	public <T> List<T> findBySql(String sql,Object vals[],int page) throws Exception;
	public <T> List<T> findByHql(String hql,int page) throws Exception;
	public <T> List<T> findBySql(String sql,int page) throws Exception;
	public <T> List<T> findByHql(String hql,Object vals[]) throws Exception;
	public <T> List<T> findBySql(String sql,Object vals[]) throws Exception;
	public <T> List<T> findByHql(String hql) throws Exception;
	public <T> List<T> findBySql(String sql) throws Exception;
	
	/**
	 * 通过HQL和SQL查询单个
	 * @param hql sql 语句
	 * @param from_id 查询范围的开始
	 * @param len 查询范围的长度
	 * @return 返回一个泛型对象
	 */
	public <T> T findOneByHql(String hql,Object vals[]) throws Exception;
	public <T> T findOneBySql(String sql,Object vals[]) throws Exception;
	public <T> T findOneByHql(String hql) throws Exception;
	public <T> T findOneBySql(String sql) throws Exception;
	
	/**
	 * 通过HQL和SQL更新数据库
	 * @param hql sql 语句
	 * @param vals 问号的代替参数
	 */
	public void updateByHql(String hql,Object vals[]) throws Exception;
	public void updateBySql(String sql,Object vals[]) throws Exception;
	public void updateByHql(String hql) throws Exception;
	public void updateBySql(String sql) throws Exception;
	
	/**
	 * 保存实体
	 * @param entity
	 * @return
	 */
	public Serializable saveEntity(Object entity) throws Exception;
	public void deleteEntity(Object entity) throws Exception;
	public void updateEntity(Object entity) throws Exception;
	
}
