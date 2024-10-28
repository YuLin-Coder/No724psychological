package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Teacher;
import com.daowen.service.TeacherService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;
@Controller
public class TeacherController extends SimpleController {

	@Override
	@RequestMapping("/admin/teachermanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		
		mappingMethod(request,response);

	}
	public void modifyPw() {
		String password1 = request.getParameter("password1");
		String repassword1 = request.getParameter("repassword1");

		String forwardurl = request.getParameter("forwardurl");
		String errorpageurl = request.getParameter("errorpageurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Teacher teacher = teacherSrv.load(new Integer(id));
		if (teacher != null) {
			if (!teacher.getPassword().equals(password1)) {
				
					request.setAttribute("errormsg",
							"<label class='error'>原始密码不正确，不能修改</label>");
					forward(forwardurl);
				
			} else {
				teacher.setPassword(repassword1);
				teacherSrv.update(teacher);
				request.getSession().setAttribute("teacher", teacher);
				redirect(forwardurl);
			}
		}
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		teacherSrv.delete(" where id=" + id);
		get();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String tno = request.getParameter("tno");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");

		String zhicheng = request.getParameter("zhicheng");
		String xueli = request.getParameter("xueli");
		String jiguan = request.getParameter("jiguan");
		String hyid = request.getParameter("hyid");
		String hyname = request.getParameter("hyname");

		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String jiaoyanshi = request.getParameter("jiaoyanshi");
		String lvli = request.getParameter("lvli");
		SimpleDateFormat sdfteacher = new SimpleDateFormat("yyyy-MM-dd");
		Teacher teacher = new Teacher();

		teacher.setTno(tno == null ? "" : tno);
		teacher.setName(name == null ? "" : name);
		teacher.setSex(sex == null ? "" : sex);
		teacher.setXiangpian(xiangpian == null ? "" : xiangpian);
		teacher.setLogintimes(0);
		teacher.setPassword("123456");
		teacher.setZhicheng(zhicheng == null ? "" : zhicheng);
		teacher.setXueli(xueli == null ? "" : xueli);
		teacher.setJiguan(jiguan == null ? "" : jiguan);
		teacher.setAge(40);
		teacher.setEmail(email == null ? "" : email);
		teacher.setMobile(mobile == null ? "" : mobile);
		teacher.setJiaoyanshi(jiaoyanshi == null ? "" : jiaoyanshi);
		teacher.setLvli(lvli == null ? "" : lvli);
		teacherSrv.save(teacher);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/teachermanager.do?actiontype=get";
		}
        redirect(forwardurl);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String id = request.getParameter("id");

		String forwardurl = request.getParameter("forwardurl");
		if (id == null)
			return;
		Teacher teacher =teacherSrv.load(new Integer(id));
		if (teacher == null)
			return;
		String tno = request.getParameter("tno");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		String hyid = request.getParameter("hyid");
		String hyname = request.getParameter("hyname");

		String zhicheng = request.getParameter("zhicheng");
		String xueli = request.getParameter("xueli");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String lvli = request.getParameter("lvli");
		SimpleDateFormat sdfteacher = new SimpleDateFormat("yyyy-MM-dd");
		if(tno!=null)
		   teacher.setTno(tno);
		teacher.setName(name);
		teacher.setSex(sex);
		teacher.setXiangpian(xiangpian);

		teacher.setZhicheng(zhicheng);
		teacher.setXueli(xueli);
		teacher.setEmail(email);
		teacher.setMobile(mobile);
		teacher.setLvli(lvli);
		
		teacherSrv.update(teacher);

		if (forwardurl == null) {
			forwardurl = "/admin/teachermanager.do?actiontype=get";
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
		String forwardurl = request.getParameter("forwardurl");
		dispatchParams(request, response);
		if (id != null) {
			Teacher teacher = teacherSrv.load("where id="
					+ id);
			if (teacher != null) {
				request.setAttribute("teacher", teacher);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}

		
		request.setAttribute("actiontype", actiontype);

		if (forwardurl == null) {
			forwardurl = "/admin/teacheradd.jsp";
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
		List<Teacher> listteacher = teacherSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = teacherSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listteacher", listteacher);
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
			forwardurl = "/admin/teachermanager.jsp";
		}
		forward(forwardurl);

	}
	
	@Autowired
	private TeacherService teacherSrv=null;
	
}
