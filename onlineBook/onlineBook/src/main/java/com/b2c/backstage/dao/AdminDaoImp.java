package com.b2c.backstage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.springframework.stereotype.Component;

import com.b2c.entity.Admin;
import com.b2c.utils.MD5;
import com.b2c.utils.PageBean;

/**
 * 
 * ����Աdao��ʵ����
 * @author �߻�
 * createTime 2017/08/17
 *
 */
@Component(value="adminDaoImp")
public class AdminDaoImp implements IAdminDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	
    /**
     * ����Ա��¼
     */
	public Admin adminLogin(String admin_no, String admin_pwd) {
		Admin admins = new Admin(0,admin_no,MD5.md5(admin_pwd));
		Admin admin = (Admin)sqlSessionTemplate.selectOne("Admin.adminLogin", admins);
		return admin;
	}

	/**
	 * �޸Ĺ���Ա����
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
	 * ��ѯ����Ա��Ϣ
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

}