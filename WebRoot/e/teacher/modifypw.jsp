<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="law.jsp"%>
<html>
  <head>
    <title>学生中心</title>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
   
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
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
  <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
     <script  type="text/javascript">
		     $(function(){
		         $.metadata.setType("attr","validate");
		         $("#form1").validate();
		  });
    </script>
  </head>
  <body >
	<jsp:include page="../head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a
				href="teachermodifyinfo.jsp">修改教师信息</a>
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<form name="form1" class="form-horizontal" action="${pageContext.request.contextPath}/admin/teachermanager.do"  id="form1" method="post"  >

					<input type="hidden" name="id" value="${teacher.id}" /> <input
						type="hidden" name="errorpageurl"
						value="/e/teacher/modifypw.jsp?seedid=101" /> <input
						type="hidden" name="actiontype" value="modifyPw" /> <input
						type="hidden" name="forwardurl" value="/e/teacher/modifypwres.jsp" />

					<table border="0" cellspacing="1" class="grid" cellpadding="0"
						width="100%">
						<tr>
							<td align="right">原始密码 :</td>
							<td align="left"><input name="password1" type="password"
								id="password1" class="input-txt"
								validate="{required:true,messages:{required:'请输入密码'}}" /></td>
						</tr>
						<tr>
							<td align="right">修改密码 :</td>
							<td align="left"><input name="repassword1" type="password"
								id="repassword1" class="input-txt"
								validate="{required:true,messages:{required:'请输入新密码'}}" /></td>
						</tr>
						<tr>
							<td align="right">确认密码 :</td>
							<td align="left"><input name="repassword2" type="password"
								id="repassword2" class="input-txt"
								validate="{required:true,equalTo:'#repassword1',messages:{required:'请输入确定密码',equalTo:'两次密码不一致'}}" /></td>
						</tr>
						<tr>
							<td colspan="4">

								<button class="button">
									<i class="fa fa-check"></i>修改密码 ${errormsg }
								</button>

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
