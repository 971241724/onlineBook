package cn.com.webxmlip;

import java.util.List;

public class Test {
	
	public static void main(String[] args) {
		
		IpAddressSearchWebService ws = new IpAddressSearchWebService();
		IpAddressSearchWebServiceSoap port = ws.getIpAddressSearchWebServiceSoap();
		List<String> string = port.getCountryCityByIp("10.55.15.42").getString();
		for(String str: string){
			System.out.println(str);
		}
	}
	
}
