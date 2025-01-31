﻿<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>

<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>焦点图</title>
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
	<link href="${pageContext.request.contextPath}/uploadifive/uploadifive.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/uploadifive/jquery.uploadifive.js" type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css"
	type="text/css"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript">
        function initControl(){

			$('#btnulTupian').uploadifive({
				'auto':true, //是否自动上传
				'multi':false, //是否允许选择多文件
				'folder': '${pageContext.request.contextPath}/Upload', //地址
				'buttonText': '选择图片',
				'buttonClass': 'uploadifive-button',
				'dnd'  : false,//是否允许拖动上传
				'removeCompleted': false, //上传成功后会自动删除页面上的文件
				'queueID': false,//指定用于显示上传队列的父级元素id
				// 'fileType': ['image/jpeg','image/jpg','image/gif','image/png'],
				fileType:false,
				'cancelImg' : '${pageContext.request.contextPath}/uploadifive/uploadifive-cancel.png',
				'uploadLimit':1,//限制上传文件数
				'queueSizeLimit':5,//一次可以在队列中拥有的最大文件数
				'height': 15,
				'width':90,
				'uploadScript':'${pageContext.request.contextPath}/admin/uploadmanager.do',
				'fileSizelimit':'2048KB', //上传文件的大小限制 0则表示无限制
				'onUploadComplete':function(file, data, response){
					$("#filelist").show();
					$("#imgTupian").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
					$("#hidTupian").val("${pageContext.request.contextPath}/upload/temp/"+file.name);
				}
			});

		var imgtupiansrc = "${requestScope.jiaodiantu.tupian}";
		if (imgtupiansrc == "") {
			var url = "${pageContext.request.contextPath}/upload/nopic.jpg";
			$("#imgTupian").attr("src", url);
			$("#hidTupian").val(url);
		} else {
			$("#imgTupian").attr("src", imgtupiansrc);
			$("#hidTupian").val(imgtupiansrc);
		}
		//开始绑定
		//结束绑定
	}
	$(function() {
		initControl();
		$("#jiaodiantuForm").submit(function() {
			return true;
		})
	});
</script>
</head>
<body>
	
			<div class="search-title">
				<h2>
					焦点图管理-> <a
						href="${pageContext.request.contextPath}/admin/jiaodiantumanager.do?actiontype=load&seedid=102">新建焦点图</a>
				</h2>
				<div class="description"></div>
			</div>
			<form name="jiaodiantuform" method="post"
				action="${pageContext.request.contextPath}/admin/jiaodiantumanager.do"
				id="jiaodiantuForm">
				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="seedid" value="${seedid}" />
					<input type="hidden" name="actiontype" value="${actiontype}" />
					<tr>
						
					    <td colspan="4" >
					    <img id="imgTupian" width="850px" height="200px"
							src="${requestScope.jiaodiantu.tupian}" />
							<div>
								<input type="file" name="upload" id="btnulTupian" />
							</div> <input type="hidden" id="hidTupian" name="tupian"
							value="${requestScope.jiaodiantu.tupian}" /></td>
					</tr>
					<tr>
					
					   <td align="right">标题:</td>
						<td><input name="title"
							value="${requestScope.jiaodiantu.title}" class="input-txt"
							type="text" id="txtTitle" />
					    </td>
					
						<td align="right">链接地址:</td>
						<td><input name="href"
							value="${requestScope.jiaodiantu.href}" class="input-txt"
							type="text" id="txtHref" /></td>
					</tr>
					<tr>
						<td align="right">类型:</td>
						<td><input type="radio" name="xtype" id="radXtype" value="站内"
							checked="checked">站内 <input type="radio" name="xtype"
								id="radXtype" value="站外">站外 
						</td>
					
						<td align="right">显示优先级:</td>
						<td><select name="pindex" id="ddlPindex" ltype="select">
								<option value="0">第一级</option>
								<option value="2">第二季</option>
								<option value="3">第三级</option>
								<option value="4">第四级</option>
								<option value="5">第五级</option>
						</select></td>
					</tr>
				</table>
				<div class="ui-button">
					<input type="submit" value="提交" id="Button1" class="ui-button-text" />
				</div>
			</form>
	
</body>
</html>
