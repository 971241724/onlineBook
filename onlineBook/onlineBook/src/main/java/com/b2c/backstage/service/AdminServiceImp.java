package com.b2c.backstage.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.b2c.backstage.dao.IAdminDao;
import com.b2c.entity.Admin;
import com.b2c.utils.PageBean;

/**
 * 
 * 管理员service层实体类
 * @author 高欢
 * createTime 2017/08/17
 *
 */
@Component(value="adminServiceImp")
public class AdminServiceImp implements IAdminService{
	
	@Resource(name="adminDaoImp")
	private IAdminDao adminDaoImp;
	
    /**
     * 管理员登录
     */
	public Admin adminLogin(String admin_no, String admin_pwd) {
		return adminDaoImp.adminLogin(admin_no, admin_pwd);
	}
	/**
	 * 修改管理员密码
	 */
	public boolean updateAdminPwd(String admin_no,String admin_pwd,String new_pwd){
		return adminDaoImp.updateAdminPwd(admin_no, admin_pwd, new_pwd);
	}
	/**
	 * 查询管理员信息
	 */
	public PageBean<Admin> selectAdmin(Integer pc, Integer ps) {
		return adminDaoImp.selectAdmin(pc, ps);
	}
}
