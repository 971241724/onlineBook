package com.b2c.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.b2c.dao.MessageDao;
import com.b2c.dao.MessageDaoImp;
import com.b2c.entity.Message;
import com.b2c.utils.PageBean;
@Component(value="MessageServiceImp")
public class MessageServiceImp implements MessageService {
	@Resource(name="MessageDaoImp")
	private MessageDao MessageDaoImp;

	@Override
	public boolean addMessage(Message message) {
		// TODO Auto-generated method stub
		return MessageDaoImp.addMessage(message);
	}

	@Override
	public boolean delMessage(int id) {
		// TODO Auto-generated method stub
		return MessageDaoImp.delMessage(id);
	}

	@Override
	public boolean updateMessage(Message message) {
		// TODO Auto-generated method stub
		return MessageDaoImp.updateMessage(message);
	}

	@Override
	public PageBean<Message> findbyall(Integer pc,Integer ps) {
		// TODO Auto-generated method stub
		return MessageDaoImp.findbyall(pc, ps);
	}

	@Override
	public Message findbyid(int id) {
		// TODO Auto-generated method stub
		return MessageDaoImp.findbyid(id);
	}

}
