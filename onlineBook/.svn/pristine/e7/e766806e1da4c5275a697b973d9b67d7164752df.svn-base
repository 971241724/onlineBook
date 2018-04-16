package com.b2c.dao;

import com.b2c.entity.SysOperateLog;
import com.b2c.utils.PageBean;

/**
 * 
 * 记录操作日志持久层接口
 * @author 高欢
 *
 */
public interface ISysLogDao {
	/**
	 * 添加操作日志
	 * @param sysOperateLog
	 * @return
	 */
	public boolean addSysOperateLog(SysOperateLog sysOperateLog);
	/**
	 * 查询操作日志
	 * @return
	 */
	public PageBean<SysOperateLog> selectLog(Integer pc,Integer ps);
	/**
	 * 删除日志
	 * @param log_id
	 * @return
	 */
	public boolean deleteLog(Integer log_id);
}
