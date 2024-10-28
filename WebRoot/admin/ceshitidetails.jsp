<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    CeshitiService  ceshitiSrv=BeansUtil.getBean("ceshitiService", CeshitiService.class);
    
    if( id!=null){
      Ceshiti temobjceshiti=ceshitiSrv.load(" where id="+ id);
      request.setAttribute("ceshiti",temobjceshiti);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>测试题信息查看</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
     <link href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.24.4.min.js"></script>
</head>
<body >
<div class="search-title">
	                <h2>
	                       测试题管理-> 查看测试题
	                </h2>
                <div class="description">
                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td align="right" >题目:</td>
											   <td>
												   ${requestScope.ceshiti.title}
												</td>
											   </tr>
											   <tr>
											   <td align="right" >选项A:</td>
											   <td>
												   ${requestScope.ceshiti.choicea}
												</td>
											   </tr>
											   <tr>
											   <td align="right" >选项B:</td>
											   <td>
												   ${requestScope.ceshiti.choiceb}
												</td>
											   </tr>
											   <tr>
											   <td align="right" >选项C:</td>
											   <td>
												   ${requestScope.ceshiti.choicec}
												</td>
											   </tr>
											   <tr>
											   <td align="right" >选项D:</td>
											   <td>
												   ${requestScope.ceshiti.choiced}
												</td>
											   </tr>
											   <tr>
											   <td align="right" >答案:</td>
											   <td>
												   ${requestScope.ceshiti.daan}
												</td>
											   </tr>
											   <tr>
											   <td align="right" >分值:</td>
											   <td>
												   ${requestScope.ceshiti.fenshu}
												</td>
											   </tr>
				        </table>
</body>
</html>
