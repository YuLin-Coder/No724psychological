<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
             TopicService  topicSrv=BeansUtil.getBean("topicService",TopicService.class);
            ForumService  formSrv=BeansUtil.getBean("forumService",ForumService.class);
            HuiyuanService huiyuanSrv=BeansUtil.getBean("huiyuanService", HuiyuanService.class);
	        String  topicid=request.getParameter("topicid");
            SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd");
	        Topic  topic=topicSrv.load("where id="+topicid);
	        Huiyuan  topicpubren=huiyuanSrv.load("where accountname='"+topic.getPubren()+"'");
	        if(topic!=null){
	        
	           request.setAttribute("topic",topic);
	           if(topic.getFee()>0&&request.getSession().getAttribute("huiyuan")==null){
	        	  response.sendRedirect(request.getContextPath()+"/e/topictip.jsp?forwardurl=/e/topicdetails.jsp?topicid="+topic.getId());
	        	   return;
	           }
	           if(topic.getFee()>0&&request.getSession().getAttribute("huiyuan")!=null){
		           Huiyuan hy=(Huiyuan)request.getSession().getAttribute("huiyuan");
		           if(hy.getYue()<topic.getFee()){
	        	      response.sendRedirect(request.getContextPath()+"/e/requiredcz.jsp");
		               return;
		           }else{
		        	   topicSrv.koukuan(hy, topic);
		           }
		       }
	           topic.setClickcount(topic.getClickcount()+1);
	           topicSrv.update(topic);
	        }
	        
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主题信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/register.css" type="text/css"></link>
 
 <link href="${pageContext.request.contextPath}/e/css/forum.css"  rel="stylesheet" type="text/css"/>
  
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/uploadifive/uploadifive.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifive/jquery.uploadifive.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>

<script type="text/javascript">
        $(function () {
         
        	var initControl =function (){

                $('#btnulTupian').uploadifive({
                    'auto':true, //是否自动上传
                    'multi':false, //是否允许选择多文件
                    'folder': '${pageContext.request.contextPath}/Upload', //地址
                    'buttonText': '选择图片',
                    'buttonClass': 'uploadifive-button',
                    'dnd'  : false,//是否允许拖动上传
                    'removeCompleted': false, //上传成功后会自动删除页面上的文件
                    'queueID': false,//指定用于显示上传队列的父级元素id
                    // 'fileType': ['image/jpeg','image/jpg','image/gif','image/png'],
                    fileType:false,
                    'cancelImg' : '${pageContext.request.contextPath}/uploadifive/uploadifive-cancel.png',
                    'uploadLimit':1,//限制上传文件数
                    'queueSizeLimit':5,//一次可以在队列中拥有的最大文件数
                    'height': 15,
                    'width':90,
                    'uploadScript':'${pageContext.request.contextPath}/admin/uploadmanager.do',
                    'fileSizelimit':'2048KB', //上传文件的大小限制 0则表示无限制
                    'onUploadComplete':function(file, data, response){
                        $("#filelist").show();
                        $("#imgTupian").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
                        $("#hidTupian").val("${pageContext.request.contextPath}/upload/temp/"+file.name);
                    }
                });

 	          var imgtupiansrc="${requestScope.topic.tupian}";
 		       if(imgtupiansrc==""){
 		         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
 		         $("#imgTupian").attr("src",url);
 		         $("#hidTupian").val(url);
 		       }else{
 		          $("#imgTupian").attr("src",imgtupiansrc);
 		          $("#hidTupian").val(imgtupiansrc); 
 		       }
              }
        	   editor = KindEditor.create('#txtDcontent', {
		              resizeType: 1,
		              uploadJson : '../plusin/upload_json.jsp',
				      fileManagerJson : '../plusin/file_manager_json.jsp',

			        allowFileManager: true
			   });
        	 $.metadata.setType("attr","validate");
        	 $("#postForm").validate();
        	 initControl();
        	 $("#postForm").submit(function(){
        		 editor.sync(); 
        		 var title2=$("#txtTitle").val();
                 var content2=$("#txtDcontent").val();
                 if(title2==""){
                    alert("标题不能为空");
                    return false;
                 }
                 if(content2==""){
                     alert("回复的内容不能为空");
                     return false;
                 }
                 var un= $("#hidusername").val();
                  if(un!=""&&un!=null){
                       return true;
                    }
                   else{
                     alert("请登陆系统学生才能进入讨论"); 
                     window.location.href="${pageContext.request.contextPath}/e/login.jsp?gobackurl=topicdetails.jsp?topicid=<%=topicid%>";
                     return false;
                   }   
     		 
     	     });
        	 $(".require-login").click(function(){
      	    	  var temaccountname= $("#scren").val(); 
      	    	  var forwardurl=$("#commentresurl").val();
      	    	  if(temaccountname==""){
                        window.location.href="${pageContext.request.contextPath}/e/login.jsp?forwardurl="+forwardurl;
                        return false;
                   }
      	    	   return true;
      	     });

        });
    </script>
  
    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	<input type="hidden" id="commentresurl" value="/e/topicdetails.jsp?topicid=<%=topicid%>"/>
	<div class="fn-clear"></div>
	
	<div class="wrap round-block">
		 
		<div class="block-description">
			<h1>${topic.bkname}</h1>

			   当前主题:${requestScope.topic.title}
    		
		</div>
		<div>
		  
            <a class="btn btn-default"   href="postadd.jsp?bkid=${requestScope.bankuai.id}">
                <i class="fa fa-plus"></i>添加主题
            </a>
             <form method="post" style="display:inline" action="${pageContext.request.contextPath}/admin/shoucangmanager.do">
                                         <input type="hidden" name="bookid" value="<%=topicid%>"/>
                                          <input type="hidden" name="bookname" value="${topic.title}"/>
                                          <input type="hidden" name="tupian" value="${pageContext.request.contextPath}/upload/nopic.jpg"/>
                                         <input type="hidden" name="actiontype" value="save"/>
                                         <input type="hidden" id="scren" name="scren" value="${huiyuan.accountname}"/>
                                         <input type="hidden" name="forwardurl" value="/e/topicdetails.jsp?topicid=<%=topicid%>"/>
                                          <input type="hidden" name="errorurl" value="/e/topicdetails.jsp?topicid=<%=topicid%>"/>
                                           <input type="hidden" name="href" value="/e/topicdetails.jsp?topicid=<%=topicid%>"/>
                                         <input type="hidden" name="xtype" value="topic"/>
		                     <button  id="btnShoucang" class="btn btn-default require-login"><i class="fa fa-plus"></i>收藏</button>
		                     ${sctip}
              </form>
           
		</div>
       <div class="gray-border">
		
       <table width="100%" cellspacing="0" cellpadding="0">
                   
                        <tr>
                            <td class="postauthor">
                               
                                <div >
                                    <div class="avatar">
                                        <img src="<%=topicpubren!=null?topicpubren.getTouxiang():""%>">
                                    </div>
                                    <p>
                                          <%=topic.getPubren()%>
                                    </p>
                                </div>
                                <p>
                                    <img src="images/star_level3.gif">
                                    <img src="images/star_level3.gif">
                                    <img src="images/star_level1.gif">
                                </p>
                                <ul class="otherinfo">
                                    <li>
                                        <%=topicpubren!=null?topicpubren.getName():"" %> </li>
                                    <li>
                                       
                                        <%=topicpubren!=null?sdf.format(topicpubren.getRegdate()):"" %>
                                    </li>
                                  
                                </ul>
                            </td>
                            <td class="postcontent">
                                
                                <div class="topic-title">
                                   ${topic.title}
                                </div>
                                <div class="topic-pubtime">
                                    <img src="images/admin.gif">
                                    <em>发表于 <span >
                                       <%=topic.getPubtime().toLocaleString() %> </span> </em><span class="pipe">|</span> 
                                </div>
                                
                                <div class="topic-content">
                                      ${topic.dcontent}
                                </div>
                                
                            </td>
                        </tr>
                        
                        
                    
                    
                    
                    <%
                     
                     List<Topic> topiclist=topicSrv.getEntity("where replyid='"+topicid+"'");
                     int i=1;
                     
                     for(Topic temtopic : topiclist)
                     {
                    	  Huiyuan  tempubren=huiyuanSrv.load("where accountname='"+temtopic.getPubren()+"'");
                   %>
                     
                    	  <tr>
                          <td class="postauthor">
                            
                              <div >
                                  <div class="avatar">
                                      <img src="<%=tempubren!=null?tempubren.getTouxiang():"" %>">
                                  </div>
                                  <p>
                                        <%=temtopic.getPubren()%>
                                  </p>
                              </div>
                              <p>
                                  <img src="images/star_level3.gif">
                                  <img src="images/star_level3.gif">
                                  <img src="images/star_level1.gif">
                              </p>
                              <ul class="otherinfo">
                                  <li>
                                     <%=tempubren!=null?tempubren.getNickname():""%> 
                                 </li>
                                  <li>
                                      <label>
                                                                                                           注册日期
                                      </label>
                                      <%=tempubren!=null?sdf.format(tempubren.getRegdate()):"" %>
                                      
                                  </li>
                               
                              </ul>
                          </td>
                          <td class="postcontent">
                              
                              <div class="topic-title">
                                 <%=temtopic.getTitle() %>
                              </div>
                              <div class="topic-pubtime">
                                  <img src="images/admin.gif">
                                  <em>发表于 <span >
                                     <%=temtopic.getPubtime().toLocaleString() %> </span> </em><span class="pipe">|</span> 
                              </div>
                              
                              <div class="topic-content">
                                   <%=temtopic.getDcontent() %>
                              </div>
                              
                          </td>
                      </tr>
                    	 
             
                    
                    
                    <%} %>
                    
                    
                    
                    
                </table>
       </div>
      
		<div>
		  
            <a class="btn btn-default"   href="postadd.jsp?bkid=${requestScope.bankuai.id}">
                <i class="fa fa-plus"></i>添加主题
            </a>
           
		</div>

	</div>
	
	<div class="fn-clear"></div>
	
	<div class="wrap round-block">
	 <c:if test="${not empty huiyuan}">
	  <form id="postForm"  method="post"   action="${pageContext.request.contextPath}/admin/topicmanager.do">
                
                
                 <input type="hidden" name="actiontype" value="save"/>
                 <input type="hidden"  id="hidusername" name="pubren" value="${requestScope.huiyuan.accountname}"/>
                 <input type="hidden"  name="forwardurl" value="/e/topicdetails.jsp?topicid=${requestScope.topic.id}"/>
                 <input type="hidden"  name="bkid" value="${requestScope.topic.bkid}"/>
                 <input type="hidden"  name="bkname" value="${requestScope.topic.bkname}"/>
                 <input type="hidden"  name="istopic" value="0"/>
                 <input type="hidden"  name="replyid" value="${requestScope.topic.id}"/>
                      
          <table class="grid" cellspacing="1" width="100%">             
	            <tr>
					<td width="10%" align="right">所属板块:</td>
					<td width="*"> 
					  ${topic.bkname}(${topic.bkid })
					</td>
				</tr>
				<tr>
					<td width="10%" align="right">标题:</td>
					<td width="*"> 
					    <input id="txtTitle"  validate="{required:true,minlength:8,messages:{required:'请输入帖子内容',minlength:'帖子内容最少需要8字符'}}" type="text" class="input-txt" name="title"/>
					</td>
				</tr>
				<tr>
					<td align="right">封面:</td>
					<td><img id="imgTupian" width="200px" height="200px"
						src="${requestScope.topic.tupian}" />
						<div>
							<input type="file" name="upload" id="btnulTupian" />
						</div> <input type="hidden" id="hidTupian" name="tupian"
						value="${requestScope.topic.tupian}" /></td>
				</tr>
				<tr>
					<td align="right">内容:</td>
					<td>
					<textarea name="dcontent" id="txtDcontent" 
                       style="width:100%;height:180px;"></textarea>
                   </td>
				</tr>
				<tr>
				   <td colspan="2">
				      <div style="padding: 10px 14px;">
		                <button class="btn btn-default" >
		                     <i class="fa fa-plus"></i>回复
		                </button>
		             </div>
				   </td>
				</tr>
       
            
           </table>
       </form>
	  </c:if>
	  <c:if test="${empty huiyuan}">
	  
	     <div style="font-size:18px;padding:20px 120px;">
	                      登录后才能进行回复  ,<a style="color:#e9ab32;" href="${pageContext.request.contextPath}/e/login.jsp">登录</a>
	     </div>
	  </c:if>
	  
	</div>
   

	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>