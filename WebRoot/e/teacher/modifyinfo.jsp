<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<%
     Teacher teacher= (Teacher)request.getSession().getAttribute("teacher");
     TeacherService teacherSrv=BeansUtil.getBean("teacherService", TeacherService.class);
	 if(teacher!=null)
	 {
	     Teacher temteacher   =teacherSrv.load("where id="+((Teacher)teacher).getId());
	     request.setAttribute("teacher",temteacher);
	 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>教师</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/web2table.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
   <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
   
  <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
	 <link href="${pageContext.request.contextPath}/uploadifive/uploadifive.css" rel="stylesheet" type="text/css" />
	 <script src="${pageContext.request.contextPath}/uploadifive/jquery.uploadifive.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   <script type="text/javascript">
        function initControl(){

			$('#btnulXiangpian').uploadifive({
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
					$("#imgXiangpian").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
					$("#hidXiangpian").val("${pageContext.request.contextPath}/upload/temp/"+file.name);
				}
			});
			          var imgxiangpiansrc="${requestScope.teacher.xiangpian}";
				       if(imgxiangpiansrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         $("#imgXiangpian").attr("src",url);
				         $("#hidXiangpian").val(url);
				       }else
				       {
				          $("#imgXiangpian").attr("src",imgxiangpiansrc);
				          $("#hidXiangpian").val(imgxiangpiansrc); 
				       }
			            editor = KindEditor.create('textarea[name="lvli"]', {
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function ()
        {
            initControl();
        });  
    </script>
</head>
<body>
		 <jsp:include page="/e/head.jsp"></jsp:include>
	   <div class="wrap round-block">
			<div class="line-title">
				  当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="teachermodifyinfo.jsp">修改教师信息</a>
			</div>
    	
		   <div class="main">
		     <jsp:include  page="menu.jsp"></jsp:include>
	  <div  class="main-content">
				 <form name="teacherform" method="post" action="${pageContext.request.contextPath}/admin/teachermanager.do" id="teacherForm">
				        <input type="hidden" name="actiontype" value="update"/>
				        <input type="hidden"  name="id" value="${requestScope.teacher.id}"/>
				        <input type="hidden"  name="forwardurl"  value="/e/teacher/accountinfo.jsp?seedid=101"/>
					<table border="0" cellspacing="1" class="grid" cellpadding="0"
						width="100%">
						<tr>
							<td bgcolor="#f8f8f8" height="30" align="right">教工号:</td>
							<td bgcolor="#ffffff">${requestScope.teacher.tno}<input name="tno"
								value="${requestScope.teacher.tno}" type="hidden" id="txtTno"
								class="input-txt" validate="{required:true}" />
						    </td>
						    <td  rowspan="6" colspan="2"><img id="imgXiangpian" width="200px"
								height="200px" src="images/touxiang.jpg" />
								<div>
									<input type="file" name="upload" id="btnulXiangpian" />
								</div> <input type="hidden" id="hidXiangpian" name="xiangpian"
								value="${requestScope.teacher.xiangpian}" />
						    </td>
						</tr>
						<tr>
							<td bgcolor="#f8f8f8" height="30" align="right">教师姓名:</td>
							<td bgcolor="#ffffff"><input name="name"
								value="${requestScope.teacher.name}" type="text" id="txtName"
								class="input-txt" validate="{required:true}" /></td>
						</tr>
						<tr>
							<td bgcolor="#f8f8f8" height="30" align="right">性别:</td>
							<td bgcolor="#ffffff"><select name="sex" id="ddlSex"
								ltype="select">
									<option value="男">男</option>
									<option value="女">女</option>
							</select></td>
						</tr>
						
						
						<tr>
							<td bgcolor="#f8f8f8" height="30" align="right">职称:</td>
							<td bgcolor="#ffffff"><input name="zhicheng"
								value="${requestScope.teacher.zhicheng}" type="text"
								id="txtZhicheng" class="input-txt" validate="{required:true}" /></td>
						</tr>
						<tr>
							<td bgcolor="#f8f8f8" height="30" align="right">学历:</td>
							<td bgcolor="#ffffff"><select name="xueli" id="ddlXueli"
								ltype="select">
									<option value="硕士">硕士</option>
									<option value="博士">博士</option>
									<option value="本科">本科</option>
									<option value="大专">大专</option>
									<option value="其他">其他</option>
							</select></td>
						</tr>
						<tr>
						
							<td bgcolor="#f8f8f8" height="30" align="right">邮箱:</td>
							<td bgcolor="#ffffff"><input name="email"
								value="${requestScope.teacher.email}" type="text" id="txtEmail"
								class="input-txt" validate="{required:true}" /></td>
						</tr>
						<tr>
							<td bgcolor="#f8f8f8" height="30" align="right">联系电话:</td>
							<td colspan="3" bgcolor="#ffffff"><input name="mobile"
								value="${requestScope.teacher.mobile}" type="text"
								id="txtMobile" class="input-txt" validate="{required:true}" /></td>
						
						
						</tr>
						<tr>
							<td bgcolor="#f8f8f8" align="right">履历:</td>
							<td bgcolor="#ffffff" colspan="3"><textarea name="lvli"
									class="l-textarea" id="txtLvli" style="width:98%;height:200px;">${requestScope.teacher.lvli}</textarea>
							</td>
						</tr>

						<tr>
							<td colspan="4"><input type="submit" value="提交" id="Button1"
								class="button" />
								
							 </td>
						</tr>
					</table>

				</form>
		</div>
		</div>
		</div>
		  <jsp:include page="../bottom.jsp"></jsp:include>		      
</body>
</html>
