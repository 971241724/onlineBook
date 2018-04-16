package com.b2c.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.b2c.entity.Message;
import com.b2c.utils.PageBean;
@Component("MessageDaoImp")
public class MessageDaoImp implements MessageDao {
	@Resource(name="sqlSessionTemplate")
	private SqlSession SqlSessionTemplate;

	@Override
	public boolean addMessage(Message message) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		try {
			SqlSessionTemplate.insert("Message.addMessage",message);
			flag = true;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean delMessage(int id) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		try {
			SqlSessionTemplate.delete("Message.delMessage", id);
			flag = true;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean updateMessage(Message message) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		try {
			SqlSessionTemplate.update("Message.updateMessage", message);
			flag = true;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public PageBean<Message> findbyall(Integer pc,Integer ps) {
		// TODO 自动生成的方法存根
		Integer tr = SqlSessionTemplate.selectOne("selectforcountMessage");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		List<Message> messages = SqlSessionTemplate.selectList("Message.findbyall",map);
		PageBean<Message> bean = new PageBean<Message>(pc, tr, ps, messages);
		return bean;
	}

	@Override
	public Message findbyid(int id) {
		// TODO 自动生成的方法存根
		Message message = SqlSessionTemplate.selectOne("Message.findbyid", id);
		return message;
	}

}
