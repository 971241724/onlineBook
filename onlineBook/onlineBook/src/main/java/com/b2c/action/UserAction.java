package com.b2c.action;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.b2c.entity.Eval;
import com.b2c.entity.Order;
import com.b2c.entity.SysOperateLog;
import com.b2c.entity.User;
import com.b2c.service.ICartService;
import com.b2c.service.IEvalService;
import com.b2c.service.IOrderService;
import com.b2c.service.ISysLogService;
import com.b2c.service.IUserService;
import com.b2c.utils.Code;
import com.b2c.utils.GetLocalIP;
import com.b2c.utils.GetVisitIP;
import com.b2c.utils.LogConstant;
import com.b2c.utils.MD5;
import com.b2c.utils.OrderUser;
import com.b2c.utils.PageBean;
import com.b2c.utils.PhoneCode;
import com.b2c.utils.sendsms;

@Controller
public class UserAction {
	
	final Integer PS = 5;
	
	@Resource(name="userServiceImp")
	private IUserService userServiceImp;
    
	@Resource(name="cartServiceImp")
	private ICartService cartServiceImp;
	
	@Resource(name="evalServiceImp")
	private IEvalService evalServiceImp;
	
	@Resource(name="orderServiceImp")
	private IOrderService orderServiceImp;
	
	@Resource(name="sysLogServiceImp")
	private ISysLogService sysLogServiceImp;
	
	/**
	 * 用户登录
	 * @param model
	 * @param user_no
	 * @param user_pwd
	 * @param user_code
	 * @param session
	 * @return
	 */
	@RequestMapping(value="selectUser.action")
	/*@SystemControllerLog(model = LogConstant.MODEL_USER_INFO, description = LogConstant.ADD, tableName = User.TABLENAME)*/
	public String selectUser(Model model,String user_no,String user_pwd,String user_code,HttpSession session,HttpServletRequest request){
		
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		/*统计访问量*/
		ServletContext context = request.getServletContext();
		Integer count = null;
		synchronized(context){
			count = (Integer) context.getAttribute("counter");
			if (null == count){
		        count = new Integer(1);
		    }else{
		    	count = new Integer(count.intValue() + 1);
		    }
				context.setAttribute("counter", count);
			}
        System.out.println("访问量是:"+count);
		
		
		/*用户登录*/
		User user = userServiceImp.selectUser(user_no, user_pwd);
		String code = (String)session.getAttribute("safecode");
		if(user==null){
			SysOperateLog log = new SysOperateLog(0,user_no,User.TABLENAME,"FAILED",LogConstant.MODEL_USER_INFO,LogConstant.LOGIN,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			System.out.println("12312456");
			model.addAttribute("message", "账号密码错误!");
			return "forward:/project/login.jsp";
		}else if(!code.equals(user_code)){
			SysOperateLog log = new SysOperateLog(0,user_no,User.TABLENAME,"FAILED",LogConstant.MODEL_USER_INFO,LogConstant.LOGIN,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			model.addAttribute("message", "验证码错误!");
			return "forward:/project/login.jsp";
		}
		SysOperateLog log = new SysOperateLog(0,user_no,User.TABLENAME,"SUCCESS",LogConstant.MODEL_USER_INFO,LogConstant.LOGIN,new Date(),visit_ip,local_ip);
		sysLogServiceImp.addSysOperateLog(log);
		int cartSum = cartServiceImp.selectCartSum(user.getUser_id());
		session.setAttribute("user", user);
		session.setAttribute("cartSum", cartSum);
		return "redirect:/selectBookNewTime.action";
		
	}
	
	/**
	 * 
	 * 查询用户是否存在
	 * @return
	 * 
	 */
	@RequestMapping(value="forgetpwd.action")
	public String forgetPwd(HttpSession session,String user_no,String user_phone,String phone_code,Model model){
		
		String pCode = (String)session.getAttribute("phoneCode");
		if(phone_code.equals(pCode)){
			User user = userServiceImp.selectUserNo(user_no,user_phone);
			if(user==null){
				model.addAttribute("message", "账号或邮箱不正确");
				return "forward:/project/forget.jsp";
			}else{
				return "forward:/project/changePwd.jsp";
			}
		}else{
			model.addAttribute("message", "验证码不正确");
			return "forward:/project/forget.jsp";
		}
		
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping(value="updatePwd.action")
	public String updatePwd(HttpServletRequest request,String user_no,String user_pwd,String cfpassword,Model model){
		System.out.println(user_no+"————————");
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		
		boolean bool = userServiceImp.updateUser(user_no, user_pwd);
		if(user_pwd.equals(cfpassword)&&bool){
			if(user_no.isEmpty()){
				SysOperateLog log = new SysOperateLog(0,"未登录",User.TABLENAME,"SUCCESS",LogConstant.MODEL_USER_INFO,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
				sysLogServiceImp.addSysOperateLog(log);
			}else {
				SysOperateLog log = new SysOperateLog(0,user_no,User.TABLENAME,"SUCCESS",LogConstant.MODEL_USER_INFO,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
				sysLogServiceImp.addSysOperateLog(log);
			}
			model.addAttribute("message", "修改成功");
			return "forward:/project/changePwd.jsp";
		}else {
			if(user_no.isEmpty()){
				SysOperateLog log = new SysOperateLog(0,"未登录",User.TABLENAME,"SUCCESS",LogConstant.MODEL_USER_INFO,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
				sysLogServiceImp.addSysOperateLog(log);
			}else {
				SysOperateLog log = new SysOperateLog(0,user_no,User.TABLENAME,"SUCCESS",LogConstant.MODEL_USER_INFO,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
				sysLogServiceImp.addSysOperateLog(log);
			}
			model.addAttribute("message", "用户名不正确");
			return "forward:/project/changePwd.jsp";
		}
	}
	
	
	/**
	 * 
	 * 获取手机的验证码
	 * @throws IOException 
	 * 
	 */
	@RequestMapping(value="phoneCodes.action")
	public void phoneCode(HttpServletResponse response,HttpSession session,Model model,String user_phone) throws IOException{
		
		String phoneCode = PhoneCode.getPhoneCode();
		System.out.println(phoneCode);
		sendsms.fasong(user_phone, phoneCode);
		if("".equals(user_phone)||user_phone==null){
			response.getWriter().write("手机好不能为空");
		}else {
			if("".equals(phoneCode)||phoneCode!=null){
				response.getWriter().write("验证码已发送");
				session.setAttribute("phoneCode", phoneCode);
			}
		}
		response.getWriter().write("");
	}
	
	/**
	 * 查询这个账号是否存在
	 * @throws IOException 
	 */
	@RequestMapping(value="/loginNo.action")
	public @ResponseBody void selectNo(HttpServletRequest request,HttpServletResponse response,String user_no) throws IOException{
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);            //获取客户端IP
		User selectNo = userServiceImp.selectNo(user_no);
		if(selectNo!=null){
			SysOperateLog log = new SysOperateLog(0,user_no,User.TABLENAME,"FAILED",LogConstant.MODEL_USER_INFO,LogConstant.REGISTER,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("*账号已存在!");
		}
		SysOperateLog log = new SysOperateLog(0,user_no,User.TABLENAME,"SUCCESS",LogConstant.MODEL_USER_INFO,LogConstant.REGISTER,new Date(),visit_ip,local_ip);
		sysLogServiceImp.addSysOperateLog(log);
	}
	
	/**
	 * 用户注册
	 * @return
	 */
	@RequestMapping(value="insertUser.action")
	public String insertUser(HttpServletRequest request,Model model,String user_nol,String name,String user_pwdl,String user_phonell,String user_maill,String cfpasswordl,String codel,HttpSession session){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);            //获取客户端IP
		
		User user = new User(0,user_nol,name,MD5.md5(user_pwdl),user_phonell,user_maill);
		User selectNo = userServiceImp.selectNo(user_nol);
		System.out.println(user.toString()+"12342345678");
		String code = (String)session.getAttribute("safecode");
		if(selectNo!=null){
			SysOperateLog log = new SysOperateLog(0,user_nol,User.TABLENAME,"FAILED",LogConstant.MODEL_USER_INFO,LogConstant.REGISTER,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			model.addAttribute("rmessage", "账号已存在!");
			return "forward:/project/register.jsp";
		}else if(codel.equals(codel)&&selectNo==null){
			SysOperateLog log = new SysOperateLog(0,user_nol,User.TABLENAME,"SUCCESS",LogConstant.MODEL_USER_INFO,LogConstant.REGISTER,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			boolean insertUser = userServiceImp.insertUser(user);
			model.addAttribute("rmessage", "注册成功!");
			return "forward:/project/register.jsp";
		}else{
			SysOperateLog log = new SysOperateLog(0,user_nol,User.TABLENAME,"FAILED",LogConstant.MODEL_USER_INFO,LogConstant.REGISTER,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			model.addAttribute("rmessage", "注册失败!");
			return "forward:/project/register.jsp";
		}
		
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="logoutUser.action")
	public String logoutUser(HttpServletRequest request,HttpSession session,Model model){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);            //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = new SysOperateLog(0,user.getUser_name(),User.TABLENAME,"SUCCESS",LogConstant.MODEL_USER_INFO,LogConstant.LOGOUT,new Date(),visit_ip,local_ip);
		sysLogServiceImp.addSysOperateLog(log);
		session.removeAttribute("user");
		return "redirect:/selectBookNewTime.action";
	}
	
	/**
	 * 
	 * 获取验证码
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping(value="code.action")
	public void code(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		OutputStream os = response.getOutputStream();
		int width = 110, height = 35;
		// 建立指定宽、高和BufferedImage对象
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics(); // 该画笔画在image上
		Color c = g.getColor(); // 保存当前画笔的颜色，用完画笔后要回复现场
		g.fillRect(0, 0, width, height);

		char[] ch = "abcdefghjkmnpqrstuvwxyz23456789".toCharArray(); // 随即产生的字符串
																		// 不包括 i
																		// l(小写L)
																		// o（小写O）
																		// 1（数字1）0(数字0)
		int length = ch.length; // 随即字符串的长度
		String sRand = ""; // 保存随即产生的字符串
		Random random = new Random();
		for (int i = 0; i < 5; i++) {
			// 设置字体
			g.setFont(Code.getFont());
			// 随即生成0-9的数字
			String rand = new Character(ch[random.nextInt(length)]).toString();
			sRand += rand;
			// 设置随机颜色
			g.setColor(new Color(random.nextInt(255), random.nextInt(255),
					random.nextInt(255)));
			g.drawString(rand, 20 * i + 6, 25);
		}
		// 产生随即干扰点
		for (int i = 0; i < 20; i++) {
			int x1 = random.nextInt(width);
			int y1 = random.nextInt(height);
			g.drawOval(x1, y1, 2, 2);
		}
		g.setColor(c); // 将画笔的颜色再设置回去
		g.dispose();
		// 将验证码记录到session
		session.setAttribute("safecode", sRand);
		//request.getSession().setAttribute("safecode", sRand);
		// 输出图像到页面
		ImageIO.write(image, "JPEG", os);
		//return "forward:/project/index/index.jsp";
	}
	
	/**
	 * 个人中心
	 */
	@RequestMapping(value="selectUsergetId.action")
	public String selectUsergetId(HttpServletRequest request,Integer pc,Integer pcs,HttpSession session,Model model){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);            //获取客户端IP
		if(pcs == null){
			pcs=1;
		}
		List<OrderUser> orderUser = new ArrayList<OrderUser>();
		User users = (User)session.getAttribute("user");
		PageBean pages = orderServiceImp.userSelectAllOrder(users.getUser_id(),pcs,5);
		List<Order> orderList = pages.getBeanlist();
		for(int i=0;i<orderList.size();i++){
			OrderUser ou = new OrderUser(orderList.get(i).getOrder_id(),orderList.get(i).getOrderBooks().get(0).getBook_id(),orderList.get(i).getOrderBooks().get(0).getBook().getBook_name(),orderList.get(i).getOrderBooks().get(0).getNumber(),orderList.get(i).getOrder_state(),orderList.get(i).getAmount(),orderList.get(i).getAccess());
			orderUser.add(ou);
		}
		pages.setBeanlist(orderUser);
		model.addAttribute("ou", pages);
		
		//User users = (User)session.getAttribute("user");
		User user = userServiceImp.selectUsergetId(users.getUser_id());
		if(pc == null){
			pc = 1;
		}
		PageBean<Eval> page = evalServiceImp.selectEvalgetUserID(users.getUser_id(), pc, PS);
		model.addAttribute("size", page.getBeanlist().size());
		model.addAttribute("user", user);
		model.addAttribute("page", page);
		SysOperateLog log = new SysOperateLog(0,users.getUser_no(),User.TABLENAME+"、"+Order.TABLENAME+"、"+Eval.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.QUERY,new Date(),visit_ip,local_ip);
		sysLogServiceImp.addSysOperateLog(log);
		return "forward:/fruit_page/personcenter.jsp";
	}
	/**
	 * 个人中心修改邮箱
	 * @throws IOException 
	 */
	@RequestMapping(value="updateMail.action")
	@ResponseBody
	public void updateMail(HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException{
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);            //获取客户端IP
		
		User user = (User)session.getAttribute("user");
		String user_mail = request.getParameter("user_mail");
		System.out.println(user_mail);
		boolean bool = userServiceImp.updateMail(user.getUser_id(), user_mail);
		if(bool){
			SysOperateLog log = new SysOperateLog(0,user.getUser_name(),User.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("修改成功！");
		}else{
			SysOperateLog log = new SysOperateLog(0,user.getUser_name(),User.TABLENAME,"FAILED",LogConstant.MODEL_MENU,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("修改失败！");
		}
	}
	
	/**
	 * 个人中心修改电话
	 * @throws IOException 
	 */
	@RequestMapping(value="updatePhone.action")
	@ResponseBody
	public void updatePhone(HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException{
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);            //获取客户端IP
		User user = (User)session.getAttribute("user");
		String  user_phone= request.getParameter("user_phone");
		System.out.println(user_phone);
		boolean bool = userServiceImp.updatePhone(user.getUser_id(), user_phone);
		if(bool){
			SysOperateLog log = new SysOperateLog(0,user.getUser_name(),User.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("修改成功！");
		}else{
			SysOperateLog log = new SysOperateLog(0,user.getUser_name(),User.TABLENAME,"FAILED",LogConstant.MODEL_MENU,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("修改失败！");
		}
	}
	
	/**
	 * 个人中心修改地址
	 * @throws IOException 
	 */
	@RequestMapping(value="updateSite.action")
	@ResponseBody
	public void updateSite(HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException{
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);            //获取客户端IP
		User user = (User)session.getAttribute("user");
		String  user_site= request.getParameter("user_site");
		System.out.println(user_site);
		boolean bool = userServiceImp.updateSite(user.getUser_id(), user_site);
		if(bool){
			SysOperateLog log = new SysOperateLog(0,user.getUser_name(),User.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("修改成功！");
		}else{
			SysOperateLog log = new SysOperateLog(0,user.getUser_name(),User.TABLENAME,"FAILED",LogConstant.MODEL_MENU,LogConstant.UPDATE,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("修改失败！");
		}
	}
	
}
