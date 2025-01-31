package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Shijuanitem;
import com.daowen.service.ShijuanitemService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
@Controller
public class ShijuanitemController extends SimpleController {

	@Override
	@RequestMapping("/admin/shijuanitemmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		
		mappingMethod(request,response);

	}
	
	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		sjiSrv.delete(" where id=" + id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String shijuanid = request.getParameter("shijuanid");
		String tihao = request.getParameter("tihao");
		
		String fenshu = request.getParameter("fenshu");
		SimpleDateFormat sdfshijuanitem = new SimpleDateFormat("yyyy-MM-dd");
		Shijuanitem shijuanitem = new Shijuanitem();
		shijuanitem.setShijuanid(shijuanid == null ? 0 : new Integer(shijuanid));
		shijuanitem.setTihao(tihao == null ? 0 : new Integer(tihao));
		
		shijuanitem.setFenshu(fenshu == null ? 0 : new Integer(fenshu));
		sjiSrv.save(shijuanitem);
		
		if (forwardurl == null) {
			forwardurl = "/admin/shijuanitemmanager.do?actiontype=get";
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
		Shijuanitem shijuanitem = sjiSrv.load(new Integer(id));
		if (shijuanitem == null)
			return;
		String shijuanid = request.getParameter("shijuanid");
		String tihao = request.getParameter("tihao");
		String fenshu = request.getParameter("fenshu");
		shijuanitem.setShijuanid(shijuanid == null ? 0 : new Integer(shijuanid));
		shijuanitem.setTihao(tihao == null ? 0 : new Integer(tihao));
		
		shijuanitem.setFenshu(fenshu == null ? 0 : new Integer(fenshu));
		sjiSrv.update(shijuanitem);
		
		if (forwardurl == null) {
			forwardurl = "/admin/shijuanitemmanager.do?actiontype=get";
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
			Shijuanitem shijuanitem = sjiSrv.load("where id=" + id);
			if (shijuanitem != null) {
				request.setAttribute("shijuanitem", shijuanitem);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/shijuanitemadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
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
		List<Shijuanitem> listshijuanitem = sjiSrv.getPageEntitys(filter, pageindex, pagesize);
		int recordscount = sjiSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listshijuanitem", listshijuanitem);
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
			forwardurl = "/admin/shijuanitemmanager.jsp";
		}
		forward(forwardurl);
	}
	
	@Autowired
	private ShijuanitemService sjiSrv=null;

}
