<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>科目信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           top.$.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             top.$.dialog.confirm("你确定要注销科目信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/kechengmanager.do?forwardurl=/admin/kechengmanager.jsp&actiontype=delete&id='+id);
				         });
			        });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>测试分类管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/kechengmanager.do?actiontype=load">新建分类</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/kechengmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>名称 <input name="mingcheng" value="${mingcheng}"
							class="input-txt" type="text" id="mingcheng" /> <input
							type="hidden" name="actiontype" value="search" /> <input
							type="hidden" name="seedid" value="${seedid}" /> <input
							type="hidden" name="forwardurl" value="/admin/kechengmanager.jsp" />
							<div class="ui-button">
								<button class="ui-button-text">搜索</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">

		<div class="btn-group">
			<button id="btnCheckAll"
				class="btn btn-default btn-success btn-group-sm">
				<span class="fa fa-check"></span> 选择
			</button>
			<button id="btnDelete"
				class="btn btn-default btn-success btn-group-sm">
				<span class="fa fa-remove"></span> 删除
			</button>

		</div>

	</div>
	<table id="kecheng" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>名称</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listkecheng== null || fn:length(listkecheng) == 0}">
				<tr>
					<td colspan="20">没有相关科目信息</td>
				</tr>
			</c:if>
			<%	
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listkecheng")!=null)
								      {
									  List<Kecheng> listkecheng=( List<Kecheng>)request.getAttribute("listkecheng");
								     for(Kecheng  temkecheng  :  listkecheng)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temkecheng.getId()%>" class="check"
					name="chk<%=temkecheng.getId()%>" type="checkbox"
					value='<%=temkecheng.getId()%>'></td>
				<td><%=temkecheng.getMingcheng()%></td>
				<td><a class="orange-href"
					href="${pageContext.request.contextPath}/admin/kechengmanager.do?actiontype=load&id=<%=temkecheng.getId()%>&forwardurl=/admin/kechengadd.jsp">修改</a>

				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
