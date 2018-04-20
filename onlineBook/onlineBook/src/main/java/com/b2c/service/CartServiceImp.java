package com.b2c.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.b2c.dao.ICartDao;
import com.b2c.entity.Cart;
import com.b2c.utils.PageBean;

@Component(value="cartServiceImp")
public class CartServiceImp implements ICartService{
   
	@Resource(name="cartDaoImp")
	private ICartDao cartDaoImp;
	/**
	 * ��ӵ����ﳵ
	 */
	public boolean addBookCart(Cart cart) {
		return cartDaoImp.addBookCart(cart);
	}
	/**
	 * ��ѯ���ﳵ
	 */
	public List<Cart> selectCart() {
		return cartDaoImp.selectCart();
	}
	/**
	 * ���ﳵ��ҳ��ѯ
	 */
	public PageBean<Cart> pageCartSelect(Integer pc,Integer ps,Integer user_id) {
		return cartDaoImp.pageSelectCart(pc, ps,user_id);
	}
	/**
	 * ɾ�����ﳵ
	 */
	public boolean deleteCart(Integer cart_id) {
		return cartDaoImp.deleteCart(cart_id);
	}
	/**
	 * ȫѡɾ�����ﳵ
	 */
	public String deleteAllCart(List<String> list) {
		return cartDaoImp.deleteAllCart(list);
	}
	
	/**
	 * ��ѯ���ﳵ�е���Ʒ����
	 * @return
	 */
	public int selectCartSum(Integer user_id) {
		return cartDaoImp.selectCartSum(user_id);
	}
	/**
	 * �������빺�ﳵ
	 */
	public int addAllCart(List<String> cartId, Integer user_id) {
		return cartDaoImp.addAllCart(cartId, user_id);
	}
	/**
	 * ���ﳵͼ��ͳ��
	 * @return
	 */
	public List<Map<String,Object>> bookStatement(){
		return cartDaoImp.bookStatement();
	}
}
