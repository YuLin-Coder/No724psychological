<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>教师</title>
   
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
    
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
	   
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
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
				         var url="${pageContext.request.contextPath}/upload/touxiang.jpg";
				         $("#imgXiangpian").attr("src",url);
				         $("#hidXiangpian").val(url);
				       }else
				       {
				          $("#imgXiangpian").attr("src",imgxiangpiansrc);
				          $("#hidXiangpian").val(imgxiangpiansrc); 
				       }
				       $("#hyid").change(function(){
		        	      $("[name=hyname]").val($("#hyid option:selected").text());
		               });
				       $("[name=hyname]").val($("#hyid option:selected").text());
			            editor = KindEditor.create('textarea[name="lvli"]', {
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#teacherForm").validate();
               
        });  
    </script>
</head>
<body>
		
             <div class="search-title">
	                <h2>
	                                                 新建教师账户(账户默认密码123456)
	                </h2>
                <div class="description">
                </div>
              </div>
				    <form name="teacherform" method="post" action="${pageContext.request.contextPath}/admin/teachermanager.do"  id="teacherForm">
				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="actiontype" value="${actiontype}" />
					<input type="hidden" name="seedid" value="${seedid}" />
					<tr>
						<td align="right">账号:</td>
						<td><input name="tno" validate="{required:true,messages:{required:'请输入工号'}}" value="${requestScope.teacher.tno}"
							class="input-txt" type="text" id="txtTno" />
						</td>
						<td colspan="2" rowspan="5"><img id="imgXiangpian" width="200px" height="200px"
							src="images/touxiang.jpg" />
							<div>
								<input type="file" name="upload" id="btnulXiangpian" />
							</div> <input type="hidden" id="hidXiangpian" name="xiangpian"
							value="${requestScope.teacher.xiangpian}" />
					   </td>
					</tr>
					<tr>
						<td align="right">姓名:</td>
						<td><input name="name" validate="{required:true,messages:{required:'请输入名称'}}" value="${requestScope.teacher.name}"
							class="input-txt" type="text" id="txtName" /></td>
					</tr>
					<tr>
						<td align="right">性别:</td>
						<td><select name="sex" id="ddlSex"  class="dropdown">
								<option value="男">男</option>
								<option value="女">女</option>
						</select></td>
					</tr>

			
			<tr>
						<td align="right">学历:</td>
						<td><select name="xueli" id="ddlXueli" class="dropdown">
								<option value="硕士">硕士</option>
								<option value="博士">博士</option>
								<option value="本科">本科</option>
								<option value="大专">大专</option>
								<option value="其他">其他</option>
						</select></td>
					</tr>
					
					
					<tr>
						<td align="right">邮箱:</td>
						<td><input name="email" validate="{required:true,email:true,messages:{required:'请输入用户名',email:'请输入正确邮箱'}}" value="${requestScope.teacher.email}"
							class="input-txt" type="text" id="txtEmail" /></td>
					</tr>
					
				
					<tr>
						<td align="right">联系电话:</td>
						<td ><input name="mobile"
							value="${requestScope.teacher.mobile}" validate="{required:true,messages:{required:'请输入电话号码'}}" class="input-txt"
							type="text" id="txtMobile" /></td>
					   <td align="right">籍贯:</td>
						<td ><input name="jiguan"
							value="${requestScope.teacher.jiguan}" validate="{required:true,messages:{required:'请输入籍贯信息'}}" class="input-txt"
							type="text" id="txtJiguan" /></td>
						
					</tr>
			<tr>



				<td align="right">职称:</td>
				<td><input name="zhicheng"
					value="${requestScope.teacher.zhicheng}" class="input-txt"
					type="text" id="txtZhicheng" /></td>
			</tr>
			<tr>
						<td align="right">履历:</td>
						<td colspan="3"><textarea name="lvli" id="txtLvli"
								style="width:98%;height:200px;">${requestScope.teacher.lvli}</textarea>
						</td>
					</tr>
				</table>
				<div class="ui-button">
				<input type="submit" value="提交" id="Button1" class="ui-button-text" /> 
		     </div>
		</form>
     
</body>
</html>
