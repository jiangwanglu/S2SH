package com.myapp.common.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlRowSetResultSetExtractor;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import com.myapp.common.service.IBaseService;
import com.myapp.common.utils.BeanUtil;
import com.myapp.common.utils.GenericsUtils;
import com.myapp.common.utils.ReflectionUtils;
import com.myapp.common.utils.StringUtil;
import com.pp.test.bo.Electric;


/**
 * @author 张伟
 * @描述 11 10, 2016
 */
@SuppressWarnings("unchecked")
public class BaseDaoImpl<T extends Serializable, PK extends Serializable> extends HibernateDaoSupport implements
	IBaseDao {

    // 配置文件注入JdbcTemplate
    JdbcTemplate jdbcTemplate;

    /**
     * @param jdbcTemplate
     *                the jdbcTemplate to set
     */
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
	System.out.println("jdbcTemplate  --  "+jdbcTemplate );
	this.jdbcTemplate = jdbcTemplate;
    }
    /**
     * @return the jdbcTemplate
     */
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }
    

    private Class<T> entityClass;
    public BaseDaoImpl() {
        /*ParameterizedType type = (ParameterizedType) this.getClass()
                .getGenericSuperclass();
        this.entityClass = (Class) type.getActualTypeArguments()[0];*/
        
    	this.entityClass =  GenericsUtils.getSuperClassGenricType(this.getClass(), 0);
    	//this.entityClass=(Class<T>) Electric.class;
        /*Type type = getClass().getGenericSuperclass();
        if(!(type instanceof ParameterizedType)){
            type = getClass().getSuperclass().getGenericSuperclass();
        };
        System.out.println("p"+type.toString());
        this.entityClass = (Class<T>)((ParameterizedType)type).getActualTypeArguments()[0];
        System.out.println(this.entityClass);*/
    	System.out.println(this.entityClass);
    }
    
   
    //public BaseDaoImpl() {
		//this.entityClass = ReflectionUtils.getSuperGenericType(getClass());
	//}

    // 针对HibernateTemplate的定义的操作方法
    // -------------------- 基本检索、增加、修改、删除操作 --------------------

    // 根据主键获取实体。如果没有相应的实体，返回 null。
    public T get(PK id)throws Exception {
	return (T) super.getHibernateTemplate().get(entityClass, id);
    }

    // 根据主键获取实体。如果没有相应的实体，抛出异常。
    public T load(PK id)throws Exception {
	return (T) super.getHibernateTemplate().load(entityClass, id);
    }

    // 获取全部实体。
    public List<T> loadAll()throws Exception {
	return (List<T>) super.getHibernateTemplate().loadAll(entityClass);
    }

    // 更新实体
    public void update(T entity)throws Exception {
	super.getHibernateTemplate().update(entity);
    }

    // 存储实体到数据库
    public void save(T entity)throws Exception {
	super.getHibernateTemplate().save(entity);
    }

    // 增加或更新集合中的全部实体
    public void saveOrUpdateAll(Collection<T> entities)throws Exception {
	super.getHibernateTemplate().saveOrUpdateAll(entities);
    }

    // 删除指定的实体
    public void delete(T entity)throws Exception {
	super.getHibernateTemplate().delete(entity);
    }

    // 根据主键删除指定实体
    public void deleteByKey(PK id)throws Exception {
	this.delete(this.load(id));
    }

    // 删除集合中的全部实体
    public void deleteAll(Collection<T> entities)throws Exception {
	super.getHibernateTemplate().deleteAll(entities);
    }

    // -------------------- HSQL -------------------------
    // 使用HSQL语句直接增加、更新、删除实体
    public int bulkUpdate(String queryString)throws Exception {
	return super.getHibernateTemplate().bulkUpdate(queryString);
    }

    // 使用带参数的HSQL语句增加、更新、删除实体
    public int bulkUpdate(String queryString, Object[] values)throws Exception {
	return super.getHibernateTemplate().bulkUpdate(queryString, values);
    }

    // 使用HSQL语句检索数据
    public List find(String queryString)throws Exception {
	return super.getHibernateTemplate().find(queryString);
    }

    // 使用带参数的HSQL语句检索数据
    public List find(String queryString, Object[] values)throws Exception {
	return super.getHibernateTemplate().find(queryString, values);
    }

    // 使用带命名的参数的HSQL语句检索数据
    public List findByNamedParam(String queryString, String[] paramNames, Object[] values)throws Exception {
	return super.getHibernateTemplate().findByNamedParam(queryString, paramNames, values);
    }

    // 使用命名的HSQL语句检索数据
    public List findByNamedQuery(String queryName)throws Exception {
	return super.getHibernateTemplate().findByNamedQuery(queryName);
    }

    // 使用带参数的命名HSQL语句检索数据
    public List findByNamedQuery(String queryName, Object[] values)throws Exception {
	return super.getHibernateTemplate().findByNamedQuery(queryName, values);
    }

    // 使用带命名参数的命名HSQL语句检索数据
    public List findByNamedQueryAndNamedParam(String queryName, String[] paramNames, Object[] values)throws Exception {
	return super.getHibernateTemplate().findByNamedQueryAndNamedParam(queryName, paramNames, values);
    }

    // 使用HSQL语句检索数据，返回 Iterator
    public Iterator iterate(String queryString)throws Exception {
	return super.getHibernateTemplate().iterate(queryString);
    }

    // 使用带参数HSQL语句检索数据，返回 Iterator
    public Iterator iterate(String queryString, Object[] values)throws Exception {
	return super.getHibernateTemplate().iterate(queryString, values);
    }

    // 关闭检索返回的 Iterator
    public void closeIterator(Iterator it)throws Exception {
	super.getHibernateTemplate().closeIterator(it);
    }

    // ---结束

    // 针对JdbcTemplate的定义的操作方法

    // 执行SQL语句,方法返回一個BEAN_LIST

    public List<?> queryForList(String sql, Object object) throws Exception {
	SqlRowSet srs = null;
	srs = (SqlRowSet) jdbcTemplate.query(sql, new SqlRowSetResultSetExtractor());
	List<?> list = BeanUtil.bindList(srs, BeanUtil.getClassName(object));
	return list;
    }

    // 執行帶參數的查詢方法返回一個BEAN_LIST
    public List<?> queryForList(String sql, Object[] args, Object object) throws Exception {
	SqlRowSet srs = null;
	srs = (SqlRowSet) jdbcTemplate.query(sql, args, new SqlRowSetResultSetExtractor());
	List<?> list = BeanUtil.bindList(srs, BeanUtil.getClassName(object));
	return list;
    }

    // * 執行不帶參數的查詢方法返回一個Object對象
    public Object queryForObject(String sql, Object object) throws Exception {
	System.out.println(getJdbcTemplate());
	
	SqlRowSet srs = null;
	srs = (SqlRowSet) jdbcTemplate.query(sql, new SqlRowSetResultSetExtractor());
	Object obj = BeanUtil.bindObject(srs, BeanUtil.getClassName(object));
	return obj;
    }

    // * 執行帶參數的查詢方法返回一個Object對象
    public Object queryForObject(String sql, Object[] args, Object object) throws Exception {
	SqlRowSet srs = null;
	srs = (SqlRowSet) jdbcTemplate.query(sql, args, new SqlRowSetResultSetExtractor());
	Object obj = BeanUtil.bindObject(srs, BeanUtil.getClassName(object));
	return obj;
    }

    // * 執行不帶參數的查詢方法返回一個Integer類型數據，可以用于查詢某個整形字段的值

    public int queryForInt(String sql) throws Exception {
	// 直接調用此方法，在查不出數據的情況下會報錯
	// int a = jdbcTemplate.queryForInt(sql);
	// 自己寫的方法
	int a = 0;
	String object = StringUtil.trimString(queryForObject(sql, Integer.class));
	if (object.length() > 0) {
	    a = Integer.parseInt(object);
	}

	return a;
    }

    // * 執行帶參數的查詢方法返回一個Integer類型數據，可以用于查詢某個整形字段的值
    public int queryForInt(String sql, Object[] args) throws Exception {
	// 直接調用此方法，在查不出數據的情況下會報錯
	// int a = jdbcTemplate.queryForInt(sql, args);
	int a = 0;
	String object = StringUtil.trimString(queryForObject(sql, args, Integer.class));
	if (object.length() > 0) {
	    a = Integer.parseInt(object);
	}
	return a;
    }

    // 執行不帶參數的查詢方法返回一個Long類型數據，可以用于查詢某個整形字段的值,也可用于統計某個SQL語句的數目count(*)
    public long queryForLong(String sql) throws Exception {
	// 直接調用此方法，在查不出數據的情況下會報錯
	// long a = jdbcTemplate.queryForLong(sql);
	long a = 0l;
	String object = StringUtil.trimString(queryForObject(sql, Long.class));
	if (object.length() > 0) {
	    a = Long.parseLong(object);
	}
	return a;
    }

    // 執行帶參數的查詢方法返回一個Long類型數據，可以用于查詢某個整形字段的值,也可用于統計某個SQL語句的數目count(*)
    public long queryForLong(String sql, Object[] args) throws Exception {
	// 直接調用此方法，在查不出數據的情況下會報錯
	// long a = jdbcTemplate.queryForLong(sql, args);
	long a = 0l;
	String object = StringUtil.trimString(queryForObject(sql, args, Long.class));
	if (object.length() > 0) {
	    a = Long.parseLong(object);
	}
	return a;
    }

    // * 執行不帶參數的查詢方法返回一個String類型數據，可以用于查詢數據表中具體某一字符型字段的值，注：只能返回一個值
    public String queryForString(String sql) throws Exception {
	String str = StringUtil.trimString(queryForObject(sql, String.class));
	return str;
    }

    // * 執行帶參數的查詢方法返回一個String類型數據，可以用于查詢數據表中具體某一字符型字段的值，注：只能返回一個值
    public String queryForString(String sql, Object[] args) throws Exception {
	String str = StringUtil.trimString(queryForObject(sql, args, String.class));
	return str;
    }

    // 執行不帶參數的數據更新操作
    public void executeUpdate(String sql) throws SQLException {
	jdbcTemplate.update(sql);
    }

    // * 執行帶參數的數據更新操作
    public void executeUpdate(String sql, Object[] args) throws SQLException {
	if (args != null) {
	    for (int i = 0; i < args.length; i++) {
		args[i] = StringUtil.trimObject(args[i]);
	    }
	}
	jdbcTemplate.update(sql, args);
    }

    /**
     * 批處理執行多條SQL語句，注：SQL語句中沒有參數
     * <p>
     * 例子： String[] sql=new String[2]; sql[0] = "update table1 set column1=2
     * where id=1"; sql[1] = "update table2 set column3=3 where id=4";
     */
    public void batchUpdate(String[] sql) throws SQLException {
	jdbcTemplate.batchUpdate(sql);
    }

    // * 更新方法，執行成功返回受影響的記錄數,sql不帶參數
    public int executeUpdateForRow(String sql) throws Exception {
	int i = jdbcTemplate.update(sql);
	return i;
    }

    // 更新方法，執行成功返回受影響的記錄數,sql帶參數
    public int executeUpdateForRow(String sql, Object[] args) throws SQLException {
	int i = jdbcTemplate.update(sql, args);
	return i;
    }

   
}
