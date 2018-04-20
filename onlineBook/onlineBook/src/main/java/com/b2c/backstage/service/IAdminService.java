package com.b2c.backstage.service;

import java.util.List;

import com.b2c.entity.ActivitiRePro;
import com.b2c.entity.Admin;
import com.b2c.utils.PageBean;

/**
 * 
 * ����Աservice��ӿ�
 * @author �߻�
 * createTime 2017/08/17
 *
 */
public interface IAdminService {
	/**
	 * ����Ա��¼
	 * @param admin_no
	 * @param admin_pwd
	 * @return
	 */
	public Admin adminLogin(String admin_no, String admin_pwd);
	
	/**
	 * �޸Ĺ���Ա����
	 * @param admin_no
	 * @param admin_pwd
	 * @param new_pwd
	 * @return
	 */
	public boolean updateAdminPwd(String admin_no,String admin_pwd,String new_pwd);
	/**
	 * ��ѯ����Ա��Ϣ
	 * @param pc
	 * @param ps
	 * @return
	 */
	public PageBean<Admin> selectAdmin(Integer pc,Integer ps);
	/**
	 * ���Զ������Դ֮��Ķ�̬�л�
	 * @return
	 */
	public List<ActivitiRePro> selectActivitiRePro();
}
