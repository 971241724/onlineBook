package com.b2c.dao;

import java.util.List;

import com.b2c.entity.Order;
import com.b2c.entity.OrderBooks;
import com.b2c.utils.PageBean;

public interface IOrderDao {
	/**
	 * 添加到订单表
	 * @param order
	 * @return
	 */
	public int addMyOrder(List<String> lists, Integer user_id);
	/**
	 * 删除订单表信息
	 * @param Order_id
	 * @return
	 */
	public boolean deleteOrder(Integer Order_id);
	/**
	 * 提交订单
	 * @param Order_id
	 * @return
	 */
	public boolean submitOrder(List<Integer> list,Integer Order_id);
	/**
	 * 查询订单信息
	 * @param order_id
	 * @return
	 */
	public List<Order> selectSaleBook(Integer order_id);
	
	/**
	 * 用户查询所有订单信息
	 * @param user_id
	 * @return
	 * @author 高欢
	 */
	public PageBean userSelectAllOrder(Integer user_id,Integer pc,Integer ps);
	/**
	 * 删除订单信息
	 * @param order_id
	 * @return
	 * @author 高欢
	 */
	public boolean deleteOrderMessage(Integer order_id);
	/**
	 * 修改评价状态
	 * @param order_id
	 * @return
	 * @author 高欢
	 */
	public boolean alterOrderAccess(Integer order_id);
	/**
	 * 订单支付
	 * @author 高欢
	 */
	public boolean alipayOrder(Integer order_id);
	
	/**
	 * 管理员查询未处理订单
	 * @param pc
	 * @param ps
	 * @return
	 */
	public PageBean<Order> findUnDealOrder(Integer pc,Integer ps);
	/**
	 * 管理员处理订单
	 * @param order_id
	 * @return
	 */
	public boolean adminAddOrder(Integer order_id);
	/**
	 * 管理员查询已处理订单
	 * @param pc
	 * @param ps
	 * @return
	 */
	public PageBean<Order> findDealedOrder(Integer pc,Integer ps);
}
