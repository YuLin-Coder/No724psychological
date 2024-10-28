<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  sjid=request.getParameter("sjid");
    Shijuan temobjshijuan=null;
    ShijuanService sjSrv=BeansUtil.getBean("shijuanService", ShijuanService.class);
    ShijuanitemService sjiSrv=BeansUtil.getBean("shijuanitemService", ShijuanitemService.class);
    CeshitiService ceshitiSrv=BeansUtil.getBean("ceshitiService", CeshitiService.class);
    if( sjid!=null)
    {
     
       temobjshijuan=sjSrv.load(" where id="+ sjid);
       request.setAttribute("shijuan",temobjshijuan);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>试卷信息查看</title>
  
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
     
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
   <script type="text/javascript">
   
   
       var init=function(){
        	
        	 var sum=0;
             $(".fenshu").each(function(){
                 
                 
                  if(!isNaN($(this).val()))
                  
                    sum+=parseInt($(this).val());
                
             })
            $("#hidSjzongfen").val(sum);
            $("#spZongfen").html("("+sum+"分)");
        	
        }
        $(function ()
        {
        	
        	  $.metadata.setType("attr", "validate");
              
              $("#form1").validate();
              
              init();
        	  $(".fenshu").blur(function(){
                 
                  init();
           
               })
        	
        });  
    </script>
</head>
<body >
	
	          <div class="search-title">
	                <h2>
	                      ${requestScope.shijuan.title}  满分:(<%=temobjshijuan.getZongfen()%>分)  
	                </h2>
                <div class="description">
                                                           试卷状态: ${requestScope.shijuan.status}    
	               
                </div>
              </div>
            
				<table border="0" cellspacing="1" class="grid" cellpadding="0"
					width="100%">

				
					   <%
                            
                          int i=1;
					     
                          List<Shijuanitem> danxuanlist=sjiSrv.getEntity( "where tixing='单选题' and shijuanid="+sjid);
                          for(Iterator<Shijuanitem> it=danxuanlist.iterator();it.hasNext();i++)
                           {
                              
                               Shijuanitem sji=it.next();
                               Ceshiti temdanxuan=ceshitiSrv.load(" where  id="+sji.getTihao());
                               if(temdanxuan!=null){
                        %>
                        
                        
                           <tr>
                        
                          <td>
                            
                            <%=i %> 
                             <%=temdanxuan.getTitle() %>
                             <%=sji.getFenshu() %>分
                          </td>
                       </tr>
                       
                        <tr>
                            <td >
                               
                                 A:<input name="<%=temdanxuan.getId() %>" checked="checked" type="radio" value="A"/>
                                 <%=temdanxuan.getChoicea() %>
                                
                                
                                 
                                 
                                   
                                
                               
                            </td>
                       </tr>
                        <tr>
                            <td >
                               
                                
                                 B: <input name="<%=temdanxuan.getId() %>" type="radio" value="B"/><%=temdanxuan.getChoiceb() %>
                                
                                
                               
                            </td>
                       </tr>
                        <tr>
                            <td >
                               
                               
                                 C: <input name="<%=temdanxuan.getId() %>"  type="radio" value="C"/><%=temdanxuan.getChoicec() %>
                                 
                                
                               
                            </td>
                       </tr>
                        <tr>
                            <td >
                               
                                
                                 D: <input name="<%=temdanxuan.getId() %>" type="radio" value="D"/><%=temdanxuan.getChoiced() %>
                                 
                                
                               
                            </td>
                       </tr>
                      
                      
                       
                       <%}//end if %>
                       <%}//end for %>
                       
                  
					
				</table>
			
		
</body>
</html>
