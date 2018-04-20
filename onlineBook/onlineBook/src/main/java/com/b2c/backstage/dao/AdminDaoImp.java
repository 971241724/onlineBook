package com.b2c.backstage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.springframework.stereotype.Component;

import com.b2c.entity.ActivitiRePro;
import com.b2c.entity.Admin;
import com.b2c.utils.DataSourceContextHolder;
import com.b2c.utils.MD5;
import com.b2c.utils.PageBean;

/**
 * 
 * 管理员dao层实体类
 * @author 高欢
 * createTime 2017/08/17
 *
 */
@Component(value="adminDaoImp")
public class AdminDaoImp implements IAdminDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	
    /**
     * 管理员登录
     */
	public Admin adminLogin(String admin_no, String admin_pwd) {
		Admin admins = new Admin(0,admin_no,MD5.md5(admin_pwd));
		Admin admin = (Admin)sqlSessionTemplate.selectOne("Admin.adminLogin", admins);
		return admin;
	}

	/**
	 * 修改管理员密码
	 */
	public boolean updateAdminPwd(String admin_no, String admin_pwd,String new_pwd) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("admin_no", admin_no);
		map.put("admin_pwd", MD5.md5(admin_pwd));
		map.put("new_pwd", MD5.md5(new_pwd));
		int update = sqlSessionTemplate.update("Admin.updateAdminPwd", map);
		if(update == 1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 查询管理员信息
	 */
	public PageBean<Admin> selectAdmin(Integer pc, Integer ps) {
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Admin.selectAdminCount");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		List<Admin> adminList = sqlSessionTemplate.selectList("Admin.selectAdmin", map);
		for(Admin admin : adminList){
			System.out.println(admin.toString());
		}
		PageBean<Admin> page = new PageBean<Admin>(pc,tr,ps,adminList);
		return page;
	}
	
	/**
	 * 测试多个数据源之间的动态切换
	 * @return
	 */
	public List<ActivitiRePro> selectActivitiRePro(){
		List<ActivitiRePro> selectList = sqlSessionTemplate.selectList("ActivitiRePro.selectActivitiRePro");
		return selectList;
	}

}
