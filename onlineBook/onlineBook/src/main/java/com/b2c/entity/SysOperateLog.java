package com.b2c.entity;

import java.util.Date;

public class SysOperateLog {
	
	private int log_id;                        //日志ID
	private String user_name;                  //用户名
	private String table_name;                 //表名
	private String result;                     //操作结果
	private String module;                     //操作模块
	private String operation;                  //操作类型
	private Date create_time;                  //操作时间
	private String visit_ip;                   //客户IP
	private String local_ip;                   //服务器IP
	
	public int getLog_id() {
		return log_id;
	}

	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getVisit_ip() {
		return visit_ip;
	}

	public void setVisit_ip(String visit_ip) {
		this.visit_ip = visit_ip;
	}

	public String getLocal_ip() {
		return local_ip;
	}

	public void setLocal_ip(String local_ip) {
		this.local_ip = local_ip;
	}

	@Override
	public String toString() {
		return "SysOperateLog [log_id=" + log_id + ", user_name=" + user_name
				+ ", table_name=" + table_name + ", result=" + result
				+ ", module=" + module + ", operation=" + operation
				+ ", create_time=" + create_time + "]";
	}

	public SysOperateLog() {
		super();
	}

	

	public SysOperateLog(int log_id, String user_name, String table_name,
			String result, String module, String operation, Date create_time) {
		super();
		this.log_id = log_id;
		this.user_name = user_name;
		this.table_name = table_name;
		this.result = result;
		this.module = module;
		this.operation = operation;
		this.create_time = create_time;
	}

	public SysOperateLog(int log_id, String user_name, String table_name,
			String result, String module, String operation, Date create_time,
			String visit_ip, String local_ip) {
		super();
		this.log_id = log_id;
		this.user_name = user_name;
		this.table_name = table_name;
		this.result = result;
		this.module = module;
		this.operation = operation;
		this.create_time = create_time;
		this.visit_ip = visit_ip;
		this.local_ip = local_ip;
	}
    

}
