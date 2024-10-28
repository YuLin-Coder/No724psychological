<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>帖子信息</title>
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
			        if($(".check:checked").length<1)
			        {
			           top.$.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             top.$.dialog.confirm("你确定要注销帖子信息?", function(){
				             window.location.href=encodeURI('${pageContext.request.contextPath}/admin/topicmanager.do?forwardurl=/admin/topicmanager.jsp&actiontype=delete&id='+id);
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
		<h2>帖子管理</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/topicmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>标题 <input name="title" value="${title}" class="input-txt"
							type="text" id="title" /> <input type="hidden"
							name="actiontype" value="search" /> <input type="hidden"
							name="seedid" value="${seedid}" /> <input type="hidden"
							name="forwardurl" value="/admin/topicmanager.jsp" />
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
		<span id="btnCheckAll" class="orange-href">选择 </span> <span
			id="btnDelete" class="orange-href">删除 </span>

	</div>
	<table id="topic" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>标题</b></th>
				<th><b>发布人</b></th>
				<th><b>发布时间</b></th>
				
				<th><b>版块名称</b></th>
				<th><b>浏览次数</b></th>
				<th><b>是否主题</b></th>
				
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listtopic== null || fn:length(listtopic) == 0}">
				<tr>
					<td colspan="20">没有相关帖子信息</td>
				</tr>
			</c:if>
			<%	
								        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listtopic")!=null)
								      {
									  List<Topic> listtopic=( List<Topic>)request.getAttribute("listtopic");
								     for(Topic  temtopic  :  listtopic)
								      {
							%>
			<tr>
				<td>&nbsp<input id="chk<%=temtopic.getId()%>" class="check"
					name="chk<%=temtopic.getId()%>" type="checkbox"
					value='<%=temtopic.getId()%>'>
				</td>
				<td><%=temtopic.getTitle()%></td>
				<td><%=temtopic.getPubren()%></td>
				<td><%=sdf.format(temtopic.getPubtime())%></td>
				
				<td><%=temtopic.getBkname()%>-<%=temtopic.getBkid()%></td>
				<td><%=temtopic.getClickcount()%></td>
				<td><%if(temtopic.getIstopic()==1){%>
				               主题
				    <%}else{%>
				               非主题
				    <%} %>
				</td>
			
				<td>
					<a class="orange-href"
					href="${pageContext.request.contextPath}/admin/topicdetails.jsp?id=<%=temtopic.getId()%>">查看</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
