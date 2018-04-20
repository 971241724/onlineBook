package com.b2c.dao;

import java.util.List;
import java.util.Map;

import com.b2c.entity.Cart;
import com.b2c.utils.PageBean;

public interface ICartDao {
	/**
	 * ��ӵ����ﳵ
	 * @param cart
	 * @return
	 */
	public boolean addBookCart(Cart cart);
	/**
	 * ��ѯ���ﳵ
	 * @return
	 */
	public List<Cart> selectCart();
	/**
	 * ��ҳ��ѯ���ﳵ
	 * @return
	 */
	public PageBean<Cart> pageSelectCart(Integer pc,Integer ps,Integer user_id);
	/**
	 * ɾ�����ﳵ
	 * @return
	 */
	public boolean deleteCart(Integer cart_id);
	/**
	 * ȫѡɾ�����ﳵ
	 * @return
	 */
	public String deleteAllCart(List<String> list);
	
	/**
	 * ��ѯ���ﳵ�е���Ʒ����
	 * @return
	 */
	public int selectCartSum(Integer user_id);
	/**
	 * �������빺�ﳵ
	 * @return
	 */
	public int addAllCart(List<String> cartId,Integer user_id);
	/**
	 * ���ﳵͼ��ͳ��
	 * @return
	 */
	public List<Map<String,Object>> bookStatement();
}
