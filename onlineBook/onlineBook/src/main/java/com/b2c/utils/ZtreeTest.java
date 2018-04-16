package com.b2c.utils;

public class ZtreeTest {
	
	public static void main(String[] args) {
		System.out.println(ztree());
	}
	
	public static String ztree(){
		
		String str = "[{\"id\":\"0001\",\"pId\":\"\",\"name\":\"总经理\",\"isParent\":\"true\"},"
				+ "{\"id\":\"0002\",\"pId\":\"\",\"name\":\"主管\",\"isParent\":\"true\"},"
				+ "{\"id\":\"0003\",\"pId\":\"\",\"name\":\"项目经理\",\"isParent\":\"true\"},"
				+ "{\"id\":\"0004\",\"pId\":\"0001\",\"name\":\"小王\",\"isParent\":\"false\",},"
				+ "{\"id\":\"0005\",\"pId\":\"0002\",\"name\":\"小明\",\"isParent\":\"false\",},"
				+ "{\"id\":\"0006\",\"pId\":\"0003\",\"name\":\"小红\",\"isParent\":\"false\",}"
				+ "]";
		return str;
	}
	
}
