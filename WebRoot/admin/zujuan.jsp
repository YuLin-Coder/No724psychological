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
    CeshitiService ceshitiSrv=BeansUtil.getBean("ceshitiService",CeshitiService.class);
    ShijuanitemService sjiSrv=BeansUtil.getBean("shijuanitemService", ShijuanitemService.class);
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
	                      
                        <%if(temobjshijuan.getStatus()!=null&&temobjshijuan.getStatus().equals("待组卷")) {%>
	                                                                      当前试卷总分: <span  id="spZongfen">  </span>   
	                    <%} %>
	                </h2>
                <div class="description">
                                                           试卷状态: ${requestScope.shijuan.status}    
	               
                </div>
              </div>
              <form  id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/admin/shijuanmanager.do">
				<input type="hidden" name="actiontype"  value="zujuanOver"/>
				<input type="hidden" name="sjid"  value="<%=sjid %>"/>
				<input type="hidden" name="sjzongfen" id="hidSjzongfen"  value=""/>
				<input type="hidden" name="manfen" id="hidManfen" validate="{equalTo:'#hidSjzongfen',messages:{equalTo:'试卷总分需要调整到<%=temobjshijuan.getZongfen()%>分，亲继续组卷'}}"  value="<%=temobjshijuan.getZongfen()%>"/>
				<input type="hidden" name="forwardurl" value="/admin/zujuan.jsp?sjid=<%=sjid%>"  />
				
				<table border="0" cellspacing="1" class="grid" cellpadding="0"
					width="100%">

					
					<tr>
						<td  height="30">一.单选题
						 
						  
						     <a class="orange-href" href="${pageContext.request.contextPath}/admin/ceshitimanager.do?actiontype=get&forwardurl=/admin/ceshitichoose.jsp?sjid=<%=temobjshijuan.getId() %>&seedid=103">添加单选题</a>
						  

						</td>
					</tr>
					
					   <%
                            
                          int i=1;
					     
                          List<Shijuanitem> danxuanlist=(List<Shijuanitem>)sjiSrv.getEntity("where tixing='单选题' and shijuanid="+sjid);
                          for(Iterator<Shijuanitem> it=danxuanlist.iterator();it.hasNext();i++)
                           {
                              
                               Shijuanitem sji=it.next();
                               Ceshiti temdanxuan=(Ceshiti)ceshitiSrv.load("where id="+sji.getTihao());
                               if(temdanxuan!=null){
                        %>
                        
                        
                           <tr>
                        
                          <td>
                            <input name="tihaolist" type="hidden" value="<%=sji.getId()%>"/>
                            <%=i %> <%=temdanxuan.getTitle() %> 
                            <input validate="{required:true,digits:true,messages:{required:'分值不能为空',digits:'请输入正确分值'}}"   class="fenshu" name="<%=sji.getId() %>" style="width: 40px;" value="<%=sji.getFenshu() %>" />分
                            <a class="orange-href" href="${pageContext.request.contextPath}/admin/shijuanmanager.do?actiontype=removeShiti&sjid=<%=sjid %>&tihao=<%=temdanxuan.getId() %>&tixing=1&forwardurl=/admin/zujuan.jsp?sjid=<%=sjid%>">从试卷中删除</a>
                          </td>
                       </tr>
                       
                        <tr>
                            <td >
                               
                                 A:<%=temdanxuan.getChoicea() %>
                                
                                  
                            </td>
                       </tr>
                        <tr>
                            <td >
                               
                                
                                 B:<%=temdanxuan.getChoiceb() %>
                                
                                
                               
                            </td>
                       </tr>
                        <tr>
                            <td >
                               
                               
                                 C:<%=temdanxuan.getChoicec() %>
                                 
                                
                               
                            </td>
                       </tr>
                        <tr>
                            <td >
                               
                                
                                 D:<%=temdanxuan.getChoiced() %>
                                 
                                
                               
                            </td>
                       </tr>
                     
                      
                       
                       <%}//end if %>
                       <%}//end for %>
                       
                     
                    
                     
                     
                       
                        <%if(temobjshijuan.getStatus()!=null&&temobjshijuan.getStatus().equals("待组卷")) {%>
                       <tr>
                       
                          <td>
                              
                              
                                  <input type="submit" name="bntOK" id="btnOK" class="orange-button" value="完成组卷"/>
                            
                          </td>
                       
                       </tr>
                      <%} %>  
                      
					
				</table>
				
				</form>
		
</body>
</html>
