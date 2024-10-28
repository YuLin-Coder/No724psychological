<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>预约信息</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
 <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
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
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 预约管理
		</div>
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<!-- 搜索控件开始 -->
				<div class="search-options">
					<form id="searchForm"
						action="${pageContext.request.contextPath}/admin/yuyuemanager.do"
						method="post">
						<table cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td>服务人员 <input name="fwyname" value="${fwyname}"
										class="input-txt" type="text" /> 
										<input
										type="hidden" name="hyaccount" value="${huiyuan.accountname}" />
										<input
										type="hidden" name="actiontype" value="search" /> <input
										type="hidden" name="seedid" value="${seedid}" /> <input
										type="hidden" name="forwardurl"
										value="/e/huiyuan/yuyuemanager.jsp" />
										<div class="ui-button">
											<input type="submit" value="搜索" id="btnSearch"
												class="ui-button-text" />
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
					<span id="btnCheckAll" class="orange-href">选择</span> <span
						id="btnDelete" class="orange-href">删除</span>
				</div>
				<table id="yuyue" width="100%" border="0" cellspacing="0"
					cellpadding="0" class="ui-record-table">
					<thead>
						<tr>
							<th>选择</th>
							<th><b>服务员</b></th>
							<th><b>预约日期</b></th>
							<th><b>面试方式</b></th>
							<th><b>联系电话</b></th>
							<th><b>状态</b></th>
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
								         SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
								     for(Yuyue  temyuyue  :  listyuyue)
								      {
							%>
						<tr>
							<td>&nbsp<input id="chk<%=temyuyue.getId()%>" class="check"
								name="ids" type="checkbox" value='<%=temyuyue.getId()%>'></td>
							<td><%=temyuyue.getFwyname()%></td>
							<td><%=sdf.format(temyuyue.getYydate())%></td>
							<td><%=temyuyue.getMsstyle()%></td>
							<td><%=temyuyue.getMobile()%></td>
							<td><%if(temyuyue.getState()==1){%>
							                    等待审批
							    <%} %>
							    <%if(temyuyue.getState()==2){%>
							                    审批通过
							    <%} %>
							     <%if(temyuyue.getState()==3){%>
							                    时间冲突
							    <%} %>
							</td>
							<td>
								<a class="orange-href"
								href="${pageContext.request.contextPath}/e/huiyuan/yuyuedetails.jsp?id=<%=temyuyue.getId()%>">查看</a>
							</td>
						</tr>
						<%}}%>
					</tbody>
				</table>
				<div class="clear"></div>
				<daowen:pager id="pager1" attcheform="searchForm" />
			</div>
		</div>
	</div>
</body>
</html>
