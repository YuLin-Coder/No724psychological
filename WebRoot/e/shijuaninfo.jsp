<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="import.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<%
            String id=request.getParameter("id");
             ShijuanService shijuanSrv=BeansUtil.getBean("shijuanService",ShijuanService.class);
            if(id!=null){
                Shijuan shijuan=shijuanSrv.load("where id="+id);
                if(shijuan!=null)
                   request.setAttribute("shijuan",shijuan);
            }
   %>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
      	<input type="hidden" id="commentresurl" value="/e/shijuaninfo.jsp?id=<%=id%>"/>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 在线测试
		</div>
<div class="show-details">
		   <div class="picture-box">
		       <img id="imgTupian"  src="${requestScope.shijuan.tupian}" />
			   <div class="operation">
			     <div class="ticket-price">
                     ${requestScope.shijuan.title}
			     </div>
			   </div>
		   </div>
		   <div class="text-box">
		       <div class="title" >
		            ${requestScope.shijuan.title}
		       </div>
		       <div class="sub-title">
		               副标题
		       </div>
		       <div>
		           <ul>
											   <li>
											   <strong  >试卷名称:</strong>
												   ${requestScope.shijuan.title}
											   </li>
											   <li>
											   <strong  >科目:</strong>
												   ${requestScope.shijuan.kemu}
											   </li>
											   <li>
											   <strong  >总分:</strong>
												   ${requestScope.shijuan.zongfen}
											   </li>
											   <li>
											  
												    <a class="btn btn-default" href="${pageContext.request.contextPath}/e/onlinetest.jsp?id=${shijuan.id}">在线测试</a>
											   </li>
											  
		           </ul>
		       </div>
		      <div>
		   </div>
		   </div>
			</div>
		   <!--end text-box-->
		   </div>
		   <!--end show details-->
		    <div  class="wrap info">
		           <div class="brief-title">介绍</div>
		           <div class="brief-content">
		              ${requestScope.shijuan.des}
		           </div>
		           
		           <jsp:include page="comment.jsp">
		                   <jsp:param value="shijuan" name="commenttype"/>
		            </jsp:include>
		     </div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
