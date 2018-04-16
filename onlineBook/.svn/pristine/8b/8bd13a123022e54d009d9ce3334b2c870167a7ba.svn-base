package com.b2c.utils;

import java.util.List;

/**
 * 
 * 高欢    创建时间  2017/03/23  17:13:00
 * 
 * 分页工具类
 * @author Administrator
 * @param <T>
 * 
 */
public class PageBean<T> {
	
	private int pc;                    //当前页码
	private int tr;                    //总记录条数
	private int ps;                    //每页显示的条数
	private String url;				   //查询URL
	private List<T> beanlist;          //查询的记录
	
	/**
	 * 
	 * 求出总的页数
	 * @return
	 * 
	 */
	public int getTp(){
		
		int tp=tr/ps;
		return tr%ps==0?tp:tp+1;
		
	}
	
	public int getPc() {
		return pc;
	}
	public void setPc(int pc) {
		this.pc = pc;
	}
	public int getTr() {
		return tr;
	}
	public void setTr(int tr) {
		this.tr = tr;
	}
	public int getPs() {
		return ps;
	}
	public void setPs(int ps) {
		this.ps = ps;
	}
	public List<T> getBeanlist() {
		return beanlist;
	}
	public void setBeanlist(List<T> beanlist) {
		this.beanlist = beanlist;
	}
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	public PageBean(int pc, int tr, int ps) {
		super();
		this.pc = pc;
		this.tr = tr;
		this.ps = ps;
		
	}
	public PageBean(int pc, int tr, int ps, List<T> beanlist) {
		super();
		this.pc = pc;
		this.tr = tr;
		this.ps = ps;
		this.beanlist = beanlist;
	}
	
	public PageBean(int pc, int tr, int ps, String url, List<T> beanlist) {
		super();
		this.pc = pc;
		this.tr = tr;
		this.ps = ps;
		this.url = url;
		this.beanlist = beanlist;
	}

	public PageBean() {
		super();
	}
	
}
