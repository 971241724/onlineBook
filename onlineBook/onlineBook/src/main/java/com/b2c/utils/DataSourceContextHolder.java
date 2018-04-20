package com.b2c.utils;

public class DataSourceContextHolder{
	
	private static final ThreadLocal<String> contextholder = new ThreadLocal<String>();

	public static String get() {
		return contextholder.get();
	}

	public static void set(String value) {
		contextholder.set(value);
	}

	public static void remove() {
		contextholder.remove();
	}
	
	
}
