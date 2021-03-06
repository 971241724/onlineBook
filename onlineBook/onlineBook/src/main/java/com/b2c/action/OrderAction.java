package com.b2c.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.b2c.entity.Order;
import com.b2c.entity.OrderBooks;
import com.b2c.entity.User;
import com.b2c.service.IOrderBooksService;
import com.b2c.service.IOrderService;
import com.b2c.utils.OrderUser;
import com.b2c.utils.PageBean;

@Controller
public class OrderAction {
	
	@Resource(name="orderServiceImp")
	private IOrderService orderServiceImp;
	
	@Resource(name="orderBooksServiceImp")
	private IOrderBooksService orderBooksServiceImp;
	
	/**
	 * 获取订单信息
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @throws IOException
	 */
	@RequestMapping(value="addMyOrder.action")
	@ResponseBody
	public void addMyOrder(HttpServletRequest request,HttpServletResponse response,HttpSession session,Model model) throws IOException {
		User user = (User)session.getAttribute("user");
		Integer user_id = user.getUser_id();
		List<String> list = new ArrayList<String>();
    	String cartId[] = request.getParameterValues("arrs");
		for(String str : cartId){
			list.add(str);
		}
		int addMyOrder = orderServiceImp.addMyOrder(list, user_id);
		int addOrderBooks = orderBooksServiceImp.addOrderBooks(list, user_id);
		if(addMyOrder == 0 || addOrderBooks == 0){
			response.getWriter().write("添加失败!");
		}else{
			response.getWriter().write("添加成功！");
		}
	}
	
	/**
	 * 显示订单信息
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="selectSaleBook.action")
	public String selectSaleBook(HttpSession session,Model model){
		User user = (User)session.getAttribute("user");
		Integer user_id = user.getUser_id();
		List<Order> orderList = orderServiceImp.selectSaleBook(user_id);
		for(Order order : orderList){
			System.out.println(order);
		}
		model.addAttribute("order", orderList);
		return "forward:/fruit_page/configmenu.jsp";
	}
	
	/**
	 * 删除订单信息
	 * @param order_id
	 * @return
	 */
	@RequestMapping(value="deleteOrder.action")
	public String deleteOrder(Integer order_id){
		boolean update = orderServiceImp.deleteOrder(order_id);
		if(update){
			System.out.println("更新成功");
		}else{
			System.out.println("更新失败");
		}
		return "redirect:/pageSelectCart.action";
	}
	
	/**
	 * 提交订单
	 * @param order_id
	 * @return
	 */
	@RequestMapping(value="submitOrder.action")
	public String submitOrder(Integer order_id){
		List<OrderBooks> orderBooksList = orderBooksServiceImp.selectCart_id(order_id);
		List<Integer> list = new ArrayList<Integer>();
		for(OrderBooks ob : orderBooksList){
			list.add(ob.getCart_id());
		}
		boolean submit = orderServiceImp.submitOrder(list, order_id);
		if(submit){
			return "forward:/fruit_page/jump.jsp";
		}else{
			return "redirect:/selectSaleBook.action";
		}
	}
	/**
	 * 用户查询所有订单信息
	 * @param session
	 * @param model
	 * @author 高欢
	 * @return
	 */
	@RequestMapping(value="userSelectAllOrder.action")
	public String userSelectAllOrder(HttpSession session,Model model,Integer pcs){
		if(pcs == null){
			pcs=1;
		}
		List<OrderUser> orderUser = new ArrayList<OrderUser>();
		User user = (User)session.getAttribute("user");
		PageBean pages = orderServiceImp.userSelectAllOrder(user.getUser_id(),pcs,5);
		List<Order> orderList = pages.getBeanlist();
		for(int i=0;i<orderList.size();i++){
			OrderUser ou = new OrderUser(orderList.get(i).getOrder_id(),orderList.get(i).getOrderBooks().get(0).getBook().getBook_name(),orderList.get(i).getOrderBooks().get(0).getNumber(),orderList.get(i).getOrder_state(),orderList.get(i).getAmount(),orderList.get(i).getAccess());
			orderUser.add(ou);
		}
		pages.setBeanlist(orderUser);
		model.addAttribute("ou", pages);
		return "forward:/fruit_page/personcenter.jsp";
	}
	/**
	 * 删除订单
	 * @author 高欢
	 * @param order_id
	 * @return
	 */
	@RequestMapping(value="deleteOrderMessage.action")
	public String deleteOrderMessage(Integer order_id){
		boolean bool = orderServiceImp.deleteOrderMessage(order_id);
		return "redirect:/selectUsergetId.action";
	}
	/**
	 * 订单支付
	 */
	@RequestMapping(value="alipayOrder.action")
	public String alipayOrder(Integer order_id){
		boolean alipayOrder = orderServiceImp.alipayOrder(order_id);
		System.out.println(alipayOrder);
		return "redirect:/selectUsergetId.action";
	}
	
}
