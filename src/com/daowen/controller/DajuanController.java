package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Dajuan;
import com.daowen.service.DajuanService;
import com.daowen.service.DajuanitemService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
@Controller
public class DajuanController extends SimpleController {

	@Override
	@RequestMapping("/admin/dajuanmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		
		mappingMethod(request,response);

	}
	
	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		dajuanSrv.delete(" where id=" + id);
		//删除答卷记录
		djiSrv.delete("where dajuanid="+id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		String title = request.getParameter("title");
		String zujuanren = request.getParameter("zujuanren");
		String kemu = request.getParameter("kemu");
		String dajuanren = request.getParameter("dajuanren");
		String shijuanid = request.getParameter("shijuanid");
		String defen = request.getParameter("defen");
		SimpleDateFormat sdfdajuan = new SimpleDateFormat("yyyy-MM-dd");
		Dajuan dajuan = new Dajuan();
		dajuan.setTitle(title == null ? "" : title);
		dajuan.setZujuanren(zujuanren == null ? "" : zujuanren);
		dajuan.setKemu(kemu == null ? "" : kemu);
		dajuan.setDajuanren(dajuanren == null ? "" : dajuanren);
		dajuan.setShijuanid(shijuanid == null ? "" : shijuanid);
		dajuan.setDefen(defen == null ? 0 : new Integer(defen));
		dajuanSrv.save(dajuan);
		
		if (forwardurl == null) {
			forwardurl = "/admin/dajuanmanager.do?actiontype=get";
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
		Dajuan dajuan = dajuanSrv.load(new Integer(id));
		if (dajuan == null)
			return;
		String title = request.getParameter("title");
		String zujuanren = request.getParameter("zujuanren");
		String kemu = request.getParameter("kemu");
		String dajuanren = request.getParameter("dajuanren");
		String shijuanid = request.getParameter("shijuanid");
		String defen = request.getParameter("defen");
		SimpleDateFormat sdfdajuan = new SimpleDateFormat("yyyy-MM-dd");
		dajuan.setTitle(title);
		dajuan.setZujuanren(zujuanren);
		dajuan.setKemu(kemu);
		dajuan.setDajuanren(dajuanren);
		dajuan.setShijuanid(shijuanid);
		dajuan.setDefen(defen == null ? 0 : new Integer(defen));
		dajuanSrv.update(dajuan);
	
		if (forwardurl == null) {
			forwardurl = "/admin/dajuanmanager.do?actiontype=get";
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
			Dajuan dajuan = dajuanSrv.load("where id=" + id);
			if (dajuan != null) {
				request.setAttribute("dajuan", dajuan);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/dajuanadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		String  dajuanren=request.getParameter("dajuanren");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		
		if (dajuanren != null)
			filter += "  and dajuanren='" + dajuanren + "'  ";
		
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
		List<Dajuan> listdajuan = dajuanSrv.getPageEntitys(filter,pageindex, pagesize);
		int recordscount = dajuanSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listdajuan", listdajuan);
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
			forwardurl = "/admin/dajuanmanager.jsp";
		}
		forward(forwardurl);
	}
	
	@Autowired
	private DajuanService dajuanSrv=null;
	@Autowired
	private DajuanitemService djiSrv=null;

}
