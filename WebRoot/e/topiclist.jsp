<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
            TopicService  topicSrv=BeansUtil.getBean("topicService",TopicService.class);
            ForumService  formSrv=BeansUtil.getBean("forumService",ForumService.class);
            BankuaiService bankuaiSrv=BeansUtil.getBean("bankuaiService", BankuaiService.class);
	        String  bankuaiid=request.getParameter("bankuaiid");
	        Bankuai  bankuai=bankuaiSrv.load("where id="+bankuaiid);
	        if(bankuai!=null){
	           request.setAttribute("bankuai",bankuai);
	        }
	        
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统栏目信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
 <link href="${pageContext.request.contextPath}/e/css/forum.css"  rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>

<script type="text/javascript">
      $(function (){
         
        	   editor = KindEditor.create('#txtContent', {
		              resizeType: 1,
		              uploadJson : '../plusin/upload_json.jsp',
				      fileManagerJson : '../plusin/file_manager_json.jsp',

			        allowFileManager: true
			   });
        	 $("#postForm").submit(function(){
        		    editor.sync();
        		    var un= $("#hidusername").val();
        		    if(un!=""&&un!=null){
        		          return true;
        		     }
        		     else{
        		        alert("请登陆系统学生才能进入讨论"); 
        		        window.location.href="login.jsp?gobackurl=topiclist.jsp?bankuaiid=<%=bankuaiid%>";
        		        return false;
        		     }     
        	 });
        	 $.metadata.setType("attr","validate");
        	 $("#postForm").validate();
        	 $(".collapsed").each(function(i,dom){
	             $(this).click(function(){
		             var blockid= $(this).attr("blockid");
		             if($("#"+blockid).is(":hidden")){
		               $(this).attr("src","images/collapsed_no.gif");
		               $("#"+blockid).show();
		             }else{
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
	
	<div class="wrap round-block">
		 
		<div class="block-description">
			<h1>${bankuai.name}</h1>

			   今日:<span class="orange-font">0</span> 主题:<span class="orange-font">3</span>
    		<p>教育试验区</p>
			<p>版主</p>
		</div>
		<div>
		  
            <a title="发新话题"   href="postadd.jsp?bankuaiid=${requestScope.bankuai.id}">
                <img alt="发新话题" src="images/newtopic.png" style="display: inline">
            </a>
           
		</div>

		<div class="mainbox forumlist">
            <span class="headactions">
                <img blockid="Block${requestScope.bankuai.id}"  class="collapsed" title="收起/展开"  alt="收起/展开"
                    src="images/collapsed_no.gif">
            </span>
            <h3>
               ${requestScope.bankuai.name}
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
                    
                        List<Topic> topiclist= topicSrv.getEntity(MessageFormat.format("where bkid=''{0}'' and istopic=1 ",bankuai.getId()));
                        
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
                             
                              Topic lasttopic =formSrv.getLastPost(topic.getId());
                             
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
       
      
		<div>
		  
            <a title="发新话题"   href="postadd.jsp?bankuaiid=${requestScope.bankuai.id}">
                <img alt="发新话题" src="images/newtopic.png" style="display: inline">
            </a>
           
		</div>

	</div>
	
	<div class="fn-clear"></div>
	
	<div class="wrap round-block gray-border">
	  
	  <form id="postForm"  method="post"   action="${pageContext.request.contextPath}/admin/topicmanager.do">
                <input type="hidden"   name="actiontype" value="save"/>
                 <input type="hidden"  id="hidusername" name="pubren" value="${requestScope.huiyuan.accountname}"/>
                 <input type="hidden"  name="forwardurl" value="/e/topiclist.jsp?bankuaiid=${requestScope.bankuai.id}"/>
                 <input type="hidden"  name="bkid" value="${requestScope.bankuai.id}"/>
                 <input type="hidden"  name="bkname" value="${requestScope.bankuai.name}"/>
                 <input type="hidden"  name="istopic" value="1"/>
                 <input type="hidden"  name="replyid" value="-1"/>
                      
	    <h2 class="bm_h">
                           主题标题
        </h2>
         <div>
            <input id="txtTitle"  validate="{required:true,minlength:8,messages:{required:'请输入帖子内容',minlength:'帖子内容最少需要8字符'}}" type="text" class="input-txt" name="title">
         </div>
            <div >
                <textarea id="txtContent" name="dcontent"  style="width:100%;height:180px;"></textarea>
            </div>
            <div style="padding: 10px 14px;">
                <input class="orange-button" value="发布主题"  type="submit"  />
             </div>
       </form>
	
	</div>
   

	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>