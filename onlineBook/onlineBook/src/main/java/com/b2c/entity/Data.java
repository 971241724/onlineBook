package com.b2c.entity;

import java.util.List;

public class Data {
	private String shidu;
	private Double pm25;
	private Double pm10;
	private String quality;
	private String wendu;
	private String ganmao;
	private Day yesterday;
	private List forecast;
	public String getShidu() {
		return shidu;
	}
	public void setShidu(String shidu) {
		this.shidu = shidu;
	}
	public Double getPm25() {
		return pm25;
	}
	public void setPm25(Double pm25) {
		this.pm25 = pm25;
	}
	public Double getPm10() {
		return pm10;
	}
	public void setPm10(Double pm10) {
		this.pm10 = pm10;
	}
	public String getQuality() {
		return quality;
	}
	public void setQuality(String quality) {
		this.quality = quality;
	}
	public String getWendu() {
		return wendu;
	}
	public void setWendu(String wendu) {
		this.wendu = wendu;
	}
	public String getGanmao() {
		return ganmao;
	}
	public void setGanmao(String ganmao) {
		this.ganmao = ganmao;
	}
	public Day getYesterday() {
		return yesterday;
	}
	public void setYesterday(Day yesterday) {
		this.yesterday = yesterday;
	}
	public List<Day> getForecast() {
		return forecast;
	}
	public void setForecast(List<Day> forecast) {
		this.forecast = forecast;
	}
	
	public Data() {
		super();
	}
	public Data(String shidu, Double pm25, Double pm10, String quality,
			String wendu, String ganmao, Day yesterday, List<Day> forecast) {
		super();
		this.shidu = shidu;
		this.pm25 = pm25;
		this.pm10 = pm10;
		this.quality = quality;
		this.wendu = wendu;
		this.ganmao = ganmao;
		this.yesterday = yesterday;
		this.forecast = forecast;
	}
	@Override
	public String toString() {
		return "Data [shidu=" + shidu + ", pm25=" + pm25 + ", pm10=" + pm10
				+ ", quality=" + quality + ", wendu=" + wendu + ", ganmao="
				+ ganmao + ", yesterday=" + yesterday + ", forecast="
				+ forecast + "]";
	}
	
	
}
