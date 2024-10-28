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
		<h2>与我相关 </h2>
		<ul>
		
		
		 
		   <li id="204"><a
				href="${pageContext.request.contextPath}/admin/leavewordmanager.do?actiontype=get&lyren=${huiyuan.accountname}&forwardurl=/e/huiyuan/leavewordmanager.jsp&seedid=204">
					我的咨询问题 </a></li>
		   <li id="205">
			  <a   href="${pageContext.request.contextPath}/admin/dajuanmanager.do?actiontype=get&seedid=205&dajuanren=${huiyuan.accountname}&forwardurl=/e/huiyuan/dajuanmanager.jsp">我的测试结果</a>
		    </li>
		    
		    
		   <li id="208" >
				<a  href="${pageContext.request.contextPath}/admin/yuyuemanager.do?actiontype=get&hyaccount=${huiyuan.accountname}&forwardurl=/e/huiyuan/yuyuemanager.jsp?seedid=208">我的预约</a>
			</li>
		
		    
		     <li id="203" >
				<a  href="${pageContext.request.contextPath}/admin/topicmanager.do?actiontype=get&pubren=${huiyuan.accountname}&forwardurl=/e/huiyuan/topicmanager.jsp&seedid=203">我的发言</a>
		   </li>
		      <li id="201" >
				<a  href="${pageContext.request.contextPath}/admin/shoucangmanager.do?actiontype=get&scren=${huiyuan.accountname}&seedid=201&forwardurl=/e/huiyuan/shoucangmanager.jsp">我的收藏夹</a>
			</li>
			
			
		</ul>
	</div>
	

	

	<div class="menu-group">
		<h2>
			<i class="fa fa-info"></i>账户信息
		</h2>
		<ul>
			<li id="101" class="current">
				<a  href="${pageContext.request.contextPath }/e/huiyuan/accountinfo.jsp?seedid=101">账户信息</a>
			</li>
			
			<li id="102">
				<a href="${pageContext.request.contextPath }/e/huiyuan/modifypw.jsp?seedid=102" target="_self">密码修改</a>
			</li>
			<li id="103">
				<a href="${pageContext.request.contextPath }/e/huiyuan/modifyinfo.jsp?seedid=103" target="_self">信息修改</a>
			</li>
         
		</ul>
	</div>




</div>