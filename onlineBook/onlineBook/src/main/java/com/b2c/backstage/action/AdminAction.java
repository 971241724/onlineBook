package com.b2c.backstage.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import org.springframework.web.multipart.MultipartFile;



































import com.b2c.backstage.service.IAdminService;
import com.b2c.entity.ActivitiRePro;
import com.b2c.entity.Admin;
import com.b2c.entity.Book;
import com.b2c.entity.BookType;
import com.b2c.entity.Day;
import com.b2c.entity.Echarts;
import com.b2c.entity.Eval;
import com.b2c.entity.Order;
import com.b2c.entity.SysOperateLog;
import com.b2c.entity.User;
import com.b2c.entity.WeatherBean;
import com.b2c.service.IBookService;
import com.b2c.service.IBookTypeService;
import com.b2c.service.ICartService;
import com.b2c.service.IEvalService;
import com.b2c.service.IOrderService;
import com.b2c.service.ISysLogService;
import com.b2c.service.IUserService;
import com.b2c.utils.DataSourceContextHolder;
import com.b2c.utils.FileUtil;
import com.b2c.utils.PageBean;
import com.b2c.utils.Statement;
import com.b2c.utils.Weather;
import com.b2c.utils.ZtreeTest;

/**
 * 
 * 管理员action层实体类
 * @author 高欢
 * createTime 2017/08/17
 *
 */
@Controller
public class AdminAction {
	
	final Integer PS = 10;
	final Integer PSL = 15;
	
	@Resource(name="adminServiceImp")
	private IAdminService adminServiceImp;
	
	@Resource(name="bookServiceImp")
	private IBookService bookServiceImp;
	
	@Resource(name="bookTypeServiceImp")
	private IBookTypeService bookTypeServiceImp;
	
	@Resource(name="evalServiceImp")
	private IEvalService evalServiceImp;
	
	@Resource(name="userServiceImp")
	private IUserService userServiceImp;
	
	@Resource(name="orderServiceImp")
	private IOrderService orderServiceImp;
	
	@Resource(name="sysLogServiceImp")
	private ISysLogService sysLogServiceImp;
	
	@Resource(name="cartServiceImp")
	private ICartService cartServiceImp;
	
	@RequestMapping(value="ActivitiRePro.action")
	public String seelctActivitiRePro(){
		//测试多个数据源之间的动态切换
		DataSourceContextHolder.set("dataSourceTwo");
		List<ActivitiRePro> selectActivitiRePro = adminServiceImp.selectActivitiRePro();
		for(ActivitiRePro activiti : selectActivitiRePro){
			System.out.println(activiti);
		}
		//测试结束
		return "forward:/backstage/login_manager.jsp";
	}
	/**
	 * 管理员登录
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="adminLogin.action")
	public String adminLogin(String admin_no,String admin_pwd,Model model,HttpSession session) throws IOException{
		DataSourceContextHolder.set("dataSourceOne");
		Admin admin = adminServiceImp.adminLogin(admin_no, admin_pwd);
		//获取天气预报
		WeatherBean ww = Weather.ww("北京");
		System.out.println(ww.getData().getForecast());
		Date date = new Date();
		Day da = null;
		SimpleDateFormat sdf = new SimpleDateFormat("dd日EEE");
		String format = sdf.format(date);
		for(Day day:ww.getData().getForecast()){
			if(format.equals(day.getDate())){
				da = day;
			}
		}
		if(admin != null){
			session.setAttribute("admin",admin);
			model.addAttribute("weats", ww);
			model.addAttribute("weat", da);
			System.out.println(ww);
			System.out.println(da);
			return "forward:/backstage/fruit_manager.jsp";
		}else {
			model.addAttribute("message", "账号密码错误!");
			return "forward:/backstage/login_manager.jsp";
		}
	}
	/**
	 * 判断原始密码是否正确
	 * @param admin_pwd
	 * @param session
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="backstage/selectAdminPwd.action")
	@ResponseBody
	public void selectAdminPwd(String admin_pwd,HttpSession session,HttpServletResponse response) throws IOException{
		Admin admin = (Admin)session.getAttribute("admin");
		Admin adminLogin = adminServiceImp.adminLogin(admin.getAdmin_no(), admin_pwd);
		if(adminLogin == null){
			response.getWriter().write("  * 原始密码错误!");
		}
	}
	/**
	 * 修改管理员密码
	 * @param admin_pwd
	 * @param new_pwd
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="updateAdminPwd.action")
	public String updateAdminPwd(String admin_pwd,String new_pwd,Model model,HttpSession session){
		Admin admin = (Admin)session.getAttribute("admin");
		boolean bool = adminServiceImp.updateAdminPwd(admin.getAdmin_no(), admin_pwd, new_pwd);
		if(bool){
			model.addAttribute("message", "<font style='color:green'>修改成功!</font>");
			return "forward:/backstage/alterpassword.jsp";
		}else {
			model.addAttribute("message", "<font style='color:red'>修改失败!</font>");
			return "forward:/backstage/alterpassword.jsp";
		}
	}
	/**
	 * 查询管理员信息
	 * @param pc
	 * @param model
	 * @return
	 */
	@RequestMapping(value="selectAdmin.action")
	public String selectAdmin(Integer pc,Model model){
		if(pc == null){
			pc = 1;
		}
		PageBean<Admin> page = adminServiceImp.selectAdmin(pc, PS);
		model.addAttribute("page", page);
		return "forward:/backstage/adminlist.jsp";
	}
	/**
	 * 管理员查询图书+分页
	 * @param pc
	 * @param model
	 * @return
	 */
	@RequestMapping(value="adminSelectBook.action")
	public String adminSelectBook(Integer pc,Model model){
		if(pc == null){
			pc = 1;
		}
	    PageBean<Book> page = bookServiceImp.adminSelectBook(pc, PSL);
	    model.addAttribute("page", page);
		return "forward:/backstage/vegetablelist.jsp";
	}
	/**
	 * 管理员删除图书
	 * @param book_id
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="deleteBook.action")
	@ResponseBody
	public void deleteBook(Integer book_id,HttpServletResponse response,Model model) throws IOException{
		boolean bool = bookServiceImp.deleteBook(book_id);
		if(bool){
			response.getWriter().write("删除成功!");
		}
	}
	/**
	 * 管理员获取图书
	 * @return
	 */
	@RequestMapping(value="adminGetBook.action")
	public String adminGetBook(String book_id,Model model){
		Book book = bookServiceImp.getBook_id(book_id);
		System.out.println(book);
		model.addAttribute("book", book);
		return "forward:/backstage/vegetableAlter.jsp";
	}
	/**
	 * 管理员修改图书详细信息
	 * @return
	 */
	@RequestMapping(value="bookAlter.action")
	public String bookAlter(Book book,Model model){
		if(book.getT_Price()!=0.0){
			book.setDown_sale(1);
		}else if(book.getT_Price()==0.0){
			book.setT_Price(null);
			book.setDown_sale(0);
		}
		BookType bookType = bookTypeServiceImp.selectBookType(book.getBook_type());
		book.setBook_type_id(bookType.getBookType_id());
		boolean bool = bookServiceImp.bookAlter(book);
		if(bool){
			model.addAttribute("message", "修改成功!");
			return "forward:/backstage/vegetableAlter.jsp";
		}else{
			model.addAttribute("message","修改失败!");
			return "forward:/backstage/vegetableAlter.jsp";
		}
	}
	/**
	 * 管理员修改图书图片
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="saveorupdateBookImages.action")
	public String saveorupdateBookImages(@RequestParam MultipartFile potos,String book_id,Model model,HttpSession session) throws IllegalStateException, IOException{
		if(!potos.isEmpty()){
			String path = session.getServletContext().getRealPath("/bookimages");
			String filename = potos.getOriginalFilename();
			if(filename.endsWith(".jpg") || filename.endsWith(".png")){
				File file = new File(path,filename);
				potos.transferTo(file);
				String dataPath = "bookimages"+"/"+filename;
				System.out.println(book_id);
				boolean bool = bookServiceImp.updateBookImage(book_id, dataPath);
				if(bool){
					model.addAttribute("mes", "图片上传成功");
					return "forward:/backstage/vegetableAlter.jsp";
				}else{
					model.addAttribute("mes", "图片上传失败");
					return "forward:/backstage/vegetableAlter.jsp";
				}
			}else{
				model.addAttribute("mes", "图片上传格式不正确！");
				return "forward:/backstage/vegetableAlter.jsp";
			}
		}else {
			model.addAttribute("mes", "未添加图片");
			return "forward:/backstage/vegetableAlter.jsp";
		}
	}
	/**
	 * 管理员查看评价
	 * @return
	 */
	@RequestMapping(value="adminSelectEval.action")
	public String adminSelectEval(Integer pc,Integer book_id,Model model){
		if(pc == null){
			pc = 1;
		}
		PageBean<Eval> page = evalServiceImp.adminSelectEval(pc, PSL,book_id);
		model.addAttribute("page", page);
		return "forward:/backstage/commentlist.jsp";
	}
	/**
	 * 管理员查询所有用户信息
	 * @param pc
	 * @param model
	 * @return
	 */
	@RequestMapping(value="adminSelectUser.action")
	public String adminSelectUser(Integer pc,Model model){
		if(pc == null){
			pc = 1;
		}
		PageBean<User> page = userServiceImp.adminSelectUser(pc, PSL);
		model.addAttribute("page", page);
		return "forward:/backstage/listAllUsers.jsp";
	}
	/**
	 * 管理员删除用户
	 * @throws IOException 
	 */
	@RequestMapping(value="adminDeleteUser.action")
	public void adminDeleteUser(Integer user_id,HttpServletResponse response) throws IOException{
		boolean bool = userServiceImp.adminDeleteUser(user_id);
		if(bool){
			response.getWriter().write("删除成功!");
		}else{
			response.getWriter().write("删除失败!");
		}
	}
	/**
	 * 管理员添加图书
	 * @return
	 */
	@RequestMapping(value="adminAddBook.action")
	public String bookadd(Book book,Model model,HttpSession session){
	    Book findBook = bookServiceImp.findBook(book.getBook_name());
	    if(findBook!=null){
	    	model.addAttribute("message", "图书已存在!");
			return "forward:/backstage/vegetableAdd.jsp";
	    }else {
	    	BookType bookType = bookTypeServiceImp.selectBookType(book.getBook_type());
			book.setBook_type_id(bookType.getBookType_id());
			Admin admin = (Admin)session.getAttribute("admin");
			if(book.getT_Price()!=0){
				book.setDown_sale(1);
			}else {
				book.setT_Price(null);
			}
			boolean bool = bookServiceImp.adminAddBook(book);
			System.out.println(book+"===============");
			if(bool){
				Book findBooks = bookServiceImp.findBook(book.getBook_name());
				System.out.println(findBooks+"yyyyyyyyyy");
				session.setAttribute("book_id", findBooks.getBook_id());
				model.addAttribute("message", "添加成功!");
				model.addAttribute("book", book);
				return "forward:/backstage/vegetableAdd.jsp";
			}else {
				model.addAttribute("message", "添加失败!");
				return "forward:/backstage/vegetableAdd.jsp";
			}
		}
	}
	/**
	 * 管理员添加图片
	 * @param potos
	 * @param book_id
	 * @param model
	 * @param session
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="bookAddImage.action")
	public String bookAddImage(@RequestParam MultipartFile potos,String book_id,Model model,HttpSession session) throws IllegalStateException, IOException{
		System.out.println(book_id+"sssssssssssssssss");
		if(book_id==""||book_id==null||book_id.isEmpty()){
			model.addAttribute("mes", "请先添加图书的基本信息!");
			return "forward:/backstage/vegetableAdd.jsp";
		}else{
			if(!potos.isEmpty()){
				String path = session.getServletContext().getRealPath("/bookimages");
				String filename = potos.getOriginalFilename();
				if(filename.endsWith(".jpg") || filename.endsWith(".png")){
					File file = new File(path,filename);
					potos.transferTo(file);
					String dataPath = "bookimages"+"/"+filename;
					//System.out.println(book_id);
					boolean bool = bookServiceImp.updateBookImage(book_id, dataPath);
					if(bool){
						model.addAttribute("mes", "图片上传成功");
						return "forward:/backstage/vegetableAdd.jsp";
					}else{
						model.addAttribute("mes", "图片上传失败");
						return "forward:/backstage/vegetableAdd.jsp";
					}
				}else{
					model.addAttribute("mes", "图片上传格式不正确！");
					return "forward:/backstage/vegetableAdd.jsp";
				}
			}else {
				model.addAttribute("mes", "未添加图片");
				return "forward:/backstage/vegetableAdd.jsp";
			}
		}
	}
	/**
	 * 管理员查询日志
	 */
	@RequestMapping(value="adminSelectSysOperateLog.action")
	public String selectLog(Integer pc,Model model){
		if(pc == null){
			pc = 1;
		}
		PageBean<SysOperateLog> page = sysLogServiceImp.selectLog(pc, PSL);
		model.addAttribute("page", page);
		return "forward:/backstage/userLog.jsp";
	}
	/**
	 * 管理员删除日志
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="deleteLog.action")
	@ResponseBody
	public void deleteLog(Integer log_id,HttpServletResponse response) throws IOException{
		boolean bool = sysLogServiceImp.deleteLog(log_id);
		if(bool){
			response.getWriter().write("删除成功!");
		}else {
			response.getWriter().write("删除失败!");
		}
	}
	
	/**
	 * 管理员查询未处理订单
	 * @param pc
	 * @param model
	 * @return
	 */
	@RequestMapping(value="findUnDealOrder.action")	
	public String findUnDealOrder(Integer pc,Model model){
		if(pc == null){
			pc = 1;
		}
	    PageBean<Order> page = orderServiceImp.findUnDealOrder(pc, PSL);
	    model.addAttribute("page", page);
		return "forward:/backstage/unDealBook.jsp";
	}
	/**
	 * 管理员处理订单
	 * @param order_id
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="adminAddOrder.action")
	public void adminAddOrder(Integer order_id,HttpServletResponse response) throws IOException{
		boolean bool = orderServiceImp.adminAddOrder(order_id);
		if(bool){
			response.getWriter().write("更新成功!");
		}else{
			response.getWriter().write("更新失败!");
		}
	}
	
	/**
	 * 管理员查询已处理订单
	 * @param pc
	 * @param model
	 * @return
	 */
	@RequestMapping(value="findDealedOrder.action")	
	public String findDealedOrder(Integer pc,Model model){
		if(pc == null){
			pc = 1;
		}
	    PageBean<Order> page = orderServiceImp.findDealedOrder(pc, PSL);
	    model.addAttribute("page", page);
		return "forward:/backstage/dealedBook.jsp";
	}
	
	/**
	 * 
	 * 导出Excel表
	 * @return
	 * @throws IOException
	 * 
	 */
	@RequestMapping(value="excelOutput.action")
	public void excelOutput(HttpServletResponse response,HttpServletRequest request) throws IOException{
		int rowNo = 0;
		int colNo = 1;
		Row nRow = null;
		Cell nCell = null;
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet();
		sheet.setColumnWidth(0, 1*256);
		sheet.setColumnWidth(1, 15*256);
		sheet.setColumnWidth(2, 33*256);
		sheet.setColumnWidth(3, 18*256);
		sheet.setColumnWidth(4, 18*256);
		sheet.setColumnWidth(5, 15*256);
		sheet.setColumnWidth(6, 15*256);
		//获取源数据
		Integer pc = 1;
		Integer PSL = 100;
		PageBean<SysOperateLog> page = sysLogServiceImp.selectLog(pc, PSL);
		List<SysOperateLog> beanlist = page.getBeanlist();
		//大标题样式
		CellStyle bigTitleStyle = wb.createCellStyle();
		bigTitleStyle.setAlignment(CellStyle.ALIGN_CENTER);				//横向居中
		bigTitleStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);	//纵向居中
		Font bigTilteFont = wb.createFont();
		bigTilteFont.setFontName("宋体");						        //设置字体名称
		bigTilteFont.setFontHeightInPoints((short)16);					//字体大小
		bigTilteFont.setBoldweight(Font.BOLDWEIGHT_BOLD);  				//字体加粗
		bigTitleStyle.setFont(bigTilteFont);							//绑定字体
		//处理大标题
		nRow = sheet.createRow(rowNo++);
		nRow.setHeightInPoints(36);
		nCell = nRow.createCell(1);
		nCell.setCellValue("用户系统操作日志");
		nCell.setCellStyle(bigTitleStyle);
		//合并单元格
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 1, 6));
		//处理子标题
		CellStyle titleStyle = wb.createCellStyle();
		titleStyle.setAlignment(CellStyle.ALIGN_CENTER);				//横向居中
		titleStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);		//纵向居中
		Font titleFont = wb.createFont();
		titleFont.setFontName("黑体");
		titleFont.setFontHeightInPoints((short)12);
		titleStyle.setFont(titleFont);
		//画线
		titleStyle.setBorderTop(CellStyle.BORDER_THIN);					//上细线
		titleStyle.setBorderBottom(CellStyle.BORDER_THIN);				//上细线
		titleStyle.setBorderLeft(CellStyle.BORDER_THIN);				//上细线
		titleStyle.setBorderRight(CellStyle.BORDER_THIN);				//上细线
		//内容样式
		CellStyle textStyle = wb.createCellStyle();
		textStyle.setAlignment(CellStyle.ALIGN_CENTER);				//横向居中
		textStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		
		Font textFont = wb.createFont();
		textFont.setFontName("Times New Roman");
		textFont.setFontHeightInPoints((short)10);
		textStyle.setFont(textFont);
		//画线
		textStyle.setBorderTop(CellStyle.BORDER_THIN);					//上细线
		textStyle.setBorderBottom(CellStyle.BORDER_THIN);				//上细线
		textStyle.setBorderLeft(CellStyle.BORDER_THIN);					//上细线
		textStyle.setBorderRight(CellStyle.BORDER_THIN);				//上细线
		
		String title[] = {"用户名","操作时间","操作IP","操作模块","操作名称","操作结果"};
		nRow = sheet.createRow(rowNo++);
		nRow.setHeightInPoints(23);
		for(int i=0;i<title.length;i++){
			nCell = nRow.createCell(i+1);
			nCell.setCellValue(title[i]);
			nCell.setCellStyle(titleStyle);
		}
		for(int i=0;i<beanlist.size();i++){
			SysOperateLog sysOperateLog = beanlist.get(i);
			colNo = 1;
			nRow = sheet.createRow(rowNo++);
			nRow.setHeightInPoints(21);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getUser_name());
			nCell.setCellStyle(textStyle);
			
			nCell = nRow.createCell(colNo++);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format = sdf.format(sysOperateLog.getCreate_time());
			nCell.setCellValue(format);
			nCell.setCellStyle(textStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getVisit_ip());
			nCell.setCellStyle(textStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getModule());
			nCell.setCellStyle(textStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getOperation());
			nCell.setCellStyle(textStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sysOperateLog.getResult());
			nCell.setCellStyle(textStyle);
			
		}
		/*FileOutputStream fileout = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\用户操作日志.xls");
	    wb.write(fileout);
	    fileout.close();*/
		response.setContentType("application/octet-stream");
		String returnName = response.encodeURL( new String("用户系统操作日志表.xls".getBytes(), "ISO-8859-1"));
		response.addHeader("Content-Disposition", "attachment;filename=" + returnName);
		wb.write(response.getOutputStream());
	    //return "redirect:/adminSelectSysOperateLog.action";
	}
	/**
	 * 
	 * 导出Excel模板
	 * @return
	 * @throws IOException
	 * 
	 */
	@RequestMapping(value="excelOutputMoBan.action")
	public void excelOutputMoBan(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取源数据
		Integer pc = 1;
		Integer PSL = 100;
		PageBean<SysOperateLog> page = sysLogServiceImp.selectLog(pc, PSL);
		List<SysOperateLog> beanlist = page.getBeanlist();
		//参数初始化
		int rowNo = 0;
		int cellNo = 0;
		Row nRow = null;
		Cell nCell = null;
		//打开模板文件，写入内容，设置样式，另存
		String path = request.getRealPath("/")+"excel";
		//操作excel2007以上版本
		InputStream in = new FileInputStream(new File(path+"/EXCELOUTPUT.xls"));
		Workbook wb = new HSSFWorkbook(in);					//打开模板文件
		Sheet sheet = wb.getSheetAt(0);						//打开第一个sheet
		
		nRow = sheet.getRow(2);
		nCell = nRow.getCell(1);
		CellStyle nameStyle = nCell.getCellStyle();	//获取模板中指定单元格的样式
		nCell = nRow.getCell(2);
		CellStyle timeStyle = nCell.getCellStyle();
		nCell = nRow.getCell(3);
		CellStyle ipStyle = nCell.getCellStyle();
		nCell = nRow.getCell(4);
		CellStyle moduleStyle = nCell.getCellStyle();
		nCell = nRow.getCell(5);
		CellStyle operationStyle = nCell.getCellStyle();
		nCell = nRow.getCell(6);
		CellStyle resultStyle = nCell.getCellStyle();
		
		nRow = sheet.getRow(rowNo++);
		nCell = nRow.getCell(1);
		nCell.setCellValue("用户系统操作日志");
		rowNo++;
		for(int i=0;i<beanlist.size();i++){
			SysOperateLog sysOperateLog = beanlist.get(i);
			cellNo = 1;
			nRow = sheet.createRow(rowNo++);
			nRow.setHeightInPoints(24);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getUser_name());
			nCell.setCellStyle(nameStyle);
			
			nCell = nRow.createCell(cellNo++);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format = sdf.format(sysOperateLog.getCreate_time());
			nCell.setCellValue(format);
			nCell.setCellStyle(timeStyle);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getVisit_ip());
			nCell.setCellStyle(ipStyle);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getModule());
			nCell.setCellStyle(moduleStyle);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getOperation());
			nCell.setCellStyle(operationStyle);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getResult());
			nCell.setCellStyle(resultStyle);
			
		}
		response.setContentType("application/octet-stream");
		String returnName = response.encodeURL( new String("用户系统操作日志表.xlsx".getBytes(), "ISO-8859-1"));
		response.addHeader("Content-Disposition", "attachment;filename=" + returnName);
		System.out.println(response.getOutputStream());
		wb.write(response.getOutputStream());
		//return "redirect:/adminSelectSysOperateLog.action";
	}
	/**
	 * 
	 * 导出Excel2007模板
	 * @return
	 * @throws IOException
	 * 
	 */
	@RequestMapping(value="excelOutputMoBanX.action")
	public void excelOutputMoBanX(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//获取源数据
		Integer pc = 1;
		Integer PSL = 100;
		PageBean<SysOperateLog> page = sysLogServiceImp.selectLog(pc, PSL);
		List<SysOperateLog> beanlist = page.getBeanlist();
		//参数初始化
		int rowNo = 0;
		int cellNo = 0;
		Row nRow = null;
		Cell nCell = null;
		//打开模板文件，写入内容，设置样式，另存
		String path = request.getRealPath("/")+"excel";
		//操作excel2007以上版本
		InputStream in = new FileInputStream(new File(path+"/EXCELOUTPUT.xlsx"));
		Workbook wb = new XSSFWorkbook(in);					//打开模板文件
		Sheet sheet = wb.getSheetAt(0);						//打开第一个sheet
		
		nRow = sheet.getRow(2);
		nCell = nRow.getCell(1);
		CellStyle nameStyle = nCell.getCellStyle();	//获取模板中指定单元格的样式
		nCell = nRow.getCell(2);
		CellStyle timeStyle = nCell.getCellStyle();
		nCell = nRow.getCell(3);
		CellStyle ipStyle = nCell.getCellStyle();
		nCell = nRow.getCell(4);
		CellStyle moduleStyle = nCell.getCellStyle();
		nCell = nRow.getCell(5);
		CellStyle operationStyle = nCell.getCellStyle();
		nCell = nRow.getCell(6);
		CellStyle resultStyle = nCell.getCellStyle();
		
		nRow = sheet.getRow(rowNo++);
		nCell = nRow.getCell(1);
		nCell.setCellValue("用户系统操作日志");
		rowNo++;
		for(int i=0;i<beanlist.size();i++){
			SysOperateLog sysOperateLog = beanlist.get(i);
			cellNo = 1;
			nRow = sheet.createRow(rowNo++);
			nRow.setHeightInPoints(24);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getUser_name());
			nCell.setCellStyle(nameStyle);
			
			nCell = nRow.createCell(cellNo++);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format = sdf.format(sysOperateLog.getCreate_time());
			nCell.setCellValue(format);
			nCell.setCellStyle(timeStyle);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getVisit_ip());
			nCell.setCellStyle(ipStyle);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getModule());
			nCell.setCellStyle(moduleStyle);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getOperation());
			nCell.setCellStyle(operationStyle);
			
			nCell = nRow.createCell(cellNo++);
			nCell.setCellValue(sysOperateLog.getResult());
			nCell.setCellStyle(resultStyle);
			
		}
		response.setContentType("application/octet-stream");
		String returnName = response.encodeURL( new String("用户系统操作日志表.xlsx".getBytes(), "ISO-8859-1"));
		response.addHeader("Content-Disposition", "attachment;filename=" + returnName);
		wb.write(response.getOutputStream());
		//return "redirect:/adminSelectSysOperateLog.action";
	}
	/**
	 * 图书的统计报表
	 * 饼状图
	 * @return
	 * @throws FileNotFoundException 
	 */
	@RequestMapping(value="bookStatement.action")
	public String bookStatementPie(HttpServletRequest request) throws FileNotFoundException{
		List<Map<String, Object>> bookStatement = cartServiceImp.bookStatement();
		List<Statement> list = new ArrayList<Statement>();
		StringBuffer sb = new StringBuffer();
		for(Map map : bookStatement){
		    Object ob = map.get("book_name");
		    String book_name = ob.toString();
			Object obj = map.get("sum");
			Integer sum = Integer.parseInt(obj.toString());
			System.out.println(book_name);
			System.out.println(sum);
			Statement st = new Statement(book_name,sum);
			list.add(st);
		}
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<pie>");
		for(int i=0;i<list.size();i++){
			sb.append("  <slice title=\"").append(list.get(i).getName()).append("\" pull_out=\"true\">").append(list.get(i).getNumber()).append("</slice>");
		}
		sb.append("</pie>");
		FileUtil fu = new FileUtil();
        String path = request.getSession().getServletContext().getRealPath("/ampie/");
		fu.newTxt(path, "ampie_data.xml", sb.toString(), "utf-8");
        return "forward:/ampie/ampie.html";
	}
	/**
	 * 线性统计报表
	 * @param request
	 * @return
	 * @throws FileNotFoundException
	 */
	@RequestMapping(value="bookStatementLine.action")
	public String bookStatementLine(HttpServletRequest request) throws FileNotFoundException{
		List<Map<String, Object>> bookStatement = cartServiceImp.bookStatement();
		List<Statement> list = new ArrayList<Statement>();
		StringBuffer sb = new StringBuffer();
		for(Map map : bookStatement){
		    Object ob = map.get("book_name");
		    String book_name = ob.toString();
			Object obj = map.get("sum");
			Integer sum = Integer.parseInt(obj.toString());
			System.out.println(book_name);
			System.out.println(sum);
			Statement st = new Statement(book_name,sum);
			list.add(st);
		}
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<chart>");
		sb.append("	<series>");
		
		int j = 0;		//xid序号
		for(int i=0;i<list.size();i++){
			sb.append("		<value xid=\"").append(j++).append("\">").append(list.get(i).getName()).append("</value>");
		}
		sb.append("	</series>");
		sb.append("	<graphs>");
		sb.append("		<graph gid=\"1\">");
		
		j = 0;
		for(int i=0;i<list.size();i++){
			sb.append("			<value xid=\"").append(j++).append("\" color=\"#318DBD\">").append(list.get(i).getNumber()).append("</value>");
		}
		sb.append("		</graph>");
		sb.append("	</graphs>");
		sb.append("</chart>");
		FileUtil fu = new FileUtil();
        String path = request.getSession().getServletContext().getRealPath("/amline/");
		fu.newTxt(path, "amline_data.xml", sb.toString(), "utf-8");
		return "forward:/amline/amline.html";
	}
	/**
	 * 统计报表
	 * 柱状图
	 * @param request
	 * @return
	 * @throws FileNotFoundException 
	 */
	@RequestMapping(value="bookStatementColumnar.action")
	public String bookStatementColumnar(HttpServletRequest request) throws FileNotFoundException{
		List<Map<String, Object>> bookStatement = cartServiceImp.bookStatement();
		List<Statement> list = new ArrayList<Statement>();
		StringBuffer sb = new StringBuffer();
		for(Map map : bookStatement){
		    Object ob = map.get("book_name");
		    String book_name = ob.toString();
			Object obj = map.get("sum");
			Integer sum = Integer.parseInt(obj.toString());
			System.out.println(book_name);
			System.out.println(sum);
			Statement st = new Statement(book_name,sum);
			list.add(st);
		}
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<chart>");
		sb.append("	<series>");
		
		int j = 0;		//xid序号
		for(int i=0;i<list.size();i++){
			sb.append("		<value xid=\"").append(j++).append("\">").append(list.get(i).getName()).append("</value>");
		}
		sb.append("	</series>");
		sb.append("	<graphs>");
		sb.append("		<graph gid=\"1\">");
		
		j = 0;
		for(int i=0;i<list.size();i++){
			sb.append("			<value xid=\"").append(j++).append("\" color=\"#318DBD\">").append(list.get(i).getNumber()).append("</value>");
		}
		sb.append("		</graph>");
		sb.append("	</graphs>");
		sb.append("</chart>");
		FileUtil fu = new FileUtil();
        String path = request.getSession().getServletContext().getRealPath("/amcolumn/");
		fu.newTxt(path, "amcolumn_data.xml", sb.toString(), "utf-8");
		return "forward:/amcolumn/amcolumn.html";
	}
	/**
	 * echart统计报表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="echartsbookStatementPie.action")
	public String echartsbookStatementPie(HttpServletRequest request,Model model){
		List<Map<String, Object>> bookStatement = cartServiceImp.bookStatement();
		List<Statement> list = new ArrayList<Statement>();
		StringBuffer sb = new StringBuffer();
		for(Map map : bookStatement){
		    Object ob = map.get("book_name");
		    String book_name = ob.toString();
			Object obj = map.get("sum");
			Integer sum = Integer.parseInt(obj.toString());
			System.out.println(book_name);
			System.out.println(sum);
			Statement st = new Statement(book_name,sum);
			list.add(st);
		}
		for(int i = 0;i<list.size();i++){
			sb.append("'").append(list.get(i).getName()).append("',");
		}
		if(sb.length()>0){
			sb.delete(sb.length()-1, sb.length());
		}
		
		StringBuffer sbs = new StringBuffer();
		for(int i=0;i<list.size();i++){
			sbs.append("{value: ").append(list.get(i).getNumber()).append(", name: '").append(list.get(i).getName()).append("'},");
		}
		if(sbs.length()>0){
			//删除最后的一个逗号
			sbs.delete(sbs.length()-1, sbs.length());
		}
		//Echarts echarts = new Echarts(sb.toString(),sbs.toString());
		//JSONObject fromObject = JSONObject.fromObject(echarts);
		System.out.println(sb);
		System.out.println(sbs);
		model.addAttribute("legendData", "["+sb+"]");
		model.addAttribute("seriesData", "["+sbs+"]");
		return "forward:/echarts/pie.jsp";
	}	
	/**
	 * 动态获取报表数据
	 * @throws IOException 
	 */
	@RequestMapping(value="echarts.action")
	@ResponseBody
	public void echarts(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("123w");
		List<Map<String, Object>> bookStatement = cartServiceImp.bookStatement();
		List<Statement> list = new ArrayList<Statement>();
		StringBuffer sb = new StringBuffer();
		for(Map map : bookStatement){
		    Object ob = map.get("book_name");
		    String book_name = ob.toString();
			Object obj = map.get("sum");
			Integer sum = Integer.parseInt(obj.toString());
			System.out.println(book_name);
			System.out.println(sum);
			Statement st = new Statement(book_name,sum);
			list.add(st);
		}
		for(int i = 0;i<list.size();i++){
			sb.append("'").append(list.get(i).getName()).append("',");
		}
		if(sb.length()>0){
			sb.delete(sb.length()-1, sb.length());
		}
		
		StringBuffer sbs = new StringBuffer();
		for(int i=0;i<list.size();i++){
			sbs.append("{value: ").append(list.get(i).getNumber()).append(", name: '").append(list.get(i).getName()).append("'},");
		}
		if(sbs.length()>0){
			//删除最后的一个逗号
			sbs.delete(sbs.length()-1, sbs.length());
		}
		Echarts echarts = new Echarts(sb.toString(),sbs.toString());
		JSONObject fromObject = JSONObject.fromObject(echarts);
		System.out.println(fromObject.toString());
		response.getWriter().write(fromObject.toString());
	}
	
	/**
	 * Ztree树
	 * @param response
	 * @param request
	 * @throws IOException 
	 */
	@RequestMapping(value="ztree.action")
	@ResponseBody
	public void ztree(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String ztree = ZtreeTest.ztree();
		System.out.println(ztree);
		response.getWriter().write(ztree);
	}
	
	
}
