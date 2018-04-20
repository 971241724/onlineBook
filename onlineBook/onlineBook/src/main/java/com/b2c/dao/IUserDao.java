package com.b2c.dao;

import com.b2c.entity.User;
import com.b2c.utils.PageBean;

public interface IUserDao{
	
	/**
	 * 用户登录
	 * @param user_no
	 * @param user_pwd
	 * @return
	 */
	public User selectUser(String user_no,String user_pwd);
	/**
	 * 用户修改密码
	 * @param usere_no
	 * @param user_pwd
	 * @return
	 */
	public boolean updateUser(String user_no,String user_pwd);
	/**
	 * 查询用户是存在
	 * @return
	 */
	public User selectUserNo(String user_no,String user_phone);
	
	/**
	 * 查询这个账号是否存在
	 * @param user_no
	 * @return
	 */
	public User selectNo(String user_no);
	
	/**
	 * 用户注册
	 * @return
	 */
	public boolean insertUser(User user);
	/**
	 * 修改邮箱
	 * @return
	 */
	public boolean updateMail(Integer user_id,String user_mail);
	/**
	 * 修改电话
	 * @return
	 */
	public boolean updatePhone(Integer user_id,String user_phone);
	/**
	 * 修改地址
	 * @return
	 */
	public boolean updateSite(Integer user_id,String user_site);
	/**
	 * 查询用户信息
	 * @param user_id
	 * @return
	 */
	public User selectUsergetId(Integer user_id);
	/**
	 * 管理员查询所有用户信息
	 * @return
	 */
	public PageBean<User> adminSelectUser(Integer pc,Integer ps);
	/**
	 * 管理员删除用户
	 */
	public boolean adminDeleteUser(Integer user_id);
}