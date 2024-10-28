<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>下载资源</title>
  
   <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
	 <link href="${pageContext.request.contextPath}/uploadifive/uploadifive.css" rel="stylesheet" type="text/css" />
	 <script src="${pageContext.request.contextPath}/uploadifive/jquery.uploadifive.js" type="text/javascript"></script>

	 <script type="text/javascript">
        function initControl(){
	
                   //开始绑定
                    //结束绑定
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

			          var imgtupiansrc="${requestScope.zydownload.tupian}";
				       if(imgtupiansrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         $("#imgTupian").attr("src",url);
				         $("#hidTupian").val(url);
				       }else
				       {
				          $("#imgTupian").attr("src",imgtupiansrc);
				          $("#hidTupian").val(imgtupiansrc); 
				       }
			            editor = KindEditor.create('textarea[name="des"]', {
			             uploadJson : '../plusin/upload_json.jsp',
				         fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
	        //初始化附件
	            initUpload();
        }
        //初始化附件
         function  initUpload(){

			 $('#upload').uploadifive({
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
					 var filesize=Math.round(file.size/1024);
					 $("#filelist div ul").append("<li ><input type='hidden' name='fileuploaded' value='"+file.name+"'  > "+file.name+"["+filesize+"KB] <a href=\"#\" onclick=\"$(this).parent().remove();\">移除</a> </li> ");
				 }
			 });
          }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#zydownloadForm").validate();
        });  
    </script>
</head>
<body>
      <jsp:include page="../head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 发布资源
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
             
				    <form name="zydownloadform" method="post" action="${pageContext.request.contextPath}/admin/zydownloadmanager.do"  id="zydownloadForm">
				        <table class="grid" cellspacing="1" width="100%">
						        <input type="hidden" name="id" value="${id}" />
						        <input type="hidden" name="actiontype" value="${actiontype}" />
						         <input type="hidden" name="seedid" value="${seedid}" />
						          <input type="hidden" name="pubren" value="${teacher.tno}" />
						          <input type="hidden" name="errorurl"
							value="/e/teacher/zydownloadadd.jsp" />
						<input type="hidden" name="forwardurl"
							value="/admin/zydownloadmanager.do?actiontype=get&pubren=${teacher.tno}&forwardurl=/e/teacher/zydownloadmanager.jsp" />
						          
					<tr>
						<td width="10%" align="right">标题:</td>
						<td width="30%"><input name="title"
							value="${requestScope.zydownload.title}" class="input-txt"
							type="text" id="txtTitle" /></td>
							
						<td width="*" colspan="2" rowspan="3">
						   <img id="imgTupian" width="200px" height="200px"
							src="${requestScope.zydownload.tupian}" />
							<div>
								<input type="file" name="upload" id="btnulTupian" />
							</div> <input type="hidden" id="hidTupian" name="tupian"
							value="${requestScope.zydownload.tupian}" />
						</td>
					</tr>

					<tr>
						<td align="right">资源分类:</td>
						<td><select name="fenlei" id="ddlFenlei" ltype="select">
								<option value="文件资料">文件资料</option>
								<option value="视频资料">视频资料</option>
						</select></td>
					</tr>

					
					<tr>
						<td align="right">附件</td>
						<td colspan="3">
							<div>
								<input type="file" name="upload" id="upload" />
							</div>
							<div id="filelist" style="display:none;" class="uploadify-queue">
								<div class="uploadify-queue-item">
									<ul>
									</ul>
								</div>
							</div> 
							<%
							    AttachementService attrSrv=BeansUtil.getBean("attachementService", AttachementService.class);
							 	String id = request.getParameter("id");
							 	if (id != null) {
							 %>
							<div class="uploadify-queue">
								<ul>
									<%
									                List<Attachement> zydownloadattachementlist=attrSrv.getEntity(MessageFormat.format(" where belongtable=''zydownload'' and belongid=''{0}''",id));
									                for(Attachement tema : zydownloadattachementlist)
									                {
									            %>
									<li><input type='hidden' name='fileuploaded'
										value='<%=tema.getFilename() %>'> <%=tema.getFilename() %>
											<a href="#" onclick="$(this).parent().remove();">移除</a>
									</li>
									<%
									            } %>
								</ul>
							</div> <%} %>
						</td>
					</tr>
					<tr>
											   <td align="right" >描述:</td>
											   <td colspan="3">
													<textarea   name="des"   id="txtDes" style="width:98%;height:400px;"  >${requestScope.zydownload.des}</textarea>
										</td>
						</tr>
						
						<tr>
						    <td colspan="4">
						        <input type="submit" value="提交"  class="orange-button" /> 
						    </td>
						</tr>
						       
				        </table>
		   
		</form>
		
		</div>
		</div>
		
		</div>

</body>
</html>
