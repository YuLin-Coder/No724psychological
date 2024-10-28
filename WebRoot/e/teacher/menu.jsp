
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>

<div id="side-menu">

  <div class="menu-group">
		<h2>
		     心理指导
		</h2>
		<ul>
		  
		      <li id="301" >
				<a  href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=load&seedid=301&forwardurl=/e/teacher/xinxiadd.jsp">发布文章</a>
			</li>
			
			<li id="302" >
				<a  href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=get&pubren=${teacher.tno}&seedid=302&forwardurl=/e/teacher/xinximanager.jsp">文章管理</a>
			</li>
			
			 <li id="303"><a href="${pageContext.request.contextPath}/admin/leavewordmanager.do?actiontype=get&replyren=${teacher.tno}&forwardurl=/e/teacher/leavewordmanager.jsp&seedid=303">
					在线指导 </a>
		     </li>
		   
		    
			
			
		</ul>
	</div>
   
	
	
    
	<div class="menu-group">
		<h2>
			账户信息
		</h2>
		<ul>
			<li id="101" class="current">
				<a  href="${pageContext.request.contextPath}/e/teacher/accountinfo.jsp?seedid=101">账户信息</a>
			</li>
			<li id="102">
				<a href="${pageContext.request.contextPath}/e/teacher/modifypw.jsp?seedid=102" target="_self">密码修改</a>
			</li>
			<li id="103">
				<a href="${pageContext.request.contextPath}/e/teacher/modifyinfo.jsp?seedid=103" target="_self">信息修改</a>
			</li>
       

		</ul>
	</div>




</div>