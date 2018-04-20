package com.b2c.utils;

public class OrderUser {
	
	private int order_id;
	private int order_book_id;
	private String order_book_name;
	private int order_number;
	private int order_state;
	private double amount;
	private int access;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_book_name() {
		return order_book_name;
	}
	public void setOrder_book_name(String order_book_name) {
		this.order_book_name = order_book_name;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getAccess() {
		return access;
	}
	public void setAccess(int access) {
		this.access = access;
	}
	public int getOrder_book_id() {
		return order_book_id;
	}
	public void setOrder_book_id(int order_book_id) {
		this.order_book_id = order_book_id;
	}
	
	@Override
	public String toString() {
		return "OrderUser [order_id=" + order_id + ", order_book_id="
				+ order_book_id + ", order_book_name=" + order_book_name
				+ ", order_number=" + order_number + ", order_state="
				+ order_state + ", amount=" + amount + ", access=" + access
				+ "]";
	}
	public OrderUser() {
		super();
	}
	public OrderUser(int order_id, String order_book_name, int order_number,
			int order_state, double amount) {
		super();
		this.order_id = order_id;
		this.order_book_name = order_book_name;
		this.order_number = order_number;
		this.order_state = order_state;
		this.amount = amount;
	}
	public OrderUser(int order_id, String order_book_name, int order_number,
			int order_state, double amount, int access) {
		super();
		this.order_id = order_id;
		this.order_book_name = order_book_name;
		this.order_number = order_number;
		this.order_state = order_state;
		this.amount = amount;
		this.access = access;
	}
	public OrderUser(int order_id, int order_book_id, String order_book_name,
			int order_number, int order_state, double amount, int access) {
		super();
		this.order_id = order_id;
		this.order_book_id = order_book_id;
		this.order_book_name = order_book_name;
		this.order_number = order_number;
		this.order_state = order_state;
		this.amount = amount;
		this.access = access;
	}
	
}
