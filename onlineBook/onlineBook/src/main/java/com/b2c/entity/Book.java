package com.b2c.entity;

/**
 * 
 * 图书实体类
 * @author 高欢
 *
 */
public class Book {
	
	public static final String TABLENAME="图书信息表";
	
	private int book_id;
	private String book_name;
	private String book_type;
	private String datetime;
	private Double price;
	private String url;
	private int down_sale;
	private Double t_Price;
	private int sales;
	private int stock;
	
	
	private int book_type_id;
	
	
	public int getBook_type_id() {
		return book_type_id;
	}
	public void setBook_type_id(int book_type_id) {
		this.book_type_id = book_type_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_type() {
		return book_type;
	}
	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getDown_sale() {
		return down_sale;
	}
	public void setDown_sale(int down_sale) {
		this.down_sale = down_sale;
	}
	public Double getT_Price() {
		return t_Price;
	}
	public void setT_Price(Double t_Price) {
		this.t_Price = t_Price;
	}
	
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Book() {
		super();
	}
	public Book(int book_id, String book_name, String book_type,
			String datetime, Double price, String url, int down_sale,
			Double t_Price, int sales) {
		super();
		this.book_id = book_id;
		this.book_name = book_name;
		this.book_type = book_type;
		this.datetime = datetime;
		this.price = price;
		this.url = url;
		this.down_sale = down_sale;
		this.t_Price = t_Price;
		this.sales = sales;
	}
	
	@Override
	public String toString() {
		return "Book [book_id=" + book_id + ", book_name=" + book_name
				+ ", book_type=" + book_type + ", datetime=" + datetime
				+ ", price=" + price + ", url=" + url + ", down_sale="
				+ down_sale + ", t_Price=" + t_Price + ", sales=" + sales
				+ ", stock=" + stock + ", book_type_id=" + book_type_id + "]";
	}
	public Book(int book_id, String book_name, String book_type,
			String datetime, Double price, String url, int down_sale,
			Double t_Price, int sales, int stock) {
		super();
		this.book_id = book_id;
		this.book_name = book_name;
		this.book_type = book_type;
		this.datetime = datetime;
		this.price = price;
		this.url = url;
		this.down_sale = down_sale;
		this.t_Price = t_Price;
		this.sales = sales;
		this.stock = stock;
	}
	public Book(int book_id, String book_name, String book_type,
			String datetime, Double price, String url, int down_sale,
			Double t_Price, int sales, int stock, int book_type_id) {
		super();
		this.book_id = book_id;
		this.book_name = book_name;
		this.book_type = book_type;
		this.datetime = datetime;
		this.price = price;
		this.url = url;
		this.down_sale = down_sale;
		this.t_Price = t_Price;
		this.sales = sales;
		this.stock = stock;
		this.book_type_id = book_type_id;
	}
	
   
	
	
}
