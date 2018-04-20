package com.b2c.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.b2c.entity.Cart;
import com.b2c.entity.Order;
import com.b2c.entity.OrderBooks;

@Component(value="orderBooksDaoImp")
public class OrderBooksDaoImp implements IOrderBooksDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	/**
	 * 添加到订书表
	 */
	public int addOrderBooks(List<String> lists,Integer user_id) {
		List<Cart> cartList = sqlSessionTemplate.selectList("Cart.getCart_id", lists);
		List<Order> orderList = sqlSessionTemplate.selectList("Order.getOrder_id", user_id);
		List<OrderBooks> orderBooksList = new ArrayList();
		for(Cart cart : cartList){
			for(Order order : orderList){
				int order_id = order.getOrder_id();
				List<OrderBooks> orBooks = sqlSessionTemplate.selectList("OrderBooks.selectCart_id", order_id);
				if(orBooks.isEmpty() || orBooks == null){
					OrderBooks orderBooks = new OrderBooks(0,order.getOrder_id(),cart.getCart_id(),cart.getBook_id(),cart.getAmount());
					orderBooksList.add(orderBooks);
				}
			}
		}
		int insert = sqlSessionTemplate.insert("OrderBooks.addOrderBooks",orderBooksList);
		return insert;
	}
	/**
	 * 获取订书表信息
	 */
	public List<OrderBooks> selectCart_id(Integer order_id){
		List<OrderBooks> orderBooksList = sqlSessionTemplate.selectList("OrderBooks.selectCart_id", order_id);
		return orderBooksList;
	}
}
