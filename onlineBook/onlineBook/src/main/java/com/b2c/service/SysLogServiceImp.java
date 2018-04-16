package com.b2c.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.b2c.dao.ISysLogDao;
import com.b2c.entity.SysOperateLog;
import com.b2c.utils.PageBean;

/**
 * 
 * 记录操作日志service实体类
 * @author 高欢
 *
 */
@Component(value="sysLogServiceImp")
public class SysLogServiceImp implements ISysLogService{
	
	@Resource(name="sysLogDaoImp")
	private ISysLogDao sysLogDaoImp;
	/**
	 * 记录操作日志
	 */
	public boolean addSysOperateLog(SysOperateLog sysOperateLog){
		return sysLogDaoImp.addSysOperateLog(sysOperateLog);
	}
	/**
	 * 查询操作日志
	 * @return
	 */
	public PageBean<SysOperateLog> selectLog(Integer pc,Integer ps){
		return sysLogDaoImp.selectLog(pc, ps);
	}
	/**
	 * 删除日志
	 * @param log_id
	 * @return
	 */
	public boolean deleteLog(Integer log_id){
		return sysLogDaoImp.deleteLog(log_id);
	}
}
