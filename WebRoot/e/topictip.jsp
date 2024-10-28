<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String forwardurl=request.getParameter("forwardurl");
    if(forwardurl!=null)
    	request.setAttribute("forwardurl", forwardurl);

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看帖子提示</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<link rel="stylesheet" href="css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="css/register.css" type="text/css"></link>

<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/e/js/jquery.iFadeSldie.js"
	type="text/javascript"></script>



</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; 系统提示
		</div>
	
		
        <div class="wrap round-block">
            <h1>
                              系统提示<strong></strong></h1>
            <div class="reg-box">
                <div class="reg-title">
                 
                </div>
                <div class="msg-tip">
                    
                    <div class="text">
                        <strong>帖子为收费内容你需要登录系统！</strong>
                        <a href="${pageContext.request.contextPath}/e/login.jsp?forwardurl=${forwardurl}">登录系统</a>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
	</div>

	<div class="fn-clear"></div>





</body>
</html>