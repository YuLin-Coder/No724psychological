﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>首页栏目信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			       
			    	
			    	var ids = $(".check[type=checkbox]:checked").serialize();
					
					 if($(".check:checked").length<1)
				        {
				           $.dialog.alert("请选择需要删除条目");
				           return;
				        } 
					if(!confirm("你确定要删除吗")){
						return;
					}
					
					$.ajax({
                       url: "${pageContext.request.contextPath}/admin/indexcolumnsmanager.do?actiontype=delete",
                       method: 'post',
                       data: ids,

                       success: function (data) {
                          
                            window.location.reload();
                       },
                       error: function (XMLHttpRequest, textStatus, errorThrown) {
                           alert(XMLHttpRequest.status + errorThrown);
                       }
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
<body>
	<div class="search-title">
		<h2>首页栏目管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/lanmumanager.do?actiontype=get&forwardurl=/admin/columnguide.jsp">新建首页栏目</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/indexcolumnsmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>栏目描述 <input name="coldes" value="${coldes}"
							class="input-txt" type="text" id="coldes" /> <input
							type="hidden" name="actiontype" value="search" /> <input
							type="hidden" name="seedid" value="${seedid}" /> <input
							type="hidden" name="forwardurl"
							value="/admin/indexcolumnsmanager.jsp" />
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
				 <span id="btnCheckAll" class="orange-href">选择</span>
				
				 <span id="btnDelete" class="orange-href" >删除</span>
				
			</div>
	<table id="indexcolumns" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>栏目描述</b></th>
				
				<th><b>栏目类型</b></th>
				<th><b>显示风格</b></th>
				<th><b>显示排版</b></th>
				<th>宽度</th>
				<th>操作</th>
				
			</tr>
		</thead>
		<tbody>
			<c:if
				test="${listindexcolumns== null || fn:length(listindexcolumns) == 0}">
				<tr>
					<td colspan="20">没有相关首页栏目信息</td>
				</tr>
			</c:if>
			<%	
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listindexcolumns")!=null)
								      {
									  List<Indexcolumns> listindexcolumns=( List<Indexcolumns>)request.getAttribute("listindexcolumns");
								     for(Indexcolumns  temindexcolumns  :  listindexcolumns)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temindexcolumns.getId()%>"
					class="check" name="ids"
					type="checkbox" value='<%=temindexcolumns.getId()%>'/></td>
				<td><%=temindexcolumns.getColdes()%>(<%=temindexcolumns.getColid()%>)</td>
				<td><%=temindexcolumns.getXtype() %></td>
				
				<td><%=temindexcolumns.getShowstyle()%></td>
				<td><%if(temindexcolumns.getLayout().equals("1")){%>
				        独立行显示
				    <%} %>
				    <%if(temindexcolumns.getLayout().equals("2")){%>
				       行内显示
				    <%} %>
				</td>
				<td><%=temindexcolumns.getWidth() %></td>
				<td><a class="orange-href"
					href="${pageContext.request.contextPath}/admin/indexcolumnsmanager.do?actiontype=load&id=<%=temindexcolumns.getId()%>&forwardurl=/admin/indexcolumnsadd.jsp">修改</a>
					
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
