package com.b2c.utils;

public class Unicode {
	
	public static void main(String[] args) {
		String str = "存在即是合理。";
		char arr [] = str.toCharArray();
		for(int i = 0;i<arr.length;i++){
			Integer valueOf = Integer.valueOf(arr[i]);
			System.out.print(valueOf+" ");
			char cc = (char)Integer.parseInt(valueOf.toString());
			System.out.println(cc);
		}
	}
	
}
