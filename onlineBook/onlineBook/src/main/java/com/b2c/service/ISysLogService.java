package com.b2c.service;

import com.b2c.entity.SysOperateLog;
import com.b2c.utils.PageBean;

/**
 * 
 * ��¼������־service�ӿ�
 * @author �߻�
 *
 */
public interface ISysLogService {
	/**
	 * ��¼������־
	 */
	public boolean addSysOperateLog(SysOperateLog sysOperateLog);
	/**
	 * ��ѯ������־
	 * @return
	 */
	public PageBean<SysOperateLog> selectLog(Integer pc,Integer ps);
	/**
	 * ɾ����־
	 * @param log_id
	 * @return
	 */
	public boolean deleteLog(Integer log_id);
}
