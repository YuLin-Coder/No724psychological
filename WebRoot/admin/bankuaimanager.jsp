<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="law.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>板块信息</title>

<link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
<link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js"
	type="text/javascript"></script>
<link
	href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js"
	type="text/javascript"></script>
<script type="text/javascript">
		
			$(function() {
			    $("#bankuai tr").each(function(){
			        if($(this).attr("parentid")!=0)
			          $(this).attr("data-tt-parent-id",$(this).attr("parentid"));
			    });
			    $("#bankuai").treetable({ expandable: true }).treetable("expandAll");
			    $(".btn-lanmu-delete").click(function(){
			        var lanmuid=$(this).attr("lanmuid");
		                 $.dialog.confirm("你确定要删除该板块",function(){
		                    $.ajax({
		                        url:encodeURI('${pageContext.request.contextPath}/admin/bankuaimanager.do?actiontype=delete&id='+lanmuid),
					            method:'post',
					            
					            success:function(){
					                window.location.reload();
					            },
					            error:function(xmhttprequest,status,excetpion){
					                $.dialog.alert("系统错误，错误编码"+status);
					            }
		                    })
		                 });
		                 return false;
			    });
			});
       </script>
</head>
<body >
	<div class="search-title">
		<h2>论坛版块管理</h2>
		<div class="description">
			<a
				href="${pageContext.request.contextPath}/admin/bankuaimanager.do?actiontype=load&parentid=0">新建根版块</a>
		</div>
	</div>

	<div class="clear"></div>
	<table id="bankuai" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		
		<tbody>
			<c:if test="${listbankuai== null || fn:length(listbankuai) == 0}">
				<tr>
					<td colspan="20">没有版块信息</td>
				</tr>
			</c:if>
			<%	
								    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listbankuai")!=null)
								      {
									  List<Bankuai> listbankuai=( List<Bankuai>)request.getAttribute("listbankuai");
								     for(Bankuai  tembankuai  :   listbankuai)
								      {
							%>
			<tr data-tt-id='<%=tembankuai.getId() %>'
				parentid="<%=tembankuai.getParentid()%>">
				<td style="text-align:left;"><span
					class='<%=tembankuai.getIsleaf()==1?"file":"folder" %>'> <a
						title="<%=tembankuai.getName()%>"
						href="bankuaimanager.do?actiontype=load&id=<%=tembankuai.getId() %>&parentid=<%=tembankuai.getParentid() %>">
							<%=tembankuai.getName()%></a>
				</span> <a type="button" class="action-button"
					href="bankuaimanager.do?actiontype=load&parentid=<%=tembankuai.getId() %>"><img
						src="images/add.gif">添加子版块 </a> <a type="button"
					class="action-button"
					href="bankuaimanager.do?actiontype=load&id=<%=tembankuai.getId() %>&parentid=<%=tembankuai.getParentid() %>"><img
						src="images/add.gif">编辑版块 </a> <%
							     if(tembankuai.getIsleaf()==1){
							    	 
							     
							  %> <a lanmuid='<%=tembankuai.getId() %>'
					class="btn-lanmu-delete action-button" type='button'
					href="javascript:void"><img src="images/del.gif">删除</a> <%} %>


				</td>
			</tr>
			<%} } %>
		</tbody>
	</table>
	<!-- 数据结束 -->
</body>
</html>
