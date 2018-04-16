package com.b2c.utils;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;

import com.b2c.entity.SysOperateLog;
import com.b2c.service.ISysLogService;

public class ExcelOutput {
	
	@Resource(name="sysLogServiceImp")
	private static ISysLogService sysLogServiceImp;
	
	public static void main(String[] args) throws IOException {
		excelOutput();
	}
	
	public static void excelOutput() throws IOException{
		//获取源数据
		Integer pc = 1;
		Integer PSL = 100;
		PageBean<SysOperateLog> page = sysLogServiceImp.selectLog(pc, PSL);
		List<SysOperateLog> beanlist = page.getBeanlist();
		
		int rowNo = 0;
		int colNo = 1;
		Row nRow = null;
		Cell nCell = null;
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet();
		//处理大标题
		nRow = sheet.createRow(rowNo++);
		nCell = nRow.createCell(1);
		nCell.setCellValue("用户系统操作日志");
		//合并单元格
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 1, 6));
		rowNo++;
		
		for(int i=0;i<beanlist.size();i++){
			SysOperateLog sysOperateLog = beanlist.get(i);
			colNo = 1;
			nRow = sheet.createRow(rowNo++);
			nRow.setHeightInPoints(26);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getUser_name());
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getTable_name());
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getResult());
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getModule());
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getOperation());
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getCreate_time());
		}
		FileOutputStream fileout = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\用户操作日志.xls");
	    wb.write(fileout);
	    fileout.close();
	}
	
}
