<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  djid=request.getParameter("djid");
    Dajuan temobjdajuan=null;
    DajuanService djSrv=BeansUtil.getBean("dajuanService",DajuanService.class);
    CeshitiService ceshitiSrv=BeansUtil.getBean("ceshitiService",CeshitiService.class);
    DajuanitemService djiSrv=BeansUtil.getBean("dajuanitemService",DajuanitemService.class);
    if( djid!=null)
    {
     
    	temobjdajuan=djSrv.load(" where id="+ djid);
       request.setAttribute("dajuan",temobjdajuan);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>答卷信息查看</title>
  
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
   <script type="text/javascript">
   
   
     
        $(function ()
        {
        	
        	  $.metadata.setType("attr", "validate");
              
              $("#form1").validate();
              
            
        });  
    </script>
</head>
<body >
	
	          <div class="search-title">
	                <h2>
	                      ${requestScope.dajuan.title}  得分:(${dajuan.defen}分)  
	                </h2>
                <div class="description">
                                                        
	               
                </div>
              </div>
            
				<table border="0" cellspacing="1" class="grid" cellpadding="0"
					width="100%">

				
					   <%
                            
                          int i=1;
					     
                          List<Dajuanitem> dajuanitemlist=(List<Dajuanitem>)djiSrv.getEntity(MessageFormat.format("where shijuanid={0} and dajuanren=''{1}'' and dajuanid={2}",temobjdajuan.getShijuanid(),temobjdajuan.getDajuanren(),djid));
                          for(Iterator<Dajuanitem> it=dajuanitemlist.iterator();it.hasNext();i++)
                           {
                              
                               Dajuanitem dji=it.next();
                               Ceshiti temdanxuan=ceshitiSrv.load("where id="+dji.getTihao());
                               if(temdanxuan!=null){
                        %>
                        
                        
                           <tr>
                        
                          <td>
                            
                            <%=i %> 
                             <%=temdanxuan.getTitle() %>
                          </td>
                       </tr>
                       
                        <tr>
                            <td >
                               
                                 A:
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
                      
                       <tr>
                            <td >
                               
                                                                                             参考答案:<%=temdanxuan.getDaan() %>
                                    <br/>
                                
                               
                            </td>
                       </tr>
                          <tr>
                            <td >
                               
                                                                                            填写答案:<%=dji.getDaan()%>
                                   本题得分:<%=dji.getDefen()%>
                                
                               
                            </td>
                       </tr>
                      
                       
                       <%}//end if %>
                       <%}//end for %>
                       
                  
					
				</table>
			
		
</body>
</html>
