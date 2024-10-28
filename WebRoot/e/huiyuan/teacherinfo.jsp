<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
     String id=request.getParameter("id");
     TeacherService teacherSrv=BeansUtil.getBean("teacherService",TeacherService.class);
	 if(id!=null){
	     Teacher temteacher   =teacherSrv.load("where id="+id);
	    request.setAttribute("teacher",temteacher);
	 }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>教师信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
	<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   <script type="text/javascript">
        $(function ()
        {
        });  
    </script>
</head>
<body >
	   <jsp:include page="head.jsp"></jsp:include>
	   <div class="wrap round-block">
			<div class="line-title">
				  当前位置：<a href="index.jsp">首页</a> &gt;&gt; 指导教师
			</div>
    	
		   <div class="main">
		     <jsp:include  page="menu.jsp"></jsp:include>
			<div class="main-content">
				<table border="0" cellspacing="1" class="grid" cellpadding="0"
					width="100%">
					<tr>
						<td align="right" class="title">账号:</td>
						<td>${requestScope.teacher.tno}</td>
						<td colspan="2" rowspan="6"><img src="${requestScope.teacher.xiangpian}" width="200"
							height="200" />
					    </td>
					</tr>
					<tr>
						<td align="right" class="title">姓名:</td>
						<td>${requestScope.teacher.name}</td>
					</tr>
					<tr>
						<td align="right" class="title">性别:</td>
						<td>${requestScope.teacher.sex}</td>
					</tr>
					
					
					<tr>
						<td align="right" class="title">职称:</td>
						<td>${requestScope.teacher.zhicheng}</td>
					</tr>
					<tr>
						<td align="right" class="title">学历:</td>
						<td>${requestScope.teacher.xueli}</td>
					</tr>
					<tr>
					
					
						<td align="right" class="title">邮箱:</td>
						<td>${requestScope.teacher.email}</td>
					</tr>
					<tr>
						<td align="right" class="title">联系电话:</td>
						<td colspan="2">${requestScope.teacher.mobile}</td>
					
						
					</tr>
					<tr>
						<td align="right" class="title">履历:</td>
						<td colspan="3">${requestScope.teacher.lvli}</td>
					</tr>
				</table>
			</div>
		</div>
		</div>
</body>
</html>
