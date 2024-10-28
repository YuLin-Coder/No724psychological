<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<title>教师信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
	
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
	</head>
	 <body >

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; 在线咨询
		</div>
	

		<div class="main">

			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<div class="search-title">
					<h2>在线咨询</h2>
					<div class="description"></div>
				</div>
				<!-- 搜索控件开始 -->
				<div class="search-options">
					<form id="searchForm"
						action="${pageContext.request.contextPath}/admin/teachermanager.do"
						method="post">
						<table cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td>教师名 <input name="name" value="${teachername}"
										class="input-txt" type="text" id="name" /> <input
										type="hidden" name="actiontype" value="search" /> <input
										type="hidden" name="seedid" value="${seedid}" /> <input
										type="hidden" name="forwardurl"
										value="/e/huiyuan/lwguide.jsp" />
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
				<div class="picture-box2">
					<ul>
						<%
							if (request.getAttribute("listteacher") != null) {
								List<Teacher> listteacher = (List<Teacher>) request
										.getAttribute("listteacher");
								for (Teacher temteacher : listteacher) {
						%>
						<li><a
							href="${pageContext.request.contextPath}/e/huiyuan/teacherinfo.jsp?id=<%=temteacher.getId()%>">
								<img width="180" height="180"
								src="<%=temteacher.getXiangpian()%>" /> </a> <span> <%=temteacher.getName()%></span>
							<div style="text-align:center;">
								<a class="orange-href"
									href="${pageContext.request.contextPath}/admin/leavewordmanager.do?actiontype=load&tno=<%=temteacher.getTno()%>&forwardurl=/e/huiyuan/leavewordadd.jsp">
									在线咨询 </a>
							</div></li>
						<%
							}
							}
						%>
						</li>
					</ul>
				</div>
				<!--end  picture-box-->
				<div class="clear"></div>
				<daowen:pager id="pager1" attcheform="searchForm" />

			</div>
		</div>

	</div>
</body>
</html>
