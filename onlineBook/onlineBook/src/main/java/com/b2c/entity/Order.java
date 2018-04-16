package com.b2c.entity;

import java.util.Date;
import java.util.List;

/**
 * 订单实体类
 * @author 高群昊
 *
 */
public class Order {
	
	public static final String TABLENAME = "订单表";
	
	private int order_id;
	private int user_id;
	private int order_state;
	private int access;
	private String buy_date;
	private double amount;
	private Date pay_date;
	private int deal_state;
	private List<OrderBooks> orderBooks;
	private User user;
	
	private int order_delete;
	public int getOrder_delete() {
		return order_delete;
	}
	public void setOrder_delete(int order_delete) {
		this.order_delete = order_delete;
	}
	public List<OrderBooks> getOrderBooks() {
		return orderBooks;
	}
	public void setOrderBooks(List<OrderBooks> orderBooks) {
		this.orderBooks = orderBooks;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getAccess() {
		return access;
	}
	public void setAccess(int access) {
		this.access = access;
	}
	public int getDeal_state() {
		return deal_state;
	}
	public void setDeal_state(int deal_state) {
		this.deal_state = deal_state;
	}
	public Order() {
		super();
	}
	
	public Order(int order_id, int user_id, int order_state, int access,
			String buy_date, double amount, Date pay_date, int deal_state,
			List<OrderBooks> orderBooks, User user) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_state = order_state;
		this.access = access;
		this.buy_date = buy_date;
		this.amount = amount;
		this.pay_date = pay_date;
		this.deal_state = deal_state;
		this.orderBooks = orderBooks;
		this.user = user;
	}
	public Order(int order_id, int user_id, int order_state, int access,
			String buy_date, double amount, Date pay_date,
			List<OrderBooks> orderBooks) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_state = order_state;
		this.access = access;
		this.buy_date = buy_date;
		this.amount = amount;
		this.pay_date = pay_date;
		this.orderBooks = orderBooks;
	}
	
	public Order(int order_id, int user_id, int order_state, int access,
			String buy_date, double amount, Date pay_date) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_state = order_state;
		this.access = access;
		this.buy_date = buy_date;
		this.amount = amount;
		this.pay_date = pay_date;
	}
	
	public Order(int order_id, int user_id, int order_state, int access,
			String buy_date, double amount, Date pay_date,int deal_state,int order_delete) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.order_state = order_state;
		this.access = access;
		this.buy_date = buy_date;
		this.amount = amount;
		this.pay_date = pay_date;
		this.deal_state = deal_state;
		this.order_delete = order_delete;
	}
	
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id
				+ ", order_state=" + order_state + ", access=" + access
				+ ", buy_date=" + buy_date + ", amount=" + amount
				+ ", pay_date=" + pay_date + ", deal_state=" + deal_state
				+ ", orderBooks=" + orderBooks + ", user=" + user + "]";
	}
	
}
