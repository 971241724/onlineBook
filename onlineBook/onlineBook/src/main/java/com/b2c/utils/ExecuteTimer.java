package com.b2c.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
/**
 * 
 * ¶¨Ê±Æ÷
 * @author ¸ß»¶
 *
 */
public class ExecuteTimer {
	
    public static void main(String[] args) {
    	Timer timer = new Timer();
		Calendar date = Calendar.getInstance();
	    date.set(date.get(Calendar.YEAR), date.get(Calendar.MONTH), date.get(Calendar.DATE), 0, 0, 0);
    	long daySpan = 24*60*60*1000;
	    timer.schedule(new TimerTask(){
			@Override
			public void run() {
				System.out.println((int)(Math.random()*10));
			}
	    }, 1000, 2000);
    }
	
}
