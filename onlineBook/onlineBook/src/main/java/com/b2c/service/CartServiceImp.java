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
	 * 添加到购物车
	 */
	public boolean addBookCart(Cart cart) {
		return cartDaoImp.addBookCart(cart);
	}
	/**
	 * 查询购物车
	 */
	public List<Cart> selectCart() {
		return cartDaoImp.selectCart();
	}
	/**
	 * 购物车分页查询
	 */
	public PageBean<Cart> pageCartSelect(Integer pc,Integer ps,Integer user_id) {
		return cartDaoImp.pageSelectCart(pc, ps,user_id);
	}
	/**
	 * 删除购物车
	 */
	public boolean deleteCart(Integer cart_id) {
		return cartDaoImp.deleteCart(cart_id);
	}
	/**
	 * 全选删除购物车
	 */
	public String deleteAllCart(List<String> list) {
		return cartDaoImp.deleteAllCart(list);
	}
	
	/**
	 * 查询购物车中的商品总数
	 * @return
	 */
	public int selectCartSum(Integer user_id) {
		return cartDaoImp.selectCartSum(user_id);
	}
	/**
	 * 批量插入购物车
	 */
	public int addAllCart(List<String> cartId, Integer user_id) {
		return cartDaoImp.addAllCart(cartId, user_id);
	}
	/**
	 * 购物车图书统计
	 * @return
	 */
	public List<Map<String,Object>> bookStatement(){
		return cartDaoImp.bookStatement();
	}
}
