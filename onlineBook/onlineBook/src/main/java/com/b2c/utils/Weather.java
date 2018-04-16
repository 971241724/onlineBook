package com.b2c.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.b2c.entity.Data;
import com.b2c.entity.Day;
import com.b2c.entity.WeatherBean;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

public class Weather {
	
	public static void main(String[] args) throws IOException {
		//ww("昌平区");
		weather();
	}
	
	
	
	
  
   public static void weather() throws IOException{
	    
	   //参数url化
		String city = java.net.URLEncoder.encode("北京", "utf-8");
		System.out.println(city);
		//拼地址
		String apiUrl = String.format("https://www.sojson.com/open/api/weather/json.shtml?city=%s",city);
		//开始请求
		URL url= new URL(apiUrl);
		if("https".equalsIgnoreCase(url.getProtocol())){
		   try {
			   SslUtils.ignoreSsl();
		   } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   }
		}
		URLConnection open = url.openConnection();
		InputStream input = open.getInputStream();
		//这里转换为String，带上包名，怕你们引错包
		String result = org.apache.commons.io.IOUtils.toString(input,"utf-8");
		//输出
		System.out.println(result);

   }
	
	
   public static WeatherBean ww(String ss) throws IOException {
	    //参数url化
		String city = java.net.URLEncoder.encode(ss, "utf-8");	
		//拼地址
		String apiUrl = String.format("https://www.sojson.com/open/api/weather/json.shtml?city=%s",city);
		//开始请求
		URL url= new URL(apiUrl);
		if("https".equalsIgnoreCase(url.getProtocol())){
		   try {
			   SslUtils.ignoreSsl();
		   } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   }
		}
		//URL url= new URL(apiUrl);
		URLConnection open = url.openConnection();
		InputStream input = open.getInputStream();
		String result = org.apache.commons.io.IOUtils.toString(input,"utf-8");
		JSONObject jb = JSONObject.fromObject(result);
		Map<String,Class> map = new HashMap<String, Class>();
		map.put("", WeatherBean.class);
		map.put("data", Data.class);
		map.put("yesterday", Data.class);
		map.put("forecast", Day.class);
		WeatherBean delivery = (WeatherBean) JSONObject.toBean(jb,WeatherBean.class, map);
		/*Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd日EEE");
		String format = sdf.format(date);
		Day da = null;
		for(Day day:delivery.getData().getForecast()){
			if(format.equals(day.getDate())){
				da = day;
				System.out.println(da);
			}
		}*/
		return delivery;
   }
}
