<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  include file="import.jsp"%>
<%
             TeacherService teacherSrv=BeansUtil.getBean("teacherService",TeacherService.class);
            String id=request.getParameter("id");
            if(id!=null){
                Teacher teacher=teacherSrv.load("where id="+id);
                if(teacher!=null)
                   request.setAttribute("temteacher",teacher);
            }
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>教师</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/webui/bootstrap/css/font-awesome.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.8.3.min.js"></script>
 <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>  
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <script type="text/javascript">
        function initControl(){
	        $("#txtYydate").datepicker({
                 dateFormat:'yy-mm-dd'
             }).datepicker("setDate",new Date());
                 
          }
        $(function (){
            initControl();
            $.metadata.setType("attr","validate");
            $("#yuyueForm").validate();
            $(".require-login").click(function(){
     	    	
      	    	 
     	    	  var temaccountname= $("[name=hyaccount]").val(); 
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
	<input type="hidden" id="commentresurl"
		value="/e/teacherinfo.jsp?id=<%=id%>" />
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; <a
				href="${pageContext.request.contextPath}/e/teacherlist.jsp">教师</a>
		</div>
		<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${requestScope.temteacher.xiangpian}" />
				<div class="operation">
					<div class="ticket-price">${temteacher.name}</div>
				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.temteacher.name}</div>
				<div class="sub-title"></div>
				<div>
					<ul>
						<li><strong>工号:</strong> ${requestScope.temteacher.tno}</li>
						<li><strong>性别:</strong> ${requestScope.temteacher.sex}</li>
						<li><strong>籍贯:</strong> ${requestScope.temteacher.jiguan}</li>
						<li><strong>职称:</strong> ${requestScope.temteacher.zhicheng}</li>
						<li><strong>学历:</strong> ${requestScope.temteacher.xueli}</li>
						<li><strong>邮箱:</strong> ${requestScope.temteacher.email}</li>
						<li><strong>电话:</strong> ${requestScope.temteacher.mobile}</li>
						
						
					</ul>
				</div>
				<div></div>
			</div>
		</div>
		<!--end text-box-->
	</div>
	<!--end show details-->
	<div class="wrap info">
		<div class="brief-title">预约咨询师</div>
		<div class="brief-content">
		
		    <form name="yuyueform" method="post"
				action="${pageContext.request.contextPath}/admin/yuyuemanager.do"
				id="yuyueForm">
				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="actiontype" value="save" />
					<input type="hidden" name="hyaccount" value="${huiyuan.accountname}" />
						<input type="hidden" name="hyname" value="${huiyuan.name}" />
					<input type="hidden" name="seedid" value="${seedid}" />
					<input type="hidden" name="errorurl"
						value="/e/yuyueadd.jsp?id=${teacher.id}" />
					<input type="hidden" name="forwardurl"
						value="/admin/yuyuemanager.do?actiontype=get&hyaccount=${huiyuan.accountname}&forwardurl=/e/huiyuan/yuyuemanager.jsp" />
					<input name="fwyid" placeholder="人员编号"
							validate="{required:true,messages:{required:'请输入人员编号'}}"
							value="${temteacher.id}" class="input-txt" type="hidden"
							id="txtFwyid" />
							<input name="fwyname" 
							validate="{required:true,messages:{required:'请输入服务员姓名'}}"
							value="${temteacher.name}" class="input-txt"
							type="hidden"  />
					
					<tr>
						<td colspan="4">${errormsg}</td>
					</tr>
					
					<tr>
						<td align="right">预约日期:</td>
						<td><input name="yydate" value="${requestScope.yuyue.yydate}"
							type="text" id="txtYydate" class="input-txt"
							validate="{required:true}" /></td>
					</tr>
					<tr>
						<td align="right">咨询方式:</td>
						<td><select name="msstyle" id="ddlMsstyle" class="dropdown">
								<option value="上门咨询">上门咨询</option>
								<option value="咨询中心交流">咨询中心交流</option>
						    </select>
						</td>
					</tr>
					<tr>
						<td align="right">联系电话:</td>
						<td><input name="mobile" placeholder="联系电话"
							validate="{required:true,mobile:true,messages:{required:'请输入联系电话',mobile:'请输入正确的电话号码'}}"
							value="${huiyuan.mobile}" class="input-txt"
							type="text" id="txtMobile" /></td>
					</tr>
				
					<tr>
						<td align="right">预约备注:</td>
						<td colspan="3"><textarea name="des" rows="4" id="txtDes"
								style="width: 98%; height: 100px;" validate="{required:true}">${requestScope.yuyue.des}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<button id="btnOK" class="button require-login">
								<i class="fa fa-check"></i>提交
							</button>
						</td>
					</tr>
				</table>
			</form>
		    
		
		</div>
		
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
