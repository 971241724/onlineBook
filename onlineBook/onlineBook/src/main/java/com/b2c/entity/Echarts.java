package com.b2c.entity;

public class Echarts {
	
	private String legendData;
	private String seriesData;
	
	public String getLegendData() {
		return legendData;
	}

	public void setLegendData(String legendData) {
		this.legendData = legendData;
	}

	public String getSeriesData() {
		return seriesData;
	}

	public void setSeriesData(String seriesData) {
		this.seriesData = seriesData;
	}

	public Echarts() {
		super();
	}
	
	public Echarts(String legendData, String seriesData) {
		super();
		this.legendData = legendData;
		this.seriesData = seriesData;
	}

	public String toString() {
		return "Echarts [legendData=" + legendData + ", seriesData="
				+ seriesData + "]";
	}
	
	
	
}
