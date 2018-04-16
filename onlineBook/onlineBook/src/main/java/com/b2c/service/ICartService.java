package com.b2c.service;

import java.util.List;
import java.util.Map;

import com.b2c.entity.Cart;
import com.b2c.utils.PageBean;

public interface ICartService {
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
	 * 购物车分页查询
	 * @return
	 */
	public PageBean<Cart> pageCartSelect(Integer pc,Integer ps,Integer user_id);
	/**
	 * 删除购物车
	 * @param cart_id
	 * @return
	 */
	public boolean deleteCart(Integer cart_id);
	/**
	 * 全选删除购物车
	 * @param cartId
	 * @return
	 */
	public String deleteAllCart(List<String> list);
	
	/**
	 * 查询购物车中的商品总数
	 * @return
	 */
	public int selectCartSum(Integer user_id);
	/**
	 * 批量插入购物车
	 * @param cartId
	 * @return
	 */
	public int addAllCart(List<String> cartId,Integer user_id);
	/**
	 * 购物车图书统计
	 * @return
	 */
	public List<Map<String,Object>> bookStatement();
}
