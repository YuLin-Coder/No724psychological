<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>板块</title>
  
  
    
   <link href="${pageContext.request.contextPath}/admin/css/web2table.css"
	rel ="stylesheet" type="text/css" />
   

    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/common.css" type="text/css"></link>

    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>

    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
   <script type="text/javascript">
       
        function initControl(){
          
           $("input[type=radio][name=ishow][value=${requestScope.bankuai.ishow}]").attr("checked",true);   
			
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr", "validate");
            var v = $("#bankuaiForm").validate();
        });  
    </script>
</head>
<body >
	
	
	<div class="search-title">
		<h2>新建论坛板块</h2>
		<div class="description"></div>
	</div>
	<form name="bankuaiform" method="post"
		action="${pageContext.request.contextPath}/admin/bankuaimanager.do"
		id="bankuaiForm">
		<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="forwardurl" value="/admin/bankuaimanager.do?actiontype=get" />
			
			  <input type="hidden" name="parentid" value="${parentid}" />
             <input type="hidden" name="creator" value="${adminuser.username}"/>
	  
		
		<table border="0"  class="grid" cellpadding="0"
			width="100%" >

			<tr>
				<td align="right">所属板块:</td>
				<td>${requestScope.parenttext}</td>
			</tr>

			<tr>
				<td  height="30" align="right">板块名:</td>
				<td >
				
				<input name="name"  class="input-txt"
					value="${requestScope.bankuai.name}" type="text" id="txtName"
					ltype="text" validate="{required:true}" /></td>
			</tr>
			
			<tr>
				<td  height="30" align="right">显示设置:</td>
				<td >
				
				<input name="ishow" value="1"
					type="radio" checked="checked" />显示
					
				 <input name="ishow" value="0"
					type="radio" />不显示
				</td>
			</tr>
			

			<tr>
				<td align="right">板块描述:</td>
				<td colspan="3">   
				      <textarea name="des"
						class="l-textarea" id="txtDes" style="width:300px;height:120px;">${requestScope.bankuai.des}</textarea>
				</td>
			</tr>
			<tr>
			    <td colspan="2">
			        <input type="submit" value="提交"  class="orange-button" />
			    </td>
			</tr>
		</table>
		
	</form>
</body>
</html>
