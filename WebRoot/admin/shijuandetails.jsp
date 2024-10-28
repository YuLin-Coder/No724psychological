<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    ShijuanService sjSrv=BeansUtil.getBean("shijuanService", ShijuanService.class);
    String id = request.getParameter("id");
	if (id != null) {
		Shijuan temobjshijuan = sjSrv.load(" where id=" + id);
		request.setAttribute("shijuan", temobjshijuan);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>试卷信息查看</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/e/css/register.css"
	type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(function() {
	});
</script>
</head>
<body style="padding: 10px">
	<div class="search-title">
		<h2>查看试卷：</h2>
		<div class="description"></div>
	</div>
	<table border="0" cellspacing="1" class="grid" cellpadding="0"
		width="100%">
		<tr>
			<td align="right" height="34px">试卷名:</td>
			<td>${requestScope.shijuan.title}</td>
		</tr>
		<tr>
			<td align="right" height="34px">组卷人:</td>
			<td>${requestScope.shijuan.zujuanren}</td>
		</tr>
		<tr>
			<td align="right" height="34px">总分:</td>
			<td>${requestScope.shijuan.zongfen}</td>
		</tr>
		<tr>
			<td align="right">科目:</td>
			<td>${requestScope.shijuan.kemu}</td>
		</tr>
		<tr>
			<td align="right">描述:</td>
			<td colspan="3">${requestScope.shijuan.des}</td>
		</tr>
	</table>

</body>
</html>
