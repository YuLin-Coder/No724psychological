<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>首页</title>

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webui/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.min.css">

<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/skins/_all-skins.min.css">
<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"
	type="text/javascript"></script>
	    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
	<style type="text/css">
	   body{
	      
	   }
	</style>
	
	<script type="text/javascript">
	        $(function(){
	        	
	        	var setIframeHeight=function (iframe) {
		        		if (iframe) {
		        		var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
		        		if (iframeWin.document.body) {
		        			
		        		   iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
		        		   
		        		}
	        		}
	        	};
	        	
	        	
	        	  var iframe = document.getElementById("main");      
	               if (iframe.attachEvent) {      
	                   iframe.attachEvent("onload", function() {      
	                	   setIframeHeight(iframe);  
	                   });      
	               } else {      
	                   iframe.onload = function() {      
	                	   setIframeHeight(iframe);    
	                   };      
	               }      

	        		
	        	
	        		
	        	
	        });
	</script>



</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">
		<header class="main-header"> <!-- Logo --> <a
			href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini">心理</span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>心理咨询管理系统</b>后台</span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav
			class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<li class="dropdown messages-menu"><a href="${pageContext.request.contextPath}/e/index.jsp"
					class="dropdown-toggle" target="_blank"> <i
						class="fa fa-envelope-o"></i> 预览网站
				</a>
				</li>
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> 
					<img
						src="${users.xiangpian}" class="user-image"
						alt="User Image"> <span class="hidden-xs">${users.username}</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img src="${users.xiangpian}"
							class="img-circle">

							<p>
								${users.username}
							</p>
						</li>
						<!-- Menu Body -->
						
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="${pageContext.request.contextPath}/admin/modifypw.jsp" target="main"  class="btn btn-default btn-flat">修改密码</a>
							</div>
							<div class="pull-right">
								<a href="${pageContext.request.contextPath}/admin/login.jsp" class="btn btn-default btn-flat">退出系统</a>
							</div>
						</li>
					</ul></li>
				<!-- Control Sidebar Toggle Button -->
				<li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li>
			</ul>
		</div>
		</nav> 
	 </header>
	 
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath}/upload/nopic.jpg" class="img-circle" alt="${user.nickname}">
        </div>
        <div class="pull-left info">
          <p>${users.username }</p>
          <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
        </div>
      </div>
    
       <jsp:include page="menu.jsp"></jsp:include> 
    </section>
    <!-- /.sidebar -->
  </aside>
	  <div class="content-wrapper">
	  
	      <iframe src="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get"     frameborder="0" width="100%" height="100%"  name="main"
                        id="main">
          </iframe>
	  </div>


     <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2018-2022 All rights
    reserved.
  </footer>


	</div>



</body>
</html>
<script
	src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/adminlte.min.js"></script>