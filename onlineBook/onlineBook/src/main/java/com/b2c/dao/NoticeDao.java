
package com.b2c.dao;


import com.b2c.entity.Notice;
import com.b2c.utils.PageBean;

/**
 * @author Administrator
 *
 */
public interface NoticeDao {
	//增
	public boolean addNotice(Notice notice);
	//删
	public boolean delNotice(int id);
	//批量删除
	//public boolean delmoreNotice()
	//改
	public boolean updateNotice(Notice notice);
	//查 
	public PageBean<Notice> findbyall(Integer pc,Integer ps);
	public Notice findbyid(int id);
}
