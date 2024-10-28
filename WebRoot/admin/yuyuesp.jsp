<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>预约信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js"
			type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
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
			url: "${pageContext.request.contextPath}/admin/yuyuemanager.do?actiontype=delete",
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
	 <body >
	<div class="search-title">
		<h2>预约管理</h2>
		<div class="description"></div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/yuyuemanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>服务人员<input name="fwyname" value="${fwyname}"
							class="input-txt" type="text" id="fwyname" /> <input
							type="hidden" name="actiontype" value="search" /> <input
							type="hidden" name="seedid" value="${seedid}" /> <input
							type="hidden" name="forwardurl" value="/admin/yuyuesp.jsp" />
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
		<span class="orange-href" id="btnCheckAll">选择</span> <span
			id="btnDelete" class="orange-href"> 删除 </span>
	</div>
	<table id="yuyue" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>服务人员</b></th>
				<th><b>预约日期</b></th>
				<th><b>面试方式</b></th>
				<th><b>联系电话</b></th>
				<th><b>状态</b></th>
				<th><b>预约备注</b></th>
				<th><b>预约人</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listyuyue== null || fn:length(listyuyue) == 0}">
				<tr>
					<td colspan="20">没有相关预约信息</td>
				</tr>
			</c:if>
			<%	
									if(request.getAttribute("listyuyue")!=null)
								      {
									  List<Yuyue> listyuyue=( List<Yuyue>)request.getAttribute("listyuyue");
								     for(Yuyue  temyuyue  :  listyuyue)
								      {
							%>
			<tr>
				<td>&nbsp <input id="chk<%=temyuyue.getId()%>" class="check"
					name="ids" type="checkbox" value='<%=temyuyue.getId()%>'></td>
				<td><%=temyuyue.getFwyname()%></td>
				<td><%=new SimpleDateFormat("yyyy-MM-dd").format(temyuyue.getYydate())%></td>
				<td><%=temyuyue.getMsstyle()%></td>
				<td><%=temyuyue.getMobile()%></td>
				<td>
					<%if(temyuyue.getState()==1){%> 等待审批 <%}%> <%if(temyuyue.getState()==2){%>
					审批通过<%}%> <%if(temyuyue.getState()==3){%> 时间冲突 <%}%>
				</td>
				<td><%=temyuyue.getDes()%></td>
				<td><%=temyuyue.getHyname()%></td>
				<td>
					<%if(temyuyue.getState()==1){%> <a class="orange-href"
					href="${pageContext.request.contextPath}/admin/yuyuespnext.jsp?id=<%=temyuyue.getId()%>">审批</a>
					<%}%> <a class="orange-href"
					href="${pageContext.request.contextPath}/admin/yuyuedetails.jsp?id=<%=temyuyue.getId()%>">查看</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
