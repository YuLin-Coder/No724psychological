package com.daowen.controller;

import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.daowen.entity.*;
import com.daowen.service.*;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 预约控制
 *
 */
@Controller
public class YuyueController extends SimpleController {
	@Autowired
	private YuyueService yuyueSrv = null;

	@Override
	@RequestMapping("/admin/yuyuemanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids) + ")";
		System.out.println("sql=" + SQL);
		yuyueSrv.delete(SQL);
	}

	public void shenpi() {
		String id = request.getParameter("id");
		String forwardurl = request.getParameter("forwardurl");
		String status = request.getParameter("state");
		String reply = request.getParameter("reply");
		String shenpiren = request.getParameter("shenpiren");
		int statuscode = 3;
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		if (id == null)
			return;
		Yuyue yuyue = yuyueSrv.load(" where id=" + id);
		if (yuyue == null)
			return;
		if (status != null)
			statuscode = Integer.parseInt(status);
		yuyue.setState(statuscode);
		yuyueSrv.update(yuyue);
		if (forwardurl == null) {
			forwardurl = "/admin/yuyuemanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String fwyid = request.getParameter("fwyid");
		String fwyname = request.getParameter("fwyname");
		String yydate = request.getParameter("yydate");
		String msstyle = request.getParameter("msstyle");
		String mobile = request.getParameter("mobile");
		String state = request.getParameter("state");
		String des = request.getParameter("des");
		String hyaccount = request.getParameter("hyaccount");
		String hyname = request.getParameter("hyname");
		SimpleDateFormat sdfyuyue = new SimpleDateFormat("yyyy-MM-dd");
		Yuyue yuyue = new Yuyue();
		yuyue.setFwyid(fwyid == null ? 0 : new Integer(fwyid));
		yuyue.setFwyname(fwyname == null ? "" : fwyname);
		if (yydate != null) {
			try {
				yuyue.setYydate(sdfyuyue.parse(yydate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			yuyue.setYydate(new Date());
		}
		yuyue.setMsstyle(msstyle == null ? "" : msstyle);
		yuyue.setMobile(mobile == null ? "" : mobile);
		yuyue.setState(1);
		yuyue.setDes(des == null ? "" : des);
		yuyue.setHyaccount(hyaccount == null ? "" : hyaccount);
		yuyue.setHyname(hyname == null ? "" : hyname);
		yuyueSrv.save(yuyue);
		if (forwardurl == null) {
			forwardurl = "/admin/yuyuemanager.do?actiontype=get";
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
			Yuyue yuyue = yuyueSrv.load("where id=" + id);
			if (yuyue != null) {
				request.setAttribute("yuyue", yuyue);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/yuyueadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String fwyid = request.getParameter("fwyid");
		String fwyname=request.getParameter("fwyname");
		String hyaccount=request.getParameter("hyaccount");
		if (fwyid != null)
			filter += "  and fwyid = '" + fwyid + "'  ";
		//
		if(fwyname!=null)
			filter+=" and fwyname like '% "+fwyname+"%'";
		if (hyaccount != null)
			filter += "  and hyaccount = '" + hyaccount + "'  ";
		
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
		List<Yuyue> listyuyue = yuyueSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = yuyueSrv
				.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listyuyue", listyuyue);
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
			forwardurl = "/admin/yuyuemanager.jsp";
		}
		forward(forwardurl);
	}
}
