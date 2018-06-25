package cn.examsys.adapters;

import java.io.Serializable;
import java.util.List;

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
	
	/**
	 * 通过ID拿到实体
	 * @param id
	 * @return
	 */
	public <T> T findEntity(Class<?> claz, Serializable id);
	/**
	 * 通过ID删除实体
	 * @param id
	 * @return
	 * @throws Exception 
	 */
	public void deleteEntity(Class<?> claz, Serializable id) throws Exception;
	
	/**
	 * 更新某个实体的某些字段的值
	 * @param claz 实体类
	 * @param id 主键
	 * @param fieldNames 字段名数组
	 * @param values 值数组
	 * @throws Exception
	 */
	public void updateEntity(Class<?> claz, Serializable id, Object[] fieldNames, Object[] values) throws Exception;
	
	/**
	 * 更新某个实体的单个字段的值
	 * @param claz 实体类
	 * @param id 主键
	 * @param fieldName 字段名
	 * @param value 值数
	 * @throws Exception
	 */
	public void updateEntity(Class<?> claz, Serializable id, String fieldName, Object value) throws Exception;
	
}
