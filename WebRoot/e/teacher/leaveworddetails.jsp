<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    LeavewordService lwSrv=BeansUtil.getBean("leavewordService", LeavewordService.class);
    Leaveword temleaveword=null;
    if( id!=null)
    {
       temleaveword=lwSrv.load(" where id="+ id);
       request.setAttribute("leaveword",temleaveword);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>留言信息查看</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >

 	<jsp:include page="/e/head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">学生中心</a>
		</div>
	

		<div class="main">

			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<div class="search-title">
					<h2>查看留言</h2>
					<div class="description"></div>
				</div>
				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					<tr>
						<td width="10%" align="right">标题:</td>
						<td>${requestScope.leaveword.title}</td>
					</tr>
					<tr>
						<td align="right">咨询时间:</td>
						<td><fmt:formatDate
								value="${requestScope.leaveword.createtime}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td width="10%" align="right">回复人:</td>
						<td>${requestScope.leaveword.replyren}</td>
					</tr>
					<tr>
						<td align="right">回复时间:</td>
						<td><fmt:formatDate
								value="${requestScope.leaveword.replytime}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<tr>
						<td width="10%" align="right">状态:</td>
						<td> <%if(temleaveword.getStatus()==1){%>
				                    待回复
				   <%} %>
				    <%if(temleaveword.getStatus()==2){%>
				                    已回复
				   <%} %></td>
					</tr>
					<tr>
						<td width="10%" align="right">留言人:</td>
						<td>${requestScope.leaveword.lyren}</td>
					</tr>
					<tr>
						<td width="10%" align="right">姓名:</td>
						<td>${requestScope.leaveword.stname}</td>
					</tr>
					<tr>
						<td align="right">内容:</td>
						<td colspan="3">${requestScope.leaveword.dcontent}</td>
					</tr>
					<tr>
						<td align="right">回复内容:</td>
						<td colspan="3">${requestScope.leaveword.replycontent}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
