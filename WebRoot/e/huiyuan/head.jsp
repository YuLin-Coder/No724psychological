
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="law.jsp" %>
 <script type="text/javascript">
  
    $(function(){
      
    	$(".exit").click(function(){
            
      	  var pageurl_pagescope= $("#pageurl_pagescope").val();
            var temusertype=$(this).data("usertype");
            $.ajax({
  		                     
  		              url:encodeURI('${pageContext.request.contextPath}/admin/qiantaiusermanager.do'),
  					   method:'get',
  					   data:{
  						  actiontype:'exit',
  						  usertype:temusertype
  					   },
  					   success:function(){
  					      window.location.reload();
  					  },
  					  error:function(xmhttprequest,status,excetpion){
  					     $.alert("系统错误，错误编码"+status);
  					  }
  		     })

        });
      
      $("#searchForm").submit(function(){
    		 var temtitle= $("#title").val();
    		  if(temtitle==""){
    			  
    			  alert("请输入搜索信息");
    			  return false;
    		  }
    		  
    		  
    	  });
      
      $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != '') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
      
      
    })

</script>
 
<%
      Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
      if(temhy!=null)
         request.setAttribute("huiyuan", temhy);
      
      Teacher temteacher=(Teacher)request.getSession().getAttribute("teacher");
      if(temhy!=null)
         request.setAttribute("teacher", temteacher);
      
      String title=request.getParameter("title");
      if(title!=null)
    	  request.setAttribute("title", title);
      
     
   
     

 %>

 

 <div id="header_top">
  <div id="top">
    <div class="Inside_pages">
      <div class="Collection">
                          <em></em><a href="#">收藏我们</a>
      </div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
	  <li class="hd_menu_tit zhuce" >
	  <c:if test="${not empty huiyuan}">
	       
	          欢迎<a href="${pageContext.request.contextPath}/e/huiyuan/accountinfo.jsp">${huiyuan.accountname }-${huiyuan.name }(会员)</a>！
	       <span  data-usertype="0"  style="cursor:pointer"  class="red exit">退出</span> 
	   </c:if>
	   
	   
	    
	   <c:if test="${not empty teacher}">
              
	             
	                 欢迎你<a href="${pageContext.request.contextPath}/e/teacher/accountinfo.jsp">${teacher.tno }-${teacher.name }(咨询师)</a>
	     <a class="exit" data-usertype="1"  style="cursor:pointer">退出</a>
	   </c:if>
	   
	    <c:if test="${empty huiyuan}">
	        <a href="${pageContext.request.contextPath}/e/login.jsp"  class="red">[登录]</a> 
	    </c:if>
	   <a href="${pageContext.request.contextPath}/e/register.jsp" class="red">[学生注册]</a>
	       
	   <li class="hd_menu_tit" ><a href="${pageContext.request.contextPath}/admin/login.jsp">系统后台</a></li>
	  
	  </ul>
	</div>
    </div>
  </div>
 </div>
   

    <div class="row-flow white-paper">
    <div class="wrap">
        <div style="font-size:22px; color:#188eee; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;" class="fn-left">
                            心理咨询管理系统
            
        </div>
        <form id="searchForm"  action="${pageContext.request.contextPath}/e/searchnews.jsp" method="post" >
           <input   type="hidden" name="actiontype" value="search" />
            <input type="hidden" name="forwardurl" value="/e/searchnews.jsp" />
        <div class="search-box">
            <div class="search-text">
            </div>
            <div class="keyword">
                <input type="text" placeholder="请输入标题" id="title" name="title">
            </div>
            <div class="so">
                <input type="submit" class="sobtn" id="btnSearch" value="搜索" name="btnSearch">
            </div>
            <div class="error-container">
                
            </div>
        </div>
        
        </form>
    </div>

     
 </div>
  
 
 
 <%=new SitenavBuilder(request).build() %>
  
     
  