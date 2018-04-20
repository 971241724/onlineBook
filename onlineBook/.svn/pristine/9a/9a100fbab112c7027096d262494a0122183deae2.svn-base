package com.b2c.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.b2c.dao.IOrderDao;
import com.b2c.entity.Order;
import com.b2c.entity.OrderBooks;
import com.b2c.utils.PageBean;

@Component(value="orderServiceImp")
public class OrderServiceImp implements IOrderService{
	
	@Resource(name="orderDaoImp")
	private IOrderDao orderDaoImp;
	/**
	 * 添加到我的订单
	 */
	public int addMyOrder(List<String> lists, Integer user_id) {
		return orderDaoImp.addMyOrder(lists,user_id);
	}
	/**
	 * 删除订单表信息
	 */
	public boolean deleteOrder(Integer order_id){
		return orderDaoImp.deleteOrder(order_id);
	}
	/**
	 * 提交订单
	 */
	public boolean submitOrder(List<Integer> list, Integer order_id){
		return orderDaoImp.submitOrder(list, order_id);
	}
	/**
	 * 查询订单信息
	 */
	public List<Order> selectSaleBook(Integer user_id) {
		return orderDaoImp.selectSaleBook(user_id);
	}
	/**
	 * 用户查询所有订单信息
	 * @author 高欢
	 * @param user_id
	 * @return
	 */
	public PageBean userSelectAllOrder(Integer user_id,Integer pc,Integer ps){
		return orderDaoImp.userSelectAllOrder(user_id,pc,ps);
	}
	/**
	 * 删除订单信息
	 * @author 高欢
	 * @param order_id
	 * @return
	 */
	public boolean deleteOrderMessage(Integer order_id){
		return orderDaoImp.deleteOrderMessage(order_id);
	}
	/**
	 * 修改评价状态
	 * @author 高欢
	 * @param order_id
	 * @return
	 */
	public boolean alterOrderAccess(Integer order_id){
		return orderDaoImp.alterOrderAccess(order_id);
	}
	/**
	 * 订单支付
	 * @author 高欢
	 */
	public boolean alipayOrder(Integer order_id){
		return orderDaoImp.alipayOrder(order_id);
	}
	/**
	 * 管理员查询未处理订单
	 */
	public PageBean<Order> findUnDealOrder(Integer pc,Integer ps){;
		return orderDaoImp.findUnDealOrder(pc, ps);
	}
	/**
	 * 管理员处理订单
	 */
	public boolean adminAddOrder(Integer order_id){
		return orderDaoImp.adminAddOrder(order_id);
	}
	/**
	 * 管理员查询已处理订单
	 */
	public PageBean<Order> findDealedOrder(Integer pc,Integer ps){;
		return orderDaoImp.findDealedOrder(pc, ps);
	}
}
