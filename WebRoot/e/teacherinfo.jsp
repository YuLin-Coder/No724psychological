<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  include file="import.jsp"%>
<%
             TeacherService teacherSrv=BeansUtil.getBean("teacherService",TeacherService.class);
            String id=request.getParameter("id");
            if(id!=null){
                Teacher teacher=teacherSrv.load("where id="+id);
                if(teacher!=null)
                   request.setAttribute("temteacher",teacher);
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>教师</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl"
		value="/e/teacherinfo.jsp?id=<%=id%>" />
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; <a
				href="${pageContext.request.contextPath}/e/teacherlist.jsp">教师</a>
		</div>
		<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${requestScope.temteacher.xiangpian}" />
				<div class="operation">
					<div class="ticket-price">${temteacher.name}</div>
				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.temteacher.name}</div>
				<div class="sub-title"></div>
				<div>
					<ul>
						<li><strong>工号:</strong> ${requestScope.temteacher.tno}</li>
						<li><strong>性别:</strong> ${requestScope.temteacher.sex}</li>
						<li><strong>籍贯:</strong> ${requestScope.temteacher.jiguan}</li>
						<li><strong>职称:</strong> ${requestScope.temteacher.zhicheng}</li>
						<li><strong>学历:</strong> ${requestScope.temteacher.xueli}</li>
						<li><strong>邮箱:</strong> ${requestScope.temteacher.email}</li>
						<li><strong>电话:</strong> ${requestScope.temteacher.mobile}</li>
						<li><a class="btn btn-default"
									href="${pageContext.request.contextPath}/e/leavewordadd.jsp?tno=${temteacher.tno}">
									<i class="fa fa-commenting" aria-hidden="true"></i>在线咨询 </a>
									
							<a class="btn btn-default"
									href="${pageContext.request.contextPath}/e/yuyueadd.jsp?id=${temteacher.id}">
									<i class="fa fa-plus" aria-hidden="true"></i>预约专家 </a>
										
					   </li>
						
					</ul>
				</div>
				<div></div>
			</div>
		</div>
		<!--end text-box-->
	</div>
	<!--end show details-->
	<div class="wrap info">
		<div class="brief-title">介绍</div>
		<div class="brief-content">${requestScope.temteacher.lvli}</div>
		<jsp:include page="comment.jsp">
			<jsp:param value="teacher" name="commenttype" />
		</jsp:include>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
