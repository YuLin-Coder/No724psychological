<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/carousel.css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/e/js/carousel.js'></script>
    <script type="text/javascript">
        $(function () {


            
            
            
            

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	

	

	<div class="fn-clear"></div>
	
	 <div class="wrap round-block">
	     <div class="forum-cate">
	         <%=new ForumBuilder().buildRootNavBankuai(1) %>
	         <%=new ForumBuilder().buildRootNavBankuai(3) %>
	         <%=new ForumBuilder().buildRootNavBankuai(6) %>
	     </div>
	     <div class="focus-right">
	          <%=new FocusgraphicBuilder().buildFullScreen()%>
	     </div>
	 </div>
  
	
	
	<div class="wrap round-block ">
     
	   
         <%=new IndexcolumnsBuilder().buildColumns() %>

		
	 
	</div>
	
	
	
	<div class="wrap round-block ">
     
	   
         <%=new IndexcolumnsBuilder().buildImageColumns() %>

		
	 
	</div>
		
		
	<div class="fn-clear"></div>
	
	
	
	
	
   
	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>