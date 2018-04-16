package com.b2c.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.b2c.dao.IUserDao;
import com.b2c.entity.User;
import com.b2c.utils.PageBean;

@Component(value="userServiceImp")
public class UserServiceImp implements IUserService{
    
	@Resource(name="userDaoImp")
	private IUserDao userDaoImp;
	/**
	 * �û���¼
	 */
	public User selectUser(String user_no, String user_pwd) {
		User user = userDaoImp.selectUser(user_no, user_pwd);
		return user;
	}
    /**
     * �޸�����
     */
	public boolean updateUser(String user_no, String user_pwd) {
		return userDaoImp.updateUser(user_no, user_pwd);
	}
	
	/**
	 * ��ѯ�û��Ƿ����
	 */
	public User selectUserNo(String user_no, String user_phone) {
		return userDaoImp.selectUserNo(user_no, user_phone);
	}
	
	/**
	 * ��ѯ����˺��Ƿ����
	 */
	public User selectNo(String user_no) {
		return userDaoImp.selectNo(user_no);
	}
	/**
	 * �û�ע��
	 */
	public boolean insertUser(User user) {
		return userDaoImp.insertUser(user);
	}
	/**
	 * �޸�����
	 * @param user_id
	 * @param user_mail
	 * @return
	 */
	public boolean updateMail(Integer user_id, String user_mail) {
		return userDaoImp.updateMail(user_id, user_mail);
	}
	/**
	 * �޸ĵ绰
	 * @param user_id
	 * @param user_phone
	 * @return
	 */
	public boolean updatePhone(Integer user_id, String user_phone) {
		return userDaoImp.updatePhone(user_id, user_phone);
	}
	/**
	 * �޸ĵ�ַ
	 * @param user_id
	 * @param user_site
	 * @return
	 */
	public boolean updateSite(Integer user_id, String user_site) {
		return userDaoImp.updateSite(user_id, user_site);
	}
	/**
	 * ��ѯ�û���Ϣ
	 */
	public User selectUsergetId(Integer user_id) {
		return userDaoImp.selectUsergetId(user_id);
	}
	/**
	 * ����Ա��ѯ�����û���Ϣ
	 * @return
	 */
	public PageBean<User> adminSelectUser(Integer pc,Integer ps){
		return userDaoImp.adminSelectUser(pc, ps);
	}
	/**
	 * ����Աɾ���û�
	 */
	public boolean adminDeleteUser(Integer user_id){
		return userDaoImp.adminDeleteUser(user_id);
	}
}
