package com.b2c.utils;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;

public class sendsms {
	
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	
	public static void main(String[] args) {
		String phoneCode = PhoneCode.getPhoneCode();
		//fasong("15225253086",phoneCode);
	}
	
	public static void fasong(String telephone, String str) {
		
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url);

		client.getParams().setContentCharset("GBK");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");

		

	    String content = new String("������֤���ǣ�" + str + "���벻Ҫ����֤��й¶�������ˡ�");

		NameValuePair[] data = {
			    new NameValuePair("account", "C37229347"), //�鿴�û������¼�û�����->��֤�롢֪ͨ����->�ʻ���ǩ������->APIID
			    new NameValuePair("password", "703dca7286a439c87de251c0d59bfed9"), //�鿴�������¼�û�����->��֤�롢֪ͨ����->
			  
			    new NameValuePair("mobile", telephone), 
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);

		try {
			client.executeMethod(method);
			
			String SubmitResult =method.getResponseBodyAsString();

			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult);
			Element root = doc.getRootElement();

			String code = root.elementText("code");
			String msg = root.elementText("msg");
			String smsid = root.elementText("smsid");

			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);

			 if("2".equals(code)){
				System.out.println("��ȡ�ֻ���֤��");
			}

		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}	
		
	}
	
}