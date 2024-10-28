<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
     YuyueService yuyueSrv=BeansUtil.getBean("yuyueService",  YuyueService.class);
    if( id!=null)
    {
      Yuyue temobjyuyue=yuyueSrv.load(" where id="+ id);
      request.setAttribute("yuyue",temobjyuyue);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>预约信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看预约</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">人员编号:</td>
			<td>${requestScope.yuyue.fwyid}</td>
		</tr>
		<tr>
			<td width="10%" align="right">备注:</td>
			<td>${requestScope.yuyue.fwyname}</td>
		</tr>
		<tr>
			<td align="right">预约日期:</td>
			<td><fmt:formatDate value="${requestScope.yuyue.yydate}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td align="right">面试方式:</td>
			<td>${requestScope.yuyue.msstyle}</td>
		</tr>
		<tr>
			<td width="10%" align="right">联系电话:</td>
			<td>${requestScope.yuyue.mobile}</td>
		</tr>
		<tr>
						<td width="10%" align="right">状态:</td>
						<td>
						    <c:if test="${requestScope.yuyue.state==1}">
						                      等待审批
						    </c:if>
						     <c:if test="${requestScope.yuyue.state==2}">
						                      审批通过
						    </c:if>
						     <c:if test="${requestScope.yuyue.state==3}">
						                      时间冲突
						    </c:if>
						
						</td>
					</tr>
		<tr>
			<td width="10%" align="right">会员:</td>
			<td>${requestScope.yuyue.hyaccount}</td>
		</tr>
		<tr>
			<td width="10%" align="right">姓名:</td>
			<td>${requestScope.yuyue.hyname}</td>
		</tr>
		<tr>
			<td align="right">预约备注:</td>
			<td colspan="3">${requestScope.yuyue.des}</td>
		</tr>
	</table>
</body>
</html>
