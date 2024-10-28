<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    TopicService topicSrv=BeansUtil.getBean("topService", TopicService.class);
    if( id!=null)
    {
      
      Topic temobjtopic=topicSrv.load(" where id="+ id);
      request.setAttribute("topic",temobjtopic);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>帖子信息查看</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>
<body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a> &gt;&gt; 帖子管理
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">	
			       <!-----开始---->
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					<tr>
						<td width="10%" align="right">标题:</td>
						<td>${requestScope.topic.title}</td>
					</tr>
					<tr>
						<td width="10%" align="right">发布人:</td>
						<td>${requestScope.topic.pubren}</td>
					</tr>
					<tr>
						<td width="10%" align="right">发布时间:</td>
						<td><fmt:formatDate value="${requestScope.topic.pubtime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
					</tr>
					
					<tr>
						<td width="10%" align="right">所属版块:</td>
						<td>${requestScope.topic.bkname}</td>
					</tr>
					<tr>
						<td width="10%" align="right">浏览次数:</td>
						<td>${requestScope.topic.clickcount}</td>
					</tr>
					
					<tr>
						<td width="10%" align="right">内容:</td>
						<td>${requestScope.topic.dcontent}</td>
					</tr>
				</table>
				<!-----结束---->
			</div>
	     </div>
	</div>
</body>
</html>
