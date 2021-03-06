package com.b2c.dao;

import java.util.List;

import com.b2c.entity.OrderBooks;

public interface IOrderBooksDao {
	/**
	 * 添加到订书表
	 * @param orderbook
	 * @return
	 */
	public int addOrderBooks(List<String> lists,Integer user_id);
	/**
	 * 获取购物车信息
	 * @param order_id
	 * @return
	 */
	public List<OrderBooks> selectCart_id(Integer order_id);
}
