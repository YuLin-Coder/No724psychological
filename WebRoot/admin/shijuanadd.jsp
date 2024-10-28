<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>试卷</title>
   
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
    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
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

          var imgtupiansrc="${requestScope.shijuan.tupian}";
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
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function ()
        {
        	
        	 $("#kmid").change(function(){
		  	      $("[name=kemu]").val($("#kmid option:selected").text());
		     });
        	 $("[name=kemu]").val($("#kmid option:selected").text());
            initControl();
            $.metadata.setType("attr","validate");
            $("#shijuanForm").validate();
        });  
    </script>
</head>
<body>

	<div class="search-title">
		<h2>发布试卷</h2>
		<div class="description"></div>
	</div>
	<form name="shijuanform" method="post"
		action="${pageContext.request.contextPath}/admin/shijuanmanager.do"
		id="shijuanForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input name="zujuanren" value="${users.username}"
				validate="{required:true,messages:{required:'请输入组卷人'}}"
				class="hidden" type="hidden" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="forwardurl"
				value="/admin/shijuanmanager.do?actiontype=get&forwardurl=/admin/shijuanmanager.jsp&seedid=103" />
			<tr>
				<td align="right">试卷名:</td>
				<td><input name="title" value="${requestScope.shijuan.title}"
					validate="{required:true,messages:{required:'请输入试卷名'}}"
					class="input-txt" type="text" id="txtTitle" /></td>
			</tr>
			<tr>
				<td align="right">测试分类:</td>
				<td><web:dropdownlist name="kmid" id="kmid" cssclass="dropdown"
						value="${requestScope.shijuan.kmid}"
						datasource="${kmid_datasource}" textfieldname="mingcheng"
						valuefieldname="id">
					</web:dropdownlist> 
					<input id="hidkemu" name="kemu" type="hidden"
					vlaue="${requestScope.shijuan.kemu}" />
				</td>
			</tr>

			<tr>
				<td align="right">总分:</td>
				<td><input name="zongfen"
					value="${requestScope.shijuan.zongfen}"
					validate="{required:true,min:1,max:100,digits:true,messages:{required:'请输入总分',digits:'请输入正确的总分',min:'最小不能小于1分',max:'最大不能超过100'}}"
					class="input-txt" type="text" id="txtZongfen" /></td>
			</tr>
			<tr>
				<td align="right">图片:</td>
				<td><img id="imgTupian" width="200px" height="200px"
					src="${requestScope.shijuan.tupian}" />
					<div>
						<input type="file" name="upload" id="btnulTupian" />
					</div> <input type="hidden" id="hidTupian" name="tupian"
					value="${requestScope.shijuan.tupian}" /></td>
			</tr>

			<tr>
				<td align="right">描述:</td>
				<td colspan="3"><textarea name="des" id="txtDes"
						style="width:98%;height:200px;">${requestScope.shijuan.des}</textarea>
				</td>
			</tr>
			
			<tr>
				<td  colspan="2"><input type="submit" value="提交"  class="orange-button" /></td>
				
			</tr>
		</table>
		
	</form>


</body>
</html>
