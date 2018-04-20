package com.b2c.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.b2c.entity.Notice;
import com.b2c.utils.PageBean;
@Component("NoticeDaoImp")
public class NoticeDaoImp implements NoticeDao {
	@Resource(name="sqlSessionTemplate")
	private SqlSession SqlSessionTemplate;

	@Override
	public boolean addNotice(Notice notice) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		try {
			SqlSessionTemplate.insert("Notice.addNotice",notice);
			flag = true;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean delNotice(int id) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		try {
			SqlSessionTemplate.delete("Notice.delNotice", id);
			flag = true;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean updateNotice(Notice notice) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		try {
			SqlSessionTemplate.update("Notice.updateNotice", notice);
			flag = true;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public PageBean<Notice> findbyall(Integer pc,Integer ps) {
		// TODO 自动生成的方法存根
		Integer tr = SqlSessionTemplate.selectOne("selectforcountNotice");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		List<Notice> Notices = SqlSessionTemplate.selectList("Notice.findbyall",map);
		PageBean<Notice> bean = new PageBean<Notice>(pc, tr, ps, Notices);
		return bean;
	}

	@Override
	public Notice findbyid(int id) {
		// TODO 自动生成的方法存根
		Notice notice = SqlSessionTemplate.selectOne("Notice.findbyid", id);
		return notice;
	}

}
