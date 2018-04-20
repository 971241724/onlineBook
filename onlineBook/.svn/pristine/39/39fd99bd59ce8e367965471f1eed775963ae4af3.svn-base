package com.b2c.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import com.b2c.dao.NoticeDao;
import com.b2c.entity.Notice;
import com.b2c.utils.PageBean;


@Component(value="NoticeServiceImp")
public class NoticeServiceImp implements NoticeService {
	@Resource(name="NoticeDaoImp")
	private NoticeDao NoticeDaoImp;

	@Override
	public boolean addNotice(Notice notice) {
		// TODO Auto-generated method stub
		return NoticeDaoImp.addNotice(notice);
	}

	@Override
	public boolean delNotice(int id) {
		// TODO Auto-generated method stub
		return NoticeDaoImp.delNotice(id);
	}

	@Override
	public boolean updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return NoticeDaoImp.updateNotice(notice);
	}

	@Override
	public PageBean<Notice> findbyall(Integer pc,Integer ps) {
		// TODO Auto-generated method stub
		return NoticeDaoImp.findbyall(pc, ps);
	}

	@Override
	public Notice findbyid(int id) {
		// TODO Auto-generated method stub
		return NoticeDaoImp.findbyid(id);
	}

}
