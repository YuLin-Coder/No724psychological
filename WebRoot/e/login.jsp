<%@ include file="import.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%

       String reurl=request.getParameter("reurl");
       if(reurl!=null)
         request.setAttribute("reurl", reurl);
 %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生登录</title>

      <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

   <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/register.css" type="text/css"></link>
   
   
<script type="text/javascript">
 
           $(function(){
	           
	            $.metadata.setType("attr","validate");
	            $("#form1").validate();
	        });  
 
 </script>


</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="login.jsp">学生登录</a>
		</div>
	
		<div class="whitebox">

			<h1>用户登录</h1>
           <form name="form1" id="form1" method="post" action="${pageContext.request.contextPath}/admin/qiantaiusermanager.do">
			<input type="hidden" name="actiontype" value="login" />
			<input type="hidden"  name="errorurl" value="/e/login.jsp"/>
                      
			<div class="reg-box">

				
				<div class="reg-content">
					
					<dl>
					    ${errormsg }
					</dl>
					<dl>
						<dt>用户名:</dt>
						<dd>
							<input type="text" class="ui-input" id="txtHuiyuanname" value="${accountname}" validate="{required:true,messages:{required:'请输入用户名称'}}"
								name="accountname"> <i></i>

						</dd>

					</dl>

					<dl>
						<dt>密码:</dt>
						<dd>
							<input type="password" class="ui-input"  value="${password}" validate="{required:true,messages:{required:'请输入登录密码'}}" id="txtPassword"
								name="password"> 
								<i>

								 </i>

						</dd>

					</dl>
					
					<dl>
						<dt></dt>
						<dd>
						 <input type="radio" name="usertype" checked="checked" value="0" />学生
                         <input type="radio" name="usertype" value="1" /> 教师
						</dd>

					</dl>
					
				     <dl>
						<dt></dt>
						<dd>
							<input type="submit" class="btn btn-default" id="btnReigster"
								value="登录" name="btnReigster">
						</dd>

					</dl>
                   <dl>
					   <dt></dt>
					   
					   <dd></dd>
					</dl>

                
				</div>


			</div>
          </form>

		</div>
		

	</div>


</body>
</html>