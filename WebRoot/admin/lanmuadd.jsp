﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>

<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>栏目</title>
 <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
<link
	href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js"
	type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css"
	type="text/css"></link>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript">
	function initControl() {
		
		editor = KindEditor.create('textarea[name="des"]', {
			resizeType : 1,
			allowFileManager : true
		});
	}
	$(function() {
		initControl();
		$("#lanmuForm").submit(function() {
			return true;
		})
	});
</script>
</head>
<body>
	
			<div class="search-title">
				<h2>
					频道管理-> 新建频道
				</h2>
				<div class="description"></div>
			</div>
			<form name="lanmuform" method="post"
				action="${pageContext.request.contextPath}/admin/lanmumanager.do"
				id="lanmuForm">
				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="actiontype" value="${actiontype}" />
                    <input name="creator"
							value="${requestScope.adminuser.username}"
							type="hidden" />
					<input type="hidden" name="parentid" value="${parentid}" />
					<tr>
						<td width="10%" align="right">所属分类:</td>
						<td width="*">${requestScope.parenttext}</td>
					</tr>
					<tr>
						<td align="right">频道名称:</td>
						<td><input name="title" value="${requestScope.lanmu.title}"
							class="input-txt" type="text" id="txtTitle" />
						</td>
					</tr>
					<tr>
					   <td colspan="2">
					        <input type="submit" value="提交" id="Button1" class="orange-button" />
				
					   </td>
					</tr>
					
					
				</table>
				
					
			</form>
	
</body>
</html>
