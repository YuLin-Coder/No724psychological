
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="huiyuan/law.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>发布主题</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>

<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>

 <link href="${pageContext.request.contextPath}/e/css/forum.css"  rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
  <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
	<link href="${pageContext.request.contextPath}/uploadifive/uploadifive.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/uploadifive/jquery.uploadifive.js" type="text/javascript"></script>
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
		       }else
		       {
		          $("#imgTupian").attr("src",imgtupiansrc);
		          $("#hidTupian").val(imgtupiansrc); 
		       }
             }
        	   editor = KindEditor.create('#txtContent', {
		              resizeType: 1,
		              uploadJson : '../plusin/upload_json.jsp',
				      fileManagerJson : '../plusin/file_manager_json.jsp',

			        allowFileManager: true
			   });
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
        		     
        		     
        		     if(un!=""&&un!=null)
        		       {
        		          
        		          return true;
        		       }
        		      else
        		      {
        		        alert("请登陆系统学生才能进入讨论"); 
        		        var url=$("[name=forwardurl]").val();
        		        window.location.href="${pageContext.request.contextPath}/e/login.jsp?forwardurl="+url;
        		        return false;
        		      }     
        		 
        		 
        	 });
        	 
        	 initControl();
        	 $.metadata.setType("attr","validate");
        	 $("#postForm").validate();
             
        	
          

        });
    </script>
  
    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	
	<div class="fn-clear"></div>
	
	
	<div class="wrap round-block">
	  
	  <form id="postForm"  method="post"   action="${pageContext.request.contextPath}/admin/topicmanager.do">
        
        <input type="hidden"   name="actiontype" value="save"/>
                <input type="hidden"   name="actiontype" value="save"/>
                 <input type="hidden"  id="hidusername" name="pubren" value="${requestScope.huiyuan.accountname}"/>
                 <input type="hidden"  name="forwardurl" value="/e/topiclist.jsp?bankuaiid=${requestScope.bankuai.id}"/>
                 <input type="hidden"  name="bkid" value="${requestScope.bankuai.id}"/>
                 <input type="hidden"  name="bkname" value="${requestScope.bankuai.name}"/>
                 <input type="hidden"  name="istopic" value="1"/>
                 <input type="hidden"  name="replyid" value="-1"/>
        <table class="grid" cellspacing="1" width="100%">
         
				<tr>
					<td width="10%" align="right">所属板块:</td>
					<td width="*"> 
					  ${bankuai.name}(${bankuai.id })
					</td>
				</tr>
				<tr>
					<td width="10%" align="right">标题:</td>
					<td width="*"> <input id="txtTitle"  validate="{required:true,minlength:8,messages:{required:'请输入帖子内容',minlength:'帖子内容最少需要8字符'}}" type="text" class="input-txt" name="title"/>
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
					<td><textarea id="txtContent" name="dcontent"  validate="{required:true,minlength:8,messages:{required:'请输入帖子内容',minlength:'帖子内容最少需要8字符'}}"
                         style="width:100%;height:280px;"></textarea>
                   </td>
				</tr>
				<tr>
				   <td colspan="2">
				   
				       <div style="padding: 10px 14px;">
			                <input class="btn btn-default" value="发布主题"  type="submit"  />
			            </div>
				   </td>
				</tr>
			
            
         </table>
       </form>
	
	</div>
   

	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>