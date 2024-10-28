<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>

<% 

String  tno=request.getParameter("tno");
TeacherService teacherSrv=BeansUtil.getBean("teacherService", TeacherService.class);
if( tno!=null)
{
 
  Teacher temobjteacher=teacherSrv.load(" where tno='"+ tno+"'");
  request.setAttribute("teacher",temobjteacher);
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>留言</title>
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
	    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
			         
			            editor = KindEditor.create('textarea[name="replycontent"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#leavewordForm").validate();
        });  
    </script>
    
  
    
</head>
<body>

   <jsp:include page="/e/head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; 在线指导
		</div>
	
	

		<div class="main">

			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
	<div class="search-title">
		<h2>在线回复</h2>
		<div class="description"></div>
	</div>
	<form name="leavewordform" method="post"
		action="${pageContext.request.contextPath}/admin/leavewordmanager.do"
		id="leavewordForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden"  name="replyren" value="${teacher.tno}"/>
			<input type="hidden"  name="teachername" value="${teacher.name}"/>
			<input type="hidden"  name="lyren" value="${huiyuan.accountname}"/>
			<input type="hidden"  name="stname" value="${huiyuan.name}"/>
			
			<input type="hidden" name="actiontype" value="reply" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl"
				value="/student/leavewordadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/leavewordmanager.do?actiontype=get&forwardurl=/e/teacher/leavewordmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
			<td width="10%" align="right">工号:</td>
			<td>${requestScope.teacher.tno}</td>
			<td colspan="2" rowspan="6"><img id="imgPhoto" width="200px" height="200px"
				src="${requestScope.teacher.xiangpian}" /></td>
		</tr>
		<tr>
			<td width="10%" align="right">姓名:</td>
			<td>${requestScope.teacher.name}</td>
		</tr>
		
		<tr>
			<td align="right">性别:</td>
			<td>${requestScope.teacher.sex}</td>
		</tr>
		<tr>
			<td width="10%" align="right">籍贯:</td>
			<td>${requestScope.teacher.jiguan}</td>
		</tr>
	
		<tr>
			<td width="10%" align="right">职称:</td>
			<td>${requestScope.teacher.zhicheng}</td>
		</tr>
		
		<tr>
				<td align="right">咨询标题:</td>
				<td colspan="3">
				   ${requestScope.leaveword.title}
				</td>
			</tr>
		   <tr>
				<td align="right">咨询内容:</td>
				<td colspan="3">${requestScope.leaveword.dcontent}
				</td>
			</tr>	
			<tr>
				<td align="right">回复:</td>
				<td colspan="3"><textarea name="replycontent" id="txtReplycontent"
						style="width:98%;height:200px;">${requestScope.leaveword.replycontent}</textarea>
				</td>
			</tr>			
			<tr>
				<td colspan="4">
					
						<button class="orange-button">
							提交
						</button>
				</td>
			</tr>
		</table>
	</form>
	
	</div>
	</div>
	</div>
</body>
</html>
