package com.b2c.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.b2c.entity.Book;
import com.b2c.entity.BookType;
import com.b2c.entity.SysOperateLog;
import com.b2c.entity.User;
import com.b2c.service.IBookService;
import com.b2c.service.IBookTypeService;
import com.b2c.service.ISysLogService;
import com.b2c.utils.GetLocalIP;
import com.b2c.utils.GetVisitIP;
import com.b2c.utils.LogConstant;
import com.b2c.utils.PageBean;

@Controller
public class BookTypeAction {
	
	final Integer PS = 8;
	
	@Resource(name="bookTypeServiceImp")
	private IBookTypeService bookTypeServiceImp;
	
	@Resource(name="bookServiceImp")
	private IBookService bookServiceImp;
	
	@Resource(name="sysLogServiceImp")
	private ISysLogService sysLogServiceImp;
	
	/**
	 * 查询图书的类型和部分图书
	 * @param model
	 * @return
	 */
	@RequestMapping("selectAllBook.action")
	public String selectAllBook(HttpServletRequest request,HttpSession session,Model model){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = null;
		if(user==null){
			log = new SysOperateLog(0,"未登录",BookType.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}else{
			log = new SysOperateLog(0,user.getUser_no(),BookType.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}
		sysLogServiceImp.addSysOperateLog(log);
		
		List<BookType> selectAllBook = bookTypeServiceImp.selectAllBook();
		for(BookType b : selectAllBook){
			b.setBook(b.getBook().subList(0, 4));
			System.out.println(b.toString());
		}
		model.addAttribute("allbook", selectAllBook);
		return "forward:/fruit_page/productslistfresh.jsp";
	}
	/**
	 * 根据图书的类型查询图书+图书分页
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="selectBookType.action")
	public String selectBookType(HttpServletRequest request,HttpSession session,String book_type,Model model,Integer pc) throws UnsupportedEncodingException{
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = null;
		if(user==null){
			log = new SysOperateLog(0,"未登录",BookType.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}else{
			log = new SysOperateLog(0,user.getUser_no(),BookType.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}
		sysLogServiceImp.addSysOperateLog(log);
		
		String book_types = new String(book_type.getBytes("ISO-8859-1"),"UTF-8");
		if(pc == null){
			pc = 1;
		}
		PageBean<Book> selectBookType = bookServiceImp.selectBookType(book_types, pc, PS);
		model.addAttribute("bookType", selectBookType);
		model.addAttribute("book_type", book_types);
		return "forward:/fruit_page/bookType.jsp";
	}
	

	@RequestMapping("selectDownSaleBook.action")
	public String selectDownSaleBook(HttpServletRequest request,HttpSession session,Model model){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = null;
		if(user==null){
			log = new SysOperateLog(0,"未登录",BookType.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}else{
			log = new SysOperateLog(0,user.getUser_no(),BookType.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}
		sysLogServiceImp.addSysOperateLog(log);
		
		List<BookType> selectDownSaleBook = bookTypeServiceImp.selectDownSaleBook();
		for(BookType b : selectDownSaleBook){
			System.out.println(b.toString());
		}
		model.addAttribute("downsalebook", selectDownSaleBook);
		return "forward:/fruit_page/productslistdiscount.jsp";
	}

}
