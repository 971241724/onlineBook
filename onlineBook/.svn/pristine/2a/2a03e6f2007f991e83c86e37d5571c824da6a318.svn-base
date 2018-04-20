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
	 * 用户登录
	 */
	public User selectUser(String user_no, String user_pwd) {
		User user = userDaoImp.selectUser(user_no, user_pwd);
		return user;
	}
    /**
     * 修改密码
     */
	public boolean updateUser(String user_no, String user_pwd) {
		return userDaoImp.updateUser(user_no, user_pwd);
	}
	
	/**
	 * 查询用户是否存在
	 */
	public User selectUserNo(String user_no, String user_phone) {
		return userDaoImp.selectUserNo(user_no, user_phone);
	}
	
	/**
	 * 查询这个账号是否存在
	 */
	public User selectNo(String user_no) {
		return userDaoImp.selectNo(user_no);
	}
	/**
	 * 用户注册
	 */
	public boolean insertUser(User user) {
		return userDaoImp.insertUser(user);
	}
	/**
	 * 修改邮箱
	 * @param user_id
	 * @param user_mail
	 * @return
	 */
	public boolean updateMail(Integer user_id, String user_mail) {
		return userDaoImp.updateMail(user_id, user_mail);
	}
	/**
	 * 修改电话
	 * @param user_id
	 * @param user_phone
	 * @return
	 */
	public boolean updatePhone(Integer user_id, String user_phone) {
		return userDaoImp.updatePhone(user_id, user_phone);
	}
	/**
	 * 修改地址
	 * @param user_id
	 * @param user_site
	 * @return
	 */
	public boolean updateSite(Integer user_id, String user_site) {
		return userDaoImp.updateSite(user_id, user_site);
	}
	/**
	 * 查询用户信息
	 */
	public User selectUsergetId(Integer user_id) {
		return userDaoImp.selectUsergetId(user_id);
	}
	/**
	 * 管理员查询所有用户信息
	 * @return
	 */
	public PageBean<User> adminSelectUser(Integer pc,Integer ps){
		return userDaoImp.adminSelectUser(pc, ps);
	}
	/**
	 * 管理员删除用户
	 */
	public boolean adminDeleteUser(Integer user_id){
		return userDaoImp.adminDeleteUser(user_id);
	}
}
