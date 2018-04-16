package com.b2c.entity;

public class WeatherBean {
	private String date;
	private String message;
	private Integer status;
	private String city;
	private Integer count;
	private Data data;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}
	
	public WeatherBean() {
		super();
	}
	public WeatherBean(String date, String message, Integer status,
			String city, Integer count, Data data) {
		super();
		this.date = date;
		this.message = message;
		this.status = status;
		this.city = city;
		this.count = count;
		this.data = data;
	}
	@Override
	public String toString() {
		return "WeatherBean [date=" + date + ", message=" + message
				+ ", status=" + status + ", city=" + city + ", count=" + count
				+ ", data=" + data + "]";
	}
	
}
