package com.b2c.entity;

public class Day {
	private String date;                      //日期
	private String sunrise;                   //日出时间
	private String high;                      //最高温度
	private String low;                       //最低温度
	private String sunset;                    //日落时间
	private Double aqi;                       //空气质量
	private String fx;                        //风向
	private String fl;                        //风力
	private String type;                      //天气类型
	private String notice;                    //通知
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSunrise() {
		return sunrise;
	}
	public void setSunrise(String sunrise) {
		this.sunrise = sunrise;
	}
	public String getHigh() {
		return high;
	}
	public void setHigh(String high) {
		this.high = high;
	}
	public String getLow() {
		return low;
	}
	public void setLow(String low) {
		this.low = low;
	}
	public String getSunset() {
		return sunset;
	}
	public void setSunset(String sunset) {
		this.sunset = sunset;
	}
	public Double getAqi() {
		return aqi;
	}
	public void setAqi(Double aqi) {
		this.aqi = aqi;
	}
	public String getFx() {
		return fx;
	}
	public void setFx(String fx) {
		this.fx = fx;
	}
	public String getFl() {
		return fl;
	}
	public void setFl(String fl) {
		this.fl = fl;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	
	public Day() {
		super();
	}
	public Day(String date, String sunrise, String high, String low,
			String sunset, Double aqi, String fx, String fl, String type,
			String notice) {
		super();
		this.date = date;
		this.sunrise = sunrise;
		this.high = high;
		this.low = low;
		this.sunset = sunset;
		this.aqi = aqi;
		this.fx = fx;
		this.fl = fl;
		this.type = type;
		this.notice = notice;
	}
	@Override
	public String toString() {
		return "Day [date=" + date + ", sunrise=" + sunrise + ", high=" + high
				+ ", low=" + low + ", sunset=" + sunset + ", aqi=" + aqi
				+ ", fx=" + fx + ", fl=" + fl + ", type=" + type + ", notice="
				+ notice + "]";
	}
	
 	
	
	
}
