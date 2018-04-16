package com.b2c.dao;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.b2c.entity.Book;
import com.b2c.entity.Cart;
import com.b2c.entity.Order;
import com.b2c.entity.OrderBooks;
import com.b2c.utils.PageBean;

@Component(value="orderDaoImp")
public class OrderDaoImp implements IOrderDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	/**
	 * 添加到我的订单
	 */
	public int addMyOrder(List<String> lists, Integer user_id) {
		double amount = 0.0;
		List<Cart> cartList = sqlSessionTemplate.selectList("Cart.getCart_id", lists);
		for(Cart cart : cartList){
			amount += cart.getC_price();
		}
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
	    String str = format.format(date); 
		Order order = new Order(0,user_id,0,0,str,amount,null,0,0);
		int insert = sqlSessionTemplate.insert("Order.addMyOrder", order);
		return insert;
	}
	/**
	 * 删除订单表信息
	 */
	public boolean deleteOrder(Integer order_id){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("order_delete", 1);
		map.put("order_id", order_id);
		int update = sqlSessionTemplate.delete("Order.deleteOrder", map);
		if(update == 1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 提交订单
	 */
	public boolean submitOrder(List<Integer> list, Integer order_id){
		Map<String,Object> map = new HashMap<String,Object>();
		Date date = new Date();
		/*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		String str = format.format(date);*/
		map.put("order_id", order_id);
		map.put("order_state", 1);
		map.put("pay_date", date);
		map.put("deal_state", 0);
		int delete = sqlSessionTemplate.delete("Cart.deleteCartList", list);
		int update = sqlSessionTemplate.update("Order.submitOrder", map);
		List<OrderBooks> obList = sqlSessionTemplate.selectList("OrderBooks.selectCart_id", order_id);
		Map<String,Object> map2 = new HashMap<String,Object>();
		for(OrderBooks ob : obList){
			map2.put("number", ob.getNumber());
			map2.put("book_id", ob.getBook_id());
			int submit = sqlSessionTemplate.update("Book.sumbitBook", map2);
			if(submit == 0){
				return false;
			}
		}
		if(delete != 0 && update != 0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 查询订单信息
	 */
	public List<Order> selectSaleBook(Integer user_id){
		List<Order> list = sqlSessionTemplate.selectList("Order.selectSaleBook", user_id);
		return list;
	};
	
	/**
	 * 用户查询所有订单信息
	 * @author 高欢
	 * @param user_id
	 * @return
	 */
	public PageBean userSelectAllOrder(Integer user_id,Integer pc,Integer ps){
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Order.userSelectOrderCount", user_id);
		Map<String,Object> map = new HashedMap<String, Object>();
		map.put("startPc",(pc-1)*ps);
		map.put("ps",ps);
		map.put("user_id",user_id);
		List<Order> list = sqlSessionTemplate.selectList("Order.userSelectAllOrder", map);
		PageBean page = new PageBean(pc,tr,ps,list);
		return page;
	}
	/**
	 * 删除订单信息
	 * @author 高欢
	 * @param order_id
	 * @return
	 */
	public boolean deleteOrderMessage(Integer order_id){
		int update = sqlSessionTemplate.update("Order.deleteOrderMessage", order_id);
		if(update == 1){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 修改评价状态
	 * @author 高欢
	 * @param order_id
	 * @return
	 */
	public boolean alterOrderAccess(Integer order_id){
		int update = sqlSessionTemplate.update("Order.alterOrderAccess",order_id);
		if(update == 1){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 订单支付
	 * @author 高欢
	 */
	public boolean alipayOrder(Integer order_id){
		int update = sqlSessionTemplate.update("Order.alipayOrder",order_id);
		if(update == 1){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 管理员查询未处理订单
	 */
	public PageBean<Order> findUnDealOrder(Integer pc,Integer ps){
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Order.selectDealOrder", 0);
		System.out.println(tr +"=========================");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		map.put("deal_state", 0);
		List<Order> orderList = sqlSessionTemplate.selectList("Order.findDealOrder", map);
		System.out.println(orderList);
		PageBean<Order> page = new PageBean<Order>(pc,tr,ps,orderList);
		return page;
	}
	/**
	 * 管理员处理订单
	 */
	public boolean adminAddOrder(Integer order_id){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("order_id", order_id);
		map.put("deal_state", 1);
		int update = sqlSessionTemplate.update("Order.adminAddOrder", map);
		if(update == 1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 管理员查询已处理订单
	 */
	public PageBean<Order> findDealedOrder(Integer pc,Integer ps){
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Order.selectDealOrder",1);
		System.out.println(tr+"+++++++++++++++++++++");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		map.put("deal_state",1);
		List<Order> orderList = sqlSessionTemplate.selectList("Order.findDealOrder", map);
		System.out.println(orderList);
		PageBean<Order> page = new PageBean<Order>(pc,tr,ps,orderList);
		return page;
	}
}
