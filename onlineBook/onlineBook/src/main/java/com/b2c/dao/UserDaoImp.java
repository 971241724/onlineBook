package com.b2c.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.b2c.entity.Book;
import com.b2c.entity.User;
import com.b2c.utils.MD5;
import com.b2c.utils.PageBean;

@Component(value="userDaoImp")
public class UserDaoImp implements IUserDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	
	/**
	 * �û���¼
	 */
	public User selectUser(String user_no, String user_pwd) {
		
		Map<String,Object> map = new HashedMap<String,Object>();
		map.put("user_no", user_no);
		map.put("user_pwd", MD5.md5(user_pwd));
	    /*User users = new User();
	    users.setUser_no(user_no);
		users.setUser_pwd(user_pwd);*/
		User user = (User)sqlSessionTemplate.selectOne("User.selectUser", map);
		return user;
		
	}

    /**
     * �޸��û�����
     */
	public boolean updateUser(String user_no, String user_pwd) {
		
		Map<String,String> map = new HashedMap<String, String>();
		map.put("user_no",user_no);
		map.put("user_pwd",MD5.md5(user_pwd));
		int update = sqlSessionTemplate.update("User.updateUser", map);
		if(update==1){
			return true;
		}else{
			return false;
		}
		
	}

	/**
	 * ��ѯ�û��Ƿ����
	 */
	public User selectUserNo(String user_no, String user_phone) {
		Map<String,Object> map = new HashedMap<String, Object>();
		map.put("user_no",user_no);
		map.put("user_phone",user_phone);
		User user = (User)sqlSessionTemplate.selectOne("User.selectUserNo", map);
		System.out.println(user+"bbbbbbbbbbbbbbbbbbbb");
		return user;
	}

	/**
	 * ��ѯ����˺��Ƿ����
	 */
	public User selectNo(String user_no) {
		User user = (User)sqlSessionTemplate.selectOne("User.selectNo", user_no);
		return user;
	}

	/**
	 * �û�ע��
	 */
	public boolean insertUser(User user) {
		int insert = sqlSessionTemplate.insert("User.insertUser", user);
		System.out.println(user.toString()+"-------------");
		if(insert==1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * �޸�����
	 * @return
	 */
	public boolean updateMail(Integer user_id, String user_mail) {
		Map<String,Object> map = new HashedMap<String,Object>();
		map.put("user_id", user_id);
		map.put("user_mail", user_mail);
		int update = sqlSessionTemplate.update("User.updateMail", map);
		if(update == 1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * �޸ĵ绰
	 * @return
	 */
	public boolean updatePhone(Integer user_id, String user_phone) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user_id", user_id);
		map.put("user_phone", user_phone);
		int update = sqlSessionTemplate.update("User.updatePhone", map);
		if(update == 1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * �޸ĵ�ַ
	 * @return
	 */
	public boolean updateSite(Integer user_id, String user_site) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user_id", user_id);
		map.put("user_site", user_site);
		int update = sqlSessionTemplate.update("User.updateSite", map);
		if(update == 1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * ��ѯ�û���Ϣ
	 */
	public User selectUsergetId(Integer user_id) {
		User user = (User)sqlSessionTemplate.selectOne("User.selectUsergetId", user_id);
		return user;
	}
	/**
	 * ����Ա��ѯ�����û���Ϣ
	 * @return
	 */
	public PageBean<User> adminSelectUser(Integer pc,Integer ps){
		Integer tr = (Integer)sqlSessionTemplate.selectOne("User.adminSelectUserCount");
		Map<String,Object> map = new HashedMap<String, Object>();
		map.put("startPc",(pc-1)*ps);
		map.put("ps",ps);
		List<User> userList = sqlSessionTemplate.selectList("User.adminSelectUser", map);
		PageBean<User> page = new PageBean<User>(pc,tr,ps,userList);
		return page;
	}
	/**
	 * ����Աɾ����ǰ�û�
	 * @param book_id
	 * @return
	 */
	public boolean adminDeleteUser(Integer book_id){
		int delete = sqlSessionTemplate.delete("User.adminDeleteUser", book_id);
		if(delete == 1){
			return true;
		}else {
			return false;
		}
	}
	
	
}