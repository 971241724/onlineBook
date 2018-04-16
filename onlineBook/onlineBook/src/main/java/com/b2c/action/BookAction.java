package com.b2c.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.b2c.entity.Book;
import com.b2c.entity.Eval;
import com.b2c.entity.SysOperateLog;
import com.b2c.entity.User;
import com.b2c.service.IBookService;
import com.b2c.service.IEvalService;
import com.b2c.service.ISysLogService;
import com.b2c.utils.GetLocalIP;
import com.b2c.utils.GetVisitIP;
import com.b2c.utils.LogConstant;
import com.b2c.utils.PageBean;

@Controller
public class BookAction {
	
	final Integer PS = 5;
	
	@Resource(name="bookServiceImp")
	private IBookService bookServiceImp;
	
	@Resource(name="evalServiceImp")
	private IEvalService evalServiceImp;
	
	@Resource(name="sysLogServiceImp")
	private ISysLogService sysLogServiceImp;
	
	/**
	 * 最新出版的书籍和最新出版的书籍
	 * @param model
	 * @return
	 */
	@RequestMapping("selectBookNewTime.action")
	public String selectBookNewTime(HttpServletRequest request,Model model,HttpSession session){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = null;
		if(user==null){
			log = new SysOperateLog(0,"未登录",Book.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}else{
			log = new SysOperateLog(0,user.getUser_no(),Book.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}
		sysLogServiceImp.addSysOperateLog(log);
		List<Book> bookList = bookServiceImp.selectBookNewTime();
		List<Book> bookListMax = bookServiceImp.selectBookNumbMax();
		/*for(Book book : bookList){
			System.out.println(book.toString());
		}
		for(Book book : bookListMax){
			System.out.println(book.toString());
		}*/
		model.addAttribute("bookL", bookList);
		model.addAttribute("bookLM", bookListMax);
		return "forward:/fruit_page/index.jsp";
	}
	
	/**
	 * 
	 * 获取图书详细信息和三本类型相同的图书
	 * @return
	 * 
	 */
	@RequestMapping("getBook_id.action")
	public String getBook_id(HttpServletRequest request,String book_id,Integer pc,Model model,HttpSession session){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = null;
		if(user==null){
			log = new SysOperateLog(0,"未登录",Book.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}else{
			log = new SysOperateLog(0,user.getUser_no(),Book.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}
		sysLogServiceImp.addSysOperateLog(log);
		if(pc == null){
			pc = 1;
		}
		PageBean<Eval> page = evalServiceImp.selectEvalgetBookId(Integer.parseInt(book_id), pc, PS);
		Book book = bookServiceImp.getBook_id(book_id);
		List<Book> selectLikeBook = bookServiceImp.selectLikeBook(book);
		/*for(Book books : selectLikeBook){
			System.out.println(books+"--------------");
		}*/
		model.addAttribute("page", page);
		model.addAttribute("book", book);
		model.addAttribute("bLB", selectLikeBook);
		return "forward:/fruit_page/commodities.jsp";
	}
	/**
	 * 搜索
	 * @return
	 */
	@RequestMapping(value="findBook.action")
	public String findBook(String book_name,Model model,HttpSession session,HttpServletRequest request){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = null;
		if(user==null){
			log = new SysOperateLog(0,"未登录",Book.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}else{
			log = new SysOperateLog(0,user.getUser_no(),Book.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		}
		sysLogServiceImp.addSysOperateLog(log);
		
		Book book = bookServiceImp.findBook(book_name);
		List<Book> selectLikeBook = bookServiceImp.selectLikeBook(book);
		model.addAttribute("book", book);
		model.addAttribute("bLB", selectLikeBook);
		return "forward:/fruit_page/commodities.jsp";
	}
	
}
