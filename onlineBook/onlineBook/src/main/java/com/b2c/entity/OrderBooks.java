package com.b2c.entity;

/**
 * 订书表实体类
 * @author 高群昊
 *
 */
public class OrderBooks {
	private int books_id;
	private int order_id;
	private int cart_id;
	private int book_id;
	private int number;
	private Book book;
	public int getBooks_id() {
		return books_id;
	}
	public void setBooks_id(int books_id) {
		this.books_id = books_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public OrderBooks() {
		super();
	}
	public OrderBooks(int books_id, int order_id, int cart_id, int book_id,
			int number) {
		super();
		this.books_id = books_id;
		this.order_id = order_id;
		this.cart_id = cart_id;
		this.book_id = book_id;
		this.number = number;
	}
	public OrderBooks(int books_id, int order_id, int cart_id, int book_id,
			int number, Book book) {
		super();
		this.books_id = books_id;
		this.order_id = order_id;
		this.cart_id = cart_id;
		this.book_id = book_id;
		this.number = number;
		this.book = book;
	}
	@Override
	public String toString() {
		return "OrderBooks [books_id=" + books_id + ", order_id=" + order_id
				+ ", cart_id=" + cart_id + ", book_id=" + book_id + ", number="
				+ number + ", book=" + book + "]";
	}
}
