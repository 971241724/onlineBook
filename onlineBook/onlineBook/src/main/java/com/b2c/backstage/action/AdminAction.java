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
 * ����Աaction��ʵ����
 * @author �߻�
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
		//���Զ������Դ֮��Ķ�̬�л�
		DataSourceContextHolder.set("dataSourceTwo");
		List<ActivitiRePro> selectActivitiRePro = adminServiceImp.selectActivitiRePro();
		for(ActivitiRePro activiti : selectActivitiRePro){
			System.out.println(activiti);
		}
		//���Խ���
		return "forward:/backstage/login_manager.jsp";
	}
	/**
	 * ����Ա��¼
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="adminLogin.action")
	public String adminLogin(String admin_no,String admin_pwd,Model model,HttpSession session) throws IOException{
		DataSourceContextHolder.set("dataSourceOne");
		Admin admin = adminServiceImp.adminLogin(admin_no, admin_pwd);
		//��ȡ����Ԥ��
		WeatherBean ww = Weather.ww("����");
		System.out.println(ww.getData().getForecast());
		Date date = new Date();
		Day da = null;
		SimpleDateFormat sdf = new SimpleDateFormat("dd��EEE");
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
			model.addAttribute("message", "�˺��������!");
			return "forward:/backstage/login_manager.jsp";
		}
	}
	/**
	 * �ж�ԭʼ�����Ƿ���ȷ
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
			response.getWriter().write("  * ԭʼ�������!");
		}
	}
	/**
	 * �޸Ĺ���Ա����
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
			model.addAttribute("message", "<font style='color:green'>�޸ĳɹ�!</font>");
			return "forward:/backstage/alterpassword.jsp";
		}else {
			model.addAttribute("message", "<font style='color:red'>�޸�ʧ��!</font>");
			return "forward:/backstage/alterpassword.jsp";
		}
	}
	/**
	 * ��ѯ����Ա��Ϣ
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
	 * ����Ա��ѯͼ��+��ҳ
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
	 * ����Աɾ��ͼ��
	 * @param book_id
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="deleteBook.action")
	@ResponseBody
	public void deleteBook(Integer book_id,HttpServletResponse response,Model model) throws IOException{
		boolean bool = bookServiceImp.deleteBook(book_id);
		if(bool){
			response.getWriter().write("ɾ���ɹ�!");
		}
	}
	/**
	 * ����Ա��ȡͼ��
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
	 * ����Ա�޸�ͼ����ϸ��Ϣ
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
			model.addAttribute("message", "�޸ĳɹ�!");
			return "forward:/backstage/vegetableAlter.jsp";
		}else{
			model.addAttribute("message","�޸�ʧ��!");
			return "forward:/backstage/vegetableAlter.jsp";
		}
	}
	/**
	 * ����Ա�޸�ͼ��ͼƬ
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
					model.addAttribute("mes", "ͼƬ�ϴ��ɹ�");
					return "forward:/backstage/vegetableAlter.jsp";
				}else{
					model.addAttribute("mes", "ͼƬ�ϴ�ʧ��");
					return "forward:/backstage/vegetableAlter.jsp";
				}
			}else{
				model.addAttribute("mes", "ͼƬ�ϴ���ʽ����ȷ��");
				return "forward:/backstage/vegetableAlter.jsp";
			}
		}else {
			model.addAttribute("mes", "δ���ͼƬ");
			return "forward:/backstage/vegetableAlter.jsp";
		}
	}
	/**
	 * ����Ա�鿴����
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
	 * ����Ա��ѯ�����û���Ϣ
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
	 * ����Աɾ���û�
	 * @throws IOException 
	 */
	@RequestMapping(value="adminDeleteUser.action")
	public void adminDeleteUser(Integer user_id,HttpServletResponse response) throws IOException{
		boolean bool = userServiceImp.adminDeleteUser(user_id);
		if(bool){
			response.getWriter().write("ɾ���ɹ�!");
		}else{
			response.getWriter().write("ɾ��ʧ��!");
		}
	}
	/**
	 * ����Ա���ͼ��
	 * @return
	 */
	@RequestMapping(value="adminAddBook.action")
	public String bookadd(Book book,Model model,HttpSession session){
	    Book findBook = bookServiceImp.findBook(book.getBook_name());
	    if(findBook!=null){
	    	model.addAttribute("message", "ͼ���Ѵ���!");
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
				model.addAttribute("message", "��ӳɹ�!");
				model.addAttribute("book", book);
				return "forward:/backstage/vegetableAdd.jsp";
			}else {
				model.addAttribute("message", "���ʧ��!");
				return "forward:/backstage/vegetableAdd.jsp";
			}
		}
	}
	/**
	 * ����Ա���ͼƬ
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
			model.addAttribute("mes", "�������ͼ��Ļ�����Ϣ!");
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
						model.addAttribute("mes", "ͼƬ�ϴ��ɹ�");
						return "forward:/backstage/vegetableAdd.jsp";
					}else{
						model.addAttribute("mes", "ͼƬ�ϴ�ʧ��");
						return "forward:/backstage/vegetableAdd.jsp";
					}
				}else{
					model.addAttribute("mes", "ͼƬ�ϴ���ʽ����ȷ��");
					return "forward:/backstage/vegetableAdd.jsp";
				}
			}else {
				model.addAttribute("mes", "δ���ͼƬ");
				return "forward:/backstage/vegetableAdd.jsp";
			}
		}
	}
	/**
	 * ����Ա��ѯ��־
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
	 * ����Աɾ����־
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="deleteLog.action")
	@ResponseBody
	public void deleteLog(Integer log_id,HttpServletResponse response) throws IOException{
		boolean bool = sysLogServiceImp.deleteLog(log_id);
		if(bool){
			response.getWriter().write("ɾ���ɹ�!");
		}else {
			response.getWriter().write("ɾ��ʧ��!");
		}
	}
	
	/**
	 * ����Ա��ѯδ������
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
	 * ����Ա������
	 * @param order_id
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value="adminAddOrder.action")
	public void adminAddOrder(Integer order_id,HttpServletResponse response) throws IOException{
		boolean bool = orderServiceImp.adminAddOrder(order_id);
		if(bool){
			response.getWriter().write("���³ɹ�!");
		}else{
			response.getWriter().write("����ʧ��!");
		}
	}
	
	/**
	 * ����Ա��ѯ�Ѵ�����
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
	 * ����Excel��
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
		//��ȡԴ����
		Integer pc = 1;
		Integer PSL = 100;
		PageBean<SysOperateLog> page = sysLogServiceImp.selectLog(pc, PSL);
		List<SysOperateLog> beanlist = page.getBeanlist();
		//�������ʽ
		CellStyle bigTitleStyle = wb.createCellStyle();
		bigTitleStyle.setAlignment(CellStyle.ALIGN_CENTER);				//�������
		bigTitleStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);	//�������
		Font bigTilteFont = wb.createFont();
		bigTilteFont.setFontName("����");						        //������������
		bigTilteFont.setFontHeightInPoints((short)16);					//�����С
		bigTilteFont.setBoldweight(Font.BOLDWEIGHT_BOLD);  				//����Ӵ�
		bigTitleStyle.setFont(bigTilteFont);							//������
		//��������
		nRow = sheet.createRow(rowNo++);
		nRow.setHeightInPoints(36);
		nCell = nRow.createCell(1);
		nCell.setCellValue("�û�ϵͳ������־");
		nCell.setCellStyle(bigTitleStyle);
		//�ϲ���Ԫ��
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 1, 6));
		//�����ӱ���
		CellStyle titleStyle = wb.createCellStyle();
		titleStyle.setAlignment(CellStyle.ALIGN_CENTER);				//�������
		titleStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);		//�������
		Font titleFont = wb.createFont();
		titleFont.setFontName("����");
		titleFont.setFontHeightInPoints((short)12);
		titleStyle.setFont(titleFont);
		//����
		titleStyle.setBorderTop(CellStyle.BORDER_THIN);					//��ϸ��
		titleStyle.setBorderBottom(CellStyle.BORDER_THIN);				//��ϸ��
		titleStyle.setBorderLeft(CellStyle.BORDER_THIN);				//��ϸ��
		titleStyle.setBorderRight(CellStyle.BORDER_THIN);				//��ϸ��
		//������ʽ
		CellStyle textStyle = wb.createCellStyle();
		textStyle.setAlignment(CellStyle.ALIGN_CENTER);				//�������
		textStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		
		Font textFont = wb.createFont();
		textFont.setFontName("Times New Roman");
		textFont.setFontHeightInPoints((short)10);
		textStyle.setFont(textFont);
		//����
		textStyle.setBorderTop(CellStyle.BORDER_THIN);					//��ϸ��
		textStyle.setBorderBottom(CellStyle.BORDER_THIN);				//��ϸ��
		textStyle.setBorderLeft(CellStyle.BORDER_THIN);					//��ϸ��
		textStyle.setBorderRight(CellStyle.BORDER_THIN);				//��ϸ��
		
		String title[] = {"�û���","����ʱ��","����IP","����ģ��","��������","�������"};
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
		/*FileOutputStream fileout = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\�û�������־.xls");
	    wb.write(fileout);
	    fileout.close();*/
		response.setContentType("application/octet-stream");
		String returnName = response.encodeURL( new String("�û�ϵͳ������־��.xls".getBytes(), "ISO-8859-1"));
		response.addHeader("Content-Disposition", "attachment;filename=" + returnName);
		wb.write(response.getOutputStream());
	    //return "redirect:/adminSelectSysOperateLog.action";
	}
	/**
	 * 
	 * ����Excelģ��
	 * @return
	 * @throws IOException
	 * 
	 */
	@RequestMapping(value="excelOutputMoBan.action")
	public void excelOutputMoBan(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//��ȡԴ����
		Integer pc = 1;
		Integer PSL = 100;
		PageBean<SysOperateLog> page = sysLogServiceImp.selectLog(pc, PSL);
		List<SysOperateLog> beanlist = page.getBeanlist();
		//������ʼ��
		int rowNo = 0;
		int cellNo = 0;
		Row nRow = null;
		Cell nCell = null;
		//��ģ���ļ���д�����ݣ�������ʽ�����
		String path = request.getRealPath("/")+"excel";
		//����excel2007���ϰ汾
		InputStream in = new FileInputStream(new File(path+"/EXCELOUTPUT.xls"));
		Workbook wb = new HSSFWorkbook(in);					//��ģ���ļ�
		Sheet sheet = wb.getSheetAt(0);						//�򿪵�һ��sheet
		
		nRow = sheet.getRow(2);
		nCell = nRow.getCell(1);
		CellStyle nameStyle = nCell.getCellStyle();	//��ȡģ����ָ����Ԫ�����ʽ
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
		nCell.setCellValue("�û�ϵͳ������־");
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
		String returnName = response.encodeURL( new String("�û�ϵͳ������־��.xlsx".getBytes(), "ISO-8859-1"));
		response.addHeader("Content-Disposition", "attachment;filename=" + returnName);
		System.out.println(response.getOutputStream());
		wb.write(response.getOutputStream());
		//return "redirect:/adminSelectSysOperateLog.action";
	}
	/**
	 * 
	 * ����Excel2007ģ��
	 * @return
	 * @throws IOException
	 * 
	 */
	@RequestMapping(value="excelOutputMoBanX.action")
	public void excelOutputMoBanX(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//��ȡԴ����
		Integer pc = 1;
		Integer PSL = 100;
		PageBean<SysOperateLog> page = sysLogServiceImp.selectLog(pc, PSL);
		List<SysOperateLog> beanlist = page.getBeanlist();
		//������ʼ��
		int rowNo = 0;
		int cellNo = 0;
		Row nRow = null;
		Cell nCell = null;
		//��ģ���ļ���д�����ݣ�������ʽ�����
		String path = request.getRealPath("/")+"excel";
		//����excel2007���ϰ汾
		InputStream in = new FileInputStream(new File(path+"/EXCELOUTPUT.xlsx"));
		Workbook wb = new XSSFWorkbook(in);					//��ģ���ļ�
		Sheet sheet = wb.getSheetAt(0);						//�򿪵�һ��sheet
		
		nRow = sheet.getRow(2);
		nCell = nRow.getCell(1);
		CellStyle nameStyle = nCell.getCellStyle();	//��ȡģ����ָ����Ԫ�����ʽ
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
		nCell.setCellValue("�û�ϵͳ������־");
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
		String returnName = response.encodeURL( new String("�û�ϵͳ������־��.xlsx".getBytes(), "ISO-8859-1"));
		response.addHeader("Content-Disposition", "attachment;filename=" + returnName);
		wb.write(response.getOutputStream());
		//return "redirect:/adminSelectSysOperateLog.action";
	}
	/**
	 * ͼ���ͳ�Ʊ���
	 * ��״ͼ
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
	 * ����ͳ�Ʊ���
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
		
		int j = 0;		//xid���
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
	 * ͳ�Ʊ���
	 * ��״ͼ
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
		
		int j = 0;		//xid���
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
	 * echartͳ�Ʊ���
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
			//ɾ������һ������
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
	 * ��̬��ȡ��������
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
			//ɾ������һ������
			sbs.delete(sbs.length()-1, sbs.length());
		}
		Echarts echarts = new Echarts(sb.toString(),sbs.toString());
		JSONObject fromObject = JSONObject.fromObject(echarts);
		System.out.println(fromObject.toString());
		response.getWriter().write(fromObject.toString());
	}
	
	/**
	 * Ztree��
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
