package com.b2c.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.b2c.entity.Book;
import com.b2c.entity.Cart;
import com.b2c.entity.SysOperateLog;
import com.b2c.entity.User;
import com.b2c.service.IBookService;
import com.b2c.service.ICartService;
import com.b2c.service.ISysLogService;
import com.b2c.utils.GetLocalIP;
import com.b2c.utils.GetVisitIP;
import com.b2c.utils.LogConstant;
import com.b2c.utils.PageBean;

@Controller
public class CartAction {
	
	//分页时每页显示的条数
	final Integer PS=10;
	
	@Resource(name="cartServiceImp")
	private ICartService cartServiceImp;
	
	@Resource(name="bookServiceImp")
	private IBookService bookServiceImp;
	
	@Resource(name="sysLogServiceImp")
	private ISysLogService sysLogServiceImp;
	
	/**
	 * 添加到购物车
	 * @param book_id
	 * @param amount
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="addShopCart.action")
	public String  addShopCart(HttpServletRequest request,String book_id,int amount,HttpSession session,Model model){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		
		Double c_price = null;
		Book book = bookServiceImp.getBook_id(book_id);
		User user = (User)session.getAttribute("user");
		if(book.getDown_sale()==1){
			c_price = amount*book.getT_Price();
		}else{
			c_price = amount*book.getPrice();
		}
		Cart cart = new Cart(0,book,user.getUser_id(),amount,c_price,Integer.parseInt(book_id));
		boolean bool = cartServiceImp.addBookCart(cart);
		if(bool){
			SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Cart.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.ADD,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			return "redirect:/pageSelectCart.action";
		}
		else{
			SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Cart.TABLENAME,"FAILED",LogConstant.MODEL_MENU,LogConstant.ADD,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			return "forward:/fruit_page/commodities.jsp";
		}
	}
	
	/**
	 * 查询购物车信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value="selectCart.action")
	public String selectCart(HttpServletRequest request,HttpSession session,Model model){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Cart.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		sysLogServiceImp.addSysOperateLog(log);
		
		List<Cart> cartList = cartServiceImp.selectCart();
		for(Cart cart : cartList){
			System.out.println(cart.toString());
		}
		int size = cartList.size();
		model.addAttribute("cList", cartList);
		model.addAttribute("size", size);
		return "forward:/fruit_page/cart.jsp";
	}
	
	/**
	 * 分页查询购物车
	 * @param pc
	 * @param model
	 * @return
	 */
	@RequestMapping(value="pageSelectCart.action")
	public String pageSelectCart(HttpServletRequest request,Integer pc,Model model,HttpSession session){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Cart.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		sysLogServiceImp.addSysOperateLog(log);
		
		if(pc == null){
			pc = 1;
		}
		PageBean<Cart> pageCartSelect = cartServiceImp.pageCartSelect(pc, PS,user.getUser_id());
		int size = pageCartSelect.getBeanlist().size();
		model.addAttribute("pCart", pageCartSelect);
		model.addAttribute("size", size);
		return "forward:/fruit_page/cart.jsp";
	}
	
	/**
	 * 删除购物车的信息
	 * @param cart_id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="deleteCart.action")
	public String deleteCart(HttpServletRequest request,HttpSession session,Integer cart_id,Model model){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		
		boolean bool = cartServiceImp.deleteCart(cart_id);
		if(bool){
			SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Cart.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.DELETE,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			System.out.println("删除成功");
		}else {
			SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Cart.TABLENAME,"FAILED",LogConstant.MODEL_MENU,LogConstant.DELETE,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			System.out.println("删除失败");
		}
		return "redirect:/pageSelectCart.action";
	}

	/**
	 * 全选删除
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="cartDelete.action")
	@ResponseBody
	public void deleteAllCart(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		
		List<String> list = new ArrayList<String>();
		String cartId[] = request.getParameterValues("arrs");
		for(String str : cartId){
			System.out.println(str);
			list.add(str);
		}
		
		SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Cart.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.DELETE,new Date(),visit_ip,local_ip);
		sysLogServiceImp.addSysOperateLog(log);
		
		String deleteAllCart = cartServiceImp.deleteAllCart(list);
		response.getWriter().write(deleteAllCart);
	}
	/**
	 * 批量加入购物车
	 * @throws IOException 
	 */
	@RequestMapping(value="allAddCart.action")
	@ResponseBody
    public void addAllCart(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		
		User user = (User)session.getAttribute("user");
		Integer user_id = user.getUser_id();
    	List<String> list = new ArrayList<String>();
    	String cartId[] = request.getParameterValues("arrs");
		for(String str : cartId){
			list.add(str);
		} 
		int addAllCart = cartServiceImp.addAllCart(list, user_id);
		if(addAllCart == 0){
			SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Cart.TABLENAME,"FAILED",LogConstant.MODEL_MENU,LogConstant.ADD,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("添加失败!");
		}else{
			SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Cart.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.ADD,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("添加成功！");
		}
    }
}
