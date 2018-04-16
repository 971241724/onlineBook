package com.b2c.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.b2c.entity.Notice;
import com.b2c.service.NoticeService;
import com.b2c.utils.PageBean;

@Controller
public class NoticeAction {
	final Integer ps=10;
	@Resource(name = "NoticeServiceImp")
	private NoticeService NoticeServiceImpl;
	
	@RequestMapping(value="htaddNotice.action")
	public String htaddNotice(Model model,HttpServletResponse response,String notice_title,String notice_content,HttpSession session,Integer pc ) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(pc == null){
			pc = 1;
		}
		if(notice_content.isEmpty() || notice_content.trim().equals("")){
			out.flush();
		    out.println("<script>");
		    out.println("alert('公告内容不能为空');");
		    out.println("history.back();");
		    out.println("</script>");
		}else{
			//String Notice_username = (String) session.getAttribute("");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String notice_date = df.format(new Date());
			int notice_level = 1;
			Notice notice = new Notice(notice_title, notice_content, notice_date, notice_level);
			boolean flag= NoticeServiceImpl.addNotice(notice);
			if(flag==true){
				out.flush();
				out.println("<script>");
				out.println("alert('公告发布成功');");
				out.println("</script>");
				PageBean<Notice> list = NoticeServiceImpl.findbyall(pc,ps);
				model.addAttribute("list", list);
				return "forward:/backstage/noticelist.jsp";
			}else {
				out.flush();
				out.println("<script>");
				out.println("alert('公告发布失败');");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		return null;
		}
	@RequestMapping(value="findbyallNotice.action")
	public String findbyallNotice(Model model,Integer pc){
		if(pc == null){
			pc = 1;
		}
		PageBean<Notice> list = NoticeServiceImpl.findbyall(pc, ps);
	    model.addAttribute("list", list);
	    return "forward:/fruit_page/notice.jsp";
	}
	@RequestMapping(value="htfindbyallNotice.action")
	public String htfindbyallNotice(Model model,Integer pc){
		if(pc == null){
			pc = 1;
		}
		PageBean<Notice> list = NoticeServiceImpl.findbyall(pc, ps);
	    model.addAttribute("list", list);
	    return "forward:/backstage/noticelist.jsp";
	}
	@RequestMapping(value="findbyidNotice.action")
	public String findbyidNotice(Model model,int id){
		Notice notice = NoticeServiceImpl.findbyid(id);
		model.addAttribute("notice", notice);
		return "forward:/fruit_page/notice_content.jsp";
	}
	@RequestMapping(value="htupdateNoticeForpage.action")
	public String htupdateNoticeForpage(Model model,String content_id){
		int id = Integer.parseInt(content_id);
		Notice notice = NoticeServiceImpl.findbyid(id);
		model.addAttribute("notice", notice);
		return "forward:/backstage/noticeUpdate.jsp";
	}
	@RequestMapping(value="htupdateNotice.action")
	public String htupdateNotice(Integer pc,Model model,HttpServletResponse response,String notice_title,String notice_content,String id) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(pc == null){
			pc = 1;
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String notice_date = df.format(new Date());
		int notice_level =1;
		int notice_id = Integer.parseInt(id);
		Notice notice = new Notice(notice_id,notice_title, notice_content, notice_date, notice_level);
		boolean flag=NoticeServiceImpl.updateNotice(notice);
		if(flag==true){
			out.flush();
			out.println("<script>");
			out.println("alert('公告修改成功');");
			out.println("</script>");
			PageBean<Notice> list = NoticeServiceImpl.findbyall(pc, ps);
			model.addAttribute("list", list);
			return "forward:/backstage/noticelist.jsp";
		}else {
			out.flush();
			out.println("<script>");
			out.println("alert('公告修改失败');");
			out.println("history.back();");
			out.println("</script>");
		}
		return null;
	}
	@RequestMapping(value="htdelNotice.action")
	public String htdelNotice(Integer pc,Model model,HttpServletResponse response,String content_id) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(pc == null){
			pc = 1;
		}
		int id = Integer.parseInt(content_id);
		boolean flag=NoticeServiceImpl.delNotice(id);
		if(flag==true){
			out.flush();
			out.println("<script>");
			out.println("alert('公告删除成功');");
			out.println("</script>");
			PageBean<Notice> list = NoticeServiceImpl.findbyall(pc, ps);
			model.addAttribute("list", list);
			return "forward:/backstage/noticelist.jsp";
		}else {
			out.flush();
			out.println("<script>");
			out.println("alert('公告删除失败');");
			out.println("history.back();");
			out.println("</script>");
		}
		return null;
	}
}
