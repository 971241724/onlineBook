package com.b2c.service;

import com.b2c.entity.SysOperateLog;
import com.b2c.utils.PageBean;

/**
 * 
 * 记录操作日志service接口
 * @author 高欢
 *
 */
public interface ISysLogService {
	/**
	 * 记录操作日志
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
