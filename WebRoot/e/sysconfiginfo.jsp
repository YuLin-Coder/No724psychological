
<%@page import="com.daowen.entity.*"%>
<%@page import="com.daowen.service.*"%>
<%@page import="com.daowen.util.*"%>
<%@page import="com.daowen.uibuilder.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            SysconfigService sysconfigSrv=BeansUtil.getBean("sysconfigService", SysconfigService.class);
            String id=request.getParameter("id");
            if(id!=null){
            
                Sysconfig sysconfig=sysconfigSrv.load("where id="+id);
                
                if(sysconfig!=null)
                   request.setAttribute("sysconfig",sysconfig);
                
            }
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
            $(function(){
               
            })
    
    
    </script>
    
    
    
   

    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	
	<div class="fn-clear"></div>
	
	<div class="wrap round-block" >
		
		  <div style="width:280px;float:left;min-height:600px;background:#fff;">
		      <div class="simple-category" >
		          <div class="title">
		                                          网站简介
		          </div>
		          <div class="content">
		              <ul>
		                  <li>
		                    <a href="${pageContext.request.contextPath}/e/sysconfiginfo.jsp?id=1">网站介绍</a>
		                 </li>
		                
		                   <li>
		                       <a href="${pageContext.request.contextPath}/e/sysconfiginfo.jsp?id=2">关于我们</a>
		                   </li>
		                 
		                 
		                 
		                  
		                
		              </ul>
		          </div>
		          
		      </div>
		  </div>
		   <div style="min-height:600px;width:800px;float:left;" class="info">
                    <h1>
                           ${sysconfig.title}
                    </h1>
                    <h5>
                                                    
                    </h5>
                    <div class="news-content">
                       
                            ${sysconfig.dcontent}  
                        
                       
                    </div>
                    
                        
                </div>
                
               
	
		

	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>