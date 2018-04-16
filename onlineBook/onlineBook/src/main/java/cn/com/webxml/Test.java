package cn.com.webxml;

import java.util.List;

public class Test {
	
	public static void main(String[] args) {
		//ws服务
		EnglishChinese ws = new EnglishChinese();
		//创建类
		EnglishChineseSoap port = ws.getEnglishChineseSoap();
		//调用方法
		List<String> str = port.translatorString("Progress is not created by contented people.").getString();
		for(String s : str){
			System.out.println(s);
		}
	}
	
}
