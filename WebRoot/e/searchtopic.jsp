
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String title= request.getParameter("title");
    if(title!=null)
    	request.setAttribute("title", title);
 
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帖子信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

 <link href="${pageContext.request.contextPath}/e/css/forum.css"  rel="stylesheet" type="text/css"/>
 
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
 
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>

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
	
	
	<div class="fn-clear"></div>
	
	<div style="min-height: 600px;" class="wrap round-block">
		 
	

		<div class="mainbox forumlist">
            <span class="headactions">
                <img blockid="Block${requestScope.bankuai.id}"  class="collapsed" title="收起/展开"  alt="收起/展开"
                    src="images/collapsed_no.gif">
            </span>
            <h3>
               ${title }
             </h3>
            <table id="Block${requestScope.bankuai.id}" cellspacing="0" summary="subform" cellpadding="0">
                <thead class="category">
                    <tr>
                        <th>
                           标题
                        </th>
                        <td class="nums">
                            作者
                        </td>
                        <td class="nums">
                            回复/查看
                        </td>
                        <td class="lastpost">
                            最后回复
                        </td>
                    </tr>
                </thead>
                <tbody>
                
                    <%
                    
                        TopicService topicSrv=BeansUtil.getBean("topicService", TopicService.class);
                        ForumService forumSrv=BeansUtil.getBean("forumService", ForumService.class);
                        List<Topic> topiclist=topicSrv.getEntity(MessageFormat.format("where title like ''%{0}%''",title));
                        
                         for(Topic  topic : topiclist)
                         {
                     %>
                    <tr>
                        <th class="new">
                            <h2>
                                <a href="topicdetails.jsp?topicid=<%=topic.getId() %>"><%=topic.getTitle() %></a> 
                               
                            </h2>
                           
                        </th>
                        <td class="nums">
                           <%=topic.getPubren() %>
                        </td>
                        <td class="nums">
                            <%=topic.getReplycount() %>/<%=topic.getClickcount() %>
                        </td>
                        <td class="lastpost">
                          <%
                              
                              Topic lasttopic =forumSrv.getLastPost(topic.getId());
                             
                              if(lasttopic!=null)
                              {
                           %>
                            <a href="topicdetails.jsp?topicid=<%=topic.getId() %>">
                                <%=lasttopic.getTitle() %> </a> <cite>by 
                                <%=lasttopic.getPubren() %>- <%=lasttopic.getPubtime() %>
                             </cite>
                             
                             <%}else {%>
                             
                                    暂无回复
                             <% }%>
                        </td>
                    </tr>
                    
                    <%} %>
                   
                </tbody>
               
            </table>
        </div>
       
      
	
	</div>
	
	

	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>