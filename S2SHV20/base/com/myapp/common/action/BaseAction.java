package com.myapp.common.action;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;

import com.myapp.common.utils.UrlUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author 刘文铭
 * @描述
 * @返回值 Mar 19, 2012
 */
public class BaseAction extends ActionSupport implements ServletResponseAware, ServletRequestAware, ServletContextAware {

    private static final long serialVersionUID = 1L;

    protected Log log = LogFactory.getLog(this.getClass());

    protected HttpServletResponse response;
    protected HttpServletRequest request;
    protected ServletContext context;
    protected HttpSession session;
    /**
     * 获得 Http Servlet Response
     */
    public void setServletResponse(HttpServletResponse response) {
	this.response = response;

    }

    /**
     * 获得当前Http Servlet Request
     */
    public void setServletRequest(HttpServletRequest request) {
	this.request = request;
	this.session = this.request.getSession();

    }

    public void setServletContext(ServletContext context) {
	this.context = context;
    }
    
    
    
    /**
     * JSON配置信息
     */
    protected Object jsonResult;

    public Object getJsonResult() {
	return this.jsonResult;
    }
    
    private String message;// 返回的消息
    private String title;// 页面显示标题
   
    /**
     * 页面显示标题
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 返回的消息
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * 获得当前Action 请求路径
     * 
     */
    public String getRequestUrl() {
	return UrlUtils.getRequestUrl(this.request);
    }

    /**
     * 获得当前Action 请求的全部路径
     */
    public String getFullRequestUrl() {
	return UrlUtils.getFullRequestUrl(this.request);
    }

    /**
     * 根据指定的页面参数名称，获取页面传递来的参数值
     * 
     * @param parameter
     * @return 单个对象
     */
    protected Object getParameterValue(String parameter) {
	Object[] parameterArray = getParamenterArray(parameter);
	if (parameterArray != null && parameterArray.length == 1) {
	    return parameterArray[0];
	} else {
	    return this.request.getAttribute(parameter);
	}
    }

    /**
     * 根据指定的页面参数名称，获取页面传递来的参数值
     * 
     * @param parameter
     * @return 数组对象
     */
    protected Object[] getParamenterArray(String parameter) {
	return (Object[]) (ActionContext.getContext().getParameters().get(parameter));
    }

    /**
     * 获取配置信息
     * 
     */
    
     
    /**
     * 向request对象添加attribute
     * 
     * @param key
     * @param value
     */
    public void setRequestAttribute(String key, Object value) {
	this.request.setAttribute(key, value);
    }

    /**
     * 从session中取得相应的值
     * 
     * @param key
     * @return
     */
    public Object getSessionObj(String key) {
	return this.session.getAttribute(key);
    }

    /**
     * 获得项目rootDir
     * 
     * @return
     */
    protected String getRootDir() {
	String workDir = this.context.getRealPath("login.jsp");

	int len = workDir.indexOf("login.jsp");
	workDir = workDir.substring(0, len);

	StringBuffer sb = new StringBuffer();
	sb.append(workDir).append("upload").append(File.separator);

	return sb.toString();
    }

    /**
     * 获得web应用根目录路径
     * 
     * @return
     */
    protected String getWebRootDir() {
	String workDir = this.context.getRealPath("index.jsp");

	int len = workDir.indexOf("index.jsp");
	workDir = workDir.substring(0, len);

	StringBuffer sb = new StringBuffer();
	sb.append(workDir);

	return sb.toString();
    }

   

    /**
     * 本人自己特殊使用方式
     */
    private Map<String, Object> convertMapKey(Map<String, Object> map) {
	Map<String, Object> result = new HashMap<String, Object>();
	Set<String> set = map.keySet();
	Iterator<String> iterator = set.iterator();
	while (iterator.hasNext()) {
	    String key = (String) iterator.next();
	    Object value = (Object) map.get(key);
	    result.put(key.toLowerCase(), value);
	}

	return result;
    }

    @SuppressWarnings("unchecked")
    protected Object getPOJOBean(Class<?> beanClass) {
	Object result = null;
	try {
	    result = beanClass.newInstance();
	    Map<String, Object> map = request.getParameterMap();
	    map = this.convertMapKey(map);
	    BeanUtils.populate(result, map);
	} catch (InstantiationException e) {
	    e.printStackTrace();
	} catch (IllegalAccessException e) {
	    e.printStackTrace();
	} catch (InvocationTargetException e) {
	    e.printStackTrace();
	}
	return result;
    }
    /**********************************************************************************/

}
