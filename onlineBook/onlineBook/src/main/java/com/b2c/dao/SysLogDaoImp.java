package com.b2c.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.b2c.entity.SysOperateLog;
import com.b2c.utils.PageBean;

/**
 * 
 * ��¼������־�־ò�ʵ����
 * @author �߻�
 *
 */
@Component(value="sysLogDaoImp")
public class SysLogDaoImp implements ISysLogDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	/**
	 * ��¼������־
	 */
	public boolean addSysOperateLog(SysOperateLog sysOperateLog){
		int insert = sqlSessionTemplate.insert("SysOperateLog.addSysOperateLog", sysOperateLog);
		if(insert == 1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * ��ѯ������־
	 * @return
	 */
	public PageBean<SysOperateLog> selectLog(Integer pc,Integer ps){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		Integer tr = (Integer)sqlSessionTemplate.selectOne("SysOperateLog.selectLogCount");
		List<SysOperateLog> logList = sqlSessionTemplate.selectList("SysOperateLog.selectLog",map);
		PageBean<SysOperateLog> page = new PageBean<SysOperateLog>(pc,tr,ps,logList);
		return page;
	}
	/**
	 * ɾ����־
	 * @param log_id
	 * @return
	 */
	public boolean deleteLog(Integer log_id){
		int delete = sqlSessionTemplate.delete("SysOperateLog.deleteLog", log_id);
		if(delete==1){
			return true;
		}else {
			return false;
		}
	}
}
