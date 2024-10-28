package com.daowen.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Fufei;
import com.daowen.service.FufeiService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 付费控制
 *
 */
@Controller
public class FufeiController extends SimpleController {
	@Autowired
	private FufeiService fufeiSrv = null;

	@Override
	@RequestMapping("/admin/fufeimanager.do")
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
		fufeiSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String topicid = request.getParameter("topicid");
		String hyaccount = request.getParameter("hyaccount");
		String fee = request.getParameter("fee");
		String createtime = request.getParameter("createtime");
		String topictitle = request.getParameter("topictitle");
		SimpleDateFormat sdffufei = new SimpleDateFormat("yyyy-MM-dd");
		Fufei fufei = new Fufei();
		fufei.setTopicid(topicid == null ? 0 : Integer.parseInt(topicid));
		fufei.setHyaccount(hyaccount == null ? "" : hyaccount);
		fufei.setFee(fee == null ? 0 : new Integer(fee));
		if (createtime != null) {
			try {
				fufei.setCreatetime(sdffufei.parse(createtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			fufei.setCreatetime(new Date());
		}
		fufei.setTopictitle(topictitle == null ? "" : topictitle);
		fufeiSrv.save(fufei);
		if (forwardurl == null) {
			forwardurl = "/admin/fufeimanager.do?actiontype=get";
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
		Fufei fufei = fufeiSrv.load(new Integer(id));
		if (fufei == null)
			return;
		String topicid = request.getParameter("topicid");
		String hyaccount = request.getParameter("hyaccount");
		String fee = request.getParameter("fee");
		String createtime = request.getParameter("createtime");
		String topictitle = request.getParameter("topictitle");
		SimpleDateFormat sdffufei = new SimpleDateFormat("yyyy-MM-dd");
		fufei.setTopicid(topicid == null ? 0 : Integer.parseInt(topicid));
		fufei.setHyaccount(hyaccount);
		fufei.setFee(fee == null ? 0 : new Integer(fee));
		if (createtime != null) {
			try {
				fufei.setCreatetime(sdffufei.parse(createtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		fufei.setTopictitle(topictitle);
		fufeiSrv.update(fufei);
		if (forwardurl == null) {
			forwardurl = "/admin/fufeimanager.do?actiontype=get";
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
			Fufei fufei = fufeiSrv.load("where id=" + id);
			if (fufei != null) {
				request.setAttribute("fufei", fufei);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/fufeiadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String topicid = request.getParameter("topicid");
		if (topicid != null)
			filter += "  and topicid like '%" + topicid + "%'  ";
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
		List<Fufei> listfufei = fufeiSrv.getPageEntitys(filter, pageindex,
				pagesize);
		int recordscount = fufeiSrv
				.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listfufei", listfufei);
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
			forwardurl = "/admin/fufeimanager.jsp";
		}
		forward(forwardurl);
	}
}
