package com.b2c.dao;

import java.util.List;
import java.util.Map;

import com.b2c.entity.Cart;
import com.b2c.utils.PageBean;

public interface ICartDao {
	/**
	 * 添加到购物车
	 * @param cart
	 * @return
	 */
	public boolean addBookCart(Cart cart);
	/**
	 * 查询购物车
	 * @return
	 */
	public List<Cart> selectCart();
	/**
	 * 分页查询购物车
	 * @return
	 */
	public PageBean<Cart> pageSelectCart(Integer pc,Integer ps,Integer user_id);
	/**
	 * 删除购物车
	 * @return
	 */
	public boolean deleteCart(Integer cart_id);
	/**
	 * 全选删除购物车
	 * @return
	 */
	public String deleteAllCart(List<String> list);
	
	/**
	 * 查询购物车中的商品总数
	 * @return
	 */
	public int selectCartSum(Integer user_id);
	/**
	 * 批量加入购物车
	 * @return
	 */
	public int addAllCart(List<String> cartId,Integer user_id);
	/**
	 * 购物车图书统计
	 * @return
	 */
	public List<Map<String,Object>> bookStatement();
}
