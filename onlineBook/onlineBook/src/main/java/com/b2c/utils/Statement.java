package com.b2c.utils;

public class Statement {
	
    private String name;
    private Integer number;
    
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Statement() {
		super();
	}
	public Statement(String name, Integer number) {
		super();
		this.name = name;
		this.number = number;
	}
	@Override
	public String toString() {
		return "Statement [name=" + name + ", number=" + number + "]";
	}
     
}
