package com.b2c.utils;

public class ZtreeTest {
	
	public static void main(String[] args) {
		System.out.println(ztree());
	}
	
	public static String ztree(){
		
		String str = "[{\"id\":\"0001\",\"pId\":\"\",\"name\":\"�ܾ���\",\"isParent\":\"true\"},"
				+ "{\"id\":\"0002\",\"pId\":\"\",\"name\":\"����\",\"isParent\":\"true\"},"
				+ "{\"id\":\"0003\",\"pId\":\"\",\"name\":\"��Ŀ����\",\"isParent\":\"true\"},"
				+ "{\"id\":\"0004\",\"pId\":\"0001\",\"name\":\"С��\",\"isParent\":\"false\",},"
				+ "{\"id\":\"0005\",\"pId\":\"0002\",\"name\":\"С��\",\"isParent\":\"false\",},"
				+ "{\"id\":\"0006\",\"pId\":\"0003\",\"name\":\"С��\",\"isParent\":\"false\",}"
				+ "]";
		return str;
	}
	
}
