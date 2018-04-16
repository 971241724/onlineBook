package com.b2c.entity;

public class Notice {

	private int notice_id; //编号
	private String notice_title; //标题
	private String notice_content; //内容
	private String notice_date; //发布时间
	private int notice_level; //级别
	
	
	public Notice() {
		super();
	}
	
	public Notice(int notice_id, String notice_title, String notice_content,
			String notice_date, int notice_level) {
		super();
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_level = notice_level;
	}

	
	
	public Notice(String notice_title, String notice_content,
			String notice_date, int notice_level) {
		super();
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_level = notice_level;
	}

	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_level() {
		return notice_level;
	}
	public void setNotice_level(int notice_level) {
		this.notice_level = notice_level;
	}
}
