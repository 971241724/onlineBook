package com.b2c.backstage.dao;

import com.b2c.entity.Admin;
import com.b2c.utils.PageBean;

/**
 * 
 * 管理员Dao层接口
 * @author 高欢
 * createTime 2017/08/17
 */
public interface IAdminDao {
	/**
	 * 管理员登录
	 * @param admin_no
	 * @param admin_pwd
	 * @return
	 */
	public Admin adminLogin(String admin_no,String admin_pwd);
	/**
	 * 修改管理员密码
	 * @return
	 */
	public boolean updateAdminPwd(String admin_no,String admin_pwd,String new_pwd);
	/**
	 * 查询管理员信息
	 * @param pc
	 * @param ps
	 * @return
	 */
	public PageBean<Admin> selectAdmin(Integer pc,Integer ps);
}
