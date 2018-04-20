package com.b2c.dao;

import com.b2c.entity.SysOperateLog;
import com.b2c.utils.PageBean;

/**
 * 
 * ��¼������־�־ò�ӿ�
 * @author �߻�
 *
 */
public interface ISysLogDao {
	/**
	 * ��Ӳ�����־
	 * @param sysOperateLog
	 * @return
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
