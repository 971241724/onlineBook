package com.b2c.utils;


import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource{


	@Override
	protected Object determineCurrentLookupKey() {
		System.out.println("1231231");
		return DataSourceContextHolder.get();
	}
	
		
}
