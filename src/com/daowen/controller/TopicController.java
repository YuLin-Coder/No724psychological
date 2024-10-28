package com.daowen.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Topic;
import com.daowen.service.TopicService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
@Controller
public class TopicController extends SimpleController {

	@Autowired
	private TopicService topicSrv=null;
	@Override
	@RequestMapping("/admin/topicmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);
	}
	

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		topicSrv.delete(" where id=" + id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String bkid = request.getParameter("bkid");
		String bkname = request.getParameter("bkname");
		String fee=request.getParameter("fee");
		String clickcount = request.getParameter("clickcount");
		String istopic = request.getParameter("istopic");
		String lastreplyor = request.getParameter("lastreplyor");
		String lastreplytime = request.getParameter("lastreplytime");
		String replycount = request.getParameter("replycount");
		String replyid = request.getParameter("replyid");
		String tupian=request.getParameter("tupian");
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdftopic = new SimpleDateFormat("yyyy-MM-dd");
		Topic topic = new Topic();
		
		topic.setTitle(title == null ? "" : title);
		topic.setPubren(pubren == null ? "" : pubren);
		if (pubtime != null) {
			try {
				topic.setPubtime(sdftopic.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			topic.setPubtime(new Date());
		}
		topic.setBkid(bkid == null ? 0 : new Integer(bkid));
		topic.setBkname(bkname == null ? "" : bkname);
		topic.setClickcount(clickcount == null ? 0 : new Integer(clickcount));
		topic.setIstopic(istopic == null ? 0 : new Integer(istopic));
		topic.setLastreplyor(lastreplyor == null ? "" : lastreplyor);
		if (lastreplytime != null) {
			try {
				topic.setLastreplytime(sdftopic.parse(lastreplytime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			topic.setLastreplytime(new Date());
		}
		topic.setTupian(tupian==null?"":tupian);
		if(fee!=null)
		   topic.setFee(Integer.parseInt(fee));
		else
			topic.setFee(0);
		topic.setReplycount(replycount == null ? 0 : new Integer(replycount));
		topic.setReplyid(replyid == null ? 0 : new Integer(replyid));
		topic.setDcontent(dcontent == null ? "" : dcontent);
		topicSrv.save(topic);
		if (forwardurl == null) {
			forwardurl = "/admin/topicmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Topic topic = topicSrv.load(new Integer(id));
		if (topic == null)
			return;
		String title = request.getParameter("title");
		String pubren = request.getParameter("pubren");
		String pubtime = request.getParameter("pubtime");
		String bkid = request.getParameter("bkid");
		String bkname = request.getParameter("bkname");
		String clickcount = request.getParameter("clickcount");
		String istopic = request.getParameter("istopic");
		String tupian=request.getParameter("tupian");
		String lastreplyor = request.getParameter("lastreplyor");
		String lastreplytime = request.getParameter("lastreplytime");
		String replycount = request.getParameter("replycount");
		String replyid = request.getParameter("replyid");
		String dcontent = request.getParameter("dcontent");
		SimpleDateFormat sdftopic = new SimpleDateFormat("yyyy-MM-dd");
		topic.setTitle(title);
		topic.setPubren(pubren);
		if (pubtime != null) {
			try {
				topic.setPubtime(sdftopic.parse(pubtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		topic.setBkid(bkid == null ? 0 : new Integer(bkid));
		topic.setBkname(bkname);
		topic.setTupian(tupian==null?"":tupian);
		topic.setClickcount(clickcount == null ? 0 : new Integer(clickcount));
		topic.setIstopic(istopic == null ? 0 : new Integer(istopic));
		topic.setLastreplyor(lastreplyor);
		if (lastreplytime != null) {
			try {
				topic.setLastreplytime(sdftopic.parse(lastreplytime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		topic.setReplycount(replycount == null ? 0 : new Integer(replycount));
		topic.setReplyid(replyid == null ? 0 : new Integer(replyid));
		topic.setDcontent(dcontent);
		topicSrv.update(topic);
		if (forwardurl == null) {
			forwardurl = "/admin/topicmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Topic topic = topicSrv.load("where id=" + id);
			if (topic != null) {
				request.setAttribute("topic", topic);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/topicadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String pubren=request.getParameter("pubren");
		String title = request.getParameter("title");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		if(pubren!=null)
			filter+=" and pubren='"+pubren+"'";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Topic> listtopic = topicSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = topicSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listtopic", listtopic);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/topicmanager.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
