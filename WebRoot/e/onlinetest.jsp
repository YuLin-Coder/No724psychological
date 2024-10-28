<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="huiyuan/law.jsp"%>

<%         
           ShijuanService shijuanSrv=BeansUtil.getBean("shijuanService", ShijuanService.class);
           ShijuanitemService sjiSrv=BeansUtil.getBean("shijuanitemService", ShijuanitemService.class);
           CeshitiService ceshitiSrv=BeansUtil.getBean("ceshitiService", CeshitiService.class);
           Shijuan temobjshijuan=null;
           String sjid=request.getParameter("id");
            if(sjid!=null){
            	temobjshijuan=shijuanSrv.load("where id="+sjid);
                if(temobjshijuan!=null)
                   request.setAttribute("shijuan",temobjshijuan);
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>在线测试</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
     
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery.timer/jquery.timer1.2.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/student/js/StringEx.js"></script>
    
     <script type="text/javascript">
   
   
        $(function (){
        	  $("#form1").submit(function(){
        		  
        		  return confirm("确认定要提交答卷吗？");
        	  });
        	  $.metadata.setType("attr", "validate");
              $("#form1").validate();
        	
        });  
    </script>

</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl"
		value="/e/shijuaninfo.jsp?id=<%=sjid%>" />
	<div class="wrap round-block">

		
		<!--end text-box-->
	
		<div class="brief-title">${requestScope.shijuan.title}>>在线测试</div>
		<div class="brief-content">
		
		 <form  id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/admin/shijuanmanager.do">
				<input type="hidden" name="actiontype"  value="exam"/>
				<input type="hidden" name="sjid"  value="<%=sjid %>"/>
				<input type="hidden" name="title"  value="${shijuan.title }"/>
				<input type="hidden" name="dajuanren"  value="${huiyuan.accountname }"/>
				<input type="hidden" name="kemu"  value="${shijuan.kemu}"/>
				<input type="hidden" name="zujuanren"  value="${shijuan.zujuanren}"/>
				<input type="hidden" name="stname"  value="${student.name}"/>
				
				<input type="hidden" name="manfen" id="hidManfen"  value="${shijuan.zongfen}"/>
				<input type="hidden" name="forwardurl" value="/admin/dajuanmanager.do?actiontype=get&dajuanren=${huiyuan.accountname}&forwardurl=/e/huiyuan/dajuanmanager.jsp"  />
				
				<table border="0" cellspacing="1" class="grid" cellpadding="0"
					width="100%">

					  <tr>
                        
                          <td>
                                                                            一.单选题 
                          </td>
                      </tr>
					
					   <%
                            
                          int i=1;
					     
                          List<Shijuanitem> danxuanlist=sjiSrv.getEntity( "where tixing='单选题' and shijuanid="+sjid);
                          for(Iterator<Shijuanitem> it=danxuanlist.iterator();it.hasNext();i++)
                           {
                              
                               Shijuanitem sji=it.next();
                               Ceshiti temdanxuan=ceshitiSrv.load("where id="+sji.getTihao());
                               if(temdanxuan!=null){
                        %>
                        
                        
                           <tr>
                        
                          <td>
                            <input name="tihaolist" type="hidden" value="<%=sji.getId()%>"/>
                            
                            <input name="tihao<%=sji.getId()%>" type="hidden" value="<%=temdanxuan.getId()%>"/>
                            <input name="tixing<%=sji.getId()%>" type="hidden" value="单选题"/>
                            <%=i %> <%=temdanxuan.getTitle() %>
                            <input  name="fenshu<%=sji.getId()%>"  type="hidden" value="<%=sji.getFenshu() %>" /><%=sji.getFenshu() %>分
                            <input  name="stdaan<%=sji.getId()%>"  type="hidden" value="<%=temdanxuan.getDaan() %>" />
                            
                          </td>
                       </tr>
                       
                       <tr>
                            <td >
                               
                                 A:<input name="daan<%=sji.getId() %>"  type="radio" value="A"/>
                                 <%=temdanxuan.getChoicea() %>
                               
                            </td>
                       </tr>
                        <tr>
                            <td >
                               
                                
                                 B: <input name="daan<%=sji.getId() %>" type="radio" value="B"/><%=temdanxuan.getChoiceb() %>
                                
                                
                               
                            </td>
                       </tr>
                        <tr>
                            <td >
                               
                               
                                 C: <input name="daan<%=sji.getId() %>"  type="radio" value="C"/><%=temdanxuan.getChoicec() %>
                                 
                                
                               
                            </td>
                       </tr>
                        <tr>
                            <td >
                               
                                
                                 D: <input name="daan<%=sji.getId() %>" type="radio" value="D"/><%=temdanxuan.getChoiced() %>
                                 
                                
                               
                            </td>
                       </tr>
                    
                       
                       <%}//end if %>
                       <%}//end for %>
                       
                      
                     
                      
                      
                      
                        <tr>
                       
                          <td>
                              
                              
                                  <input type="submit" name="bntOK" class="btn btn-default" value="提交测试"/>
                             
                          </td>
                       
                       </tr>
					
				</table>
				
			</form>
		
		
		</div>

		
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
