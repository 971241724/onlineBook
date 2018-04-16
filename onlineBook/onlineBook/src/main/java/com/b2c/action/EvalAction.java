package com.b2c.action;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.b2c.entity.Cart;
import com.b2c.entity.Eval;
import com.b2c.entity.SysOperateLog;
import com.b2c.entity.User;
import com.b2c.service.IEvalService;
import com.b2c.service.IOrderService;
import com.b2c.service.ISysLogService;
import com.b2c.utils.GetLocalIP;
import com.b2c.utils.GetVisitIP;
import com.b2c.utils.LogConstant;
/**
 * 图书评价
 * @author Administrator
 *
 */
@Controller
public class EvalAction {
	
	@Resource(name="orderServiceImp")
	private IOrderService orderServiceImp;
	
	@Resource(name="evalServiceImp")
	private IEvalService evalServiceImp;
	
	@Resource(name="sysLogServiceImp")
	private ISysLogService sysLogServiceImp;
	
	/**
	 * 根据评价id删除评价
	 * @param eval_id
	 * @return
	 */
	@RequestMapping(value="deleteEvalID.action")
	public String deleteEvalID(HttpSession session,HttpServletRequest request,Integer eval_id){
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		User user = (User)session.getAttribute("user");
		SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Eval.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.DELETE,new Date(),visit_ip,local_ip);
		sysLogServiceImp.addSysOperateLog(log);
		
		boolean bool = evalServiceImp.deleteEvalId(eval_id);
		return "redirect:/selectUsergetId.action";
	}
	/**
	 * 添加评价
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="addEval.action")
	@ResponseBody
	public void addEval(HttpServletRequest request,Integer book_id,Double eval_score,String eval_content,Integer order_id,HttpSession session,HttpServletResponse response) throws IOException{
		String local_ip = GetLocalIP.getLocalIP();                   //获取服务器IP
		String visit_ip = GetVisitIP.getVisitIp(request);         //获取客户端IP
		
		boolean alterOrderAccess = orderServiceImp.alterOrderAccess(order_id);
		User user = (User)session.getAttribute("user");
		Date date = new Date();
		boolean bool = evalServiceImp.addEval(user.getUser_id(),book_id,eval_content,eval_score);
		if(bool){
			SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Eval.TABLENAME,"SUCCESS",LogConstant.MODEL_MENU,LogConstant.ADD,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("添加成功!");
		}else {
			SysOperateLog log = new SysOperateLog(0,user.getUser_no(),Eval.TABLENAME,"FAILED",LogConstant.MODEL_MENU,LogConstant.ADD,new Date(),visit_ip,local_ip);
			sysLogServiceImp.addSysOperateLog(log);
			response.getWriter().write("添加失败!");
		}
	}
}
