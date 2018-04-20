package cn.com.webxmlphone;

import java.util.List;

public class Test {
	
	public static void main(String[] args) {
		
		MobileCodeWS ws = new MobileCodeWS();
		MobileCodeWSSoap port = ws.getMobileCodeWSSoap();
		
		String mobileCodeInfo = port.getMobileCodeInfo("15225253086", "");
		System.out.println(mobileCodeInfo);
		
	}
	
}
