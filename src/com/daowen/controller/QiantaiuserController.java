package com.daowen.controller;

import java.text.MessageFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Huiyuan;
import com.daowen.entity.Teacher;
import com.daowen.service.HuiyuanService;
import com.daowen.service.TeacherService;
import com.daowen.ssm.simplecrud.SimpleController;

@Controller
public class QiantaiuserController extends SimpleController {

	@Override
	@RequestMapping("/admin/qiantaiusermanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);
	}
	public void exit() {

		String usertype=request.getParameter("usertype");
		if (usertype!= null&&usertype.equals("0")) {

			System.out.println("系统退出");
			request.getSession().removeAttribute("huiyuan");

		}
		if (usertype!= null&&usertype.equals("1")) {

			System.out.println("教师退出");
			request.getSession().removeAttribute("teacher");

		}
		

	}
	public  void login(){
		
		String usertype = request.getParameter("usertype");

		if (usertype != null && usertype.equals("0")) {
			huiyuanLogin(request,response);
		}
		
		if (usertype != null && usertype.equals("1")) {
			teacherLogin(request, response);
		}
		
	}

	private void huiyuanLogin(HttpServletRequest request,
			HttpServletResponse response) {

		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		String filter = MessageFormat.format(
				"where accountname=''{0}'' and password=''{1}''", accountname,
				password);

		Huiyuan huiyuan = huiyuanSrv.load(filter);
		String errorurl=request.getParameter("errorurl");
		String forwardurl=request.getParameter("forwardurl");

		if (huiyuan != null && huiyuan.getPassword().equals(password)) {
			huiyuan.setLogtimes(huiyuan.getLogtimes() + 1);
			huiyuanSrv.update(huiyuan);
			request.getSession().setAttribute("huiyuan", huiyuan);
			if(forwardurl==null)
				forwardurl="/e/huiyuan/accountinfo.jsp";
			redirect(forwardurl);
			
		} else {
			dispatchParams(request, response);
			request.setAttribute("errormsg", "<label class='error'>学生账户和密码不匹配</label>");
			forward(errorurl);
		}

	}
	
	
	private void teacherLogin(HttpServletRequest request,
			HttpServletResponse response) {

		String accountname = request.getParameter("accountname");
		String password = request.getParameter("password");
		String errorurl=request.getParameter("errorurl");
		String filter = MessageFormat.format("where tno=''{0}'' and password=''{1}''", accountname,
						password);
		Teacher teacher = teacherSrv.load(filter);
		String forwardurl = request.getParameter("forwardurl");
        
		
		if (teacher != null && teacher.getPassword().equals(password)) {

			teacher.setLogintimes(teacher.getLogintimes() + 1);
			teacherSrv.update(teacher);
			request.getSession().setAttribute("teacher", teacher);
			if (forwardurl==null)
				forwardurl="/e/teacher/accountinfo.jsp";
			redirect(forwardurl);
			
		} else {

			dispatchParams(request, response);
			request.setAttribute("errormsg", "系统账户和密码不匹配");
			forward(errorurl);

		}

	}
	@Autowired
	private HuiyuanService huiyuanSrv=null;

	@Autowired
	private TeacherService  teacherSrv=null;

}
