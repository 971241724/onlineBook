package cn.com.webxml;

import java.util.List;

public class Test {
	
	public static void main(String[] args) {
		//ws����
		EnglishChinese ws = new EnglishChinese();
		//������
		EnglishChineseSoap port = ws.getEnglishChineseSoap();
		//���÷���
		List<String> str = port.translatorString("Progress is not created by contented people.").getString();
		for(String s : str){
			System.out.println(s);
		}
	}
	
}
