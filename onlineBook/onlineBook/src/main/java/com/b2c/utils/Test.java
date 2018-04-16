package com.b2c.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class Test {
	//   https://www.baidu.com/#ie=utf-8&f=3&rsv_bp=0&rsv_idx=1&tn=baidu&wd=%E4%BD%A0%E5%A5%BD&rsv_pq=bf6330d800004a80&rsv_t=f597P3qO9XeK7Yl0tvv%2Bhru9anW1Xl76e4RP22GzRuguChYdkFEO6ri8At0&rqlang=cn&rsv_enter=0&rsv_sug3=1&rsv_sug1=1&rsv_sug7=100&prefixsug=%25E4%25BD%25A0%25E5%25A5%25BD&rsp=0&inputT=2763&rsv_sug4=2763&rsv_sug=1
    //   https://www.baidu.com/#ie=utf-8&f=8&rsv_bp=0&rsv_idx=1&tn=baidu&wd=876&rsv_pq=c0289fb600004f95&rsv_t=2187AefGYMPLa9twjQlt21XhipzP8vqZu8q32rzr4tHqoOQmEvoNbTXFLwY&rqlang=cn&rsv_enter=0&rsv_sug3=3&rsv_sug1=3&rsv_sug7=100&inputT=1533&rsv_sug4=1533
	
	
	public static void main(String[] args) throws IOException {
		int i = 0;
		while(true){
			System.out.println(xx());
			System.out.println(i++);
		}
 		
	}
	public static String xx() throws IOException{
		URL url= new URL("http://www.baidu.com/s?wd=BC");
 		URLConnection open = url.openConnection();
 		InputStream input = open.getInputStream();
 		String result = org.apache.commons.io.IOUtils.toString(input,"utf-8");
 		return result;
	}

}
