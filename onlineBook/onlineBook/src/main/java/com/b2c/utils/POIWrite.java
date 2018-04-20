package com.b2c.utils;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class POIWrite {
	
	public static void main(String[] args) throws IOException {
		//ExcelExport();
		//POItest();
		test();
	}
	
	public static void ExcelExport() throws IOException{
		//创建一个工作簿
		Workbook wb = new HSSFWorkbook();
		//创建一个表
		Sheet sheet = wb.createSheet("new sheet");  
		// 创建一个行并在其中放置一些单元格
		Row row = sheet.createRow((short)0); 
	    //创建一个单元格并放入一个值
		Cell cell = row.createCell(0);
        cell.setCellValue("高欢");
        //将输出写入文件
        FileOutputStream fileout = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\workExport02.xls");
        wb.write(fileout);
        fileout.close();
	}
	
	
	public static void POItest() throws IOException{
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("poi");
		for(int i=0;i<10;i++){
			Row row = sheet.createRow(i);
			for(int j=0;j<5;j++){
				row.createCell(j).setCellValue(i+"."+j);
			}
		}
		FileOutputStream fileout = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\workExport01.xls");
		wb.write(fileout);
		fileout.close();
	}
	
	public static void test() throws IOException{
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("frist");
		Row row = sheet.createRow(0);
		String strarr[] = {"姓名","年龄","性别","职位"};
		for(int i=0;i<strarr.length;i++){
			row.createCell(i).setCellValue(strarr[i]);
		}
		FileOutputStream fileout = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\workExport03.xls");
	    wb.write(fileout);
	    fileout.close();
	}
}
