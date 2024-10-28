<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link  href="${pageContext.request.contextPath}/e/css/index.css"  rel="stylesheet"  type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/jquery.iFadeSlide.css" type="text/css"></link>
 
<link href="${pageContext.request.contextPath}/e/css/forum.css"  rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>

<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/e/js/jquery.iFadeSldie.js" type="text/javascript"></script>  

    <script type="text/javascript">
        $(function () {


        
          
            $(".collapsed").each(function(i,dom){
	             
	             
	             $(this).click(function(){
		             var blockid= $(this).attr("blockid");
		             if($("#"+blockid).is(":hidden")){
		               
		               $(this).attr("src","images/collapsed_no.gif");
		               $("#"+blockid).show();
		             
		             }else
		             {
		                $(this).attr("src","images/collapsed_yes.gif");
		               $("#"+blockid).hide(); 
		             }
	             });
	             
	         
	         
	         });
            
          

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
     
   
      
    <div style="min-height:600px;" class="wrap round-block"> 
    
	     <%=new ForumBuilder().buildForum(0) %>
    </div>
	


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>