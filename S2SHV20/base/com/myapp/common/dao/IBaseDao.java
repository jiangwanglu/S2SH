package com.myapp.common.dao;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;


/**
 * @author 刘文铭
 * @描述
 * Mar 20, 2012
 */
public interface IBaseDao {
    

    // -------------------- HSQL -------------------------
    // 使用HSQL语句直接增加、更新、删除实体
    public int bulkUpdate(String queryString) throws Exception ;

    // 使用带参数的HSQL语句增加、更新、删除实体
    public int bulkUpdate(String queryString, Object[] values) throws Exception ;

    // 使用HSQL语句检索数据
    public List find(String queryString) throws Exception ;

    // 使用带参数的HSQL语句检索数据
    public List find(String queryString, Object[] values) throws Exception ;

    // 使用带命名的参数的HSQL语句检索数据
    public List findByNamedParam(String queryString, String[] paramNames, Object[] values) throws Exception ;

    // 使用命名的HSQL语句检索数据
    public List findByNamedQuery(String queryName) throws Exception ;

    // 使用带参数的命名HSQL语句检索数据
    public List findByNamedQuery(String queryName, Object[] values) throws Exception ;

    // 使用带命名参数的命名HSQL语句检索数据
    public List findByNamedQueryAndNamedParam(String queryName, String[] paramNames, Object[] values) throws Exception ;

    // 使用HSQL语句检索数据，返回 Iterator
    public Iterator iterate(String queryString) throws Exception ;

    // 使用带参数HSQL语句检索数据，返回 Iterator
    public Iterator iterate(String queryString, Object[] values) throws Exception ;

    // 关闭检索返回的 Iterator
    public void closeIterator(Iterator it) throws Exception ;

    // ---结束

    // 针对JdbcTemplate的定义的操作方法

    // 执行SQL语句,方法返回一個BEAN_LIST

    public List<?> queryForList(String sql, Object object) throws Exception ;

    // 執行帶參數的查詢方法返回一個BEAN_LIST
    public List<?> queryForList(String sql, Object[] args, Object object) throws Exception ;

    // * 執行不帶參數的查詢方法返回一個Object對象
    public Object queryForObject(String sql, Object object) throws Exception ;

    // * 執行帶參數的查詢方法返回一個Object對象
    public Object queryForObject(String sql, Object[] args, Object object) throws Exception ;

    // * 執行不帶參數的查詢方法返回一個Integer類型數據，可以用于查詢某個整形字段的值

    public int queryForInt(String sql) throws Exception ;

    // * 執行帶參數的查詢方法返回一個Integer類型數據，可以用于查詢某個整形字段的值
    public int queryForInt(String sql, Object[] args) throws Exception ;
    
    // 執行不帶參數的查詢方法返回一個Long類型數據，可以用于查詢某個整形字段的值,也可用于統計某個SQL語句的數目count(*)
    public long queryForLong(String sql) throws Exception ;

    // 執行帶參數的查詢方法返回一個Long類型數據，可以用于查詢某個整形字段的值,也可用于統計某個SQL語句的數目count(*)
    public long queryForLong(String sql, Object[] args) throws Exception ;

    // * 執行不帶參數的查詢方法返回一個String類型數據，可以用于查詢數據表中具體某一字符型字段的值，注：只能返回一個值
    public String queryForString(String sql) throws Exception ;
    // * 執行帶參數的查詢方法返回一個String類型數據，可以用于查詢數據表中具體某一字符型字段的值，注：只能返回一個值
    public String queryForString(String sql, Object[] args) throws Exception;

    // 執行不帶參數的數據更新操作
    public void executeUpdate(String sql) throws SQLException;
    // * 執行帶參數的數據更新操作
    public void executeUpdate(String sql, Object[] args) throws SQLException ;

    /**
     * 批處理執行多條SQL語句，注：SQL語句中沒有參數
     * <p>
     * 例子： String[] sql=new String[2]; sql[0] = "update table1 set column1=2
     * where id=1"; sql[1] = "update table2 set column3=3 where id=4";
     */
    public void batchUpdate(String[] sql) throws SQLException;

    // * 更新方法，執行成功返回受影響的記錄數,sql不帶參數
    public int executeUpdateForRow(String sql) throws Exception ;

    // 更新方法，執行成功返回受影響的記錄數,sql帶參數
    public int executeUpdateForRow(String sql, Object[] args) throws SQLException ;

}
